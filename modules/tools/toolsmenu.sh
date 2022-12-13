#!/bin/bash

source kp.conf
source $MODULES_PATH/misc_module.sh
source $TOOL_PATH/21_kp_autoscan.sh
source $TOOL_PATH/22_kp_check.sh


function menu_tools(){
    clear
    figlet Tools
    num2 0 " Tools"
    num1 5 " AutoScan"
    num2 5 " Check"
    num9 5 " Main"
    read -n 1 -s NUM
	case $NUM in
	1) menu_autoscan ;;
    2) menu_check ;;
    9) mainmenu ;;
    *) ;;
    esac
}