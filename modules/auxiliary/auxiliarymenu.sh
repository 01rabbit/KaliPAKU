#!/bin/bash

source kp.conf
source $MODULES_PATH/misc_module.sh
source $AUXILIARY_PATH/51_kp_undercover.sh

function menu_auxiliary(){
    clear
    figlet Auxiliary
    num5 0 "Auxiliary"
    num1 5 "kali-undercover"
    num2 5 ""
    num9 5 "Main"
    read -n 1 -s NUM
	case $NUM in
	1)
        menu_undercover
        ;;
    2)
        ;;
    9)
        mainmenu
        ;;
    *)
        ;;
    esac
}
