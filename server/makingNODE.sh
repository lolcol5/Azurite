#!/bin/bash
echo "makingNode vs 1.0"
fab -f $HOME/Azurite/server/fabfile.py cmd:"sudo $NodeUser/Azurite/node/./install.sh"