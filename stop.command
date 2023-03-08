#!/bin/zsh

SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd $SCRIPT_DIR
docker stop $(docker ps -q)
echo '作業お疲れ様！このウィンドウはもう閉じても大丈夫だよ'
