#!/bin/bash
#***********************************************  #KickPi-OS Retropie content loader  ***********************************
# Install KickPi-OS
# B.Titze 2021
#***********************************************  #Some Info for the future  ***********************************
# not ready....

if [ ! -f /home/$USER/RetroPie/roms/Romset.zip ]; then
      clear
      toilet -F gay Retropie
      echo " "
      echo " "
      echo "  Configure Retropie Romset from Archiv.org " 
      echo " "
      echo " "
      cd /home/$USER/RetroPie/roms
      wget https://archive.org/download/archive_20190819/Romset.zip
      unzip -u /home/$USER/RetroPie/roms/Romset.zip
      
      else 
      clear
      
      fi
      
if [ ! -f /home/$USER/RetroPie/roms/Amiga_WHD_Games ]; then
      clear
      toilet -F gay Retropie
      echo " "
      echo " "
      echo "  Configure Retropie Romset from Archiv.org " 
      echo " "
      echo " "
      cd /home/$USER/RetroPie/roms
      #wget https://archive.org/compress/Amiga_WHD_Games
      #unzip -u /home/$USER/RetroPie/roms/Amiga_WHD_Games
      
      else 
      clear
      
      fi

