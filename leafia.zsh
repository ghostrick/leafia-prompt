function prompt_leafia_setup {

    add-zsh-hook precmd prompt_leafia_precmd
    PROMPT='>'
}

function prompt_leafia_precmd {

    Color=(35 114 228)
    print -P "\e[38;5;$Color[2]m%d%f"
}

function prompt_leafia_preview {
    prompt_preview_theme 'leafia'
}

prompt_leafia_setup '$@'
