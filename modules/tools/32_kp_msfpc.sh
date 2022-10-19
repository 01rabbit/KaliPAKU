#!/bin/bash

source kp.conf
source $MODULES_PATH/misc_module.sh

function menu_msfpc(){
    clear
    figlet MSFPC
    num3 0 " Attack"
    num4 5 " MSFvenom_Payload_Creator" " (msfpc)"
    num1 10 " Create_Payload"
    num9 10 " Back"
    read -n 1 -s NUM
    case $NUM in
    1)
        cmd_msfpc
        ;;
    9)
        menu_attack
        ;;
    *)
        ;;
    esac
}

function cmd_msfpc(){
    local flg=0
    clear
    figlet MSFPC
    cmd="msfpc"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${YELLOW}[3]Attack${NC} > ${BLUE}[4]msfpc${NC} > ${RED}[1]create${NC}\n"
    echo "|"
    printf "> Use which ${YELLOW}Type${NC}?:\n"
    printf "+${BLUE}Types${NC}:\n"
    printf "|   [${GREEN} 1${NC}] ${YELLOW}APK${NC}\n"
    printf "|   [${GREEN} 2${NC}] ${YELLOW}ASP${NC}\n"
    printf "|   [${GREEN} 3${NC}] ${YELLOW}ASPX${NC}\n"
    printf "|   [${GREEN} 4${NC}] ${YELLOW}Bash${NC} [.${YELLOW}sh${NC}]\n"
    printf "|   [${GREEN} 5${NC}] ${YELLOW}Java${NC} [.${YELLOW}jsp${NC}]\n"
    printf "|   [${GREEN} 6${NC}] ${YELLOW}Linux${NC} [.${YELLOW}elf${NC}]\n"
    printf "|   [${GREEN} 7${NC}] ${YELLOW}OSX${NC} [.${YELLOW}macho${NC}]\n"
    printf "|   [${GREEN} 8${NC}] ${YELLOW}Perl${NC} [.${YELLOW}pl${NC}]\n"
    printf "|   [${GREEN} 9${NC}] ${YELLOW}PHP${NC}\n"
    printf "|   [${GREEN}10${NC}] ${YELLOW}Powershell${NC} [.${YELLOW}ps1${NC}]\n"
    printf "|   [${GREEN}11${NC}] ${YELLOW}Python${NC} [.${YELLOW}py${NC}]\n"
    printf "|   [${GREEN}12${NC}] ${YELLOW}Tomcat${NC} [.${YELLOW}war${NC}]\n"
    printf "|   [${GREEN}13${NC}] ${YELLOW}Windows${NC} [.${YELLOW}exe${NC} // .${YELLOW}exe${NC} // .${YELLOW}dll${NC}]\n"
    printf "|   [${GREEN}14${NC}] ${YELLOW}Help${NC}\n"
    printf "> Select ${GREEN}1${NC}-${GREEN}14${NC}: "
    read NUM
    case $NUM in
    1)
        TYPE="APK";;
    2)
        TYPE="ASP";;
    3)
        TYPE="ASPX";;
    4)
        TYPE="Bash";;
    5)
        TYPE="Java";;
    6)
        TYPE="Linux";;
    7)
        TYPE="OSX";;
    8)
        TYPE="Perl";;
    9)
        TYPE="PHP";;
    10)
        TYPE="Powershell";;
    11)
        TYPE="Python";;
    12)
        TYPE="Tomcat";;
    13)
        TYPE="Windows";;
    14)
        TYPE="help";;
    *)
        echo "Select Error"
        flg=1
        ;;
    esac
    if [ ! flg ];then
        cmd="${cmd} ${TYPE} verbose"
        echo "└─Command > $cmd"
        echo ""
        echo "> You ready?"
        num1 0 "No"
        num2 0 "Yes"
        read -n 1 -s ANS
        if [ ! -z "$ANS" ];then
            if [ $ANS = "2" ];then
                eval $cmd
            else
                :
            fi
        else
            :
        fi
    fi
}
