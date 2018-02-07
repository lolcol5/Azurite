#!/bin/bash

echo "Node"
echo "***Update***"
sudo apt-get update -y
sudo apt-get upgrade -y

echo "***Download Software***"
sudo apt-get install automake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev make g++ git libgmp-dev$
sudo apt-get install git -y
sudo mkdir $HOME/AzuriteMINER
sudo mkdir $HOME/AzuriteMINER/DATA
sudo mkdir $HOME/AzuriteMINER/TEMP
cd $HOME/AzuriteMINER/DATA

echo "***Download Miner***"
sudo git clone https://github.com/magi-project/m-cpuminer-v2
sudo git clone https://github.com/fireworm71/veriumMiner
sudo git clone https://github.com/tpruvot/cpuminer-multi
echo "***AUTOGEN***"
echo "1/3"
cd $HOME/AzuriteMINER/DATA/m-cpuminer-v2
sudo ./autogen.sh
echo "2/3"
cd $HOME/AzuriteMINER/DATA/veriumMiner
sudo ./autogen.sh
echo "3/3"
cd $HOME/Azurite/MINERDATA/cpuminer-multi
sudo ./autogen.sh
echo "***AUTOGEN Complete***"

echo "***CONFIGURE***"
echo "1/3"
cd $HOME/AzuriteMINER/DATA/m-cpuminer-v2
sudo CFLAG="-O2 mfpu=neon-vfpv4" ./configure




echo "2/3"
cd $HOME/AzuriteMINER/DATA/veriumMiner
sudo ./configure CFLAGS= --with-crypto --with-curl
echo "3/3"
cd $HOME/AzuriteMINER/DATA/cpuminer-multi
sudo ./configure --disable-assembly CFLAGS="-Ofast -march=native" --with-crypto --with-curl
echo "***CONFIGURE Complete***"


