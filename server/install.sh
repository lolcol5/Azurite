#!/bin/bash
clear
#NodeUser== Username of the node
NodeUser="home/fa"

echo "Server vs 1.0"
echo "***Update***"
sudo apt-get update -y
sudo apt-get upgrade -y


echo "***Download Software***"
sudo apt-get install python-pip 
sudo apt-get install build-essential libssl-dev libffi-dev python3-dev
sudo pip install --upgrade pip
#sudo pip install fabric
sudo easy_install fabric
sudo apt-get install vsftpd -y

echo "***Setting FTP server***"
sudo cp /etc/vsftpd.conf /etc/vsftpd.conf.old
sudo cp /etc/vsftpd.conf /$HOME/a
sudo rm /etc/vsftpd.conf
sudo sed -i 's/anonymous_enable=No/anonymous_enable=Yes/g' $HOME/a
sudo cp $HOME/a /etc/vsftpd.conf
sudo rm $HOME/a

echo "***Setting Node***"
fab -f $HOME/Azurite/server/fabfile.py cmd:"sudo apt-get install git -y"
fab -f $HOME/Azurite/server/fabfile.py cmd:"sudo git clone https://github.com/lolcol5/Azurite.git"
fab -f $HOME/Azurite/server/fabfile.py cmd:"sudo chmod +x $NodeUser/Azurite/Node/install.sh"
fab -f $HOME/Azurite/server/fabfile.py cmd:"sudo $NodeUser/Azurite/Node/./install.sh"

echo "***Setting AzuriteSERVER***"
sudo cp $HOME/Azurite/node/AzuriteCORE.sh $HOME/AzuriteCORE.sh
sudo chmod +x $HOME/AzuriteCORE.sh
sudo chmod +x $HOME/updateAzuriteNODE.sh
echo "#!/bin/bash" > $HOME/updateAzuriteNODE.sh
echo "#____updateAzuriteNODE____"  >> $HOME/updateAzuriteNODE.sh
echo "" >> $HOME/updateAzuriteNODE.sh

