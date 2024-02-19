#!/bin/bash

# Install homebrew if not already installed
if test ! $(which brew); then
  echo  "[+] Installing Homebrew ..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew receipes
echo "[+] Updating Homebrew receipes ..."
brew update

# Install all our dependencies with bundle (See Brewfile)
echo  "[+] Installing Applications and Command line tools via Homebrew ..."
brew tap homebrew/bundle
brew bundle

# Make zsh the default shell environment
echo "[+] Making zsh the default shell"
chsh -s $(which zsh)

# Set MacOS preferences
echo "[+] Configuring MAC with sensible defaults ..."
bash .macos

# Move the configuration files
echo "[+] Synchronizing dotfiles ..."
rsync --exclude ".git/" \
  --exclude ".DS_Store" \
  --exclude ".osx" \
  --exclude "init/" \
  -avh --no-perms . ~

echo "[+] Sourcing zsh ..."
source ~/.zshrc

echo "DONE"
