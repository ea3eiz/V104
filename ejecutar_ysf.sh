#!/bin/bash
SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
cd /home/pi/Desktop
sudo cp Abrir_YSF.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version;sudo sh cerrar_ysf.sh'" /home/pi/Abrir_YSF.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/YSF_ON.png" /home/pi/Abrir_YSF.desktop
sed -i "10c Name[es_ES]=Cerrar YSF" /home/pi/Abrir_YSF.desktop
sed -i "3c YSF=ON" /home/pi/status.ini
cd /home/pi
sudo cp Abrir_YSF.desktop /home/pi/Desktop

sudo rm /home/pi/Abrir_YSF.desktop

cd /home/pi/YSFClients/YSFGateway
echo "${VERDE}"
echo " ******************************************************************************"
echo " ******************************   ABRIENDO YSF    *****************************"
echo " ******************************************************************************"
sleep 2
echo "\33[1;33m"
sudo ./YSFGateway YSFGateway.ini






