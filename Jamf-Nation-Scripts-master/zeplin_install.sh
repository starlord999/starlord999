#!/bin/bash
#
####################################################
####################################################
####################################################
###########          Version 1.0          ##########
###########                               ##########31
###########   created by - Thomas Cosby   ##########
###########           2018 08 29          ##########
###########          __        __         ##########
###########         /\ \   *  /\ \        ##########
###########         \:\ \    /::\ \       ##########
###########          \:\ \  /:/\:\ \      ##########
###########        * /::\ \/:/ /\:\ \     ##########
###########         /:/\:\_\/_/  \:\_\    ##########
###########        /:/ /\/_/\ \   \/_/    ##########
###########       /:/ /    \:\ \  *       ##########
###########       \/_/      \:\ \         ##########
###########               *  \:\_\        ##########
###########                   \/_/        ##########
###########                               ##########
###########      Current Version 1.0      ##########
###########                               ##########
####################################################
####################################################
####################################################
#
####################################################
#  Version History
#  
#  
####################################################
#  
#  this script downloads and installs the latest
#+ version of Zeplin
#  
####################################################

cd /tmp

# Installing Zeplin
curl -L -o "Zeplin.app.zip" "https://zpl.io/download-mac"
sleep 30s
unzip Zeplin.app.zip
sleep 10s
mv -f Zeplin.app /Applications/
rm -Rf Zeplin.app.zip

exit 0
#  A zero return value from the script upon exit indicates success
#+ to the shell.

