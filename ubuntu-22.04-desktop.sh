#!/bin/bash

sudo echo START

# # # SOFT
# git
sudo apt install -y git
git config --global user.name "AntonyMo"
git config --global user.email "32247865+AntonyMoes@users.noreply.github.com"

# chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb

# toolbox
sudo apt install -y fuse
wget https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.24.11947.tar.gz
tar -xzf jetbrains-toolbox-1.24.11947.tar.gz
rm jetbrains-toolbox-1.24.11947.tar.gz
./jetbrains-toolbox-1.24.11947/jetbrains-toolbox
rm -r jetbrains-toolbox-1.24.11947

# discord

wget -O discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
sudo dpkg -i discord.deb
rm discord.deb

sudo apt --fix-broken install -y

# # # BASH

source ~/.bashrc

if [[ $(type -t git_branch) != function ]]
then
  cat >> ~/.bashrc <<- EOM

# show git branch
git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export -f git_branch
export PS1="\$PS1\\\$(git_branch)\\\$ "
EOM
fi

source ~/.bashrc

# # # CONFIG
# color scheme
gsettings set org.gnome.desktop.interface color-scheme prefer-dark
gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-prussiangreen-dark'
# ^ before icons, 'Yaru' resets them

# icon theme
sudo add-apt-repository -y -u ppa:snwh/ppa
sudo apt install -y paper-icon-theme
gsettings set org.gnome.desktop.interface icon-theme Paper-Mono-Dark

# config language change
gsettings set org.gnome.desktop.wm.keybindings switch-input-source "['<Shift>Alt_L']"
