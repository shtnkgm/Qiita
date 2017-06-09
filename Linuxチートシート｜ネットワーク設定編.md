# Linuxチートシート｜ネットワーク設定編
Linuxの学習メモをチートシートとして残します。

## メモ

 - RHEL7系ではネットワーク管理はNetworkManagerの利用を推奨
 - 従来のifconfigなどを利用する場合は要インストール

## チートシート

``` bash
# ネットワークを有効化
$ nmcli networking on

# ネットワークを無効化
$ nmcli networking off

# NetWorkManagerの状態を確認
$ nmcli general status

# デバイスとコネクションの接続状態を確認する
$ nmcli device status

# デバイスを接続
$ nmcli device connect DEVICENAME

# デバイスを切断
$ nmcli device disconnect DEVICENAME

# ホスト名を変更
$ nmcli general hostname HOSTNAME

# コネクションを確認
$ nmcli connection show

# コネクションを有効化
$ nmcli connection up CONNECTIONNAME

# コネクションを無効化
$ nmcli connection down CONNECTIONNAME

# コネクションのIPアドレスを変更
$ nmcli connection modify CONNECTIONNAME ipv4.addresses IPADDRESS

# デバイスにコネクションを追加
$ nmcli connection add type ethernet con-name CONNECTIONNAME ifname DEVICENAME

# デバイスからコネクションを削除
$ nmcli connection delete CONNECTIONNAME

# ホスト名を確認
$ hostname

# ホスト名を変更（専用コマンド）
$ hostnamectl set-hostname HOSTNAME

# ホスト名を確認（専用コマンド）
$ hostnamectl status

# ICMPパケットを5回送信
$ ping -c5 IPADDRESS

# ソケットの統計情報を確認
$ ss

```

