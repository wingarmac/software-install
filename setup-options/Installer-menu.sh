#!/bin/sh
show_menu(){
    normal=`echo "\033[m"`
    menu=`echo "\033[36m"` #Blue
    number=`echo "\033[33m"` #yellow
    bgred=`echo "\033[41m"`
    fgred=`echo "\033[31m"`
    printf "\n${menu}*********************************************${normal}\n"
    printf "\n${menu}*              ${fgred}Installer Menu              ${menu}*${normal}\n"
    printf "\n${menu}*********************************************${normal}\n"
    printf "${menu}**${number} 1)${menu} Add Mint PPA and update ${normal}\n"
    printf "${menu}**${number} 2)${menu} Install Cinnamon ${normal}\n"
    printf "${menu}**${number} 3)${menu} update and upgrade ${normal}\n"
    printf "${menu}**${number} 4)${menu} Addition software installation ${normal}\n"
    printf "${menu}**${number} 5)${menu} Upgrade Kernel ${normal}\n"
    printf "${menu}**${number} 6)${menu} Resolve Ubuntu Cinnamon issues ${normal}\n"
    printf "${menu}**${number} 7)${menu} Install graphic proprietary driver ${normal}\n"
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
            sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com A1715D88E1DF1F24 40976EAF437D05B5 3B4FE6ACC0B21F32 A6616109451BBBF2;
	    sudo sh -c 'echo "deb http://packages.linuxmint.com vanessa main upstream import backport romeo" >> /etc/apt/sources.list.d/mint.list';
	    sudo sh -c 'echo "deb-src http://packages.linuxmint.com vanessa main upstream import backport romeo" >> /etc/apt/sources.list.d/mint.list' ;
	    sudo apt-key export 451BBBF2 | gpg --dearmour -o /etc/apt/trusted.gpg.d/mint.gpg
            sudo apt update;
            show_menu;
        ;;
        2) clear;
            option_picked "Option 2 Picked";
            sudo apt install slick-greeter muffin cinnamon;
            show_menu;
        ;;
        3) clear;
            option_picked "Option 3 Picked";
            sudo apt update;
            sudo apt upgrade -y;
            show_menu;
        ;;
        4) clear;
            option_picked "Option 4 Picked";
            sudo sh additional-software.sh;
            show_menu;
        ;;
        5) clear;
            option_picked "Option 5 Picked";
            sudo sh ubuntu-mainline-kernel.sh;
            show_menu;
        ;;
        6) clear;
            option_picked "Option 6 Picked";
	    sudo sh problem-solver.sh;
	    show_menu;
        ;;
        7) clear;
            option_picked "Option 7 Picked";
	    sudo sh nvidia-installation.sh;
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

