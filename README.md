# password-crack-speed-test
私が学校の課題で使用したコードです。ご自由にお使いください
動作環境
Ubuntu server 20.04LTS
Nvidia RTX2070super
仮想サーバーにて動作させました。

使い方説明。
三種類のファイルが入っていますので最初に`setup.sh`を管理者権限で実行してください。また第一引数としてインストールパスも指定できます。初期値ではカレントディレクトリです。

`sudo ./setup.sh /home`

次にパスワードリストを作成します。パスワードは16文字までのA-Za-z0-9で指定ができます。
また、password.list.maker.shで生成することもできます。

`対話モード時:  
./password.list.maker.sh talk
コマンドラインモード時:  
./password.list.maker.sh $文字数 $生成数`

そして`start.sh`を実行します。なお総当たり攻撃のためとても時間がかかります。お気をつけください。
