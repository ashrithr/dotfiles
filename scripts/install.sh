#!/bin/bash

set -e

# Install homebrew if not already installed
if ! command -v brew &> /dev/null; then
  echo "[+] Installing Homebrew ..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # Add Homebrew to PATH for the rest of this script
  if [[ -f /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [[ -f /usr/local/bin/brew ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
  fi
fi

# Update homebrew recipes
echo "[+] Updating Homebrew recipes ..."
brew update

# Install all dependencies with bundle (See Brewfile)
echo "[+] Installing Applications and Command line tools via Homebrew ..."
brew bundle --file="$(dirname "$0")/../Brewfile"

# Install stow if not already installed
if ! command -v stow &> /dev/null; then
  echo "[+] Installing GNU Stow ..."
  brew install stow
fi

# Set macOS preferences
echo "[+] Configuring MAC with sensible defaults ..."
bash "$(dirname "$0")/.macos"

# Create symlinks using stow
echo "[+] Creating symlinks with stow ..."
cd "$(dirname "$0")/.."
stow -v --target="$HOME" .

# Make fish the default shell
FISH_PATH=$(which fish)
if [[ -n "$FISH_PATH" ]]; then
  if ! grep -q "$FISH_PATH" /etc/shells; then
    echo "[+] Adding fish to /etc/shells ..."
    echo "$FISH_PATH" | sudo tee -a /etc/shells
  fi

  if [[ "$SHELL" != "$FISH_PATH" ]]; then
    echo "[+] Making fish the default shell ..."
    chsh -s "$FISH_PATH"
  fi
fi

echo "[+] Done! Please restart your terminal."
