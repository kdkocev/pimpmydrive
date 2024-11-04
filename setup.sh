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
# TODO: setup the color scheme and Typescript and Python packages using cli

# Install google chrome
echo "Install Google Chrome"
curl -o ~/Downloads/google-chrome-stable_current_amd64.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i ~/Downloads/google-chrome-stable_current_amd64.deb

echo "Install pv"
sudo apt install pv

echo "Install nvm"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

echo "Install docker"
# Remove any previously installed docker packages
# for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
# Install the latest
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
# Setup the current user in the docker group so that scripts can be executed without sudo
sudo groupadd docker
sudo gpasswd -a $USER docker
# "Relog" the user to use the new group permission
su - $USER
sudo service docker restart

echo "Add alias dock"
echo 'alias dock="docker compose run django"' >> ~/.zshrc
echo "Add alias sail"
echo 'alias sail="./vendor/bin/sail"' >> ~/.zshrc

# Add tmux
echo "Install and configure tmux"
sudo apt install tmux -y
echo "set -g base-index 1" >> ~/.tmux.conf
echo "set -g escape-time 20" >> ~/.tmux.conf
echo "set -g mouse on" >> ~/.tmux.conf
echo "set -g mode-keys vi" >> ~/.tmux.conf
echo "set -s set-clipboard off" >> ~/.tmux.conf
echo 'bind key -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel "xclip -selection clipboard -i"' >> ~/.tmux.conf
echo 'set -g default-terminal "screen-256color"' >> ~/.tmux.conf
echo 'set -g status-bg "#333333"' >> ~/.tmux.conf
echo "set -g status -fg white" >> ~/.tmux.conf

# Install jump
echo "Install jump"
sudo snap install jump
echo 'eval "$(jump shell)"' >> ~/.zshrc
