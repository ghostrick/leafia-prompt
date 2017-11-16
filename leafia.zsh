function prompt_leafia_setup {
  # Define prompts.
  PROMPT='%c%f | %f '
}

function prompt_leafia_precmd {
}

function prompt_leafia_preview {
  prompt_preview_theme 'leafia'
}

prompt_leafia_setup '$@'
