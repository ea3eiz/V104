﻿#!/bin/bash
						clear

						#Colores
						ROJO="\033[1;31m"
						VERDE="\033[1;32m"
						BLANCO="\033[1;37m"
						AMARILLO="\033[1;33m"
						CIAN="\033[1;36m"
						GRIS="\033[0m"
						MARRON="\33[38;5;138m"

						echo "${ROJO}"
						echo "            *******************************************************"
						echo "${BLANCO}"
						echo "                TODA LA CONFIGURACIÓN DEL ANTERIOR IRCDDBGATEWAY "
						echo ""
						echo "                  SE PERDERÁ Y DEBERÁS CONFIGURARLO DE NUEVO  "
						echo "${ROJO}"
						echo "            *******************************************************"
						echo "\v\v"
						echo "${CIAN}"

						echo -n "       Quieres actualizar Ircddbgateway a la última versión ? ${AMARILLO}S/N: "
						read actualizar						           	                           
                      	case $actualizar in
			          	[sS]* ) echo ""
						echo "Estas actualizando"
						# sudo mv /usr/local/bin/ircddbgateway /usr/local/bin/ircddbgateway_2016
						# sudo mv /usr/local/bin/ircddbgatewayconfig /usr/local/bin/ircddbgatewayconfig_2016
						# sudo mv /usr/local/bin/remotecontrol /usr/local/bin/remotecontrol_2016

						# sudo cp /home/pi/V104/ircddbgateway /usr/bin/ircddbgateway
						# sudo cp /home/pi/V104/ircddbgatewayconfig /usr/bin/ircddbgatewayconfig
						# sudo cp /home/pi/V104/remotecontrol /usr/bin/remotecontrol

						# sudo rm -R /usr/share/opendv
						# sudo mkdir /usr/share/opendv
						# sudo cp /usr/local/share/opendv/*.ambe /usr/share/opendv/
						# sudo cp /usr/share/ircddbgateway/*.* /usr/share/opendv/

						# sudo rm -R /var/log/opendv
						# sudo mkdir /var/log/opendv

						read a
						break;;
			       		[nN]* ) echo ""
						echo " No actualiza"
						read a
			       		break;;
						esac



