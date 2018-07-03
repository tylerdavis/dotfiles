# StatusPage specific stuff
alias rg="rg -g '!*.bundle.*.js' -g '!vendor' -p"

BLUE='\033[0;34m'
GREEN='\033[0;32m'
NC='\033[0m'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='
  (git ls-tree -r --name-only HEAD ||
   find . -path "*/\.*" -prune -o -type f -print -o -type l -print |
      sed s/^..//) 2> /dev/null'

