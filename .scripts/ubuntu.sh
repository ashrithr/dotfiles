#!/bin/bash

#
# Script to install neovim, tmux, and other tools on ubuntu
#

echo "[+] Updating apt-get"
sudo apt-get update

echo "[+] Adding software-properties-common to get 'add-apt-repository'"
sudo apt-get install -y software-properties-common

echo "[+] Installing neovim, curl, git and zsh"
sudo add-apt-repository -y ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install -y neovim curl git zsh wget

echo "[+] Installing Python packages"
sudo apt-get install -y python-dev python-pip python3-dev python3-pip

echo "[+] Making neovim default editor"
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --config editor

echo "[+] Installing python bindings for neovim"
pip3 install neovim

# Install Prezto - Zsh configuration framework
echo "[+] Installing Prezto (A Zsh configuration framework) ..."
/usr/bin/zsh <<'EOF'
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
	ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
chsh -s /bin/zsh
EOF

echo "[+] Installing ripgrep"
wget https://github.com/BurntSushi/ripgrep/releases/download/0.4.0/ripgrep-0.4.0-x86_64-unknown-linux-musl.tar.gz
tar xzf ripgrep-0.4.0-x86_64-unknown-linux-musl.tar.gz
cp ripgrep-0.4.0-x86_64-unknown-linux-musl/rg /usr/local/bin/
rm -f ripgrep-0.4.0-x86_64-unknown-linux-musl.tar.gz
rm -rf ripgrep-0.4.0-x86_64-unknown-linux-musl

