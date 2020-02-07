#!/bin/bash

while true
do
clear
SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
AUTOARRANQUE="AUTOARRANQUE"
AUTOARRANQUE=$AUTOARRANQUE$SCRIPTS_version
ROJO="\033[1;31m"
VERDE="\033[1;32m"
BLANCO="\033[1;37m"
AMARILLO="\033[1;33m"
CIAN="\033[1;36m"
GRIS="\033[0m"
echo "${VERDE}"
echo "   ********************************************************************"
echo -n "${CIAN}"
echo "   Script para Actualizar, instalar programas y ejecutar aplicaciones  "
echo -n "${ROJO}"
echo "                             $SCRIPTS_version by EA3EIZ"
echo -n "${VERDE}"
echo "   ********************************************************************"
#echo "\33[1;36m   1)\33[1;37m Actualizar imagen"
echo "\33[1;36m   2)${AMARILLO} Actualizar ${AMARILLO}YSF,${AMARILLO} YSF2DMR, DMR2YSF, DMR2NXDN y NXDNClients"
echo ""
echo "\33[1;32m      APARTADO BLUETOOTH"
echo "\33[1;32m      =================="
echo "\33[1;36m   3)\33[1;33m Activar el Bluetooth (en la imagen viene desactivado por defecto)"
echo "\33[1;36m   4)\33[1;33m Desactivar Bluetooth (esto habilita el puerto /dev/ttyAMA0)"
echo "\33[1;36m   5)\33[1;32m PDF con las instrucciones para emparejar el Bluetooth"
echo "\33[1;36m   6)\33[1;37m Anclar el puerto rfcomm0 para conectar el Bluetooth para siempre"
echo "\33[1;36m   7)\33[1;37m Anclar el puerto rfcomm1 para conectar el Bluetooth para siempre"
echo "\33[1;32m      =================="
echo ""
echo "\33[1;36m   8)\33[1;37m Instalar Anydesk"
echo "\33[1;36m   9)\33[1;37m Grabar pantalla Nextion"
echo "\33[1;36m  10)${VERDE} Menú Actualizar MMDVM_HS Libre kit y ZUMSpot"
echo "\33[1;36m  11)${AMARILLO} Actualizar YCS Para Conectar Por Protocolo FCS"
echo ""
echo "\33[1;36m  12)\33[1;31m Reiniciar Sistema"
echo ""
echo -n "\33[1;36m   Elige una opción: " 
read escoger_menu
echo ""
case $escoger_menu in
test) echo ""
while true
do
clear                     
                        instalarsi=S
                        case $instalarsi in
                        [sS]* ) echo ""
                        cd /tmp
                        git clone http://github.com/ea3eiz/test
                        cd test
                        sudo sh script_raspberry.sh                  
                        break;;
                        [nN]* ) echo ""
                        clear
                        exit;
                        break;;
esac
done;;
inis) echo ""
while true
do
clear                     
                        instalarsi=S
                        case $instalarsi in
                        [sS]* ) echo ""
                        sudo cp /opt/Analog_Bridge/dmr.ini /opt/Analog_Bridge/Analog_Bridge.ini
                        cd /home/pi
                        sudo sh configuracion_inis_neutros.sh                 
                        break;;
                        [nN]* ) echo ""
                        clear
                        exit;
                        break;;
esac
done;;
1) echo ""
while true
do
clear
                        ejecutar1=S
                        case $ejecutar1 in
                        [sS]* ) echo ""
                        echo ">>>>>>>>> ACTUALIZANDO >>>>>>>>"

                        #Actualiza reflectores
                        cd /usr/local/share/opendv/
                        sudo curl --fail -o DExtra_Hosts.txt -s http://www.pistar.uk/downloads/DExtra_Hosts.txt
                        sudo curl --fail -o DCS_Hosts.txt -s http://www.pistar.uk/downloads/DCS_Hosts.txt
                        sudo curl --fail -o DPlus_Hosts.txt -s http://www.pistar.uk/downloads/DPlus_Hosts.txt
                        sudo cp DExtra_Hosts.txt /home/pi/dv4mini/xref.ip

                        cd /home/pi/$SCRIPTS_version
                        sudo git pull
clear
sleep 1
                        sudo rm -R  /home/pi/$AUTOARRANQUE
                        cd /home/pi/
clear
sleep 1
                        cd /home/pi/$SCRIPTS_version/Desktop
                        sudo cp * /home/pi/Desktop

                        #clear                                                              
                        exit;
                        break;;
                        [nN]* ) echo ""
                        clear
                        exit;
                        break;;
esac
done;;
2) echo ""
while true
do
clear                     
                        instalarsi=S
                        case $instalarsi in
                        [sS]* ) echo ""
                        clear
                        cd /home/pi/$SCRIPTS_version/
                        sudo sh actualiza_YSF_YSF2DMR_DMR2YSF_DMR2NXDN_NXDNClients.sh                  
                        break;;
                        [nN]* ) echo ""
                        clear
                        exit;
                        break;;
esac
done;;
3) echo ""
while true
do
clear
echo "${ROJO}"
echo "   ****************************************************"
echo "   *            SI SE ACTIVA EL BLUETOOTH             *"
echo "   * EL DVMEGA PINCHADO EN LA RASPBERRY NO FUNCIONARÁ *"
echo "   * SE REINICIARÁ EL SISTEMA PARA APLICAR EL CAMBIO  *"
echo "   ****************************************************"
echo ""
echo "${VERDE}"                                               
read -p ' QUIERES SEGUIR CON EL CAMBIO S/N: ' seguir
	                        case $seguir in
			            [sS]* ) echo ""
					echo "ACTIVANDO BLUETOOTH"
					sed -i "57c #dtoverlay=pi3-disable-bt" /boot/config.txt
			            sudo reboot
                              break;;
		                  [nN]* ) echo ""
clear
break;;
esac
done;;
4) echo ""
while true
do
clear
echo "${ROJO}"
echo "   ***************************************************"
echo "   *         SI SE DESACTIVA EL BLUETOOTH            *"
echo "   * SE REINICIAR EL SISTEMA PARA APLICAR EL CAMBIO  *"
echo "   ***************************************************"
echo "" 
echo "${VERDE}"                                              
read -p ' QUIERES SEGUIR CON EL CAMBIO S/N: ' seguir
                        case $seguir in
                        [sS]* ) echo ""
                        echo "DESACTIVANDO BLUETOOTH"
                        sed -i "57c dtoverlay=pi3-disable-bt" /boot/config.txt
                        sudo reboot
                        break;;
                        [nN]* ) echo ""
clear
break;;
esac
done;;
5) echo ""
while true
do
clear

	                	ejecutar1=S
		    			case $ejecutar1 in
						[sS]* ) echo ""
						echo ">>>>>>>>> EMPAREJAR BLUETOOTH >>>>>>>>"
                        cd /home/pi/SCRIPTS_version
                        evince ./EMPAREJAR_BLUETOOTH.pdf
                        clear
                        exit;
						break;;
						[nN]* ) echo ""
						clear
						exit;
						break;;
esac
done;;
6) echo ""
while true
do
clear
	                    ejecutar1=S
		                case $ejecutar1 in
		                [sS]* ) echo "\33[1;32m<<<< ESCANEANDO DISPOSITIVOS BLUETOOTH >>>>"
						echo ""
						echo "\33[1;36m" # color Cian
						sudo hcitool scan
						echo "\33[1;32m" #color verde
						echo "Copia la mac del modulo Bluetooth HC-05 para pegarla en el siguiente paso"
						echo ""
						echo "\33[1;33m" #amarillo
			            echo "PEGA LA MAC DE TU BLUETOOTH aquí y pulsa Enter"	          		            
			            read mac
						sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version;sudo sh actualizar_02_07_06.sh;sudo rfcomm bind /dev/rfcomm0 $mac'" /home/pi/.config/autostart/actualizar.desktop
						clear
						echo ""
						echo ""
						echo ""
						echo "\33[1;31m" #color rojo
						echo "********************************************************************"
						echo "* SE NECESITA REINICIAR EL SISTEMA PARA ANCLAR EL PUERTO rfcomm0   *"
						echo "********************************************************************"
						echo "\33[1;37m" #color
						echo "Pulsa Enter para salir"
			            read a
			            break;;
		                [nN]* ) echo " "
clear
exit;
break;;
esac
done;;
7) echo ""
while true
do
clear
	                    ejecutar1=S
		                case $ejecutar1 in
		                [sS]* ) echo "\33[1;32m<<<< ESCANEANDO DISPOSITIVOS BLUETOOTH >>>>"
						echo ""
						echo "\33[1;36m" # color Cian
						sudo hcitool scan
						echo "\33[1;32m" #color verde
						echo "Copia la mac del modulo Bluetooth HC-05 para pegarla en el siguiente paso"
						echo ""
						echo "\33[1;33m" #amarillo
			            echo "PEGA LA MAC DE TU BLUETOOTH aquí y pulsa Enter"	          		            
			            read mac
						sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version;sudo sh actualizar_02_07_06.sh;sudo rfcomm bind /dev/rfcomm1 $mac'" /home/pi/.config/autostart/actualizar.desktop
						clear
						echo ""
						echo ""
						echo ""
						echo "\33[1;31m" #color rojo
						echo "********************************************************************"
						echo "* SE NECESITA REINICIAR EL SISTEMA PARA ANCLAR EL PUERTO rfcomm1   *"
						echo "********************************************************************"
						echo "\33[1;37m" #color
						echo "Pulsa Enter para salir"
			            read a
			            break;;
		                [nN]* ) echo ""
clear
exit;
break;;
esac
done;;
8) echo ""
while true
do
clear
                        
						
						#comprueba si el fichero existe
                        if [ -d /home/pi/.anydesk ];
                        then
                        clear
                        echo "${VERDE}"
                        echo "*******************************************"
                        echo "*       ANYDESK YA ESTÁ INSTALADO         *"
                        echo "*******************************************"
                        sleep 5
                        instalarsi="N"
                        else
                        instalarsi="S"
                        fi
                        #================================

                        case $instalarsi in
                        [sS]* ) echo ""
                        echo ">>>>>>>>> INSTALANDO ANYDESK >>>>>>>>"

                        cd /home/pi/Downloads
                        wget http://download.anydesk.com/rpi/anydesk_2.9.4-1_armhf.deb
                        sudo dpkg -i anydesk_2.9.4-1_armhf.deb
                        sudo apt-get -f install
                        sudo dpkg -i anydesk_2.9.4-1_armhf.deb
                        echo "Anydesk Instalado"
                        sleep 2
                        break;;
                        [nN]* ) echo ""
clear
exit;
break;;
esac
done;;
9) echo ""
while true
do
clear
	                    ejecutar1=S
		                case $ejecutar1 in
			            [sS]* ) echo ""
			            echo ">>>>>>>>> GRABAR NEXTION ORIGINAL >>>>>>>>"
                        sudo sh grabar_nextion_05.sh
                        exit;
		                break;;
		                [nN]* ) echo ""
clear
exit;
break;;
esac
done;;
10) echo ""
while true
do
clear
                                ejecutar1=S
                                case $ejecutar1 in
                                [sS]* ) echo ""

echo "${ROJO}"
echo "   *********************************************************"
echo "   * ATENCIÒN!!! Si estás utilizando la Raspberry pi 3 B+  *"
echo "   * Dicha máquina tiene los puertos USB de alta velocidad *"
echo "   * por lo que tendrás que utilizar un ladrón de USB      *"
echo "   * para poder rebajar la velocidad de los puertos USB    *"
echo "   * y así poder grabar los pinchos sin ningun problema    *"
echo "   *********************************************************"
echo "${VERDE}"

echo "${AMARILLO}"
echo "   *********************************************************************"
echo "   * Haz clik en el icono donde tengas conectado el pincho             *"
echo "   * una vez se abra la consola mostrando que se conectó correctamente *"
echo "   * cierra dicha consola y utiliza el MENÚ que te aparecerá           *"
echo "   *********************************************************************"
echo "${VERDE}"
echo -n "    Pulsa una tecla para seguir "
read a
                                sh flash_mmdvm_hs.sh
                                echo ""
                                break;;
                                [nN]* ) echo ""
clear
exit;
break;;
esac
done;;
a) echo ""
while true
do
clear
                                ejecutar1=S
                                case $ejecutar1 in
                                [sS]* ) echo ""
                                cd home/pi
                                git clone https://github.com/ea3eiz/AMBE_SERVER
                                cd home/pi/AMBEServer
                                sleep 2
                                make
                                cd /home/pi/V104
                                sudo cp Abrir_ambe_server.desktop /home/pi/Desktop
                                echo ""
                                exit;
                                break;;
                                [nN]* ) echo ""
clear
exit;
break;;
esac
done;;
11) echo ""
while true
do
clear
                        ejecutar1=S
                        case $ejecutar1 in
                        [sS]* ) echo ""
                        echo ">>> Actualizar YCS Para Conectar Por Protocolo FCS >>>"
                        sudo rm -R /home/pi/YSFClients
                        cd /home/pi
                        git clone https://github.com/g4klx/YSFClients
                        cd /home/pi/YSFClients/YSFGateway
                        make
                        sudo cp /home/pi/V104/FCSRooms.txt /home/pi/YSFClients/YSFGateway                                                             
                        clear                                                              
                        exit;
                        break;;
                        [nN]* ) echo ""
                        clear
                        exit;
                        break;;
esac
done;;
12) echo ""
while true
do
clear
echo " \33[1;31m  ************************************************************"
echo "   *                                                          *"
echo "   *     OJO!!   SE VA A REINICIAR EL SISTEMA                 *"
echo "   *                                                          *"
echo "   ************************************************************"
echo ""
                read -p '   Estás seguro de querer reiniciar ? Si/No: ' ejecutar13
                    case $ejecutar13 in
                        [sS]* ) echo ""
                        echo "ok >>>>>"
                        sudo reboot
                        echo ""
                        echo "Ok, se ha ejecutado correctamente"
                        echo ""
                        break;;
                        [nN]* ) echo ""
                        break;;
esac
done;;
0) echo ""
clear
echo "\33[1;33m   ******************************"
echo "   *                            *"
echo "   *     CERRANDO SCRIPT        *"
echo "   *                            *"
echo "   ******************************"
sleep 1
clear
exit;;	
esac
done
