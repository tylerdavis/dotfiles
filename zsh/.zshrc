export EDITOR="nvim"
export VISUAL="nvim"
export ZSH="$HOME/.oh-my-zsh"
export PATH="$PATH:$HOME/.rvm/bin"
export NVM_DIR="$HOME/.nvm"

ZSH_THEME="tmd"
HYPHEN_INSENSITIVE="true"

BLUE='\033[0;34m'
GREEN='\033[0;32m'
NC='\033[0m'

plugins=( git )

source $ZSH/oh-my-zsh.sh
[ -s ~/.rvm/scripts/rvm ] && source ~/.rvm/scripts/rvm
[ -s ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -s ~/.atlassian.zsh ] && source ~/.atlassian.zsh
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"

alias vi=nvim
alias vim=nvim
alias tmux="tmux -2"
alias ntmux="tmux new -A -s dev"
alias rg="rg -g '!*.bundle.*.js' -g '!vendor' -p"
# alias docker="docker.exe"
# alias docker-compose="docker-compose.exe"

bindkey -e

