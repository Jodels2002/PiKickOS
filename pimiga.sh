


#!/bin/bash
# Install Pimiga - not for use!!!
# B.Titze 2020
## PWR-LED (green)
#dtoverlay = pwr-led, gpio = 17
# HDD LED (orange)
#dtoverlay = act-led, gpio = 27
# -language set for GB,DE,IT,ES..
# -OLED DISPLAY Amiga þ- bootpic... amyberry, amibian, Amiga Logo
# -since USBþStick possible... update BOOT and script create USBSTick (PI400) 
# -Cusom Webserver, RaspiControl, ( Lights, FAN, OLED;...) -> WebAdmin is overkill
# -Preinstalled ClassicWB for amyberry..... -> extract HDF to folder for easy acces from Linux
# -Amibian Colour Menue in Amiga colours - consultation with G.K -> OK
# -rename the Amibian Version of raspi-config ( Update proof) - consultation with G.K -> 
# Useful PiKiss Modules, CoolTerm, Certificates....stuff

# https://github.com/rewtnull/amigafonts
# https://github.com/HoraceAndTheSpider/RetroPieAmigaSetup
# https://github.com/HoraceAndTheSpider/UAEConfigMaker

# 11.01.2021 Amibian update & Settings Ok 
# 11.01.2021 PiKiss OK -> todo CoolTerm, Certificates 
# 18.01 Menu & Funktions

if [ "$(whoami &2>/dev/null)" == "root" ] && [ "$(id -un &2>/dev/null)" == "root" ]
      then
      echo "Don't be root to run this script!"
      echo "Pleas don't use 'sudo !!'"
      exit 1
      fi
sudo apt-get -y update 
sudo apt install -y toilet
clear
toilet -F gay Pimiga3000
echo " "
echo " "
echo " "
echo "Pimiga3000 mini  Setup"
echo " "
echo " "
echo "Lets start ..."
echo " "
echo "Backup Settings...."

mkdir /home/$USER/.backup/
sudo chmod -R 777 ~/.backup/
cp -R ~/.config/ ~/.backup/.config
cp -R ~/.local/ ~/.backup/.local
cp -R /usr/local/bin ~/.backup/usr

#****************************************************************************************************************

HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=4
BACKTITLE="Pimiga3000"
TITLE="Title here"
MENU="Please select:"

OPTIONS=(1 "Install Pimiga3000"
         2 "Install Pimiga3000, Retropie & Tools"
         3 "Install Pimiga3000, Pimiga3000 Desktop, Retropie & Tools")

CHOICE=$(dialog --clear \
                --backtitle "$Pimiga3000" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
case $CHOICE in
        1)
            echo "Pimiga3000"
            Pimiga_Tools()
            Pimiga_Amiberry()
            Pimiga_PiKiss()
            ;;
        2)
            echo "Pimiga3000, Retropie & Tools"
            Pimiga_Update()
            Pimiga_Tools()
            Pimiga_Amiberry()
            Pimiga_Retropie()
            Pimiga_PiKiss()
            ;;
        3)
            echo "Pimiga3000, Pimiga3000 Desktop, Retropie & Tools"
            Pimiga_Update()
            Pimiga_Tools()
            Pimiga_Amiberry()
            Pimiga_Retropie()
            Pimiga_PiKiss()
            Pimiga_Desktop()
            ;;
esac
 #****************************************************************************************************************

cd ~/Pimiga_mini
clear
toilet -F gay Pimiga3000
 #****************************************************************************************************************
Pimiga_Desktop() {
   echo "Installing Pimiga3000 Desktop ..."

      #echo "Update Settings since LXDEPanel has a bug... to mutch applications on Dock ...No Image"
      # Todo create a clean Menu
      unzip ~/Pimiga_mini/data.pac
      #rm -r ~/.config
      #mkdir ~/.config
      #rm -r ~/.local
      #mkdir ~/.local
      #mv ~/Pimiga_mini/.data/.config/ /home/$USER/
      #mv ~/Pimiga_mini/.data/.local/ /home/$USER/
      #sudo apt install -y xserver-xorg xfce4 
      #sudo apt install -y xfce4-goodies
      #sudo apt install -y xfce4-utils
      sudo apt install -y xserver-xorg 
      cd /usr/share/icons/
      sudo cp -R /home/$USER/Pimiga_mini/.data/AMIGAOSLINUX.zip /usr/share/icons
      sudo unzip /usr/share/icons/AMIGAOSLINUX.zip /usr/share/icons/
      #mv ~/Pimiga_mini/.data/.config/lxsession ~/.config/lxsession
      #mv ~/Pimiga_mini/.data/.config/lxterminal ~/.config/lxterminal
}
 #****************************************************************************************************************

clear
toilet -F gay Pimiga3000
echo " "
echo " "
echo "            Time to update:)              "

Pimiga_Update() {
      echo "Installing Pimiga3000 Update System ..."
      sudo apt-get -y upgrade

}

#****************************************************************************************************************

Pimiga_Tools() {
clear
toilet -F gay Pimiga3000
echo " "
echo " "
echo "            Lets install some usefull Tools:)              "


      sudo apt install -y mc git gparted synaptic firefox-esr geany geany-plugins-common geany-common imagemagick 
      sudo apt-get -y install openbox-menu  obmenu 
      sudo apt-get install -y libsdl2-2.0-0 libsdl2-ttf-2.0-0 libsdl2-image-2.0-0 libxml2 flac mpg123 libmpeg2-4
      sudo apt-get install -y libraspberrypi-dev

      clear
      toilet -F gay Pimiga3000
      #Some little Amiga stuff....
      sudo apt-get -y install amiga-fdisk-cross buzztrax grafx2 protracker unadf worker xdms
      clear
      toilet -F gay Pimiga3000
}
 
 #****************************************************************************************************************
 
Pimiga_Retropie() {
#Install Retropie/Setup
      clear
      toilet -F gay Pimiga3000
      echo " "
      echo " "
      echo "  ... here comes Retropie :-)     "   

      sudo apt-get install -y git dialog unzip xmlstarlet
      git clone --depth=1 https://github.com/RetroPie/RetroPie-Setup.git
      sudo chmod -R 777 /home/amibian/RetroPie-Setup/
      cd /home/amibian/RetroPie-Setup

      sudo __nodialog=1 ./retropie_packages.sh setup basic_install
      clear
      toilet -F gay Pimiga3000
      sudo __nodialog=1 ./retropie_packages.sh setup amiberry
      clear
      toilet -F gay Pimiga3000
      sudo __nodialog=1 ./retropie_packages.sh setup vice
      sudo _clear
      toilet -F gay Pimiga3000
      sudo _nodialog=1 ./retropie_packages.sh setup lr-vice
      clear
      toilet -F gay Pimiga3000
      #sudo __nodialog=1 ./retropie_packages.sh setup giana
      clear
      toilet -F gay Pimiga3000
      #sudo __nodialog=1 ./retropie_packages.sh setup eduke32
      
}
 #****************************************************************************************************************
     
     Pimiga_Amiberry() {
      # Install Amiberry Raspberry Pi with SDL2 + DispmanX
      clear
      toilet -F gay Pimiga3000
      echo " "
      echo " "
      echo "  ... here comes Amiberry  :-)   "   
      cd ~
      sudo apt-get install -y libsdl2-dev libsdl2-ttf-dev libsdl2-image-dev libxml2-dev libflac-dev libmpg123-dev libpng-dev libmpeg2-4-dev
      git clone https://github.com/midwan/amiberry
      cd amiberry
      make -j2 PLATFORM=rpi4
      sudo chmod -R 777 /home/$USER/amiberry
      clear
      toilet -F gay Pimiga3000
      echo " "
      echo " "
      echo "  Amiberry is compiled ...     " 
      clear
      toilet -F gay Pimiga3000
      echo " "
      echo "  ... lets configer ClassicWB"  
      # Preinstall Classic WB UAE
      mkdir /home/$USER/Amiga
      mkdir /home/$USER/Amiga/HDD
      mkdir /home/$USER/Amiga/FDD
  
      sudo mkdir /boot/Amiga
      sudo chmod -R 777 /home/$USER/Amiga
      sudo cp -R /home/$USER/amiberry/kickstarts /boot/Amiga
      cd cd ~/Amiga
      clear
      toilet -F gay Pimiga3000
      wget http://download.abime.net/classicwb/ClassicWB_UAE_v28.zip
      clear
      toilet -F gay Pimiga3000
      echo " "
      echo " "
      echo "  ClassicWB extracting ...     " 
      unzip ./ClassicWB_UAE_v28.zip
  
      clear
      toilet -F gay Pimiga3000
      echo " "
      echo " "
      echo "  Configure ClassicWB ...     " 
      mv /home/$USER/amiberry/ClassicWB_UAE_v28 /home/$USER/Amiga/HDD
        # Preinstall AROS
      wget https://netcologne.dl.sourceforge.net/project/aros/nightly2/20210114/Binaries/AROS-20210114-raspi-armhf-system.tar.bz2
      #entpacken ./AROS-20210114-raspi-armhf-system.tar.bz2
      sudo chmod -R 777 /home/$USER/Amiga
      sudo chmod -R 777 /home/$USER/amiberry
      
    }
    
 #****************************************************************************************************************

Pimiga_PiKiss() {
     #Install PiKISS
      clear
      toilet -F gay Pimiga3000
      echo " "
      echo " "
      echo "  ... here comes PiKiss  :-)   "     
      cd ~
      git clone --depth=1 https://github.com/jmcerrejon/PiKISS

      cd PiKISS
      sudo chmod -R 777 ./piKiss.sh
      clear
      toilet -F gay Pimiga3000
      echo " "
      echo " "
      echo "  PiKiss is ready for you...     " 
      echo "Here you can install additional software :-)"
      echo " · TIP: F12 = Menu."
      echo "I hardly recommend: Coolterm, Tweaks, ..."
      echo
      read -p "Press [ENTER] to continue..."
      sudo ./piKiss.sh 
}
 #****************************************************************************************************************


 cd ~
clear
toilet -F gay Pimiga3000

 echo " "
      echo " "
      echo "  ... cleanup and finish setup  "   
      sudo apt-get -y autoremove
      sudo chmod -R 777 /usr/local/bin/
      sudo chmod -R 777 /usr/local/share/
      sudo chmod -R 777 /home/$USER/.backup/
      sudo chmod -R 777 /home/$USER/.config/
      sudo chmod -R 777 /home/$USER/.local/

      whiptail --msgbox " Ready,... Okey, here we are ... Lets Pimiga3000 (mini) :-)" 20 60 1
clear
toilet -F gay Pimiga3000
startx


