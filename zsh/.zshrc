export ZSH="/home/tyler/.oh-my-zsh"
export PATH="$PATH:$HOME/.rvm/bin"
export NVM_DIR="$HOME/.nvm"

ZSH_THEME="tmd"
HYPHEN_INSENSITIVE="true"

BLUE='\033[0;34m'
GREEN='\033[0;32m'
NC='\033[0m'

plugins=( git )

source $ZSH/oh-my-zsh.sh
source ~/.rvm/scripts/rvm
source ~/.fzf.zsh
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"

alias tmux="tmux -2"
alias rg="rg -g '!*.bundle.*.js' -g '!vendor' -p"
alias docker="docker.exe"
alias docker-compose="docker-compose.exe"

bindkey -e
