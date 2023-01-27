# software-install
Menu for automated installation of software and settings on Cinnamon Desktop

Purpose: Only for Ubuntu server (22.04 tested) and installation of the Cinnamon Desktop

This menu is made for my personal use in order to restore my Cinnamon Desktop installation like I prefer.

- It resolves known issues with sound on Ubuntu and with the network applet of Cinnamon that's on it.

[For more details about the network applet issue here](https://askubuntu.com/questions/1135755/network-manager-applet-shows-not-connected-and-one-unmanaged-wired-connection/1439162#1439162)

[For more information about the trouble with sound on Ubuntu](https://askubuntu.com/questions/1436904/problem-with-sound-in-ubuntu-22-10/1440458#1440458)

- It makes it easy to add the Mint backports for Cinnamon install on Ubuntu
- It let you select the proprietary driver to install for graphics
Since I only use Nvidia drivers on my computer, I just did add the version I personally need.

- It has an option to update the Ubuntu kernel to its last release
- It has a menu to install additional software from a text-list and also 3th party software I like/use that uses deb packages to be installed.

I also added an option to check for updates and upgrades automatically in combination with what needs to be done.
Same thing for a reboot option in the problem-solver.sh - because the sound fix requires a reboot to apply.

Usage:
---

`git clone https://github.com/wingarmac/software-install.git`

From inside the target folder, run a terminal and enter:

`~/software-install/setup-options$ chmod a+x Installer-menu.sh`

`~/software-install/setup-options$ ./Installer-menu.sh`
