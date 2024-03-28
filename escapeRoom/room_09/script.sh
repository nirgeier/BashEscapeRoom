#!/bin/bash

source /home/escape/escapeRoom/_utils.sh
###
### This script will test if the user solved the puzzle
###

# Function to calculate sum
function calculate_sum {

    # Start the sum variable
    sum=0
    # loop from 1 to the desired number
    for (( i=1; i<=$1; i++ ))
    do
        # Calculate the result
        sum=$((sum + i))
    done
    # Print out result
    echo $sum
}

# Test the function with random number
for i in {1..5}
do
    # Generate random number
    NUMBER=$(shuf -i 1-1000 -n 1)
    echo -e "Testing ${BYellow}escape $NUMBER${Color_Off}"

    # calculate usign user script
    SUM=$(escape $NUMBER)
    # calculated using our script
    EXPECTED=$(calculate_sum $NUMBER)

    # Verify if the results are equal
    if [ "$SUM" == "$EXPECTED" ] 
    then    
        echo -e "${Green}Passed [$SUM]${Color_Off}"
    else
        echo -e "${Red}Failed [$SUM]${Color_Off}"
        exit 1
    fi    
done

echo -e ""
echo -e ""
echo -e "${Cyan}--------------------------------------------------------------${Color_Off}"
echo -e "${Cyan}Well Done !!!${Color_Off}"
echo -e ""
echo -e "${Green}The password for the next room is: ${BYellow}linux${BGreen}is${BYellow}free${Color_Off}"
echo -e ""
echo -e ""
