#!/bin/bash

#
# Script to install neovim, tmux, and other tools on ubuntu
#

echo "[+] Installing epel repo"
yum -y install epel-release
echo "[+] Installing neovim repo"
curl -o /etc/yum.repos.d/dperson-neovim-epel-7.repo https://copr.fedorainfracloud.org/coprs/dperson/neovim/repo/epel-7/dperson-neovim-epel-7.repo
echo "[+] Installing neovim, git, curl, wget, tmux, zsh, python"
yum -y install neovim python-neovim git curl wget tmux zsh python34 python34-pip python34-devel
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
