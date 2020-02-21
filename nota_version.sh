#!/bin/bash
actualizacion=$(awk "NR==1" /home/pi/.config/autostart/actualizacion)
SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
ROJO="\033[1;31m"
VERDE="\033[1;32m"
BLANCO="\033[1;37m"
AMARILLO="\033[1;33m"
CIAN="\033[1;36m"
GRIS="\033[0m"
echo "${VERDE}"
echo "   ************************************************************************************"
echo -n "${CIAN}"
echo "                      NOTAS DE LA VERSIÓN: ${AMARILLO}$SCRIPTS_version${CIAN}Actualización: ${AMARILLO}$actualizacion"
echo -n "${VERDE}"                                                                                 
echo "   ************************************************************************************"
echo "\33[1;36m   Gracias por descargar la imagen de ${AMARILLO}ADER $SCRIPTS_version"

echo "${BLANCO}"
info=$(cat /etc/os-release > /home/pi/info.txt)
info=$(awk "NR==1" /home/pi/info.txt)
echo "   $info"
echo -n "${AMARILLO}"

echo "\33[1;32m   Imagen multi plataforma para \33[1;33mRADIOAFICIONADOS."

echo -n "${AMARILLO}"

echo ""
echo "   Project participants:"
echo "${BLANCO}   -EA3EIZ (Developer and designer programmer) -EA3EG (Innovative & System Tester)"# -EA4AOJ (Linux expert)"

echo ""
echo "\33[1;33m   - Utilizar adecuadamente los puertos de los correspondientes Módems."
echo ""
echo -n "${VERDE}"
echo "   Esta imagen utiliza programas de terceros de:" 
echo "   Jonathan Naylor G4KLX, David Palm PA7LIM, José Uribe (Andy) CA6JAU, ON7LDS,"
echo "   Torsten Schultze DG1HT, Estefan Reiman DG8FAC, Manuel EA7EE y Kurt Moraw DJ0ABR." 
echo ""
echo "\33[1;31m   Recomendación de no modificar total o parcialmente el contenido de esta imagen."
echo "\33[1;31m   Podria dañar algún fichero del sistema y el funcionamiento de la misma."

						mmdvm=$(awk "NR==22" /home/pi/MMDVMHost/Version.h)
						var10=`echo "$mmdvm" | tr -d '[[:space:]]'`
						var10=`expr substr $var10 20 18`
						echo "\33[1;32m" #color verde
						echo -n "   Versión del MMDVMHOST: "
						echo -n "\33[1;37m" #color blanco
                        echo "$var10"
                        echo -n "\33[1;32m   Temperatura de la CPU: \33[1;37m"
						tem=$(cat /sys/class/thermal/thermal_zone0/temp)
						tem=`expr substr $tem 1 2`
						echo -n "$tem Grados"

						var2=$(cat /proc/version)
						var2=`echo "$var2" | tr -d '[[:space:]]'`
						echo ""
						var1=`expr substr $var2 1 22`
						var3=`expr substr $var2 23 20`
						var4=`expr substr $var2 43 62`
						var5=`expr substr $var2 105 31`
						echo -n "\33[1;32m   Info del sistema: \33[1;37m"
						echo "$var1 $var3"
						echo "   $var4"
						echo "   $var5"
						echo ""
						echo -n "${VERDE}"
                        echo "   ************************************************************************************"
                        echo ""
                        echo "   ************************************************************************************"

                        echo ""
                        echo -n "\33[1;36m   Pulsa la tecla ENTER para salir "
                        read A
						exit;

						


