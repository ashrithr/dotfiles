# ============================================================
# Zsh Configuration - Optimized with mise
# ============================================================

# Source modular configs
[[ -f ~/.config/zsh/exports.zsh ]] && source ~/.config/zsh/exports.zsh
[[ -f ~/.config/zsh/aliases.zsh ]] && source ~/.config/zsh/aliases.zsh
[[ -f ~/.config/zsh/functions.zsh ]] && source ~/.config/zsh/functions.zsh

# Homebrew
if [[ -f "/opt/homebrew/bin/brew" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# mise (replaces pyenv/jenv)
command -v mise &>/dev/null && eval "$(mise activate zsh)"

# Starship prompt
eval "$(starship init zsh)"

# Zoxide - smart cd
command -v zoxide &>/dev/null && eval "$(zoxide init --cmd cd zsh)"

# Atuin - better shell history
command -v atuin &>/dev/null && eval "$(atuin init zsh)"

# Direnv - per-directory environments
command -v direnv &>/dev/null && eval "$(direnv hook zsh)"

# fzf - fuzzy finder
command -v fzf &>/dev/null && source <(fzf --zsh)

# Kiro integration
[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"
