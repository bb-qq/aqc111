# Aquantia AQC111U 搭載アダプタ向け DSM ドライバ

これは Synology 製 NAS 向けの AQC111U ドライバパッケージです。 

## インストール方法

1. 「パッケージセンター」を開く
2. 「手動インストール」を選択する
3. [release page](https://github.com/bb-qq/aqc111/releases) からダウンロードしたパッケージを指定する。

https://www.synology.com/ja-jp/knowledgebase/SRM/help/SRM/PkgManApp/install_buy

## 設定方法

1. [SSH を有効にする](https://www.synology.com/ja-jp/knowledgebase/DSM/tutorial/General_Setup/How_to_login_to_DSM_with_root_permission_via_SSH_Telnet) and login your NAS
2. ドライバによって追加されたインタフェース(例: eth2)を有効化する (ifconfig eth2 up)
3. Web GUI からもう一度設定を行う

注: IP アドレス設定は再起動すると失われてしまいます。何か良い解決方法がありましたら Issue 経由で教えて下さい。

## サポートするプラットフォーム

* DSM 6.2
* apollolake ベースの製品
    * DS918+ (confirmed working)
    * DS620slim
    * DS1019+
    * DS718+
    * DS418play
    * DS218+

もし他の製品で使いたい場合は、Issue を作って教えて下さい。

## サポートされている AQC111U(5.0Gbps) ベースの製品

今は QNAP QNA-UC5G1T のみ動作確認ができています。もし他の製品を使用していて動作しない場合は VID/PID とともに Issue でお知らせ下さい。

* [QNAP QNA-UC5G1T](https://amzn.to/2VdRsrx) (Type-A, 動作確認済)
* [TRENDnet TUC-ET5G](https://amzn.to/30Dnn5T) (Type-C)

## 性能計測結果

### 環境
* DS918+ (QNAP QNA-UC5G1T)
* PC との直接接続 (AQN-107)
* [ネイティブの iperf3](http://www.jadahl.com/iperf-arp-scan/DSM_6.2/)
    * docker を使用すると CPU 負荷が高くなります
* jumbo-frame(9k) 有効

### 結果
````
iperf3 -c 192.168.xx.xx -P 2
Connecting to host 192.168.xx.xx, port 5201
[  4] local 192.168.yy.yy port 54613 connected to 192.168.xx.xx port 5201
[  6] local 192.168.yy.yy port 54614 connected to 192.168.xx.xx port 5201
[ ID] Interval           Transfer     Bandwidth
[  4]   0.00-1.00   sec   198 MBytes  1.66 Gbits/sec
[  6]   0.00-1.00   sec   186 MBytes  1.56 Gbits/sec
[SUM]   0.00-1.00   sec   384 MBytes  3.22 Gbits/sec
- - - - - - - - - - - - - - - - - - - - - - - - -
[  4]   1.00-2.00   sec   211 MBytes  1.77 Gbits/sec
[  6]   1.00-2.00   sec   189 MBytes  1.58 Gbits/sec
[SUM]   1.00-2.00   sec   400 MBytes  3.36 Gbits/sec
- - - - - - - - - - - - - - - - - - - - - - - - -
[  4]   2.00-3.00   sec   209 MBytes  1.75 Gbits/sec
[  6]   2.00-3.00   sec   190 MBytes  1.60 Gbits/sec
[SUM]   2.00-3.00   sec   400 MBytes  3.35 Gbits/sec
- - - - - - - - - - - - - - - - - - - - - - - - -
[  4]   3.00-4.00   sec   209 MBytes  1.76 Gbits/sec
[  6]   3.00-4.00   sec   188 MBytes  1.57 Gbits/sec
[SUM]   3.00-4.00   sec   397 MBytes  3.33 Gbits/sec
- - - - - - - - - - - - - - - - - - - - - - - - -
[  4]   4.00-5.00   sec   224 MBytes  1.88 Gbits/sec
[  6]   4.00-5.00   sec   176 MBytes  1.47 Gbits/sec
[SUM]   4.00-5.00   sec   400 MBytes  3.36 Gbits/sec
- - - - - - - - - - - - - - - - - - - - - - - - -
[  4]   5.00-6.00   sec   209 MBytes  1.75 Gbits/sec
[  6]   5.00-6.00   sec   191 MBytes  1.60 Gbits/sec
[SUM]   5.00-6.00   sec   400 MBytes  3.35 Gbits/sec
- - - - - - - - - - - - - - - - - - - - - - - - -
[  4]   6.00-7.00   sec   210 MBytes  1.76 Gbits/sec
[  6]   6.00-7.00   sec   189 MBytes  1.59 Gbits/sec
[SUM]   6.00-7.00   sec   399 MBytes  3.35 Gbits/sec
- - - - - - - - - - - - - - - - - - - - - - - - -
[  4]   7.00-8.00   sec   212 MBytes  1.78 Gbits/sec
[  6]   7.00-8.00   sec   186 MBytes  1.56 Gbits/sec
[SUM]   7.00-8.00   sec   398 MBytes  3.34 Gbits/sec
- - - - - - - - - - - - - - - - - - - - - - - - -
[  4]   8.00-9.00   sec   212 MBytes  1.78 Gbits/sec
[  6]   8.00-9.00   sec   189 MBytes  1.59 Gbits/sec
[SUM]   8.00-9.00   sec   401 MBytes  3.36 Gbits/sec
- - - - - - - - - - - - - - - - - - - - - - - - -
[  4]   9.00-10.00  sec   207 MBytes  1.73 Gbits/sec
[  6]   9.00-10.00  sec   193 MBytes  1.62 Gbits/sec
[SUM]   9.00-10.00  sec   400 MBytes  3.35 Gbits/sec
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth
[  4]   0.00-10.00  sec  2.05 GBytes  1.76 Gbits/sec                  sender
[  4]   0.00-10.00  sec  2.05 GBytes  1.76 Gbits/sec                  receiver
[  6]   0.00-10.00  sec  1.83 GBytes  1.57 Gbits/sec                  sender
[  6]   0.00-10.00  sec  1.83 GBytes  1.57 Gbits/sec                  receiver
[SUM]   0.00-10.00  sec  3.89 GBytes  3.34 Gbits/sec                  sender
[SUM]   0.00-10.00  sec  3.89 GBytes  3.34 Gbits/sec                  receiver

iperf Done.
````

SMB 経由のファイルコピーの場合、この環境下で 434 MB/s の速度が出ています。
