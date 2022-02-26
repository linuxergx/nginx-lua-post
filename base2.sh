#!/bin/bash
# token2.lua只传递用户名
echo "接收到的参数个数为: $#","第一个参数为: $1" >>postman.log
if [ -z "$1" ]; then
        echo 200
else
        if [[ $(grep -w "$1" PostmanUsername.txt | wc -l) == 1 ]]; then
                echo 200
        else
                echo 403
        fi
fi