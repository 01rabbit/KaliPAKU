#!/bin/bash

source kp.conf
source $MODULES_PATH/misc_module.sh

function menu_hydra(){
	clear
	figlet hydra
    num1 0 "Kali-tools-top10"
    num4 3 "hydra"
    num1 6 "Dictionary_Attack"
    num2 6 "Password_Spray_Attack"
    num3 6 "Manual"
	num9 6 "Back"
    read -n 1 -s NUM
    case $NUM in
    1)
        cmd_hydra1
        ;;
    2)
        cmd_hydra2
        ;;
    3)
        cmd_hydra3
        ;;
    9)
        kalitoolstop10_menu1
        ;;
    *)
        ;;
	esac
}

function cmd_hydra1(){
    local cmd="" USERNAME="" PASSWORD="" SERVER="" SERVICE="" ANS=""
    clear
    figlet hydra
    cmd="hydra"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${RED}[1]Kali-tools-top10${NC} > ${BLUE}[4]$cmd${NC} > ${RED}[1]Dictionary Attack${NC}\n"
	printf "+${BLUE}Options${NC}:\n"
    printf "|  ${YELLOW}-l LOGIN or -L FILE${NC}     login with LOGIN name, or load several logins from FILE\n"
    read -p "> Enter Username: " USERNAME
    USERNAME="-l ${USERNAME}"
    echo "|"
    printf "|  ${YELLOW}-p PASS  or -P FILE${NC}     try password PASS, or load several passwords from FILE\n"
    echo "> Original list or Default?"
    num1 0 "Original Password List"
    num2 0 "Default Password List(rockyou)"
    read -n 1 -s ANS
    if [ $ANS = 1 ];then
        read -p "> Enter the path to the original password file: " PASSWORD
        PASSWORD="-P ${PASSWORD}"
    else
        echo "> Use Default PAssword List."
        PASSWORD="-P rockyou.txt"
    fi
    echo "|"
    printf "|  ${YELLOW}-t TASKS${NC}                run TASKS number of connects in parallel per target (default: 16)\n"
    printf "|  ${YELLOW}-v / -V / -d${NC}            verbose mode / show login+pass for each attempt / debug mode\n"
	printf "|  ${YELLOW}server${NC}                  the target: DNS, IP or 192.168.0.0/24 (this OR the -M option)\n"
    read -p "> Enter Target:" SERVER
    echo "|"
	printf "|  service                 the service to crack (see below for supported protocols)"
    echo "> Which Service?"
    num1 0 "SSH"
    num2 0 "FTP"
    num3 0 "TELNET"
    read -n 1 -s ANS
    case $ANS in
    1)
        SERVICE="ssh"
        ;;
    2)
        SERVICE="ftp"
        ;;
    3)
        SERVICE="telnet"
        ;;
    esac
    echo "|"
	printf "+${BLUE}usage${NC}: hydra ${WHITE}[[[-l LOGIN|-L FILE] [-p PASS|-P FILE]] | [-C FILE]] [-e nsr] [-o FILE] [-t TASKS] [-M FILE [-T TASKS]] [-w TIME] [-W TIME] [-f] [-s PORT] [-x MIN:MAX:CHARSET] [-c TIME] [-ISOuvVd46] [-m MODULE_OPT] [service://server[:PORT][/OPT]]${NC}\n"
    cmd="$cmd -t 4 $USERNAME $PASSWORD -v $SERVER $SERVICE"
    echo "└─Command > $cmd"
    echo ""
    echo "> You ready?"
    num1 0 "No"
    num2 0 "Yes"
    read -n 1 -s ANS
    if [ ! -z "$ANS" ];then
        if [ $ANS = "2" ];then
            show_number 141 "hydra Dictionary Attack"
            tmux split-window -v
            tmux send-keys "${cmd};read;exit" C-m
            tmux select-pane -t "${TITLE}".0
            # eval $cmd
        else
            :
        fi
    else
        :
    fi
}

function cmd_hydra2(){
    local cmd="" USERNAME="" PASSWORD="" SERVER="" ANS=""
    clear
    figlet hydra
    cmd="hydra "
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${RED}[1]Kali-tools-top10${NC} > ${BLUE}[4]$cmd${NC} > ${GREEN}[2]Password Spray Attack${NC}\n"
    printf "+${BLUE}Options:${NC}\n"
    printf "|  ${YELLOW}-l LOGIN or -L FILE${NC}     login with LOGIN name, or load several logins from FILE\n"
    read -p "> Enter the path to the username file: " USERNAME
    USERNAME="-L ${USERNAME}"
    echo "|"
    printf "|  ${YELLOW}-p PASS  or -P FILE${NC}     try password PASS, or load several passwords from FILE\n"
    read -p "> Enter Password: " PASSWORD
    PASSWORD="-p ${PASSWORD}"
    echo "|"
	printf "|  ${YELLOW}-u${NC}                      loop around users, not passwords (effective! implied with -x)\n"
	printf "|  ${YELLOW}-t TASKS${NC}                run TASKS number of connects in parallel per target (default: 16)\n"
	printf "|  ${YELLOW}-v / -V / -d${NC}            verbose mode / show login+pass for each attempt / debug mode\n"
    printf "|  ${YELLOW}server${NC}                  the target: DNS, IP or 192.168.0.0/24 (this OR the -M option)\n"
    read -p "> Enter Target:" SERVER
    echo "|"
	printf "|  service                 the service to crack (see below for supported protocols)"
    echo "> Which Service?"
    num1 0 "SSH"
    num2 0 "FTP"
    num3 0 "TELNET"
    read -n 1 -s ANS
    case $ANS in
    1)
        SERVICE="ssh"
        ;;
    2)
        SERVICE="ftp"
        ;;
    3)
        SERVICE="telnet"
        ;;
    esac
    echo "|"
    #printf "${RED}Example${NC}:  hydra -v -u -L <USER_LIST_PATH> -P <PASSWORD_LIST_PATH> -t 1 ssh://<SERVER>\n"
    printf "+${BLUE}usage${NC}: hydra ${WHITE}[[[-l LOGIN|-L FILE] [-p PASS|-P FILE]] | [-C FILE]] [-e nsr] [-o FILE] [-t TASKS] [-M FILE [-T TASKS]] [-w TIME] [-W TIME] [-f] [-s PORT] [-x MIN:MAX:CHARSET] [-c TIME] [-ISOuvVd46] [-m MODULE_OPT] [service://server[:PORT][/OPT]]${NC}\n"
    cmd="$cmd $USERNAME $PASSWORD -u -t 1 -v $SERVER $SERVICE"
    echo "└─Command > $cmd"
    echo ""
    echo "> You ready?"
    num1 0 "No"
    num2 0 "Yes"
    read -n 1 -s ANS
    if [ ! -z "$ANS" ];then
        if [ $ANS = "2" ];then
            show_number 142 "hydra Password Spray Attack"
            tmux split-window -v
            tmux send-keys "${cmd};read;exit" C-m
            tmux select-pane -t "${TITLE}".0
            # eval $cmd
        else
            :
        fi
    else
        :
    fi
}

function cmd_hydra3(){
    local cmd="" 
    clear
    show_number 143 "hydra Manual"
    figlet hydra
    cmd="hydra "
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${RED}[1]Kali-tools-top10${NC} > ${BLUE}[4]$cmd${NC} > ${YELLOW}[3]Manual${NC}\n"
    printf "+${BLUE}Options:${NC}\n"
    printf "|  ${YELLOW}-l LOGIN or -L FILE${NC}     login with LOGIN name, or load several logins from FILE\n"
    printf "|  ${YELLOW}-R${NC}        restore a previous aborted/crashed session\n"
    printf "|  ${YELLOW}-I${NC}        ignore an existing restore file (don't wait 10 seconds)\n"
    printf "|  ${YELLOW}-S${NC}        perform an SSL connect\n"
    printf "|  ${YELLOW}-s PORT${NC}   if the service is on a different default port, define it here\n"
    printf "|  ${YELLOW}-l LOGIN or -L FILE${NC}  login with LOGIN name, or load several logins from FILE\n"
    printf "|  ${YELLOW}-p PASS  or -P FILE${NC}  try password PASS, or load several passwords from FILE\n"
    printf "|  ${YELLOW}-x MIN:MAX:CHARSET${NC}  password bruteforce generation, type \"-x -h\" to get help\n"
    printf "|  ${YELLOW}-y${NC}        disable use of symbols in bruteforce, see above\n"
    printf "|  ${YELLOW}-r${NC}        use a non-random shuffling method for option -x\n"
    printf "|  ${YELLOW}-e nsr${NC}    try \"n\" null password, \"s\" login as pass and/or \"r\" reversed login\n"
    printf "|  ${YELLOW}-u${NC}        loop around users, not passwords (effective! implied with -x)\n"
    printf "|  ${YELLOW}-C FILE${NC}   colon separated \"login:pass\" format, instead of -L/-P options\n"
    printf "|  ${YELLOW}-M FILE${NC}   list of servers to attack, one entry per line, ':' to specify port\n"
    printf "|  ${YELLOW}-o FILE${NC}   write found login/password pairs to FILE instead of stdout\n"
    printf "|  ${YELLOW}-b FORMAT${NC} specify the format for the -o FILE: text(default), json, jsonv1\n"
    printf "|  ${YELLOW}-f / -F${NC}   exit when a login/pass pair is found (-M: -f per host, -F global)\n"
    printf "|  ${YELLOW}-t TASKS${NC}  run TASKS number of connects in parallel per target (default: 16)\n"
    printf "|  ${YELLOW}-T TASKS${NC}  run TASKS connects in parallel overall (for -M, default: 64)\n"
    printf "|  ${YELLOW}-w / -W TIME${NC}  wait time for a response (32) / between connects per thread (0)\n"
    printf "|  ${YELLOW}-c TIME${NC}   wait time per login attempt over all threads (enforces -t 1)\n"
    printf "|  ${YELLOW}-4 / -6${NC}   use IPv4 (default) / IPv6 addresses (put always in [] also in -M)\n"
    printf "|  ${YELLOW}-v / -V / -d${NC}  verbose mode / show login+pass for each attempt / debug mode \n"
    printf "|  ${YELLOW}-O${NC}        use old SSL v2 and v3\n"
    printf "|  ${YELLOW}-K${NC}        do not redo failed attempts (good for -M mass scanning)\n"
    printf "|  ${YELLOW}-q${NC}        do not print messages about connection errors\n"
    printf "|  ${YELLOW}-U${NC}        service module usage details\n"
    printf "|  ${YELLOW}-m OPT${NC}    options specific for a module, see -U output for information\n"
    printf "|  ${YELLOW}-h${NC}        more command line options (COMPLETE HELP)\n"
    printf "|  ${YELLOW}server${NC}    the target: DNS, IP or 192.168.0.0/24 (this OR the -M option)\n"
    printf "|  ${YELLOW}service${NC}   the service to crack (see below for supported protocols)\n"
    printf "|  ${YELLOW}OPT${NC}       some service modules support additional input (-U for module help)\n"
    echo "|"
    printf "+${BLUE}Supported services${NC}:\n"
    printf "|  adam6500 asterisk cisco cisco-enable cobaltstrike cvs firebird ftp[s] http[s]-{head|get|post} http[s]-{get|post}-form http-proxy http-proxy-urlenum icq imap[s] irc ldap2[s] ldap3[-{cram|digest}md5][s] memcached mongodb mssql mysql nntp oracle-listener oracle-sid pcanywhere pcnfs pop3[s] postgres radmin2 rdp redis rexec rlogin rpcap rsh rtsp s7-300 sip smb smtp[s] smtp-enum snmp socks5 ssh sshkey svn teamspeak telnet[s] vmauthd vnc xmpp\n"
    echo "|"
    printf "+${BLUE}usage${NC}: hydra [[[-l LOGIN|-L FILE] [-p PASS|-P FILE]] | [-C FILE]] [-e nsr] [-o FILE] [-t TASKS] [-M FILE [-T TASKS]] [-w TIME] [-W TIME] [-f] [-s PORT] [-x MIN:MAX:CHARSET] [-c TIME] [-ISOuvVd46] [-m MODULE_OPT] [service://server[:PORT][/OPT]]\n"
    read -e -p "└─Command > " cmd
    tmux split-window -v
    tmux send-keys "${cmd};read;exit" C-m
    tmux select-pane -t "${TITLE}".0
    # eval $cmd
}
