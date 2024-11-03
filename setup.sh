#!/bin/bash

# Setup git
echo "Install and config git"
sudo apt install git -y
git config --global core.editor "vim"

# Setup curl
echo "Install curl"
sudo apt install curl -y

# Setup zsh and ohmyzsh. This needs git and curl
echo "Setting up zsh and ohmyzsh"
sudo apt install zsh -y
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# zsh_history has a limit of 10k lines.
# in order to remove this limit - we add these settings to .zshrc
echo 'export HISTSIZE=1000000000' >> ~/.zshrc
echo 'export SAVEHIST=$HISTSIZE' >> ~/.zshrc
echo 'setopt EXTENDED_HISTORY' >> ~/.zshrc

echo "Install htop"
sudo apt install htop -y

echo "Install sensors"
sudo apt install lm-sensors -y

echo "Install guake"
sudo apt install guake -y

# Download and install sublime-text
echo "Install sublime"
# Add a Sublime repository key so that the necessary package installation will be carried out from a reliable source.
sudo wget -O- https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/sublimehq.gpg
# Download the latest stable version of sublime-text
echo 'deb [signed-by=/usr/share/keyrings/sublimehq.gpg] https://download.sublimetext.com/ apt/stable/' | sudo tee /etc/apt/sources.list.d/sublime-text.list
# Install sublime text
sudo apt update
sudo apt install sublime-text