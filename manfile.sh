#!/bin/bash
 
set -e

if [ ! -d analisi/ ]
then
	mkdir analisi
fi

echo -e "\e[1m\e[32mAnAlIsI E RiOrDiNo dEi fIlEs dElLa cArTeLlA\e[0m" > analisi/report.txt

echo -e "Vuoi copiare o spostare?([C]/s)"
read -r VAR1
if test -z $VAR1  || [ $VAR1 = "C" ] || [ $VAR1 = "c" ]
then
	modo=0
else modo=1
fi


for file in *.*      			# per ogni file nella cartella corrente
do
	#echo "${file##*/}"      	# mostra tutto il nome file
	#echo "${file##*.}"      	# mostra l'ultima estensione
	filename="${file##*/}"		# salva il nome file senza estensione
	filext="${file##*.}"
	filebase="$(basename $file .$filext)"		# solo nome file senza estensione
	#echo "$filebase"

	if [ ! -d analisi/$filext ]
	then
		mkdir analisi/$filext
	fi

	if [ $modo -eq 0 ]
	then
		cp $file analisi/$filext
	elif [ $modo -eq 1 ]
	then
		mv $file analisi/$filext
	else
		echo "Errore!"
	fi

done
wait
echo -e "Ho finito il riordino!"

#file="/home/vivek/.gpass/passwd.enc"




# FILE="/home/vivek/lighttpd.tar.gz"
# echo "${FILE#*.}"     # print tar.gz
# echo "${FILE##*.}"    # print gz
# ext="${FILE#*.}"      # store output in a shell variable 
# echo "$FILE has $ext" # display it
