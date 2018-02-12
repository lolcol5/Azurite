#!/bin/bash
echo "settingNode vs 1.0"

#NodeUser== Username of the node
NodeUser="home/fa"

fab -f $HOME/Azurite/server/fabfile.py cmd:"sudo apt-get install git -y"
fab -f $HOME/Azurite/server/fabfile.py cmd:"sudo git clone https://github.com/lolcol5/Azurite.git"
fab -f $HOME/Azurite/server/fabfile.py cmd:"sudo chmod +x $NodeUser/Azurite/node/install.sh"