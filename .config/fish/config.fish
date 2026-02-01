# ============================================================
# Fish Shell Configuration - Optimized for Fast Startup
# ============================================================

# ----------------------------------------------------------
# Core Configuration (Always loaded immediately)
# ----------------------------------------------------------

# Remove the default greeting (clean prompt)
set -g fish_greeting ""

# Source aliases (fast, no subshells)
test -f "$HOME/.config/fish/aliases.fish"; and source "$HOME/.config/fish/aliases.fish"

# Source functions (fast, defines but doesn't execute)
test -f "$HOME/.config/fish/functions.fish"; and source "$HOME/.config/fish/functions.fish"

# Source shared exports
test -f "$HOME/.exports"; and source "$HOME/.exports"

# ----------------------------------------------------------
# Homebrew (Required for other tools, cache HOMEBREW_PREFIX)
# ----------------------------------------------------------
if test -f "/opt/homebrew/bin/brew"
    if not set -q HOMEBREW_PREFIX
        eval (/opt/homebrew/bin/brew shellenv)
    end
end

# ----------------------------------------------------------
# Cargo/Rust (PATH only, no init script)
# ----------------------------------------------------------
fish_add_path "$HOME/.cargo/bin"

# ----------------------------------------------------------
# mise (Replaces pyenv - much faster activation)
# ----------------------------------------------------------
type -q mise; and mise activate fish | source

# ----------------------------------------------------------
# Prompt (Starship - load immediately for visual)
# ----------------------------------------------------------
type -q starship; and starship init fish | source

# ----------------------------------------------------------
# Smart Tools
# ----------------------------------------------------------

# Zoxide - smart cd with learning
type -q zoxide; and zoxide init --cmd cd fish | source

# Atuin - better shell history
type -q atuin; and atuin init fish | source

# Direnv - per-directory environments
type -q direnv; and direnv hook fish | source

# ----------------------------------------------------------
# PATH Additions
# ----------------------------------------------------------
fish_add_path "$HOME/.local/bin"
fish_add_path "$HOME/.codeium/windsurf/bin"
fish_add_path "$HOME/.antigravity/antigravity/bin"
fish_add_path "$HOME/.amp/bin"
fish_add_path "$HOME/.opencode/bin"

# ----------------------------------------------------------
# Editor Integrations (only in interactive shells)
# ----------------------------------------------------------

# Kiro integration
string match -q "$TERM_PROGRAM" "kiro"; and . (kiro --locate-shell-integration-path fish)

# OrbStack
test -f ~/.orbstack/shell/init2.fish; and source ~/.orbstack/shell/init2.fish 2>/dev/null
