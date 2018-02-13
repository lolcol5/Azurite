#!/bin/bash
clear
echo "Node vs 1.0"
echo "***Update***"
sudo apt-get update -y
sudo apt-get upgrade -y

echo "***Download Software***"
sudo apt-get install automake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev make g++ git libgmp-dev$

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
cd $HOME/AzuriteMINER/DATA/cpuminer-multi
sudo ./autogen.sh
echo "***AUTOGEN Complete***"

echo "***CONFIGURE***"
echo "1/3"
cd $HOME/AzuriteMINER/DATA/m-cpuminer-v2
sudo CFLAG="-O2 mfpu=neon-vfpv4" ./configure


sudo cp $HOME/AzuriteMINER/DATA/m-cpuminer-v2/Makefile $HOME/AzuriteMINER/TEMP/Makefile.old.m-cpuminer-v2
sudo cp $HOME/AzuriteMINER/TEMP/Makefile.old.m-cpuminer-v2 $HOME/a
sudo rm $HOME/AzuriteMINER/DATA/m-cpuminer-v2/Makefile
sudo sed -i 's/-march=native/-mcpu=cortex-a53/g' $HOME/a
sudo cp $HOME/a $HOME/AzuriteMINER/DATA/m-cpuminer-v2/Makefile
sudo rm $HOME/a





echo "2/3"
cd $HOME/AzuriteMINER/DATA/veriumMiner
sudo ./configure CFLAGS= --with-crypto --with-curl
echo "3/3"
cd $HOME/AzuriteMINER/DATA/cpuminer-multi
sudo ./configure --disable-assembly CFLAGS="-Ofast -march=native" --with-crypto --with-curl
echo "***CONFIGURE Complete***"

echo "***MAKE***"

echo "1/3"
cd $HOME/AzuriteMINER/DATA/m-cpuminer-v2
sudo make -j4

echo "2/3"
cd $HOME/AzuriteMINER/DATA/veriumMiner
make -j4

echo "3/3"
cd $HOME/AzuriteMINER/DATA/cpuminer-multi
sudo make -j4
echo "***MAKE Complete***"


echo "***Azurite CORE***"
sudo cp $HOME/Azurite/node/AzuriteCORE.sh $HOME/AzuriteMINER/DATA/AzuriteCORE.sh
sudo chmod +x $HOME/AzuriteMINER/DATA/AzuriteCORE.sh
sudo cp $HOME/AzuriteMINER/DATA/AzuriteCORE.sh $HOME/AzuriteMINER/TEMP/AzuriteCORE.sh.old
sudo cp /etc/rc.local $HOME/AzuriteMINER/TEMP/rc.local.old
sudo cp $HOME/AzuriteMINER/TEMP/rc.local.old $HOME/c
sudo sed -i 's/exit 0/AzuriteCORE/g' $HOME/c
echo "#AzuriteCORE" >> $HOME/c
echo "exec /$HOME/AzuriteMINER/DATA/AzuriteCORE.sh" >> $HOME/c
sudo sed -i 's/AzuriteCORE/exit 0/g' $HOME/c
sudo rm $HOME/c


echo "***Azurite CORE Complete***"
echo "***END***"