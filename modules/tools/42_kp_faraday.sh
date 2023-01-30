#!/bin/bash

source kp.conf
source $MODULES_PATH/misc_module.sh

function menu_faraday(){
    clear
    figlet Faraday
    num4 0 "Reports"
    num2 5 "Faraday"
    num1 10 "Start Faraday"
    num2 10 "Stop Faraday"
    num3 10 "Open Faraday(Web)"
    num4 10 "faraday-cli"
    num9 10 "Back"
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
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${BLUE}[4]Reports${NC} > ${GREEN}[2]Faraday${NC} > ${RED}[1]Start Faraday${NC}\n"
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
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${BLUE}[4]Reports${NC} > ${GREEN}[2]Faraday${NC} > ${GREEN}[2]Stop Faraday${NC}\n"
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
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${BLUE}[4]Reports${NC} > ${GREEN}[2]Faraday${NC} > ${YELLOW}[3]Open Faraday(Web)${NC}\n"
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
    figlet Faraday
    num4 0 "Reports"
    num2 5 "Faraday"
    num4 10 "faraday-cli"
    num1 15 "auth"
    num2 15 "workspace"
    num3 15 "Host list"
    num4 15 "Service list"
    num5 15 "Vuln list"
    num6 15 "Stats"
    num9 15 "Back"
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
    figlet Faraday
    cmd="faraday-cli"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${BLUE}[4]Reports${NC} > ${GREEN}[2]Faraday${NC} > ${BLUE}[4]faraday-cli${NC} > ${RED}[1]auth${NC}\n"
    printf "+${BLUE}Core${NC}\n"
    printf "|  ----------------------------------------------------------------------------------------------------\n"
    printf "|  auth                  Authenticate with a faraday server                                              \n"
    echo "|"
    printf "|  ${YELLOW}usage${NC}: auth ${WHITE}[-h] [-f FARADAY_URL] [-i] [-u USER] [-p PASSWORD]${NC}\n"
    read -e -p "> Input FARADAY_URL (default)127.0.0.1:5985 :" TARGET
    if [ ! -n "$TARGET" ];then
        TARGET="http://127.0.0.1:5985"
    fi
    echo "|"
    read -e -p "> Input USER: " USER
    echo "|"
    read -e -p "> Input PASSWORD: " PASSWORD
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
    figlet Faraday
    cmd="faraday-cli"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${BLUE}[4]Reports${NC} > ${GREEN}[2]Faraday${NC} > ${BLUE}[4]faraday-cli${NC} > ${GREEN}[2]workspace${NC}\n"
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
    read -e -p "> Input Workspace name: " WSNAME
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
    figlet Faraday
    cmd="faraday-cli"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${BLUE}[4]Reports${NC} > ${GREEN}[2]Faraday${NC} > ${BLUE}[4]faraday-cli${NC} > ${YELLOW}[3]Host list${NC}\n"
    printf "+${BLUE}Objects${NC}\n"
    printf "|  ----------------------------------------------------------------------------------------------------\n"
    printf "|  host                  host actions                                                                    \n"
    echo "|"
    printf "|  ${YELLOW}usage${NC}: host [-h] {create,delete,get,list} ...\n"
    echo "|"
    printf "+${BLUE}host actions${NC}\n"
    echo "|"
    printf "+${BLUE}options${NC}:\n"
    printf "|  -h, --help            show this help message and exit\n"
    echo "|"
    printf "+${BLUE}action${NC}:\n"
    printf "|  ${YELLOW}list${NC}                list hosts\n"
    cmd="$cmd host list"
    echo "└─Command > $cmd"
    echo ""
    echo "> You ready?"
    num1 0 "No"
    num2 0 "Yes"
    read -n 1 -s ANS
    if [ ! -z "$ANS" ];then
        if [ $ANS = "2" ];then
            show_number 4243 "faraday-cli Host-List"
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
    figlet Faraday
    cmd="faraday-cli"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${BLUE}[4]Reports${NC} > ${GREEN}[2]Faraday${NC} > ${BLUE}[4]faraday-cli${NC} > ${BLUE}[4]Service list${NC}\n"
    printf "+${BLUE}Objects${NC}\n"
    printf "|  ----------------------------------------------------------------------------------------------------\n"
    printf "|  service               service actions                                                                 \n"
    echo "|"
    printf "|  ${YELLOW}usage${NC}: service ${WHITE}[-h] {list}${NC} ...\n"
    echo "|"
    printf "+${BLUE}service actions${NC}\n"
    echo "|"
    printf "+${BLUE}options${NC}:\n"
    printf "|  -h, --help  show this help message and exit\n"
    echo "|"
    printf "+${BLUE}action${NC}:\n"
    printf "  ${YELLOW}list${NC}      list services\n"
    cmd="$cmd service list"
    echo "└─Command > $cmd"
    echo ""
    echo "> You ready?"
    num1 0 "No"
    num2 0 "Yes"
    read -n 1 -s ANS
    if [ ! -z "$ANS" ];then
        if [ $ANS = "2" ];then
            show_number 4244 "faraday-cli Service-List"
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

function cmd_faraday-cli5(){
    clear
    figlet Faraday
    cmd="faraday-cli"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${BLUE}[4]Reports${NC} > ${GREEN}[2]Faraday${NC} > ${BLUE}[4]faraday-cli${NC} > ${PURPLE}[5]workspace${NC}\n"
    printf "+${BLUE}Objects${NC}\n"
    printf "|  ----------------------------------------------------------------------------------------------------\n"
    printf "|  vuln                  vulnerabilities actions                                                         \n"
    printf "|  ${YELLOW}usage${NC}: vuln [-h] {add-evidence,list} ...\n"
    echo "|"
    printf "+${BLUE}vulnerabilities actions${NC}\n"
    echo "|"
    printf "+${BLUE}options${NC}:\n"
    printf "|  -h, --help           show this help message and exit\n"
    echo "|"
    printf "+${BLUE}action${NC}:\n"
    printf "|  ${YELLOW}list${NC}               list vulnerabilities\n"
    cmd="$cmd vuln list"
    echo "└─Command > $cmd"
    echo ""
    echo "> You ready?"
    num1 0 "No"
    num2 0 "Yes"
    read -n 1 -s ANS
    if [ ! -z "$ANS" ];then
        if [ $ANS = "2" ];then
            show_number 4245 "faraday-cli Vuln-List"
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
    figlet Faraday
    cmd="faraday-cli"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${BLUE}[4]Reports${NC} > ${GREEN}[2]Faraday${NC} > ${BLUE}[4]faraday-cli${NC} > ${LIGHTBLUE}[6]Stats${NC}\n"
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
    cmd="$cmd stats $OPTION"
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
