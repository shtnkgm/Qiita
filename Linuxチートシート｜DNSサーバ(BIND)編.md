# Linuxチートシート｜DNSサーバ(BIND)編
Linuxの学習メモをチートシートとして残します。

## メモ
 - BINDはデフォルトでセキュリティ設定がかなり甘く、実用には様々な設定が必要
 - リゾルバ：名前解決の問い合わせを行うソフト
 - ゾーン：DNSサーバが管理するドメインの範囲（複数ドメイン可）
 - マスタDNSサーバ：オリジナルのゾーンファイルを保持
 - スレーブDNSサーバ：ソーンファイルのコピーを保持（マスタからゾーン転送）
 - キャッシュサーバ：問い合わせ結果を一時的にメモリ上に保持
 - セキュリティ上の理由からchroot環境での実行を推奨（要bind-chrootインストール）

## チートシート

```bash
# ホスト名の確認
$ hostname

# 正引き問い合わせ
$ host DOMAINNAME
$ dig DOMAINNAME

# 逆引き問い合わせ
$ host IPADDRESS
$ dig -x IPADDRESS

# BINDサービス起動/再起動/停止
$ systemctl start named
$ systemctl restart named
$ systemctl stop named

# BINDサービスの自動起動を有効化/無効化
$ systemctl enable named
$ systemctl disable named
 
# BINDサービス起動/再起動/停止（chroot環境）
$ systemctl start named-chroot
$ systemctl restart named-chroot
$ systemctl stop named-chroot

# BINDサービスの自動起動を有効化/無効化（chroot環境）
$ systemctl enable named-chroot
$ systemctl disable named-chroot



```

## 設定ファイル
``` bash
# hostsファイル
/etc/hosts

# BINDの設定ファイル（ブートファイル）
/etc/named.conf
/etc/named/*

# ゾーンデータファイル
/var/named/*

# 名前解決の問い合わせ順設定
/etc/nsswitch.conf

# リゾルバ用設定ファイル
/etc/resolv.conf
```

## 各種設定の参考
 - [備忘録）BIND named.conf の記載について。](http://qiita.com/dumpty-alma@github/items/536f21de67d0ed2c8e85)
 - [自宅サーバのDockerでDNSを運用する](http://qiita.com/74th/items/a7e0c044497c95ecc04a)
 - [DNSサーバのチューニング　其の一](http://qiita.com/digitalpeak/items/210d0eea3c5340e46123)
 - [DNSサーバ構築](http://qiita.com/digitalpeak/items/e61f0b6a32b345883bce)

