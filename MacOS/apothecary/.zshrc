#*** EXPORT ***#

export PATH="/usr/local/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export DOTNET_ROOT=$(brew --prefix dotnet@9)/libexec
export PATH="$DOTNET_ROOT:$PATH"
export HOMEBREW_NO_ENV_HINTS=1
eval "$(gdircolors -b)"
LS_COLORS="${LS_COLORS/di=01;34:/di=01;33:}"  # remap dirs to ochre (palette 3 = #DBBC7F)
alias ls='gls --color=auto'

#*** ZSH ***#

# Colors (needed by prompt)
autoload -Uz colors && colors

# Prompt + git branch
git_prompt_info() {
  local branch
  branch=$(git symbolic-ref --short HEAD 2>/dev/null) || return
  local dirty
  [[ -n $(git status --porcelain 2>/dev/null) ]] \
    && dirty="${ZSH_THEME_GIT_PROMPT_DIRTY}" \
    || dirty="${ZSH_THEME_GIT_PROMPT_CLEAN}"
  echo "${ZSH_THEME_GIT_PROMPT_PREFIX}${branch}${dirty}${ZSH_THEME_GIT_PROMPT_SUFFIX}"
}

setopt PROMPT_SUBST

# source ~/.zsh/themes/cdimascio-lambda.zsh
source ~/.zsh/themes/aditya.zsh

# History
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=10000
setopt EXTENDED_HISTORY SHARE_HISTORY HIST_EXPIRE_DUPS_FIRST HIST_IGNORE_DUPS HIST_IGNORE_SPACE HIST_VERIFY

# Completion
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'  # case-insensitive

# Keybindings
bindkey -e  # emacs mode (what OMZ defaults to)
bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward

# Plugins (Homebrew-installed)
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/plugins/zsh-shift-select/zsh-shift-select.plugin.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


#*** FUNCTIONS ***#

code () { VSCODE_CWD="$PWD" open -n -a "/Applications/Visual Studio Code.app" --args $* ;}

#*** ALIAS ***#

alias gncc="/opt/homebrew/bin/gcc-13"
alias gn++="/opt/homebrew/bin/g++-13"
alias cd=z
alias venv="source .venv/bin/activate"
alias sshon="sudo /usr/sbin/sshd -p 2219"
alias sshoff="sudo pkill -9 sshd"

#*** EVALS ***#

eval "$(zoxide init zsh)"
eval "$(fzf --zsh)"

#*** PYENV ***#

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/haru/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions
