#!/bin/bash
#/usr/lib/piclone
export TEXTDOMAIN=piclone

[Desktop Entry]
Type=Application
Name=SD Card Copier
Name[de]=SD Card Copier
Name[en_GB]=SD Card Copier
Name[nb]=SD Card Copier
Name[sk]=Kopírovanie SD kariet
GenericName=SD Card Copier
GenericName[de]=SD Card Copier
GenericName[en_GB]=SD Card Copier
GenericName[nb]=SD Card Copier
GenericName[sk]=Kopírovanie SD kariet
Comment=Make a copy of the Raspbian SD card
Comment[de]=Erstellen Sie eine Kopie der Raspbian SD-Karte
Comment[en_GB]=Copy SD cards and USB devices
Comment[nb]=Lag en kopi av Raspbian-SD-kortet
Comment[sk]=Kopírovať SD karty a USB zariadenia
Icon=media-removable
Exec=env SUDO_ASKPASS=/usr/lib/piclone/pwdpic.sh sudo -AE dbus-launch piclone
NotShowIn=GNOME;XFCE;
StartupNotify=true
Categories=Utility;

zenity --password --title "$(gettext "Password Required")"

