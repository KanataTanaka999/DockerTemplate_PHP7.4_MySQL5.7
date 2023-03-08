#!/bin/zsh

SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd $SCRIPT_DIR
docker stop $(docker ps -q)
docker-compose up -d
