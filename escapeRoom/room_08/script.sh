#!/bin/bash

source ../_utils.sh

# Get the PID of the testUser
function getPID(){
    PID=$(ps -u testUser | grep 'room08_proc' | awk '{print $1}')
    return PID
}

getPID
# Check if an error occurred by chekcing the return code from the function
if [ $? -ne 0 ] && [ $PID -ne $1 ]; 
then
    echo -e "${BRed}--------------------------------------------------${Color_Off}"
    echo -e "${BRed}   An error occurred. Try again${Color_Off}"
    echo -e "${BRed}   Verify that you done it correctly and Try again${Color_Off}"
    echo -e "${BRed}--------------------------------------------------${Color_Off}"
    exit 1
fi

# Check if we have passed the correct PID
if [[ $PID -eq $1 ]]
then
    echo -e "${Green}--------------------------------------------------${Color_Off}"
    echo -e "${Green}Good work.${Color_Off}"
    echo -e "${Red}- Im killing the process for you :-)${Color_Off}"
    echo -e "${Green}- In Linux ${Cyan}less${Color_Off} is ${Cyan}more${Color_Off} ...${Color_Off}"
    echo -e "${Green}- Password for the next room is: ${BYellow}less${BGreen}is${BYellow}more${Color_Off}"
    echo -e "${Green}--------------------------------------------------${Color_Off}"
    sudo kill -9 $PID
else
    echo -e "${Yellow}Please make sure that you have done the following:${Color_Off}"
    echo -e "${Yellow} - Script named:        'room08_proc'${Color_Off}"
    echo -e "${Yellow} - Script is invoked as 'testUser'${Color_Off}"
fi

