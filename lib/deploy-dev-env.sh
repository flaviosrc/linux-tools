#!/bin/bash

set -e

echo "Executar como root"

echo "Instalando ferramentas"
apt install curl git zip tmux neovim htop zsh tcpdump nmap tree -y

echo "Instalando bitwarden"
curl -L "https://bitwarden.com/download/?app=cli&platform=linux" -o bw-cli-linux.zip

unzip bw-cli-linux.zip

install bw /usr/bin/

rm bw-cli-linux.zip bw

echo "Instalando nordvpn"
sh <(curl -sSf https://downloads.nordcdn.com/apps/linux/install.sh)

exit 0

echo "Users configuration"

echo "Add tmux to shortcut alt + t: gnome-terminal -- tmux"

echo "Configurando zsh as default shell"

chsh -s $(which zsh)

zsh

echo "Instalando OhMyZsh"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Instalando claude code"

curl -fsSL https://claude.ai/install.sh | bash

if ! echo $PATH | grep "$HOME/.local/bin" ; then
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc && source ~/.bashrc
fi

