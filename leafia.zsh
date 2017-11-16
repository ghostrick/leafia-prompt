
# add color palette
Color=(35 114 230 227)

# setting syntax-highlighting color
typeset -g -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[command]="fg=$Color[2]"
ZSH_HIGHLIGHT_STYLES[alias]="fg=$Color[2]"
ZSH_HIGHLIGHT_STYLES[path]="fg=$Color[1]"
ZSH_HIGHLIGHT_STYLES[globbing]="fg=$Color[3]"
ZSH_HIGHLIGHT_STYLES[unknown-token]="fg=245"
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]="fg=$Color[4]"
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]="fg=$Color[4]"
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]="fg=$Color[4]"

function prompt_leafia_setup {

    zstyle ':prezto:module:syntax-highlighting' color 'yes'

    add-zsh-hook precmd prompt_leafia_precmd
    PROMPT='🍃 '
}

function prompt_leafia_precmd {

    if (( $+functions[git-info] )); then
        git-info
    fi

    zstyle ':prezto:module:git:info' verbose 'yes'
    zstyle ':prezto:module:git:info:branch' format '%F{'$Color[3]'}%b%f'
    zstyle ':prezto:module:git:info:dirty' format '%F{'$Color[3]'}*%f'
    zstyle ':prezto:module:git:info:keys' format 'prompt' '%F{'$Color[3]'} %b%D'

    print -P "\e[38;5;$Color[2]m%d%f ${git_info:+${(e)git_info[prompt]}}"
}

function prompt_leafia_preview {
    prompt_preview_theme 'leafia'
}

prompt_leafia_setup '$@'
