
#!/bin/bash
yad --width 400 --height 400 --title "sujet 2" \
     --text="
       *)HWinfo: Permet d'afficher les caractéristiques 
       hardware de votre pc
  
	*)lspci:Permet de lister les Bus pci presents

	*)Save:Permet de sauvegarder les informations filtrés du commande specefique				"\
       --button="menu":6\
      


ret=$?
if [ $ret -eq 6 ] ;then
./gui.sh
fi
