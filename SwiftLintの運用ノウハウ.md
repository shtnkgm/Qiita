# SwiftLintの運用ノウハウ
# 概要
SwiftのLintツールの一つである[SwiftLint](https://github.com/realm/SwiftLint)の運用ノウハウについて、自己流ですが公開します。本記事で説明するノウハウは個人アプリの開発にて実施している内容になります。

SwiftLintの運用に関し、主に以下の内容を説明します。

- SwiftLintの活用方法
- SwiftLintのバージョンアップへの追従
- オプトインルールを全抽出するワンライナーコマンド
- 設定ファイル（.swiftlint.yml）の内容

※執筆時のswiftLintバージョン: 0.25.1（最新）

# SwiftLintの活用方法
SwiftLintはコンパイラよりもより詳細にソースコードの静的解析が行えるツールです。静的解析によって、より細かいwarningを出せるだけでなく、SwiftLintでは`autocorrect`オプションにより**ソースコードの自動修正が可**能です。

```bash:基本的なコマンド
# ソースコードの静的解析
$ swiftlint

# ソースコードの自動修正
$ swiftlint autocorrect
```

ビルド毎に静的解析および自動修正を行うため、以下のようなRun Scriptを作成して自動で実行しています。`swiftlint autocorrect`のみでは自動修正のみで、**静的解析が行われないことに注意**が必要です。

```bash:RunScript
if which swiftlint >/dev/null; then
    swiftlint autocorrect
    swiftlint
else
    echo "SwiftLint does not exist, download from https://github.com/realm/SwiftLint"
fi
```

Run Scriptの設定イメージ
![image.png](https://qiita-image-store.s3.amazonaws.com/0/113553/78a0fea0-8b3c-5906-aa77-a11b5bcd5ab9.png)

# SwiftLintのバージョンアップへの追従
SwiftLintではデフォルトで設定されるルールと**設定しないと有効にならないオプトインルール（Opt-In Rules）**があります。

SwiftLintのバージョンアップにより、オプトインルールが追加されることがありますが、**基本的には全て設定ファイルに追記**するようにしています。

SwiftLintのルールは以下の`swiftlint rules`コマンドでチェックできますが、オプトインルールのみを抽出したかったりします。（表内のopt-inがyesのもの）

```bash
$ swiftlint rules
+------------------------------------------+--------+-------------+------------------------+-------------+---------------+
| identifier                               | opt-in | correctable | enabled in your config | kind        | configuration |
+------------------------------------------+--------+-------------+------------------------+-------------+---------------+
| array_init                               | yes    | no          | no                     | lint        | warning       |
| attributes                               | yes    | no          | no                     | style       | warning, a... |
| block_based_kvo                          | no     | no          | yes                    | idiomatic   | warning       |
| class_delegate_protocol                  | no     | no          | yes                    | lint        | warning       |
| closing_brace                            | no     | yes         | yes                    | style       | warning       |
〜略〜
```

自分はSwiftLintのオプトインルールのみを全て抽出し、そのまま設定ファイル（.swiftlint.yml）へ設定するために、以下のワンライナーコマンドを利用しています。

**オプトインルールを全抽出するワンライナーコマンド**

```bash
$ swiftlint rules | awk -F "|" '$3 ~ "yes" { print $2 }' | tr -d ' ' | sed 's/^/  - /' | pbcopy
```

コマンドの説明をすると、以下のようなことをしています。

 1. awkコマンドで|を区切り文字として表を分割し、opt-inがyesのもののみ抽出
 2. trコマンドで半角スペースを除去
 3. sedコマンドで行頭に箇条書き用の - を付与
 4. pbcopyコマンドでクリップボードへコピー

**出力結果**

コマンド入力後、クリップボードに出力結果が保存されますので、そのまま設定ファイル（.swiftlint.yml）へ記述しています。

```出力結果（クリップボード）
  - array_init
  - attributes
  - closure_end_indentation
  - closure_spacing
  - conditional_returns_on_newline
  - contains_over_first_not_nil
  - discouraged_object_literal
〜略〜
```

# 設定ファイル（.swiftlint.yml）

設定ファイルでは、**基本的に全てのオプトインルールを有効化した上で、無効にしたいもののみdisabled_rulesに欄に記載し、無効化**しています。無効化する際は、備忘のため無効化した理由をコメントで記載しています。

```yml:.swiftlint.yml
# document: https://github.com/realm/SwiftLint

# 無効にするルール
disabled_rules:
- multiple_closures_with_trailing_closure # 複数のクロージャーの場合でも、trailing closureを利用したいため
- empty_enum_arguments # enumの引数を省略したいため

# opt-inルールの中で無効にするルール
- conditional_returns_on_newline # ガード文などは簡潔に一行で記述したいため
- discouraged_optional_collection # PHImageManagerの既存仕様のため
- explicit_enum_raw_value # 暗黙的なraw値で問題ないため
- explicit_type_interface # 型推論を利用したいため
- fatal_error_message # メッセージは不要なため
- file_header # ヘッダには特に決まりがないため
- lower_acl_than_parent # 対応不可のため
- no_extension_access_modifier # extension_access_modifierを優先するため
- no_grouping_extension # グルーピングにextensionを利用したいため
- strict_fileprivate # fileprivateを利用したいため
- switch_case_on_newline # caseと同じ行に記述したいため

# defaultルール以外にopt-inから採用するルール
opt_in_rules:
- array_init
- attributes
- closure_end_indentation
- closure_spacing
- conditional_returns_on_newline
- contains_over_first_not_nil
- discouraged_object_literal
- discouraged_optional_boolean
- discouraged_optional_collection
- empty_count
- empty_string
- explicit_acl
- explicit_enum_raw_value
- explicit_init
- explicit_top_level_acl
- explicit_type_interface
- extension_access_modifier
- fatal_error_message
- file_header
- first_where
- force_unwrapping
- implicit_return
- implicitly_unwrapped_optional
- joined_default_parameter
- let_var_whitespace
- literal_expression_end_indentation
- multiline_arguments
- multiline_parameters
- nimble_operator
- no_extension_access_modifier
- no_grouping_extension
- number_separator
- object_literal
- operator_usage_whitespace
- overridden_super_call
- override_in_extension
- pattern_matching_keywords
- prefixed_toplevel_constant
- private_action
- private_outlet
- prohibited_super_call
- quick_discouraged_call
- quick_discouraged_focused_test
- quick_discouraged_pending_test
- redundant_nil_coalescing
- required_enum_case
- single_test_class
- sorted_first_last
- sorted_imports
- strict_fileprivate
- switch_case_on_newline
- trailing_closure
- unneeded_parentheses_in_closure_argument
- untyped_error_in_catch
- vertical_parameter_alignment_on_call
- yoda_condition

# Lint対象に追加するパス
included:
- MyLibrary

# Lint対象から除外するパス
excluded:
- Carthage
- Pods
- MyLibraryDemoTests

# 1行の文字列制限
line_length:
- 200   # warning
- 300   # error

# 型の行数制限
type_body_length:
- 400   # warning
- 600   # error

# 1ファイルの行数制限
file_length:
- 500   # warning
- 1000  # error

# メソッドの行数制限
function_body_length:
- 100   # warning
- 200   # error

type_name:
min_length: 3
max_length:
warning: 40
error: 50
excluded:

identifier_name:
min_length: # only min_length
error: 2 # only error
excluded: # excluded via string array
- id
- URL
reporter: "xcode"
```

# その他（局所的なルールの無効化）

その他、どうしても部分的に強制キャストを記述したい場合など、以下のようにコードの特定の行のみでSwiftLintを無効化するコメントを記載しています。

```swift
// swiftlint:disable:next force_cast
let noWarning = NSNumber() as! Int
let hasWarning = NSNumber() as! Int
let noWarning2 = NSNumber() as! Int // swiftlint:disable:this force_cast
let noWarning3 = NSNumber() as! Int
// swiftlint:disable:previous force_cast
```

# 参考

 - [[SwiftLint]コードの中で無効にするルールを指定する](https://qiita.com/akatsuki174/items/13033ec34b6bcd880dfd)
 - [SwiftLintのRules全まとめ](https://qiita.com/kagemiku/items/80e6d905dc0059c342b3)


