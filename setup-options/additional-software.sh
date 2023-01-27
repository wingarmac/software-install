#!/bin/sh
show_menu(){
    normal=`echo "\033[m"`
    menu=`echo "\033[36m"` #Blue
    number=`echo "\033[33m"` #yellow
    bgred=`echo "\033[41m"`
    fgred=`echo "\033[31m"`
    printf "\n${menu}*********************************************${normal}\n"
    printf "\n${menu}*             ${fgred}Software Menu              ${menu}*${normal}\n"
    printf "\n${menu}*********************************************${normal}\n"
    printf "${menu}**${number} 1)${menu} Package install menu ${normal}\n"
    printf "${menu}**${number} 2)${menu} Install Google Chrome ${normal}\n"
    printf "${menu}**${number} 3)${menu} Install Unified Remote ${normal}\n"
    printf "${menu}**${number} 4)${menu} Install Wine ${normal}\n"
    printf "${menu}**${number} 5)${menu} Install Webmin ${normal}\n"
    printf "${menu}*********************************************${normal}\n"
    printf "Please enter a menu option and enter or ${fgred}x to exit. ${normal}"
    read opt
}

option_picked(){
    msgcolor=`echo "\033[01;31m"` # bold red
    normal=`echo "\033[00;00m"` # normal white
    message=${@:-"${normal}Error: No message passed"}
    printf "${msgcolor}${message}${normal}\n"
}

clear
show_menu
while [ $opt != '' ]
    do
    if [ $opt = '' ]; then
      exit;
    else
      case $opt in
        1) clear;
            option_picked "Option 1 Picked";
            sudo sh packages.sh;
            show_menu;
        ;;
        2) clear;
            option_picked "Option 2 Picked";
            wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb;
	    sudo dpkg -i google-chrome-stable_current_amd64.deb;
	    sudo apt install -f;
	    sudo apt update;
	    sudo apt upgrade -y;
            show_menu;
        ;;
        3) clear;
            option_picked "Option 3 Picked";
            wget https://www.unifiedremote.com/download/linux-x64-deb;
            sudo dpkg -i linux-x64-deb;
            sudo apt install -f;
	    show_menu;
        ;;
	4) clear;
            option_picked "Option 4 Picked";
            sudo dpkg --add-architecture i386;
	    sudo mkdir -pm755 /etc/apt/keyrings;
	    sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key;
	    sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/jammy/winehq-jammy.sources;
	    sudo apt update;
	    sudo apt install --install-recommends winehq-devel;
            show_menu;
        ;;
        5) clear;
            option_picked "Option 5 Picked";
            sudo apt update;
            wget http://prdownloads.sourceforge.net/webadmin/webmin_2.013_all.deb;
            sudo dpkg --install webmin_2.013_all.deb;
            sudo apt install -f;
	    show_menu;
        ;;
        x)exit;
        ;;
        \n)exit;
        ;;
        *)clear;
            option_picked "Pick an option from the menu";
            show_menu;
        ;;
      esac
    fi
done

