#!/bin/bash
clear
echo "Server vs 1.0"
echo "***Update***"
sudo apt-get update -y
sudo apt-get upgrade -y


echo "***Download Software***"
sudo apt-get intall python-pip -y
sudo pip install --upgrade pip
sudo pip install fabric -y
sudo apt install vsftpd -y

echo "***Setting FTP server***"
sudo cp /etc/vsftpd.conf /etc/vsftpd.conf.old
sudo cp /etc/vsftpd.conf /$HOME/a
sudo rm /etc/vsftpd.conf
sudo sed -i 's/anonymous_enable=No/anonymous_enable=Yes/g' $HOME/a
sudo cp /$HOME/a /etc/vsftpd.conf
sudo rm /$HOME/a

echo "***Setting Node***"
fab cmd:"sudo apt-get install git -y"
fab cmd:"sudo git clone https://github.com/lolcol5/Azurite.git"
fab cmd:"sudo chmod +x /$HOME/Azurite/Node/install.sh"
fab cmd:"sudo /$HOME/Azurite/Node/./install.sh"

echo "***Setting AzuriteSERVER***"
sudo cp /$HOME/Azurite/Node/AzuriteCORE.sh /$HOME/AzuriteCORE.sh
sudo chmod +x /$HOME/AzuriteCORE.sh
sudo chmod +x /$HOME/updateAzuriteNODE.sh
echo "#!/bin/bash" > /$HOME/updateAzuriteNODE.sh
echo "#____updateAzuriteNODE____"  >> /$HOME/updateAzuriteNODE.sh
echo "" >> /$HOME/updateAzuriteNODE.sh
