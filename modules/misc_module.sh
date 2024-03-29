#!/bin/bash

function banner(){
    printf "${RED}010010101100000110110011010001010000100000010010101010101 ${NC}\n"
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
    printf "                                    .:d;.':;.\n"
    printf "                                       'd,  .'\n"
    printf "${GREEN} _  __${WHITE}     _ _ ${GREEN}____   ${WHITE}_    _  ___   _  ${BLUE}    ;l   ..\n"
    printf "${GREEN}| |/ /${WHITE}__ _| (_${GREEN})  _ \ ${WHITE}/ \  | |/ / | | |  ${BLUE}  .o\n"
    printf "${GREEN}| ' /${WHITE}/ _\`   | ${GREEN}| |_) /${WHITE} _ \ | ' /| | | | ${BLUE}     c\n"
    printf "${GREEN}| . \ ${WHITE}(_| | | ${GREEN}|  __/${WHITE} ___ \| . \| |_| |  ${BLUE}    .'\n"
    printf "${GREEN}|_|\_\ ${WHITE}_,_|_|_${GREEN}|_| ${WHITE}/_/   \_\_|\_\\\\\___/ ${BLUE}       . \n"
    printf "${WHITE}                                       PAKURI Version 5\n"
    printf "${RED}010010101100000110110011010001010000100000010010101010101 ${NC}\n"

}


function num0(){
    printf "${WHITE}%$1s  |  \n"
    printf "${WHITE}%$1s  +-${WHITE}[0]%s${NC}\n" "" " $2 $3"
}
function num1(){
    printf "${WHITE}%$1s  |  \n"
    printf "${WHITE}%$1s  +-${RED}[1]%s${NC}\n" "" " $2 $3"
}

function num2(){
    printf "${WHITE}%$1s  |  \n"
    printf "${WHITE}%$1s  +-${GREEN}[2]%s${NC}\n" "" " $2 $3"
}

function num3(){
    printf "${WHITE}%$1s  |  \n"
    printf "${WHITE}%$1s  +-${YELLOW}[3]%s${NC}\n" "" " $2 $3"
}

function num4(){
    printf "${WHITE}%$1s  |  \n"
    printf "${WHITE}%$1s  +-${BLUE}[4]%s${NC}\n" "" " $2 $3"
}

function num5(){
    printf "${WHITE}%$1s  |  \n"
    printf "${WHITE}%$1s  +-${PURPLE}[5]%s${NC}\n" "" " $2 $3"
}

function num6(){
    printf "${WHITE}%$1s  |  \n"
    printf "${WHITE}%$1s  +-${LIGHTBLUE}[6]%s${NC}\n" "" " $2 $3"
}

function num9(){
    printf "${WHITE}%$1s  |  \n"
    printf "${WHITE}%$1s  +-${BLACK}[9]%s${NC}\n" "" " $2 $3"
}

function show_number()
{
    echo $1 | fold -w 1 | while read c; do
        INPUT_NUMBER+=$c
        clear
        figlet $INPUT_NUMBER
        sleep 0.5
    done
    figlet $2
    sleep 1.5
    clear
}

function main_banner() {
    figlet KaliPAKU
}

function header(){
        TARGET=$(<"$T_FILE")
        figlet KaliPAKU
        echo "---------------------------------------"
        echo "Pentest Skill Level Upper"
        echo ""
        echo "[+] Your Target: $TARGET"
}