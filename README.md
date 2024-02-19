# Dotfiles for my setup

This repository contains the dot files for my setup.

## Setup of the dotfiles

1. Install macOS Command Line Tools by running `xcode-select --install`
2. Install [Homebrew](https://brew.sh)
3. Install GNU Stow by running `brew install stow`
4. Clone this repo to `~/dotfiles`
5. Run `stow` to symlink the dotfiles to the home directory

```bash
cd ~/dotfiles
stow .
```

## Setup all packages and tools using Homebrew

Install brew packages by running `brew bundle --file=~/dotfiles/Brewfile`
