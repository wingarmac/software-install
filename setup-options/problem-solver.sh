#!/bin/sh
show_menu(){
    normal=`echo "\033[m"`
    menu=`echo "\033[36m"` #Blue
    number=`echo "\033[33m"` #yellow
    bgred=`echo "\033[41m"`
    fgred=`echo "\033[31m"`
    printf "\n${menu}*********************************************${normal}\n"
    printf "\n${menu}*        ${fgred}Ubuntu Cinnamon issues menu          ${menu}*${normal}\n"
    printf "\n${menu}*********************************************${normal}\n"
    printf "${menu}**${number} 1)${menu} Network applet problem ${normal}\n"
    printf "${menu}**${number} 2)${menu} Sound problem ${normal}\n"
    printf "${menu}**${number} 3)${menu} Mint Software & Update Center APT issue ${normal}\n"
    printf "${menu}**${number} 4)${menu} Reboot ${normal}\n"
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
            sudo touch /etc/network/interfaces;
            sudo sh -c 'echo "auto lo" >> /etc/network/interfaces';
            sudo sh -c 'echo "iface lo inet loopback" >> /etc/network/interfaces';
            sudo sh -c 'echo "  renderer: NetworkManager" >> /etc/netplan/*.yaml';
            sudo netplan apply;
            show_menu;
        ;;
        2) clear;
            option_picked "Option 2 Picked";
            sudo ln -s /usr/share/pipewire /etc/pipewire;
            sudo touch /usr/share/pipewire/media-session.d/with-pulseaudio;
            sudo systemctl --user restart pipewire-session-manager;
            sudo systemctl --user start pulseaudio;
            show_menu;
        ;;
        3) clear;
            option_picked "Option 3 Picked";
            sudo touch /etc/apt/preferences.d/official-package-repositories.pref;
	    sudo cp ~/setup-options/official-package-repositories.pref /etc/apt/preferences.d/official-package-repositories.pref;
	    sudo apt install mintinstall mintupdate -y;
	    show_menu;
        ;;
        4) clear;
            option_picked "Option 4 Picked";
            reboot;
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

