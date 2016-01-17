#!/bin/bash

# 変数の読み込み
VAL=/root/Tools/etc/VAL.txt
source ${VAL}

# Ctrl + Cを実施した場合の動作（SIGINTを受信した場合）
trap ' echo You must input your ID number and reasons of login.' 2

# 社員番号を入力
echo $MESSAGE6
read answer

case "$answer" in

# 許可された社員番号
        12345)
        echo $MESSAGE5
        read answer2

                if [ -z $answer2 ]
                then
                        echo $DATETIME $MESSAGE1 | tee -a ${LOG}
                        kill $BADTERM
                        exit 15

                else
                        echo $DATETIME $MESSAGE2 $answer $MESSAGE3 $answer2 | te
e -a ${LOG}
                fi
        ;;

# 上記以外は拒否
        *)
        echo $DATETIME $MESSAGE4 | tee -a ${LOG}
        kill $BADTERM
        exit 10
        ;;
esac
