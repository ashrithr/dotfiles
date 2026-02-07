#!/bin/bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

info()    { printf "\033[0;34m[INFO]\033[0m %s\n" "$1"; }
success() { printf "\033[0;32m[OK]\033[0m %s\n" "$1"; }
error()   { printf "\033[0;31m[ERROR]\033[0m %s\n" "$1" >&2; }

# 1. Install Homebrew
if ! command -v brew &>/dev/null; then
    info "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    if [[ -f /opt/homebrew/bin/brew ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    elif [[ -f /usr/local/bin/brew ]]; then
        eval "$(/usr/local/bin/brew shellenv)"
    fi
else
    success "Homebrew already installed"
fi

# 2. Install packages from Brewfile
info "Installing packages from Brewfile..."
brew bundle --file="$DOTFILES_DIR/Brewfile" --no-lock

# 3. Create symlinks with stow
info "Creating symlinks with stow..."
cd "$DOTFILES_DIR"
stow -v --target="$HOME" --restow .

# 4. Set up Rust toolchain
if command -v rustup &>/dev/null; then
    if ! rustup show active-toolchain &>/dev/null 2>&1; then
        info "Installing Rust stable toolchain..."
        rustup install stable
        rustup default stable
    else
        success "Rust toolchain already configured"
    fi
fi

# 5. Set Fish as default shell
FISH_PATH="$(which fish 2>/dev/null || true)"
if [[ -n "$FISH_PATH" ]]; then
    if ! grep -q "$FISH_PATH" /etc/shells; then
        info "Adding Fish to /etc/shells..."
        echo "$FISH_PATH" | sudo tee -a /etc/shells
    fi
    if [[ "$SHELL" != "$FISH_PATH" ]]; then
        info "Setting Fish as default shell..."
        chsh -s "$FISH_PATH"
    else
        success "Fish is already the default shell"
    fi
fi

success "Setup complete! Please restart your terminal."
