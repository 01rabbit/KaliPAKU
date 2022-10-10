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
    num0 5 "Next"
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
    num9 5 "Back"
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

function menu_autoscan(){
    clear
    figlet AutoScan
    num2 0 "AutoScan"
    num1 5 "Install"
    num2 5 "Scan"
    num9 5 "Back"
    read -n 1 -s NUM
    case $NUM in
    1)
        install_autoscan
        ;;
    2)
        cmd_autoscan1
        ;;
    9)
        kalitoolstop10_menu1
        ;;
    *)
        ;;
    esac
}

function install_autoscan(){
    clear
    figlet AutoScan
    num2 0 "AutoScan"
    num1 5 "Install"
    cd $TOOL_PATH
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${GREEN}[2]AutoScan${NC} > ${RED}[1]Install${NC}\n"
    if ! which git ;then
        printf "|${RED}  ####  Caution!  ####${NC}\n"
        printf "|${WHITE}  git is not installed. Stop work.${NC}\n"
    else
        printf "${BLUE}Install${NC}\n"
        echo "|  Clone nmapAutomator..."
        git clone https://github.com/21y4d/nmapAutomator.git
        if ! which ffuf ;then
            sudo apt update
            sudo apt install ffuf -y
        fi
        if ! which gobuster ;then
            sudo apt update-alternatives
            sudo apt install gobuster -y
        fi
        echo "└─Command > Complete"
    fi
    # finaly
    cd ../../
}

function cmd_autoscan1(){
    clear
    figlet AutoScan
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${GREEN}[2]AutoScan${NC} > ${GREEN}[2]Scan${NC}\n"
    printf "+${RED}Command${NC}:\n"
    printf "|  ${WHITE}nmapAutomator${NC}  Auther:${WHITE}21y4d${NC}  https://github.com/21y4d/nmapAutomator\n"
    echo "|"
    printf "+${BLUE}Optional${NC}: [-r/--remote <REMOTE MODE>] [-d/--dns <DNS SERVER>] [-o/--output <OUTPUT DIRECTORY>]\n"
    printf "|          [-s/--static-nmap <STATIC NMAP PATH>]\n"
    read -e -p "> Input Target: " TARGET
    echo "|"
    printf "+${BLUE}Scan Types${NC}:\n"
    printf "|   ${YELLOW}[1]Network${NC} : Shows all live hosts in the host's network (~15 seconds)\n"
    printf "|   ${YELLOW}[2]Port${NC}    : Shows all open ports (~15 seconds)\n"
    printf "|   ${YELLOW}[3]Script${NC}  : Runs a script scan on found ports (~5 minutes)\n"
    printf "|   ${YELLOW}[4]Full${NC}    : Runs a full range port scan, then runs a script scan on new ports (~5-10 minutes)\n"
    num1 0 "Network"
    num2 0 "Port"
    num3 0 "Script"
    num4 0 "Full"
    num0 0 "Next"
    read -n 1 -s NUM
    case $NUM in
    1)
        $AUTOSCAN_PATH/nmapAutomator.sh -H $TARGET -t Network
        ;;
    2)
        $AUTOSCAN_PATH/nmapAutomator.sh -H $TARGET -t Port
        ;;
    3)
        $AUTOSCAN_PATH/nmapAutomator.sh -H $TARGET -t Script
        ;;
    4)
        $AUTOSCAN_PATH/nmapAutomator.sh -H $TARGET -t Full
        ;;
    0)
        cmd_autoscan2
        ;;
    *)
        ;;
    esac
}

function cmd_autoscan2(){
    clear
    figlet AutoScan
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${GREEN}[2]AutoScan${NC} > ${GREEN}[2]Scan${NC}\n"
    printf "+${RED}Command${NC}:\n"
    printf "|  ${WHITE}nmapAutomator${NC}  Auther:${WHITE}21y4d${NC}  https://github.com/21y4d/nmapAutomator\n"
    echo "|"
    printf "+${BLUE}Optional${NC}: [-r/--remote <REMOTE MODE>] [-d/--dns <DNS SERVER>] [-o/--output <OUTPUT DIRECTORY>]\n"
    printf "|          [-s/--static-nmap <STATIC NMAP PATH>]\n"
    read -e -p "> Input Target: " TARGET
    echo "|"
    printf "+${BLUE}Scan Types${NC}:\n"
    printf "|   ${YELLOW}[1]UDP${NC}     : Runs a UDP scan \"requires sudo\" (~5 minutes)\n"
    printf "|   ${YELLOW}[2]Vulns${NC}   : Runs CVE scan and nmap Vulns scan on all found ports (~5-15 minutes)\n"
    printf "|   ${YELLOW}[3]Recon${NC}   : Suggests recon commands, then prompts to automatically run them\n"
    printf "|   ${YELLOW}[4]All${NC}     : Runs all the scans (~20-30 minutes)\n"
    num1 0 "UDP"
    num2 0 "Vulns"
    num3 0 "Recon"
    num4 0 "All"
    num9 0 "Back"
    read -n 1 -s NUM
    case $NUM in
    1)
        $AUTOSCAN_PATH/nmapAutomator.sh -H $TARGET -t UDP
        ;;
    2)
        $AUTOSCAN_PATH/nmapAutomator.sh -H $TARGET -t Vulns
        ;;
    3)
        $AUTOSCAN_PATH/nmapAutomator.sh -H $TARGET -t Recon
        ;;
    4)
        $AUTOSCAN_PATH/nmapAutomator.sh -H $TARGET -t All
        ;;
    9)
        cmd_autoscan1
        ;;
    *)
        ;;
    esac
}


# Rockyou Check
FILE="rockyou.txt"

if [ ! -e $FILE ];then
    cp /usr/share/wordlists/rockyou.txt.gz .
    if [ -e "rockyou.txt.gz" ];then
        gunzip rockyou.txt.gz
    fi
fi

# Banner
clear
banner
read -t 1
clear

while :;do
	echo -e "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${BLUE}`pwd`${NC}"
	read -e -p "└─Command? > " str
    case $str in
    "kp"|"k"|"pakuri"|"kalipakuri"|"menu")
		mainmenu "Kali-tools-top10" "AutoScan" "" "" ""
		read -n 1 -s NUM
            case $NUM in
            1)
                kalitoolstop10_menu1
                ;;
            2)
                menu_autoscan
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
