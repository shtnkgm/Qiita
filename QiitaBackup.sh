#!/bin/sh

#ファイル名のサニタイズ関数
sanitize() {
  t1=$(echo "$1"|sed -e 's,<[^>]*>,,g') #strip_tags
  t1=$(echo "$t1"|sed -e 's/[\~\`\!\@\#\$\%\^\&\*\=\+{}\\|;:\"\,\<\.\>\/\?]+//g' -e "s,[']+,,g") #str_replace
  echo "$t1"|sed -e 's, ,,g' #スペースを削除
}

DEBUG="$@"
DIR=$PWD
DB_FILE=$HOME/Library/Containers/com.qiita.Kobito/Data/Library/Kobito/Kobito.db
SQLITE3=/usr/bin/sqlite3
MSG='Automatic Update'
SQL_SELECT_ID='select ZUUID from ZITEM where ZUUID is not null and ZPRIVATE = 0 ORDER BY ZPOSTED_AT DESC;'
SQL_SELECT_TITLE_AND_URL='select ZURL,ZTITLE from ZITEM where ZUUID = '
SQL_SELECT_BODY='select ZRAW_BODY from ZITEM where ZUUID = '

#1レコードずつファイルに保存
MARKDOWN="Posts on Qiita\n=====\n\n"
echo "Collecting your posts from Kobito...\n"
for zuuid in $($SQLITE3 $DB_FILE "$SQL_SELECT_ID"); do
  SQL="$SQL_SELECT_TITLE_AND_URL '$zuuid'";
  TAU=$($SQLITE3 $DB_FILE "$SQL");
  URL=$(echo $TAU|cut -d"|" -f 1);
  TITLE=$(sanitize "$(echo $TAU|cut -d"|" -f 2-)");
  SQL="$SQL_SELECT_BODY '$zuuid'"
  $SQLITE3 $DB_FILE "$SQL" > "$DIR/${TITLE}.md"
  echo "* $TITLE url: $URL";
  MARKDOWN="$MARKDOWN* $TITLE ([GitHub](./$TITLE.md)|[Qiita]($URL))\n"
  echo "* $TITLE ([GitHub](./$TITLE.md)|[Qiita]($URL))\n";
done

#目次がわりのREADME.mdを作成
echo $MARKDOWN > "README.md"

#デバックモードを追加
if [ -z "$DEBUG" ]; then
  #GitHubにコミット
  echo "\nConnecting to GitHub...\n"
  git add .
  git commit -m "$MSG"
  git push origin master
fi
