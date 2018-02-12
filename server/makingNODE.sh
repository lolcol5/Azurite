#!/bin/bash
echo "makingNode vs 1.0"

#NodeUser== Username of the node
NodeUser="home/fa"

fab -f $HOME/Azurite/server/fabfile.py cmd:"sudo $NodeUser/Azurite/node/./install.sh"