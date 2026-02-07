# ============================================================
# Zsh Configuration - Optimized with mise
# ============================================================

# Source shared exports
[[ -f ~/.exports ]] && source ~/.exports

# Source modular configs (Zsh-specific overrides after shared exports)
[[ -f ~/.config/zsh/exports.zsh ]] && source ~/.config/zsh/exports.zsh
[[ -f ~/.config/zsh/aliases.zsh ]] && source ~/.config/zsh/aliases.zsh
[[ -f ~/.config/zsh/functions.zsh ]] && source ~/.config/zsh/functions.zsh

# Zsh options
setopt AUTO_CD              # Type directory name to cd into it
setopt AUTO_PUSHD           # Push directories onto stack automatically
setopt PUSHD_IGNORE_DUPS    # Don't push duplicate directories
setopt EXTENDED_GLOB        # Extended globbing patterns
setopt NO_CASE_GLOB         # Case-insensitive globbing

# Initialize completion system
autoload -Uz compinit
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then
    compinit
else
    compinit -C
fi
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'     # Case-insensitive matching
zstyle ':completion:*' menu select                           # Arrow-key driven menu
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"      # Colored completions

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

# Zsh plugins (syntax-highlighting must be last)
[[ -f $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && \
    source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
[[ -f $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && \
    source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
