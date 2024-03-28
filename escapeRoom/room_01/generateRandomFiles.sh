#!/bin/bash

for i in {1..2500}
do
   # Generate a random number 
   length=$(( RANDOM % 1000 + 10 ))

   # Generate a random string of the determined length
   random_string=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w $length | head -n 1)

   # Generate a random file name
   file_name=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 10 | head -n 1)

   # Write the random string to a .txt file
   echo "$random_string" > "room_files/$file_name.txt"
done