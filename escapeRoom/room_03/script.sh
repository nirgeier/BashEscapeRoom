#/bin/bash

################################################################
# Util section to print in colors.                             #
# This is not part of the  main script, but it's used by it    #
# to print messages in colors, you can skip this part          #
# Get the pwd of the this script                               #
source ../_utils.sh                                            #
################################################################

#
# The creature is hungry
#
if [ ! -f ./food ];
then
  echo -e ""
  echo -e "${BRed}  No No! I am hungry,                            ${Color_Off}"
  echo -e "${BRed}  I Dont see any ${BGreen}food${Color_Off} ${Yellow}files around!${Color_Off}"
  echo -e "${BRed}  Give me        ${BGreen}food${Color_Off} ${Yellow}please!${Color_Off}"
  echo -e ""
  exit 1
fi

#
# He is still hungry
#
group=$(stat -c "%G" food)
if  [ "$group" != "vegan" ];
then
  echo -e ""
  echo -e "${BRed}  Oh No, I forgot to mention that i only eat                           ${Color_Off}"
  echo -e "${BRed}  ${BGreen}vegan group${Color_Off} ${BRed}food${Color_Off}, ${BRed}give me ${BGreen}food${Color_Off} ${Yellow}please!${Color_Off}"
  echo -e ""
  exit 1
fi

# Calculate the key to the chest 
key=1
 
for i in {1..36..3}
do 
  b=$(( 2 * key + i  ))
  key=$((key + b))
done

/usr/games/cowsay "MOO MOO MOO ...
 The password to open the chest is $(echo -e ${BRed}$key${Color_Off})     "

echo -e ""
echo -e ""
echo -e "${BYellow}Linux Usage Statistics (2024) ${Color_Off}"
echo -e "${BYellow}-----------------------------${Color_Off}"
echo -e "- The Linux market share on desktop is less that ${BGreen}2%${Color_Off}"
echo -e "${BYellow}- ${BGreen}96.3%${Color_Off} of the world's top 1 million servers run on Linux${Color_Off}"
echo -e "${BYellow}- ${BGreen}90%  ${Color_Off} of Hollywood's special effects are made on Linux${Color_Off}"
echo -e "${BYellow}- ${BGreen}90%  ${Color_Off} of the public cloud workload runs on Linux${Color_Off}"
echo -e "${BYellow}- ${BGreen}83.1%${Color_Off} of developers claim that they prefer to work on Linux as opposed to other operating systems${Color_Off}"
echo -e ""
echo -e ""


