#!/bin/bash

source kp.conf
source $MODULES_PATH/misc_module.sh

function menu_faraday(){
    clear
	header
    num4 0 "Reports"
    num2 3 "Faraday"
    num1 6 "Start Faraday"
    num2 6 "Stop Faraday"
    num3 6 "Open Faraday(Web)"
    num4 6 "faraday-cli"
    num9 6 "Back"
    read -n 1 -s NUM
    case $NUM in
    1)
        cmd_faraday1
        ;;
    2)
        cmd_faraday2
        ;;
    3)
        cmd_faraday3
        ;;
    4)
        menu_faraday-cli
        ;;
    9)
        menu_reports
        ;;
    *)
        ;;
    esac

}

function cmd_faraday1(){
    clear
	figlet Faraday
    cmd="sudo systemctl start faraday.service"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${BLUE}[4]Reports${WHITE} > [2]Faraday > [1]Start Faraday${NC}\n"
    printf "|  Start Faraday service.\n"
    echo "|"
    echo "└─Command > $cmd"
	echo ""
	echo "> You ready?"
	num1 0 "No"
	num2 0 "Yes"
    read -n 1 -s ANS
    if [ ! -z "$ANS" ];then
        if [ $ANS = "2" ];then
            show_number 421 "Start Faraday"
            # tmux split-window -v
            # tmux send-keys "sudo ${cmd};read;exit" C-m
            # tmux select-pane -t "${TITLE}".0
            eval $cmd
        else
            :
        fi
    else
        :
    fi
}

function cmd_faraday2(){
    clear
	figlet Faraday
    cmd="sudo systemctl stop faraday.service"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${BLUE}[4]Reports${WHITE} > [2]Faraday > [2]Stop Faraday${NC}\n"
    printf "|  Stop Faraday service.\n"
    echo "|"
    echo "└─Command > $cmd"
	echo ""
	echo "> You ready?"
	num1 0 "No"
	num2 0 "Yes"
    read -n 1 -s ANS
    if [ ! -z "$ANS" ];then
        if [ $ANS = "2" ];then
            show_number 422 "Stop Faraday"
            # tmux split-window -v
            # tmux send-keys "sudo ${cmd};read;exit" C-m
            # tmux select-pane -t "${TITLE}".0
            eval $cmd
        else
            :
        fi
    else
        :
    fi
}

function cmd_faraday3(){
    clear
	figlet Faraday
    cmd="faraday"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${BLUE}[4]Reports${WHITE} > [2]Faraday > [3]Open Faraday(Web)${NC}\n"
    printf "|${RED}  ####  Caution!  ####${NC}\n"
    printf "|${RED}  Faraday ${WHITE}is a Web application. It can't be displayed on a remote console.\n"
    printf "|  If you want to continue with CUI, you can choose ${RED}faraday-cli.${NC}\n"
    echo "|"
    echo "└─Command > $cmd"
	echo ""
	echo "> You ready?"
	num1 0 "No"
	num2 0 "Yes"
    read -n 1 -s ANS
    if [ ! -z "$ANS" ];then
        if [ $ANS = "2" ];then
            show_number 423 "Open Faraday(Web)"
            tmux split-window -v
            tmux send-keys "sudo ${cmd};read;exit" C-m
            tmux select-pane -t "${TITLE}".0
            # eval $cmd
        else
            :
        fi
    else
        :
    fi
}

function menu_faraday-cli(){
    clear
	header
    num4 0 "Reports"
    num2 3 "Faraday"
    num4 6 "faraday-cli"
    num1 9 "auth"
    num2 9 "workspace"
    num3 9 "List"
    num4 9 "Import"
    num6 9 "Stats"
    num9 9 "Back"
    read -n 1 -s NUM
    case $NUM in
    1)
        cmd_faraday-cli1
        ;;
    2)
        cmd_faraday-cli2
        ;;
    3)
        cmd_faraday-cli3
        ;;
    4)
        cmd_faraday-cli4
        ;;
    5)
        cmd_faraday-cli5
        ;;
    6)
        cmd_faraday-cli6
        ;;
    9)
        menu_faraday
        ;;
    *)
        ;;
    esac

}

function cmd_faraday-cli1(){
    clear
    figlet Faraday-Cli
    cmd="faraday-cli"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${BLUE}[4]Reports${WHITE} > [2]Faraday > [4]faraday-cli > [1]auth${NC}\n"
    printf "+${BLUE}Core${NC}\n"
    printf "|  ----------------------------------------------------------------------------------------------------\n"
    printf "|  auth                  Authenticate with a faraday server                                              \n"
    echo "|"
    printf "|  ${YELLOW}usage${NC}: auth ${WHITE}[-h] [-f FARADAY_URL] [-i] [-u USER] [-p PASSWORD]${NC}\n"
    read -e -p "> Enter FARADAY_URL (default)127.0.0.1:5985 :" TARGET
    if [ ! -n "$TARGET" ];then
        TARGET="http://127.0.0.1:5985"
    fi
    echo "|"
    read -e -p "> Enter your username (default)$FARADAY_USER : " USER
    if [ ! -n "$USER" ];then
        USER=$FARADAY_USER
    fi
    echo "|"
    read -e -p "> Enter your password (default)$FARADAY_PASS : " PASSWORD
    if [ ! -n "$PASSWORD" ];then
        PASSWORD=$FARADAY_PASS
    fi
    echo "|"
    cmd="$cmd auth -f $TARGET -u $USER -p $PASSWORD"
    echo "└─Command > $cmd"
    echo ""
    echo "> You ready?"
    num1 0 "No"
    num2 0 "Yes"
    read -n 1 -s ANS
    if [ ! -z "$ANS" ];then
        if [ $ANS = "2" ];then
            show_number 4241 "faraday-cli auth"
            tmux split-window -v
            tmux send-keys "${cmd};read;exit" C-m
            tmux select-pane -t "${TITLE}".0
        else
            :
        fi
    else
        :
    fi
}

function cmd_faraday-cli2(){
    clear
    figlet Faraday-Cli
    cmd="faraday-cli"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${BLUE}[4]Reports${WHITE} > [2]Faraday > [4]faraday-cli > [2]workspace${NC}\n"
    printf "+${BLUE}Objects${NC}\n"
    printf "|  ----------------------------------------------------------------------------------------------------\n"
    printf "|  workspace             workspace actions                                                               \n"
    echo "|"
    printf "|  ${YELLOW}usage${NC}: workspace ${WHITE}[-h] {create,delete,disable,enable,get,list,select,dashboard}${NC} ...\n"
    echo "|"
    printf "+${BLUE}workspace actions${NC}\n"
    echo "|"
    printf "+${BLUE}options${NC}:\n"
    printf "|  -h, --help            show this help message and exit\n"
    echo "|"
    printf "+${BLUE}action${NC}:\n"
    printf "|  ${YELLOW}[1]create${NC}             : create a workspace\n"
    printf "|  ${YELLOW}[2]delete${NC}             : delete a workspace\n"
    printf "|  ${YELLOW}[3]disable${NC}            : disable a workspace\n"
    printf "|  ${YELLOW}[4]enable${NC}             : enable a workspace\n"
    printf "|  ${YELLOW}[5]select${NC}             : select active workspace\n"
    printf "|  ${YELLOW}[6]dashboard${NC}          : workspaces dashboard\n"
    num1 0 "create"
    num2 0 "delete"
    num3 0 "disable"
    num4 0 "enable"
    num5 0 "select"
    num6 0 "dashboard"
    read -n 1 -s NUM
    case $NUM in
    1)
        OPTION="create"
        SET_NUMBER=42421
        ;;
    2)
        OPTION="delete"
        SET_NUMBER=42422
        ;;
    3)
        OPTION="disable"
        SET_NUMBER=42423
        ;;
    4)
        OPTION="enable"
        SET_NUMBER=42424
        ;;
    5)
        OPTION="select"
        SET_NUMBER=42425
        ;;
    6)
        OPTION="dashboard"
        SET_NUMBER=42426
        ;;
    *)
        ;;
    esac
    cmd="$cmd workspace $OPTION"
    read -e -p "> Enter Workspace name: " WSNAME
    echo "|"
    cmd="$cmd $WSNAME"
    echo "└─Command > $cmd"
    echo ""
    echo "> You ready?"
    num1 0 "No"
    num2 0 "Yes"
    read -n 1 -s ANS
    if [ ! -z "$ANS" ];then
        if [ $ANS = "2" ];then
            show_number ${SET_NUMBER} "faraday-cli ${OPTION}"
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

function cmd_faraday-cli3(){
    clear
    figlet Faraday-Cli
    cmd="faraday-cli"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${BLUE}[4]Reports${WHITE} > [2]Faraday > [4]faraday-cli > [3]List${NC}\n"
    printf "+${BLUE}Objects${NC}\n"
    printf "|  ----------------------------------------------------------------------------------------------------\n"
    printf "|  host                  host actions                                                                    \n"
    printf "|  ${YELLOW}usage${NC}: host ${WHITE}[-h] {list}${NC} ...\n"
    echo "|"
    printf "|  service               service actions                                                                 \n"
    printf "|  ${YELLOW}usage${NC}: service ${WHITE}[-h] {list}${NC} ...\n"
    echo "|"
    printf "|  vuln                  vulnerabilities actions                                                         \n"
    printf "|  ${YELLOW}usage${NC}: vuln ${WHITE}[-h] {add-evidence,list}${NC} ...\n"
    echo "|"
    printf "+${BLUE}options${NC}:\n"
    printf "|  -h, --help            show this help message and exit\n"
    echo "|"
    printf "+${BLUE}action${NC}:\n"
    printf "|  ${YELLOW}[1] host${NC}                list hosts\n"
    printf "|  ${YELLOW}[2] service${NC}             list service\n"
    printf "|  ${YELLOW}[3] vuln${NC}                list vulnerabilities\n"
    num1 0 "host"
    num2 0 "service"
    num3 0 "vuln"
    read -n 1 -s NUM
    case $NUM in
    1)
        OPTION="host list"
        SET_NUMBER=42431
        ;;
    2)
        OPTION="service list"
        SET_NUMBER=42432
        ;;
    3)
        OPTION="vuln list"
        SET_NUMBER=42433
        ;;
    *)
        ;;
    esac
    cmd="$cmd $OPTION"
    echo "└─Command > $cmd"
    echo ""
    echo "> You ready?"
    num1 0 "No"
    num2 0 "Yes"
    read -n 1 -s ANS
    if [ ! -z "$ANS" ];then
        if [ $ANS = "2" ];then
            show_number $SET_NUMBER "faraday-cli $OPTION"
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

function cmd_faraday-cli4(){
    clear
    figlet Faraday-Cli
    cmd="faraday-cli"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${BLUE}[4]Reports${WHITE} > [2]Faraday > [4]faraday-cli > [4]Import${NC}\n"
    printf "+${BLUE}Objects${NC}\n"
    printf "|  ----------------------------------------------------------------------------------------------------\n"
    printf "|  tool                  tool actions                                                                    \n"
    printf "|  ${YELLOW}usage${NC}: tool ${WHITE}[-h] {report}${NC} ...\n"
    echo "|"
    printf "+${BLUE}options${NC}:\n"
    printf "|  -h, --help            show this help message and exit\n"
    echo "|"
    printf "+${BLUE}action${NC}:\n"
    printf "|  report      process a report from a tool\n"
    echo ""
    BASE=`pwd`
    cd result
    REPORT_FILE=""
    while :;do
        PS3="└─Please Select report file > "
        select FILE in * "Exit" ;do
        echo ""
        break
        done
        printf "+You selected was : ${YELLOW}${FILE}${NC}\n"
        echo "|"
        if [ ${FILE} = "Exit" ];then
            break
        elif [ -d ${FILE} ];then
            cd ${FILE}
        elif [ -f ${FILE} ];then
            DIR_PATH=`pwd`
            REPORT_FILE="${DIR_PATH}/${FILE}"
            cd $BASE
            break
        fi
    done
    cmd="$cmd tool report $REPORT_FILE"
    echo "└─Command > $cmd"
    echo ""
    echo "> You ready?"
    num1 0 "No"
    num2 0 "Yes"
    read -n 1 -s ANS
    if [ ! -z "$ANS" ];then
        if [ $ANS = "2" ];then
            show_number 4244 "faraday-cli Import Report"
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

function cmd_faraday-cli6(){
    clear
    figlet Faraday-Cli
    cmd="faraday-cli"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${BLUE}[4]Reports${WHITE} > [2]Faraday > [4]faraday-cli > [6]Stats${NC}\n"
    printf "+${BLUE}Stats${NC}\n"
    printf "|  ----------------------------------------------------------------------------------------------------\n"
    printf "|  stats                 Different statistics about the information on Faraday   \n"
    echo "|"
    printf "|  ${YELLOW}usage${NC}: stats [-h] {severity,vulns}\n"
    echo "|"
    printf "+${BLUE}Different statistics about the information on Faraday${NC}\n"
    echo "|"
    printf "+${BLUE}positional arguments${NC}:\n"
    printf "|  ${YELLOW}[1]Severity${NC}\n"
    printf "|  ${YELLOW}[2]Vulns${NC}\n"
    num1 0 "Severity"
    num2 0 "Vulns"
    read -n 1 -s NUM
    case $NUM in
    1)
        OPTION="severity"
        SET_NUMBER=42461
        ;;
    2)
        OPTION="vulns"
        SET_NUMBER=42462
        ;;
    *)
        ;;
    esac
    cmd="$cmd stats --type $OPTION"
    echo "└─Command > $cmd"
    echo ""
    echo "> You ready?"
    num1 0 "No"
    num2 0 "Yes"
    read -n 1 -s ANS
    if [ ! -z "$ANS" ];then
        if [ $ANS = "2" ];then
            show_number ${SET_NUMBER} "faraday-cli ${OPTION}"
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
