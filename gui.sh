#!/bin/bash
yad --width 200 --height 300 --title "sujet 2" \
--image="h.jpg"  \
    --button="Execute HWinfo":1\
    --button="Execute lspci":2 \
    --button="Save HWinfo(filtered)":3 \
    --button="Save lspci(filtered)":4 \
	--button="Help":5 \
    --button=gtk-cancel:6 \
    --on-top \
    --center \


#ret=$?
#[[ $ret -eq 5 ]] && exit 0

choix=$?

case $choix in
	 
	 1)
	  ./sujet2.sh -li
	  ;;
	 2)
	  ./sujet2.sh -lp
	  ;;
	 3)
	  ./sujet2.sh -s -li
	  ;;
	4)
	  ./sujet2.sh -s -lp
	  ;;
	5)
	  ./help.sh
	  ;;
          
esac
