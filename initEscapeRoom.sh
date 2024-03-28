#!/bin/bash

# Set the base folder for the escape room 
BASE_FOLDER=/home/escape/escapeRoom

# Set up permissions for all rooms
chmod -R agou+rw $BASE_FOLDER/room_*

# Set up password for rooms
vi -es -c "%p|set key=welldone"         -c "%p|wq!" $BASE_FOLDER/room_02/README       >/dev/null
vi -es -c "%p|set key=472"              -c "%p|wq!" $BASE_FOLDER/room_03/README       >/dev/null
vi -es -c "%p|set key=linuxisfun"       -c "%p|wq!" $BASE_FOLDER/room_04/README       >/dev/null
vi -es -c "%p|set key=crazyroom"        -c "%p|wq!" $BASE_FOLDER/room_05/README       >/dev/null
vi -es -c "%p|set key=linuxrocks"       -c "%p|wq!" $BASE_FOLDER/room_06/README       >/dev/null
vi -es -c "%p|set key=LinusTorvalds"    -c "%p|wq!" $BASE_FOLDER/room_07/README       >/dev/null
vi -es -c "%p|set key=linuxkernel"      -c "%p|wq!" $BASE_FOLDER/room_08/README       >/dev/null
vi -es -c "%p|set key=lessismore"       -c "%p|wq!" $BASE_FOLDER/room_09/README       >/dev/null
vi -es -c "%p|set key=linuxisfree"      -c "%p|wq!" $BASE_FOLDER/room_10/README       >/dev/null

# # -------------------------------------------------------------------
# Install rooms required tools
# # -------------------------------------------------------------------
# Download the installation script of nodejs (latest version)
curl -sL https://deb.nodesource.com/setup_lts.x | sudo -E bash -

# Install Node.js
sudo apt install -y nodejs attr zip

# Install js Obfuscator
sudo npm -g install javascript-obfuscator

## -------------------------------------------------------------------
# Room 01
## -------------------------------------------------------------------
# Generate random files
cd $BASE_FOLDER/room_01
./generateRandomFiles.sh
rm -rf ./generateRandomFiles.sh

## -------------------------------------------------------------------
# Room 02
## -------------------------------------------------------------------
cd $BASE_FOLDER/room_02
# Add the white rabbit user
useradd -M -s /bin/false white_rabbit
usermod -u 521 white_rabbit

## -------------------------------------------------------------------
# Room 03
## -------------------------------------------------------------------
cd $BASE_FOLDER/room_03
# Lock the script with password
mv      ./script.sh ./creature.sh
chmod   -R agou-x   ./creature.sh
vi -es -c "%p|set key=83"  -c "%p|wq!" $BASE_FOLDER/room_03/creature.sh          >/dev/null

## -------------------------------------------------------------------
# Room 04
## -------------------------------------------------------------------
cd $BASE_FOLDER/room_04
# Set up permissions for specific files
chmod -R agou+rw $BASE_FOLDER/room_04/crazyText
vi -es -c "%p|set key=linuxisstillfun"  -c "%p|wq!" $BASE_FOLDER/room_04/key          >/dev/null


## -------------------------------------------------------------------
# Room 05
## -------------------------------------------------------------------
cd $BASE_FOLDER/room_05

# Obfuscate the file
javascript-obfuscator ./lockedDoor.js --output ./lockedDoor.js
# Remove the extention 
mv ./lockedDoor.js ./lockedDoor

# Add metdata
setfattr ./lockedDoor -n user.scriptLanguage -v "This is a NodeJs script"                        
setfattr ./lockedDoor -n user.showKey        -v "Just ask me to: showKey and ill show you the key" 

vi -es -c "%p|set key=hints" -c "%p|wq!" ./hints.txt    >/dev/null

## -------------------------------------------------------------------
## Room 06
## -------------------------------------------------------------------
cd $BASE_FOLDER/room_06

# Obfuscate the script
javascript-obfuscator ./script.js --output ./script.js

## -------------------------------------------------------------------
## Room 07
## -------------------------------------------------------------------
cd $BASE_FOLDER/room_07

# Zip the content with the given password
zip --password 374 room_07.zip puzzle/*

# Delete original files
rm -rf puzzle

## -------------------------------------------------------------------
## Room 08
## -------------------------------------------------------------------
cd $BASE_FOLDER/room_08

# Obfuscate the bash script
sudo shc -r -o getKey.sh -f ./script.sh 
chmod +x ./getKey.sh
rm ./script*

## -------------------------------------------------------------------
## Room 09
## -------------------------------------------------------------------
cd $BASE_FOLDER/room_09

# Obfuscate the bash script
sudo shc -r -o getKey.sh -f ./script.sh 
chmod +x ./getKey.sh
rm ./script*
rm ./escape

## -------------------------------------------------------------------
## Room 10
## -------------------------------------------------------------------
cd $BASE_FOLDER/room_10

# Obfuscate the bash script
sudo shc -r -o getKey.sh -f ./script.sh 
chmod +x ./getKey.sh
rm ./script*

cd $BASE_FOLDER

# remove the additional packages which user will have to isntall 
# in order to resolve the puzzle
apt remove -y       \
    attr            \
    build-essential \
    nodejs          \
    shc             \
    zip     

apt autoremove -y 
apt autoclean -y 

