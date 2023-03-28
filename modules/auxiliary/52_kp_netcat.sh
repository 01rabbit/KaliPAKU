#!/bin/bash
source kp.conf
source $MODULES_PATH/misc_module.sh

function menu_netcat(){
	clear
	figlet Netcat
	num5 0 "Auxiliary"
	num2 3 "Netcat"
	num1 6 "Connect"
	num2 6 "Reverse Connect"
    num3 6 "Send File"
    num4 6 "Receiving File"
    num5 6 "Manual"
	num9 6 "Back"
    read -n 1 -s NUM
	case $NUM in
    1)
        cmd_netcat1
        ;;
	2)
		cmd_netcat2
		;;
    3)
        cmd_netcat3
        ;;
    4)
        cmd_netcat4
        ;;
    4)
        cmd_netcat5
        ;;
    9)
        menu_auxiliary
        ;;
    *)
        ;;
    esac

}

function cmd_netcat1(){
    clear
    figlet Netcat
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${PURPLE}[5]Auxiliary${NC} > ${GREEN}[2]Netcat${NC} > ${RED}[1]Connect${NC}\n"
    printf "+${BLUE}Options${NC}:\n"
    printf "|  ${YELLOW}-v${NC}:            verbose [use twice to be more verbose]\n"
    read -p "> Enter Target IP: " TARGET
    echo "|"
    read -p "> Enter Target Port: " PORT
    echo "|"
    printf "+${BLUE}usage${NC}: nc ${WHITE}[-options] hostname port[s] [ports] ...${NC}\n"
    cmd="nc -v $TARGET $PORT" 
    echo "└─Command > $cmd"
        echo ""
    echo "> You ready?"
    num1 0 "No"
    num2 0 "Yes"
    read -n 1 -s ANS
    if [ ! -z "$ANS" ];then
        if [ $ANS = "2" ];then
            show_number 521 "Netcat Connect"
            tmux split-window -v
            tmux send-keys "${cmd};exit" C-m
            tmux select-pane -t "${TITLE}".0
            # eval $cmd
        else
            :
        fi
    else
        :
    fi
}

function cmd_netcat2(){
    clear
    figlet Netcat
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${PURPLE}[5]Auxiliary${NC} > ${GREEN}[2]Netcat${NC} > ${GREEN}[2]Reverse Connect${NC}\n"
    printf "+${BLUE}Options${NC}:\n"
    printf "|  ${YELLOW}-l      ${NC}:            listen mode, for inbound connects\n"
    printf "|  ${YELLOW}-n      ${NC}:            numeric-only IP addresses, no DNS\n"
    printf "|  ${YELLOW}-p port ${NC}:            local port number\n"
    printf "|  ${YELLOW}-v      ${NC}:            verbose [use twice to be more verbose]\n"
    read -p "> Enter Standby Port: " PORT
    echo "|"
    printf "+${BLUE}usage${NC}: nc -l -p port ${WHITE}[-options] [hostname] [port]${NC}\n"
    cmd="nc -lnvp $PORT" 
    echo "└─Command > $cmd"
        echo ""
    echo "> You ready?"
    num1 0 "No"
    num2 0 "Yes"
    read -n 1 -s ANS
    if [ ! -z "$ANS" ];then
        if [ $ANS = "2" ];then
            show_number 522 "Netcat Reverse Connect"
            tmux split-window -v
            tmux send-keys "${cmd};exit" C-m
            tmux select-pane -t "${TITLE}".0
            # eval $cmd
        else
            :
        fi
    else
        :
    fi
}

function cmd_netcat3(){
    clear
    figlet Netcat
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${PURPLE}[5]Auxiliary${NC} > ${GREEN}[2]Netcat${NC} > ${YELLOW}[3]Send File${NC}\n"
    printf "+${BLUE}Options${NC}:\n"
    printf "|  ${YELLOW}-v${NC}:            verbose [use twice to be more verbose]\n"
    read -p "> Enter Target IP: " TARGET
    echo "|"
    read -p "> Enter Target Port: " PORT
    echo "|"
    BASE=`pwd`
    FILEPATH=""
    while :;do
        PS3="└─Please Select one > "
        select FILE in ".." * "Exit" ;do
        echo ""
        break
        done
        echo "> `pwd`"
        printf "└─You selected was : ${YELLOW}${FILE}${NC}\n"
        echo "|"
        if [ ${FILE} = "Exit" ];then
            break
        elif [ -d ${FILE} ];then
            cd ${FILE}
        elif [ -f ${FILE} ];then
            FILEPATH="`pwd`/${FILE}"
            cd $BASE
            break
        fi
    done
    printf "+${BLUE}usage${NC}: nc ${WHITE}[-options] hostname port[s] [ports] ...${NC} < filename\n"
    cmd="nc -v $TARGET $PORT < $FILEPATH" 
    echo "└─Command > $cmd"
        echo ""
    echo "> You ready?"
    num1 0 "No"
    num2 0 "Yes"
    read -n 1 -s ANS
    if [ ! -z "$ANS" ];then
        if [ $ANS = "2" ];then
            show_number 523 "Netcat Send File"
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

function cmd_netcat4(){
    clear
    figlet Netcat
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${PURPLE}[5]Auxiliary${NC} > ${GREEN}[2]Netcat${NC} > ${BLUE}[4]Receiving File${NC}\n"
    printf "+${BLUE}Options${NC}:\n"
    printf "|  ${YELLOW}-l      ${NC}:            listen mode, for inbound connects\n"
    printf "|  ${YELLOW}-n      ${NC}:            numeric-only IP addresses, no DNS\n"
    printf "|  ${YELLOW}-p port ${NC}:            local port number\n"
    printf "|  ${YELLOW}-v      ${NC}:            verbose [use twice to be more verbose]\n"
    read -p "> Enter Standby Port: " PORT
    echo "|"
    read -p "> Enter File Name(Received)" FILENAME
    echo "|"
    printf "+${BLUE}usage${NC}: nc -l -p port ${WHITE}[-options] [hostname] [port]${NC} > filename\n"
    cmd="nc -lnvp $PORT > $FILENAME" 
    echo "└─Command > $cmd"
        echo ""
    echo "> You ready?"
    num1 0 "No"
    num2 0 "Yes"
    read -n 1 -s ANS
    if [ ! -z "$ANS" ];then
        if [ $ANS = "2" ];then
            show_number 524 "Netcat Receiving File"
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

function cmd_netcat5(){
    clear
    show_number 525 "Netcat Manual"
    cmd="nc"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${PURPLE}[5]Auxiliary${NC} > ${GREEN}[2]Netcat${NC} > ${PURPLE}[5]Manual${NC}\n"
    printf "+${BLUE}Options${NC}:\n"
    printf "|  ${YELLOW}-c shell commands ${NC}:            as \`-e'; use /bin/sh to exec [dangerous!!]\n"
    printf "|  ${YELLOW}-e filename       ${NC}:            program to exec after connect [dangerous!!]\n"
    printf "|  ${YELLOW}-b                ${NC}:            allow broadcasts\n"
    printf "|  ${YELLOW}-g gateway        ${NC}:            source-routing hop point[s], up to 8\n"
    printf "|  ${YELLOW}-G num            ${NC}:            source-routing pointer: 4, 8, 12, ...\n"
    printf "|  ${YELLOW}-h                ${NC}:            this cruft\n"
    printf "|  ${YELLOW}-i secs           ${NC}:            delay interval for lines sent, ports scanned\n"
    printf "|  ${YELLOW}-k                ${NC}:            set keepalive option on socket\n"
    printf "|  ${YELLOW}-l                ${NC}:            listen mode, for inbound connects\n"
    printf "|  ${YELLOW}-n                ${NC}:            numeric-only IP addresses, no DNS\n"
    printf "|  ${YELLOW}-o file           ${NC}:            hex dump of traffic\n"
    printf "|  ${YELLOW}-p port           ${NC}:            local port number\n"
    printf "|  ${YELLOW}-r                ${NC}:            randomize local and remote ports\n"
    printf "|  ${YELLOW}-q secs           ${NC}:            quit after EOF on stdin and delay of secs\n"
    printf "|  ${YELLOW}-s addr           ${NC}:            local source address\n"
    printf "|  ${YELLOW}-T tos            ${NC}:            set Type Of Service\n"
    printf "|  ${YELLOW}-t                ${NC}:            answer TELNET negotiation\n"
    printf "|  ${YELLOW}-u                ${NC}:            UDP mode\n"
    printf "|  ${YELLOW}-v                ${NC}:            verbose [use twice to be more verbose]\n"
    printf "|  ${YELLOW}-w secs           ${NC}:            timeout for connects and final net reads\n"
    printf "|  ${YELLOW}-C                ${NC}:            Send CRLF as line-ending\n"
    printf "|  ${YELLOW}-z                ${NC}:            zero-I/O mode [used for scanning}\n"
    echo "|"
    printf "+${BLUE}Usage${NC}:\n"
    printf "|    connect to somewhere:   nc ${WHITE}[-options] hostname port[s] [ports] ...${NC}\n" 
    printf "|    listen for inbound:     nc -l -p port ${WHITE}[-options] [hostname] [port]${NC}\n"
    read -e -p "└─Command > " cmd
    eval $cmd
}                         
                         
                          
                              
                              
                         
                              
                              