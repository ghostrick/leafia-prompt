function prompt_leafia_setup {

    add-zsh-hook precmd prompt_leafia_precmd
    PROMPT='🍃 '
}

function prompt_leafia_precmd {

    Color=(35 114 229)

    if (( $+functions[git-info] )); then
        git-info
    fi

    zstyle ':prezto:module:git:info:branch' format '%b%f'
    zstyle ':prezto:module:git:info:keys' format 'prompt' "\e[38;5;245m(\e[38;5;$Color[3]m%b\e[38;5;245m)"

    print -P "\e[38;5;$Color[2]m%d%f${git_info:+${(e)git_info[prompt]}}"
}

function prompt_leafia_preview {
    prompt_preview_theme 'leafia'
}

prompt_leafia_setup '$@'
