if [ -f "$HOME/.config/fish/aliases.fish" ]
	source "$HOME/.config/fish/aliases.fish"
end

if [ -f "$HOME/.config/fish/functions.fish" ]
	source "$HOME/.config/fish/functions.fish"
end

eval (/opt/homebrew/bin/brew shellenv)

starship init fish | source

export PATH="$HOME/.cargo/bin:$PATH"

pyenv init - | source
pyenv virtualenv-init - | source
