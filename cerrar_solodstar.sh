#!/bin/bash

sed -i "62c Enable=1" /opt/MMDVM_Bridge/MMDVM_Bridge.ini
sudo systemctl restart ircddbgateway
sudo systemctl restart mmdvm_bridge

SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
cd /home/pi/Desktop
sudo cp Abrir_solodstar.desktop /home/pi
sleep 1

sed -i "6c Exec=sh -c 'cd /home/pi/V104/;lxterminal --geometry=80x15 -e sudo sh ejecutar_solodstar.sh'" /home/pi/Abrir_solodstar.desktop
sed -i "7c Icon=/home/pi/$SCRIPTS_version/SOLO_D-STAR.png" /home/pi/Abrir_solodstar.desktop
sed -i "11c Name[es_ES]=Abrir solo D-STAR" /home/pi/Abrir_solodstar.desktop
sed -i "13c SOLODSTAR=OFF" /home/pi/status.ini
sleep 1
cd /home/pi
sudo cp Abrir_solodstar.desktop /home/pi/Desktop
sleep 1
sudo rm /home/pi/Abrir_solodstar.desktop

sudo killall MMDVMDSTAR
sudo killall ircddbgateway
sudo killall MMDVMBM


