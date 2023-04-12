#!/usr/bin/env bash
#Installs all Ubuntu specific apps and dependencies.

# #Run the script as sudo! :/
# if [ $EUID != 0 ]; then
#     sudo bash "$0" "$@"
#     exit "$?"
# fi

#Get the latest updates
sudo apt-get update

#Install Chezmoi and Apply git

#Install dependencies
sudo apt install curl git cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3 -y

#Install Alacritty
sudo apt update && sudo apt upgrade
sudo add-apt-repository ppa:aslatter/ppa -y
sudo apt install alacritty

#Install zsh and oh-my-zsh
sudo apt install zsh -y
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

grep $USER /etc/passwd | grep /usr/bin/zsh > /dev/null
grep mkasberg /etc/passwd | grep /usr/bin/zsh > /dev/null
if [ $? -ne 0 ]; then
    echo "Changing user shell to zsh..."
    chsh -s /usr/bin/zsh
fi