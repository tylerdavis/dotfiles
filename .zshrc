# StatusPage specific stuff
alias rg="rg -g '!*.bundle.*.js' -g '!vendor' -p"

BLUE='\033[0;34m'
GREEN='\033[0;32m'
NC='\033[0m'

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='
  (git ls-tree -r --name-only HEAD ||
   find . -path "*/\.*" -prune -o -type f -print -o -type l -print |
      sed s/^..//) 2> /dev/null'

export ZSH="/home/tyler/.oh-my-zsh"
export DOCKER_HOST=tcp://0.0.0.0:2375
export PATH="$PATH:$HOME/.rvm/bin"
export NVM_DIR="$HOME/.nvm"

ZSH_THEME="robbyrussell"
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

# FZF
export FZF_DEFAULT_COMMAND='
  (git ls-tree -r --name-only HEAD ||
   find . -path "*/\.*" -prune -o -type f -print -o -type l -print |
      sed s/^..//) 2> /dev/null'

