#!/bin/zsh

SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd $SCRIPT_DIR
docker stop $(docker ps -q)
docker-compose up -d
echo 'このウィンドウは閉じて、さっそく作業に取り掛かろう！'
