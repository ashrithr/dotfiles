# Dotfiles

Personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/) and [Homebrew](https://brew.sh).

## Quick Setup

```bash
# 1. Install prerequisites
xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 2. Clone and install
git clone https://github.com/ashrithr/dotfiles.git ~/dotfiles
cd ~/dotfiles
bash scripts/install.sh
```

## Manual Setup

```bash
brew install stow
cd ~/dotfiles
stow .
brew bundle --file=~/dotfiles/Brewfile --no-lock
```
