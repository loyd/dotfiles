ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[magenta]%} "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

PROMPT="%{$fg[yellow]%}%2~%{$reset_color%} \$(git_prompt_info)» "
RPROMPT="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
