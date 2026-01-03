function fish_user_key_bindings
    # fzf key bindings (lazy loaded when first key is pressed)
    # Note: fzf.fish plugin handles bindings via conf.d
    # This is a fallback for vanilla fzf
    if not functions -q _fzf_search_directory
        type -q fzf; and fzf --fish | source
    end
end
