#!/bin/bash

source kp.conf
source 1_kp_wifite.sh
source 2_kp_burpsuite.sh
source 3_kp_crackmapexec.sh
source 4_kp_hydra.sh
source 5_kp_john.sh
source 6_kp_metasploit.sh
source 7_kp_nmap.sh
source 8_kp_responder.sh
source 9_kp_sqlmap.sh


function banner(){
    printf "${BLUE}..............\n"
    printf "            ..,;:ccc,.\n"
    printf "          ......''';lxO.\n"
    printf ".....''''..........,:ld;\n"
    printf "           .';;;:::;,,.x,\n"
    printf "      ..'''.            0Xxoc:,.  ...\n"
    printf "  ....                ,ONkc;,;cokOdc',.\n"
    printf " .                   OMo           ':${GREEN}dd${BLUE}o.\n"
    printf "                    dMc               :OO;\n"
    printf "                    0M.                 .:o.\n"
    printf "                    ;Wd\n"
    printf "                     ;XO,\n"
    printf "                       ,d0Odlc;,..\n"
    printf "                           ..',;:cdOOd::,.\n"
    printf "${PURPLE} _  __     _ _ _  ___     _     _   ${BLUE}.:d;.':;.\n"
    printf "${PURPLE}| |/ /__ _| (_) |/ (_) __| | __| |_   _${BLUE}'d,  .'\n"
    printf "${PURPLE}| ' // _\` | | | ' /| |/ _\` |/ _\` | | | |${BLUE};l   ..\n"
    printf "${PURPLE}| . \ (_| | | | . \| | (_| | (_| | |_| |  ${BLUE}.o\n"
    printf "${PURPLE}|_|\_\__,_|_|_|_|\_\_|\__,_|\__,_|\__, |    ${BLUE}c\n"
    printf "${PURPLE}                                  |___/     ${BLUE}.'\n"
    printf "${WHITE}PAKURI Version 6                             ${BLUE}. ${NC}\n"
}

function num1(){
    printf "${RED}%$1s  |  +---+\n"
    printf "%$1s  +--| 1 |%s\n" "" " $2"
    printf "%$1s  |  +---+%s${NC}\n" "" " $3"
}

function num2(){
    printf "${GREEN}%$1s  |  +---+\n"
    printf "%$1s  +--| 2 |%s\n" "" " $2"
    printf "%$1s  |  +---+%s${NC}\n" "" " $3"
}

function num3(){
    printf "${YELLOW}%$1s  |  +---+\n"
    printf "%$1s  +--| 3 |%s\n" "" " $2"
    printf "%$1s  |  +---+%s${NC}\n" "" " $3"
}

function num4(){
    printf "${BLUE}%$1s  |  +---+\n"
    printf "%$1s  +--| 4 |%s\n" "" " $2"
    printf "%$1s  |  +---+%s${NC}\n" "" " $3"
}

function num5(){
    printf "${PURPLE}%$1s  |  +---+\n"
    printf "%$1s  +--| 5 |%s\n" "" " $2"
    printf "%$1s  |  +---+%s${NC}\n" "" " $3"
}

function mainmenu(){
	clear
	figlet KaliPAKU
    num1 0 $1
    num2 0 $2
    num3 0 $3
}

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
    printf "${WHITE}%5s+---+\n"
    printf "%5s| 0 |%s\n" "" " Next"
    printf "%5s+---+\n"
	printf "${NC}"
	read -n 1 -s NUM
	case $NUM in
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
	*)
		;;
	esac
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
    printf "${BLACK}%5s+---+\n"
    printf "%5s| 9 |%s\n" "" " Back"
    printf "%5s+---+${NC}\n"
    read -n 1 -s NUM
	case $NUM in
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
    9)
        kalitoolstop10_menu1
        ;;
	*)
		;;
	esac
}




clear
while :;do
	echo -e "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${BLUE}`pwd`${NC}"
	read -e -p "└─Command? > " str
    case $str in
    "kp"|"k"|"pakuri"|"kalipakuri"|"menu")
		mainmenu "Kali-tools-top10" "Git-tools" "" "" ""
		read -n 1 -s NUM
            case $NUM in
            1)
                kalitoolstop10_menu1
                ;;
            2)
                ;;
            3)
                ;;
            *)
                ;;
            esac
            ;;
	"exit"|"q"|"quit")
		exit 0
        ;;
	*)
		eval $str
        ;;
    esac
done
