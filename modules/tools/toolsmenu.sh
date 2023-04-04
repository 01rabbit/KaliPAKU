#!/bin/bash

source kp.conf
source $MODULES_PATH/misc_module.sh
source $TOOL_PATH/21_kp_nmapautomator.sh
source $TOOL_PATH/22_kp_vulncheck.sh
source $TOOL_PATH/23_kp_gobuster.sh


function menu_tools(){
    clear
    figlet Tools
    num2 0 "Tools"
    num1 3 "AutoScan(nmapAutomator)"
    num2 3 "VulnCheck"
    num3 3 "gobuster"
    num9 3 "Main"
    read -n 1 -s NUM
	case $NUM in
	1) menu_nmapautomator ;;
    2) menu_vulncheck ;;
    3) menu_gobuster;;
    9) mainmenu ;;
    *) ;;
    esac
}