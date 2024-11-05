#!/bin/bash

#archivo de salda
output_file="reporte_monitoreo.txt"
echo "Tiempo %CPU Libre %Memoeria Libre % Disco Duro" > $output_file

for i in {1..5}
do
	#Timpo
	tiempo=$((i * 60))

	#cpu libre
	cpu_libre=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $2}')

	#memoria libre
	memoria_libre=$(free -h | grep "Mem:" | awk '{print $7}')

	#disco libre
	disco_libre=$(df -h | grep "/$" | awk '{print $4}')
	echo "$tiempo $cpu_libre $memoria_libre $disco_libre" >> $output_file

	#Esperar 60 segundos
	sleep 60
done
