# ============================================================
# Fish Shell Configuration
# ============================================================

# Suppress default greeting
set -g fish_greeting ""

# Source config modules
test -f "$HOME/.config/fish/aliases.fish"; and source "$HOME/.config/fish/aliases.fish"
test -f "$HOME/.config/fish/functions.fish"; and source "$HOME/.config/fish/functions.fish"
test -f "$HOME/.exports"; and source "$HOME/.exports"

# ----------------------------------------------------------
# PATH Setup
# ----------------------------------------------------------

# Homebrew (required for other tools)
if test -f "/opt/homebrew/bin/brew"
    if not set -q HOMEBREW_PREFIX
        eval (/opt/homebrew/bin/brew shellenv)
    end
end

# Core paths
fish_add_path "$HOME/.local/bin"
fish_add_path "$HOME/.cargo/bin"

# ----------------------------------------------------------
# Tool Initialization
# ----------------------------------------------------------

# mise - needed for scripts too (provides correct tool versions)
type -q mise; and mise activate fish | source

# ----------------------------------------------------------
# Interactive-only Setup
# ----------------------------------------------------------
if status is-interactive
    # Prompt
    type -q starship; and starship init fish | source

    # Smart tools
    type -q zoxide; and zoxide init --cmd cd fish | source
    type -q atuin; and atuin init fish | source
    type -q direnv; and direnv hook fish | source

    # OrbStack
    test -f ~/.orbstack/shell/init2.fish; and source ~/.orbstack/shell/init2.fish 2>/dev/null
end
