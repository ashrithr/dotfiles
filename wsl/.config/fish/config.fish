# Set homebrew Path
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# force umask
umask 022

# Starship
starship init fish | source

# Rustup
export PATH="$HOME/.cargo/bin:$PATH"


