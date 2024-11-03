echo "Configuring git:"

read -p "Enter your git username: " gitusername
git config --global user.name $gitusername

read -p "Enter your git email: " gitemail
git config --global user.email $gitemail

echo "Generate ssh key"
ssh-keygen -t ed25519 -C "$gitemail"

