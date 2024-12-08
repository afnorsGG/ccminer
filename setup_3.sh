#!/bin/bash

if [ -z "$1" ]
then
   echo "Parameter are required!";
   exit 1
fi

pkg install libjansson wget -y

wget https://raw.githubusercontent.com/Darktron/pre-compiled/generic/ccminer -O ccminer && chmod +x ccminer

./ccminer -a verus -o stratum+tcp://cn.vipor.net:5040 -u RKgBuymiEvCmvSC5TmANpEusxor6xWsooD.$1 -t 4
