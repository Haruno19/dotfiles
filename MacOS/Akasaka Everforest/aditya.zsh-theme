# Default OMZ theme

if [[ "$USER" == "root" ]]; then
  PROMPT="%(?:%{$fg[red]%}%{$fg[yellow]%}%{$fg[red]%} :%{$fg[red]%} )"
  PROMPT+='%{$fg[cyan]%}  %c%{$reset_color%} $(git_prompt_info)'
else
  PROMPT="%(?:%{$fg[red]%}%{$fg[green]%}%{$fg[yellow]%} :%{$fg[red]%} )"
  PROMPT+='%{$fg[yellow]%}  %c%{$reset_color%} $(git_prompt_info)'
fi

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}  git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
