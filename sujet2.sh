#!/bin/bash

help_menu()
{
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
}

hwinfo_cmd()
{
	hwinfo --short
}
lspci_cmd()
{
	lspci
}
save_hwinfo()
{
	hwinfo --short | sed -n -e '/cpu:/,/bios:/ p' > hwinfo.txt
}
save_lspci()
{
	lspci | grep -v "PCI bridge:" > lspci.txt
}
if [ $# -eq 1 ]
then
	if [[ "$1" = "-help" || "$1" = "-h" ]]
	then
		help_menu
		./gui.sh	
	elif [[ "$1" = "-li" ]]
	then
		hwinfo_cmd
		./gui.sh	
	elif [[ "$1" = "-lp" ]]
	then
		lspci_cmd
		./gui.sh	
	else
		help_menu
		./gui.sh
	fi
elif [ $# -eq 2 ]
then
	if [[ "$1" = "-li" && "$2" = "-s" ]]
	then
		save_hwinfo
		./gui.sh	
	elif [[ "$2" = "-li" && "$1" = "-s" ]]
	then
		save_hwinfo
		./gui.sh
	elif [[ "$1" = "-lp" && "$2" = "-s" ]]
	then
		save_lspci
		./gui.sh
	elif [[ "$2" = "-lp" && "$1" = "-s" ]]
	then
		save_lspci
		./gui.sh
	fi
elif [ $# -eq 0 ]
then
	help_menu
	./gui.sh
fi
