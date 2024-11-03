#!/bin/bash

# Setup git
echo "Install and config git"
sudo apt install git
git config --global core.editor "vim"

# Setup curl
echo "Install curl"
sudo apt install curl

# Setup zsh and ohmyzsh. This needs git and curl
echo "Setting up zsh and ohmyzsh"
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# zsh_history has a limit of 10k lines.
# in order to remove this limit - we add these settings to .zshrc
echo 'export HISTSIZE=1000000000' >> ~/.zshrc
echo 'export SAVEHIST=$HISTSIZE' >> ~/.zshrc
echo 'setopt EXTENDED_HISTORY' >> ~/.zshrc

echo "Install htop"
sudo apt install htop

echo "Install sensors"
sudo apt install lm-sensors -y

echo "Install guake"
sudo apt install guake

# Download and install sublime-text
echo "Install sublime"
curl -o ~/Downloads/sublime-install.deb https://www.sublimetext.com/download_thanks?target=x64-deb
sudo dpkg --install ~/Downloads/sublime-install.deb
