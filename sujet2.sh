#!/bin/bash

if [ $# -eq 1 ]
then
	if [[ "$1" = "-help" || "$1" = "-h" ]]
	then
		printf "\n"
		echo Afficher Les Caractéristiques Du PC
		printf "\n"
		echo 1 - Utiliser \"$0 -li\" Pour Lancer La Commande hwinfo
		printf "\n"
		echo 2 - Utiliser \"$0 -lp\" Pour Lancer La Commande lspci
		printf "\n"
		echo 3 - Utiliser \"$0 -s\" Ou \"$0 -save\" 
		echo Pour Sauvegarder Les Informations Les Plus Pertinentes Dans Un Fichier  !
		printf "\n"
		echo 4 - Utiliser \"$0 -h\" Ou \"$0 -help\" Pour Afficher Ce Menu !
		printf "\n"
	elif [[ "$1" = "-li" ]]
	then
		hwinfo
	elif [[ "$1" = "-lp" ]]
	then
		lspci
	else
	echo randomness
	fi
elif [ $# -eq 2 ]
then
	if [[ "$1" = "-li" && "$2" = "-s" ]]
	then
		hwinfo > hwinfo.txt
	elif [[ "$2" = "-li" && "$1" = "-s" ]]
	then
		hwinfo > hwinfo.txt
	elif [[ "$1" = "-lp" && "$2" = "-s" ]]
	then
		lspci > lspci.txt
	elif [[ "$2" = "-lp" && "$1" = "-s" ]]
	then
		lspci > lspci.txt
	fi
elif [ $# -eq 0 ]
then
	echo Type In \"$0 -h\" Or \"$0 -help\" Pour Afficher Le Menu !
fi
