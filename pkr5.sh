#!/bin/bash

BLACK='\e[1;30m'
RED='\e[1;31m'
GREEN='\e[1;32m'
YELLOW='\e[1;33m'
BLUE='\e[1;34m'
PURPLE='\e[1;35m'
LIGHTBLUE='\e[1;36m'
WHITE='\e[1;37m'
NC='\e[0m'

TITLE="KaliKiddy"

function mainmenu(){
	clear
	figlet Kali Kiddy
    menu_title=(" Kali-tools-top10" "" "")
    printf "${WHITE}"
    for ((i=0;i<3;i++))
    do
        printf "+---+\n"
        printf "| %s |%s\n" "$(($i+1))" " ${menu_title[$i]}"
        printf "+---+\n"
    done
    printf "${NC}"
}

function kalitoolstop10_menu1(){
	clear
	figlet kali-tools-top10
    printf "${BLUE}+---+\n"
    printf "| 1 |%s\n" " Kali-tools-top10"
    printf "+---+\n"
    printf "${WHITE}"
    menu_title=("wifite(aircrack-ng)" "burpsuite" "crackmapexec" "hydra" "john")
    for ((i=0;i<5;i++))
    do
        printf "%5s+---+\n"
        printf "%5s| %s |%s\n" "" "$(($i+1))" " ${menu_title[$i]}"
        printf "%5s+---+\n"
    done
    printf "%5s+---+\n"
    printf "%5s| N |%s\n" "" " Next"
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
		cmd_crackmapexec
		;;
	4)
		menu_hydra
		;;
	5)
		menu_john
		;;
    n|N)
        kalitoolstop10_menu2
        ;;
	*)
		;;
	esac

}

function kalitoolstop10_menu2(){
	clear
	figlet kali-tools-top10
    printf "${BLUE}+---+\n"
    printf "| 1 |%s\n" " Kali-tools-top10"
    printf "+---+\n"
    printf "${WHITE}"
    menu_title=("metasploit-framework" "nmap" "responder" "sqlmap" "wireshark(tshark)")
    for ((i=0;i<5;i++))
    do
        printf "%5s+---+\n"
        printf "%5s| %s |%s\n" "" "$(($i+1))" " ${menu_title[$i]}"
        printf "%5s+---+\n"
    done
    printf "%5s+---+\n"
    printf "%5s| B |%s\n" "" " Back"
    printf "%5s+---+\n"
	printf "${NC}"
    read -n 1 -s NUM
	case $NUM in
	1)
		cmd_wifite
		;;
	2)
		cmd_crackmapexec
		;;
	3)
		menu_hydra
		;;
	4)
		menu_john
		;;
	5)
		;;
    b|B)
        kalitoolstop10_menu1
        ;;
	*)
		;;
	esac
}

function cmd_wifite(){
	clear
	figlet wifite
	printf "${WHITE}+---+\n"
    printf "| 1 |%s\n" " Kali-tools-top10"
    printf "+---+\n"
    printf "${BLUE}%5s+---+\n"
    printf "%5s| 1 |%s\n" "" " wifite(aircrack-ng)"
    printf "%5s+---+\n${NC}"
    cmd="wifite "
    printf "(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${BLUE}Kali-tools-top10${NC} > ${BLUE}$cmd${NC}\n"
	echo "options:"
	echo "  -h, --help              show this help message and exit"
	echo ""
	echo "SETTINGS:"
	echo "  -v, --verbose           Shows more options (-h -v). Prints commands and outputs."
	echo "                           (default:quiet)"
	echo "  -i [interface]          Wireless interface to use, e.g. wlan0mon (default: ask)"
	echo "  -c [channel]            Wireless channel to scan e.g. 1,3-6 (default: all 2Ghz channels)"
	echo "  -ab, --allbands         Include both 2.4Ghz and 5Ghz bands (default: off)"
	echo "  -2, --2ghz              Include 2.4Ghz channels (default: off)"
	echo "  -5, --5ghz              Include 5Ghz channels (default: off)"
	echo "  -inf, --infinite        Enable infinite attack mode. Modify scanning time with -p (default:off)"
	echo "  -mac, --random-mac      Randomize wireless card MAC address (default: off)"
	echo "  -p [scan_time]          Pillage: Attack all targets after scan_time (seconds)"
    printf "${BLUE}usage${NC}: wifite (${RED}Run as Root${NC})\n"
    printf "  wifite ${WHITE}[option|SETTINGS]${NC}\n"
    read -e -p "Command? > $cmd" arg
	if [ $arg = "-h" ] || [ $arg = "--help" ];then
		arg="-h|more"
	fi
	cmd+=$arg
    eval $cmd
}

function cmd_burpsuite(){
	clear
	figlet Burpsuite
	printf "${WHITE}+---+\n"
    printf "| 1 |%s\n" " Kali-tools-top10"
    printf "+---+\n"
    printf "${BLUE}%5s+---+\n"
    printf "%5s| 2 |%s\n" "" " burpsuite"
    printf "%5s+---+\n${NC}"
    cmd="burpsuite"
    printf "${RED}Caution!\n"
    printf "${WHITE}This is a GUI application. It can't be displayed on a remote console.${NC}\n"
    printf "(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${BLUE}Kali-tools-top10${NC} > ${BLUE}$cmd${NC}\n"
    read -e -p "Command? > $cmd &" arg
    cmd+=$arg
    eval $cmd
}

function cmd_crackmapexec(){
	clear
	figlet crackmapexec
	printf "${WHITE}+---+\n"
    printf "| 1 |%s\n" " Kali-tools-top10"
    printf "+---+\n"
    printf "${BLUE}%5s+---+\n"
    printf "%5s| 3 |%s\n" "" " crackmapexec"
    printf "%5s+---+\n${NC}"
    cmd="crackmapexec "
    printf "(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${BLUE}Kali-tools-top10${NC} > ${BLUE}$cmd${NC}\n"
	printf "${BLUE}options${NC}:\n"
	echo "  -h, --help            show this help message and exit"
	echo "  -t THREADS            set how many concurrent threads to use (default: 100)"
	echo "  --timeout TIMEOUT     max timeout in seconds of each thread (default: None)"
	echo "  --jitter INTERVAL     sets a random delay between each connection (default: None)"
	echo "  --darrell             give Darrell a hand"
	echo "  --verbose             enable verbose output"
	echo ""
	printf "${BLUE}protocols${NC}:\n"
	echo "  available protocols"
	echo "  {smb,ssh,winrm,ldap,mssql}"
	echo "    smb                 own stuff using SMB"
	echo "    ssh                 own stuff using SSH"
	echo "    winrm               own stuff using WINRM"
	echo "    ldap                own stuff using LDAP"
	echo "    mssql               own stuff using MSSQL"
	printf "${BLUE}usage${NC}: crackmapexec ${WHITE}[-h] [-t THREADS] [--timeout TIMEOUT] [--jitter INTERVAL] [--darrell] [--verbose] {smb,ssh,winrm,ldap,mssql}${NC} ...\n"
    read -e -p "Command? > $cmd" arg
    cmd+=$arg
    eval $cmd
}

function menu_hydra(){
	clear
	figlet hydra
    printf "${WHITE}+---+\n"
    printf "| 1 |%s\n" " Kali-tools-top10"
    printf "+---+\n"
    printf "${BLUE}%5s+---+\n"
    printf "%5s| 4 |%s\n" "" " hydra"
    printf "%5s+---+\n"
	printf "${WHITE}%10s+---+\n"
	printf "%10s| 1 |%s\n" "" " Brute force the username admin "
	printf "%10s+---+%s\n" "" " with the given password list"
    printf "%10s+---+\n"
    printf "%10s| 2 |%s\n" "" " Brute force SSH with user and password lists"
    printf "%10s+---+%s\n${NC}" "" " against target IP address"
    read -n 1 -s NUM
    case $NUM in
    1)
            cmd_hydra1
            ;;
    2)
            cmd_hydra2
            ;;
	esac
}

function cmd_hydra1(){
    clear
    figlet hydra
    printf "${WHITE}+---+\n"
    printf "| 1 |%s\n" " Kali-tools-top10"
    printf "+---+\n"
    printf "%5s+---+\n"
    printf "%5s| 4 |%s\n" "" " hydra"
    printf "%5s+---+\n"
    printf "${BLUE}%10s+---+\n"
    printf "%10s| 1 |%s\n" "" " Brute force the username admin "
    printf "%10s+---+%s\n" "" " with the given password list"
    printf "${WHITE}%10s+---+\n"
    printf "%10s| 2 |%s\n" "" " Brute force SSH with user and password lists"
    printf "%10s+---+%s\n${NC}" "" " against target IP address"
	cmd="hydra "
    printf "(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${BLUE}Kali-tools-top10${NC} > ${BLUE}$cmd${NC}\n"
	printf "${BLUE}Options${NC}:\n"
    echo "  -l LOGIN or -L FILE     login with LOGIN name, or load several logins from FILE"
    echo "  -p PASS  or -P FILE     try password PASS, or load several passwords from FILE"
    echo "  -h                      more command line options (COMPLETE HELP)"
    echo "  -t TASKS                run TASKS number of connects in parallel per target (default: 16)"
    echo "  -v / -V / -d            verbose mode / show login+pass for each attempt / debug mode "
	echo "  -h                      more command line options (COMPLETE HELP)"
	echo "  server                  the target: DNS, IP or 192.168.0.0/24 (this OR the -M option)"
	echo "  service                 the service to crack (see below for supported protocols)"
	printf "${BLUE}usage${NC}: hydra ${WHITE}[[[-l LOGIN|-L FILE] [-p PASS|-P FILE]] | [-C FILE]] [-e nsr] [-o FILE] [-t TASKS] [-M FILE [-T TASKS]] [-w TIME] [-W TIME] [-f] [-s PORT] [-x MIN:MAX:CHARSET] [-c TIME] [-ISOuvVd46] [-m MODULE_OPT] [service://server[:PORT][/OPT]]${NC}\n"
	printf "${RED}Example${NC}:   hydra -t 1 -l admin -P <PASSWORD_LIST_PATH> -v ftp://<IP_ADDRESS> ftp\n"
    read -e -p "Command? > $cmd" arg
    if [ $arg = "-h" ] || [ $arg = "--help" ];then
            arg="-h|more"
    fi
    cmd+=$arg
    eval $cmd
}

function cmd_hydra2(){
    clear
    figlet hydra
    printf "${WHITE}+---+\n"
    printf "| 1 |%s\n" " Kali-tools-top10"
    printf "+---+\n"
    printf "%5s+---+\n"
    printf "%5s| 4 |%s\n" "" " hydra"
    printf "%5s+---+\n"
    printf "%10s+---+\n"
    printf "%10s| 1 |%s\n" "" " Brute force the username admin "
    printf "%10s+---+%s\n" "" " with the given password list"
    printf "${BLUE}%10s+---+\n"
    printf "%10s| 2 |%s\n" "" " Brute force SSH with user and password lists"
    printf "%10s+---+%s\n${NC}" "" " against target IP address"
    cmd="hydra "
    printf "(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${BLUE}Kali-tools-top10${NC} > ${BLUE}$cmd${NC}\n"
    printf "${BLUE}Options:${NC}\n"
    echo "  -l LOGIN or -L FILE     login with LOGIN name, or load several logins from FILE"
    echo "  -p PASS  or -P FILE     try password PASS, or load several passwords from FILE"
    echo "  -h                      more command line options (COMPLETE HELP)"
	echo "  -u                      loop around users, not passwords (effective! implied with -x)"
	echo "  -t TASKS                run TASKS number of connects in parallel per target (default: 16)"
	echo "  -v / -V / -d            verbose mode / show login+pass for each attempt / debug mode "
    echo "  server                  the target: DNS, IP or 192.168.0.0/24 (this OR the -M option)"
    echo "  service                 the service to crack (see below for supported protocols)"
    printf "${BLUE}usage${NC}: hydra ${WHITE}[[[-l LOGIN|-L FILE] [-p PASS|-P FILE]] | [-C FILE]] [-e nsr] [-o FILE] [-t TASKS] [-M FILE [-T TASKS]] [-w TIME] [-W TIME] [-f] [-s PORT] [-x MIN:MAX:CHARSET] [-c TIME] [-ISOuvVd46] [-m MODULE_OPT] [service://server[:PORT][/OPT]]${NC}\n"
    printf "${RED}Example${NC}:  hydra -v -u -L <USER_LIST_PATH> -P <PASSWORD_LIST_PATH> -t 1 ssh://<IP_ADDRESS>\n"
    read -e -p "Command? > $cmd" arg
    if [ $arg = "-h" ] || [ $arg = "--help" ];then
            arg="-h|more"
    fi
    cmd+=$arg
    eval $cmd
}

function menu_john(){
	clear
	figlet john
	printf "${WHITE}+---+\n"
	printf "| 1 |%s\n" " Kali-tools-top10"
	printf "+---+\n"
	printf "${BLUE}%5s+---+\n"
	printf "%5s| 5 |%s\n" "" " john"
	printf "%5s+---+\n"
	printf "${WHITE}%10s+---+\n"
	printf "%10s| 1 |%s\n" "" " Cracking with a wordlist"
	printf "%10s+---+%s\n"
    printf "%10s+---+\n"
    printf "%10s| 2 |%s\n" "" " Attempt to crack hash file"
    printf "%10s+---+%s\n" "" " using previously cracked passwords"
    printf "%10s+---+\n"
    printf "%10s| 3 |%s\n" "" " Show cracked passwords"
    printf "%10s+---+%s\n"
    printf "%10s+---+\n"
    printf "%10s| 4 |%s\n" "" " Attempt to crack hash using incremental mode"
    printf "%10s+---+%s${NC}\n" "" " (May take a long time)"
	read -n 1 -s NUM
    case $NUM in
    1)
        cmd_john1
        ;;
    2)
        cmd_john2
        ;;
	3)
		cmd_john3
		;;
	4)
		cmd_john4
		;;
    esac
}

function cmd_john1(){
    clear
    figlet john
    printf "${WHITE}+---+\n"
    printf "| 1 |%s\n" " Kali-tools-top10"
    printf "+---+\n"
    printf "%5s+---+\n"
    printf "%5s| 5 |%s\n" "" " john"
    printf "%5s+---+\n"
    printf "${BLUE}%10s+---+\n"
    printf "%10s| 1 |%s\n" "" " Cracking with a wordlist"
    printf "%10s+---+%s\n"
    printf "${WHITE}%10s+---+\n"
    printf "%10s| 2 |%s\n" "" " Attempt to crack hash file"
    printf "%10s+---+%s\n" "" " using previously cracked passwords"
    printf "%10s+---+\n"
    printf "%10s| 3 |%s\n" "" " Show cracked passwords"
    printf "%10s+---+%s\n"
    printf "%10s+---+\n"
    printf "%10s| 4 |%s\n" "" " Attempt to crack hash using incremental mode"
    printf "%10s+---+%s${NC}\n" "" " (May take a long time)"
    cmd="john "
    printf "(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${BLUE}Kali-tools-top10${NC} > ${BLUE}$cmd${NC}\n"
    printf "${BLUE}Options${NC}:\n"
	echo "  --wordlist[=FILE] --stdin  Wordlist mode, read words from FILE or stdin"
	echo "                    --pipe   like --stdin, but bulk reads, and allows rules"
    printf "${BLUE}usage${NC} :john ${WHITE}[OPTIONS] [PASSWORD-FILES]${NC}\n"
    printf "${RED}Example${NC}:  john --wordlist=<WORD_LIST_PATH> <HASH_LIST_FILE>\n"
    read -e -p "Command? > $cmd" arg
    if [ $arg = "-h" ] || [ $arg = "--help" ];then
            arg="-h|more"
    fi
    cmd+=$arg
    eval $cmd
}

function cmd_john2(){
    clear
    figlet john
    printf "${WHITE}+---+\n"
    printf "| 1 |%s\n" " Kali-tools-top10"
    printf "+---+\n"
    printf "%5s+---+\n"
    printf "%5s| 5 |%s\n" "" " john"
    printf "%5s+---+\n"
    printf "%10s+---+\n"
    printf "%10s| 1 |%s\n" "" " Cracking with a wordlist"
    printf "%10s+---+%s\n"
    printf "${BLUE}%10s+---+\n"
    printf "%10s| 2 |%s\n" "" " Attempt to crack hash file" 
    printf "%10s+---+%s\n" "" " using previously cracked passwords"
    printf "${WHITE}%10s+---+\n"
    printf "%10s| 3 |%s\n" "" " Show cracked passwords"
    printf "%10s+---+%s\n"
    printf "%10s+---+\n"
    printf "%10s| 4 |%s\n" "" " Attempt to crack hash using incremental mode"
    printf "%10s+---+%s${NC}\n" "" " (May take a long time)"
    cmd="john "
    printf "(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${BLUE}Kali-tools-top10${NC} > ${BLUE}$cmd${NC}\n"
    printf "${BLUE}Options${NC}:\n"
	echo "  --loopback[=FILE]          Like --wordlist, but extract words from a .pot file"
    printf "${BLUE}usage${NC}: john ${WHITE}[OPTIONS] [PASSWORD-FILES]${NC}\n"
    printf "${RED}Example${NC}:  john --loopback <HASH_LIST_FILE>\n"
    read -e -p "Command? > $cmd" arg
    if [ $arg = "-h" ] || [ $arg = "--help" ];then
            arg="-h|more"
    fi
    cmd+=$arg
    eval $cmd
}

function cmd_john3(){
    clear
    figlet john
    printf "${WHITE}+---+\n"
    printf "| 1 |%s\n" " Kali-tools-top10"
    printf "+---+\n"
    printf "%5s+---+\n"
    printf "%5s| 5 |%s\n" "" " john"
    printf "%5s+---+\n"
    printf "%10s+---+\n"
    printf "%10s| 1 |%s\n" "" " Cracking with a wordlist"
    printf "%10s+---+%s\n"
    printf "%10s+---+\n"
    printf "%10s| 2 |%s\n" "" " Attempt to crack hash file" 
    printf "%10s+---+%s\n" "" " using previously cracked passwords"
    printf "${BLUE}%10s+---+\n"
    printf "%10s| 3 |%s\n" "" " Show cracked passwords"
    printf "%10s+---+%s\n"
    printf "${WHITE}%10s+---+\n"
    printf "%10s| 4 |%s\n" "" " Attempt to crack hash using incremental mode"
    printf "%10s+---+%s${NC}\n" "" " (May take a long time)"
    cmd="john "
    printf "(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${BLUE}Kali-tools-top10${NC} > ${BLUE}$cmd${NC}\n"
    printf "${BLUE}Options${NC}:\n"
	echo "  --show[=left]              Show cracked passwords [if =left, then uncracked]"
    printf "${BLUE}usage${NC}: john ${WHITE}[OPTIONS] [PASSWORD-FILES]${NC}\n"
    printf "${RED}Example${NC}:  john --show <HASH_LIST_FILE>\n"
    read -e -p "Command? > $cmd" arg
    if [ $arg = "-h" ] || [ $arg = "--help" ];then
            arg="-h|more"
    fi
    cmd+=$arg
    eval $cmd
}

function cmd_john4(){
    clear
    figlet john
    printf "${WHITE}+---+\n"
    printf "| 1 |%s\n" " Kali-tools-top10"
    printf "+---+\n"
    printf "%5s+---+\n"
    printf "%5s| 5 |%s\n" "" " john"
    printf "%5s+---+\n"
    printf "%10s+---+\n"
    printf "%10s| 1 |%s\n" "" " Cracking with a wordlist"
    printf "%10s+---+%s\n"
    printf "%10s+---+\n"
    printf "%10s| 2 |%s\n" "" " Attempt to crack hash file" 
    printf "%10s+---+%s\n" "" " using previously cracked passwords"
    printf "%10s+---+\n"
    printf "%10s| 3 |%s\n" "" " Show cracked passwords"
    printf "%10s+---+%s\n"
    printf "${BLUE}%10s+---+\n"
    printf "%10s| 4 |%s\n" "" " Attempt to crack hash using incremental mode"
    printf "%10s+---+%s${NC}\n" "" " (May take a long time)"
    cmd="john "
    printf "(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${BLUE}Kali-tools-top10${NC} > ${BLUE}$cmd${NC}\n"
    printf "${BLUE}Options${NC}:\n"
	echo "  --incremental[=MODE]       \"Incremental\" mode [using section MODE]"
    printf "${BLUE}usage${NC}: john ${WHITE}[OPTIONS] [PASSWORD-FILES]${NC}\n"
    printf "${RED}Example${NC}:  john --incremental <HASH_LIST_FILE>\n"
    read -e -p "Command? > $cmd" arg
    if [ $arg = "-h" ] || [ $arg = "--help" ];then
            arg="-h|more"
    fi
    cmd+=$arg
    eval $cmd
}

function menu_metasploit(){
	clear
	figlet Metasploit
    printf "${WHITE}+---+\n"
    printf "| 1 |%s\n" " Kali-tools-top10"
    printf "+---+\n"
    printf "${BLUE}%5s+---+\n"
    printf "%5s| 1 |%s\n" "" " metasploit-framework"
    printf "%5s+---+\n${NC}"
}


clear
while :;do
	echo -e "(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${BLUE}`pwd`${NC}"
	read -e -p "Command? > " str
    case $str in
    "kk"|"k"|"kiddy"|"kalikiddy")
		mainmenu
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
	"exit")
		exit 0
        ;;
	*)
		eval $str
        ;;
    esac
done
