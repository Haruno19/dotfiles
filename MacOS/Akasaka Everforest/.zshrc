#*** EXPORT ***#

export ZSH="$HOME/.oh-my-zsh"
export PATH="/usr/local/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export HOMEBREW_NO_ENV_HINTS=1

#*** ZSH ***#

plugins=(
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-shift-select
)
ZSH_THEME="aditya" # set by `omz`
source $ZSH/oh-my-zsh.sh
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

#fastfetch# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/haru/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions
