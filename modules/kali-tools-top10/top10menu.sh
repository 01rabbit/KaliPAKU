#!/bin/bash

source kp.conf
source $TOP10_PATH/1_kp_wifite.sh
source $TOP10_PATH/2_kp_burpsuite.sh
source $TOP10_PATH/3_kp_crackmapexec.sh
source $TOP10_PATH/4_kp_hydra.sh
source $TOP10_PATH/5_kp_john.sh
source $TOP10_PATH/6_kp_metasploit.sh
source $TOP10_PATH/7_kp_nmap.sh
source $TOP10_PATH/8_kp_responder.sh
source $TOP10_PATH/9_kp_sqlmap.sh
source $TOP10_PATH/10_kp_wireshark.sh
source $MODULES_PATH/misc_module.sh

local NUM=""

function kalitoolstop10_menu1(){
	clear
	figlet kali-tools-top10
    num1 0 " Kali-tools-top10"
    menu_title=("wifite(aircrack-ng)" "burpsuite" "crackmapexec(SMB)" "hydra" "john")
    num1 5 ${menu_title[0]}
    num2 5 ${menu_title[1]}
    num3 5 ${menu_title[2]}
    num4 5 ${menu_title[3]}
    num5 5 ${menu_title[4]}
    num0 5 "Next"
	num9 5 "Main"
	printf "${NC}"
	read -n 1 -s n
	case $n in
	1)
		cmd_wifite
		;;
    2)
        cmd_burpsuite
        ;;
	3)
		menu_crackmapexec
		;;
	4)
		menu_hydra
		;;
	5)
		menu_john
		;;
    0)
        kalitoolstop10_menu2
        ;;
	9)
		mainmenu
		;;
	*)
		;;
	esac
	exit
}

function kalitoolstop10_menu2(){
	clear
	figlet kali-tools-top10
    num1 0 " Kali-tools-top10"
    menu_title=("metasploit-framework" "nmap" "responder" "sqlmap" "wireshark(tshark)")
    num1 5 ${menu_title[0]}
    num2 5 ${menu_title[1]}
    num3 5 ${menu_title[2]}
    num4 5 ${menu_title[3]}
    num5 5 ${menu_title[4]}
    num0 5 "Back"
	num9 5 "Main"
    read -n 1 -s n
	case $n in
	1)
		menu_metasploit
		;;
	2)
		menu_nmap
		;;
	3)
		menu_responder
		;;
	4)
		menu_sqlmap
		;;
	5)
        cmd_wireshark
		;;
	0)
		kalitoolstop10_menu1
		;;
    9)
        mainmenu
        ;;
	*)
		;;
	esac
	exit
}
