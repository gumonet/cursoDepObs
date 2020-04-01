#!/bin/bash
#mkdir temp && cd temp
#wget https://moz.com/top-500/download/\?table\=top500Domains -O domains.csv
INPUT=temp/domains.csv
OLDIFS=$IFS
IFS=','
output="ips.tsv"
while read number domain idontcare
do
	domain=${domain//\"/}
	echo "$domain"
	ip=$(dig +short ${domain} | tail -n 1)
	#echo "ID : $number"
	#echo "DOMAIN : $domain"
	#echo "IP : $ip"
	echo -e "${domain}\t${ip}" | tee -a ${output} #Guardamos en un tsv
done < <(tail -n +2 $INPUT) #Nos saltamos la primera linea
IFS=$OLDIFS

