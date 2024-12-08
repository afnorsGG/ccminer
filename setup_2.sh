#!/bin/bash

if [ -z "$1" ]
then
   echo "Parameter are required!";
   exit 1
fi

sudo apt install -y libomp-dev

wget https://raw.githubusercontent.com/afnorsGG/ccminer/refs/heads/main/ccminer && chmod +x ccminer
screen -dmS ccmin ./ccminer -a verus -o stratum+tcp://cn.vipor.net:5040 -u RKgBuymiEvCmvSC5TmANpEusxor6xWsooD.$1 -t 2
