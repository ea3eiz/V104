#!/bin/bash
sudo systemctl stop ircddbgateway.service
modo=$(awk "NR==18" /home/pi/status.ini)
if [ "$modo" = 'DVSWITCH=ON' ];then
echo "\033[1;31m" #ROJO
echo "******************************************"
echo "*        ESTO DESACTIVARÁ D-STAR         *"
echo "*              EN DVSWITCH               *"
echo "******************************************"
sleep 5
#else
clear
SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
echo "***********************************************"
echo "*             ABRIENDO SOLO D-STAR            *"
echo "***********************************************"
mode=`grep -n -m 1 "^Port=" /home/pi/MMDVMHost/MMDVMDSTAR.ini`
buscar=":"
caracteres=`expr index $mode $buscar`
caracteres_linea=`expr $caracteres - 1`
numero_linea_port=`expr substr $mode 1 $caracteres_linea`
mode=$(awk "NR==$numero_linea_port" /home/pi/MMDVMHost/MMDVMDSTAR.ini)
puerto=`expr substr $mode 14 9`
puerto="  "$puerto
cd /home/pi/Desktop
sudo cp RXF_DSTAR.desktop /home/pi
frecuencia=$(awk "NR==13" /home/pi/MMDVMHost/MMDVMDSTAR.ini)
frecuencia=`expr substr $frecuencia 13 9`
frecuencia=$frecuencia$puerto
sed -i "11c Name=$frecuencia" /home/pi/RXF_DSTAR.desktop
sleep 1
sudo cp /home/pi/RXF_DSTAR.desktop /home/pi/Desktop
sleep 1
sudo rm /home/pi/RXF_DSTAR.desktop

#Escribe en el fichero INFO_RXF para poner los datos del icono INFO TXF                         
sed -i "5c $frecuencia" /home/pi/INFO_RXF

SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
cd /home/pi/Desktop
sudo cp Abrir_solodstar.desktop /home/pi
sed -i "6c Exec=sh -c 'cd /home/pi/$SCRIPTS_version; lxterminal -e sudo sh cerrar_solodstar.sh'" /home/pi/Abrir_solodstar.desktop
sed -i "7c Icon=/home/pi/$SCRIPTS_version/SOLO_D-STAR_ON.png" /home/pi/Abrir_solodstar.desktop
sed -i "11c Name[es_ES]=Cerrar solo D-STAR" /home/pi/Abrir_solodstar.desktop
sed -i "13c SOLODSTAR=ON" /home/pi/status.ini
cd /home/pi
sudo cp Abrir_solodstar.desktop /home/pi/Desktop
sleep 1
sudo rm /home/pi/Abrir_solodstar.desktop

sed -i "62c Enable=0" /opt/MMDVM_Bridge/MMDVM_Bridge.ini
sudo systemctl stop ircddbgateway
sudo systemctl restart mmdvm_bridge.service

cd /home/pi/MMDVMHost
echo "\33[1;32m"
clear
echo "***********************************************"
echo "*             ABRIENDO SOLO D-STAR            * "
echo "***********************************************"
sleep 1
sudo ./MMDVMDSTAR MMDVMDSTAR.ini & ircddbgateway -gui
else
SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
cd /home/pi/Desktop
sudo cp Abrir_solodstar.desktop /home/pi
sed -i "6c Exec=sh -c 'cd /home/pi/$SCRIPTS_version; lxterminal -e sudo sh cerrar_solodstar.sh'" /home/pi/Abrir_solodstar.desktop
sed -i "7c Icon=/home/pi/$SCRIPTS_version/SOLO_D-STAR_ON.png" /home/pi/Abrir_solodstar.desktop
sed -i "11c Name[es_ES]=Cerrar solo D-STAR" /home/pi/Abrir_solodstar.desktop
sed -i "13c SOLODSTAR=ON" /home/pi/status.ini
cd /home/pi
sudo cp Abrir_solodstar.desktop /home/pi/Desktop
sleep 1
sudo rm /home/pi/Abrir_solodstar.desktop

fi
