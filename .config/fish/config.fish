if [ -f "$HOME/.config/fish/aliases.fish" ]
	source "$HOME/.config/fish/aliases.fish"
end

if [ -f "$HOME/.config/fish/functions.fish" ]
	source "$HOME/.config/fish/functions.fish"
end

if [ -f "$HOME/.exports" ]
    # pull in all shared `export …` aka `set -gx …`
    source "$HOME/.exports"
end

if [ -f "/opt/homebrew/bin/brew" ]
	eval (/opt/homebrew/bin/brew shellenv)
end

if [ -d "$HOME/.cargo" ]
	export PATH="$HOME/.cargo/bin:$PATH"
end

if type -q starship
	starship init fish | source
end

if type -q pyenv
	pyenv init - | source
	pyenv virtualenv-init - | source
end

if type -q zoxide
	zoxide init --cmd cd fish | source
end
