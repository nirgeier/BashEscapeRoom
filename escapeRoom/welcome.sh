#!/bin/bash

# Clear screen
clear

# Get the pwd of the this script
SCRIPT_PATH=$(dirname -- "${BASH_SOURCE[0]}")

# Load the colors
if [ -x "${SCRIPT_PATH}/_utils.sh" ]; 
then
   source "${SCRIPT_PATH}/_utils.sh"
fi

echo -e "${Yellow}"
echo -e "--------------------------------------------"
echo -e "           Linux Bash Escape Room           "                     
echo -e "--------------------------------------------"
echo -e ""

slowecho "- Welcome to the Linux Bash Escape Room." ${Purple} 
slowecho "- This place is full of secrets and only the chosen ones can escape ... " ${Green}
slowecho "- The folder /home/escape/escapeRoom contain the different rooms (folders names room_xx)" ${Purple} 
slowecho "- Each folder has an encrypted README file (except the first room README - This file)" ${Green}
slowecho "- To reveal the next room README file, following the clues ..." ${Purple} 
slowecho "- Every README file uses 'vim encryption' ... to open them you will need a password (key)..." ${Green}

echo -e ""
echo -e "${Cyan}>> Tip 01: ${Color_Off}" 
echo -e "${Cyan}  Once you open the encrypted file, the command: ${Yellow}:set key=${Color_Off}. "
echo -e "${Cyan}  Dont forget to save ${Yellow}(:wq)${Cyan} in order to keep the file unlocked (keep it in mind for other rooms)."  
  
echo -e ""
echo -e "${Yellow}>> Tip 02: ${Color_Off}" 
echo -e "${Yellow}  To make the magic happen (delete, rename, change ownership, create files and etc.),${Color_Off}"  
echo -e "${Yellow}  you will need your secret sudo password: ${Green}escape${Color_Off}." 

echo -e ""
echo -e "${Red}>>> Press any key to continue${Color_Off}"

# Wait for user input to continue (max timeout 600 seconds)
read -t 600 -n 1

# Clear the screen
clear

echo -e "${BYellow} This is what you need to do in the First room (room_01):"
echo -e "---------------------------------------------------------"

slowecho "1. Go to 'room_files' folder" ${Green} 

slowecho "2. Delete/move/filter-out all the files with '.txt' extension." ${Yellow}
slowecho "   - highly recommended to backup the folder before you make changes" ${Yellow} 

slowecho "3. Sort the remaining files by 'size' " ${Green} 
slowecho "   - Ascending Order, including the hidden files!! " ${Green} 
  
slowecho "4. View the file names on the screen, then take the [first letter] of each filename top-to-bottom." ${Yellow} 
 
slowecho "5. Once you discover the hidden message, move to the next room." ${Green} 

slowecho "6. Open the README file using the hidden message in [lowercase] without spaces..." ${Yellow} 

echo -e "${Cyan}>> Reminder: ${Color_Off}" 
echo -e "${Cyan}  Once you open the encrypted file, the command: ${Yellow}:set key=${Color_Off}. "
echo -e "${Cyan}  Dont forget to save ${Yellow}(:wq)${Color_Off} in order to keep the file unlocked (keep it in mind for other rooms)."  
      
echo -e ""
echo -e ""
