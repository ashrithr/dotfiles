#!/usr/bin/env zsh

# Zsh-specific history settings (Fish uses Atuin)
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=50000
export SAVEHIST=50000

setopt HIST_IGNORE_ALL_DUPS    # Remove older duplicate entries
setopt HIST_IGNORE_SPACE       # Don't record commands starting with a space
setopt HIST_REDUCE_BLANKS      # Remove superfluous blanks
setopt SHARE_HISTORY           # Share history across sessions
setopt INC_APPEND_HISTORY      # Write immediately, not when shell exits
setopt EXTENDED_HISTORY        # Add timestamps to history
