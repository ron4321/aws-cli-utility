# aws-cli-utility
AWSの運用を楽にするためのスクリプト群を置いています。

## aws-ssh/aws-ssm
EC2環境へのsshやSession Manager経由でのログインを楽にするためのツールです。
ログインできるEC2をリストし、pecoで検索/選択ができます。EC2の PublicIP や Intance Id を事前に知る必要がなく、普段目にしているインスタンス名でログインできるのが便利です。

## How to install
`make setup && make install` を実行してください。シェルスクリプトを `/usr/local/bin` にlinkして、コマンドとして扱えるようにしています。
aws-sshは秘密鍵を指定したログインを想定しているため、利用する場合には `aws-ssh.sh` 内のpemファイルのpathを変更してください 
