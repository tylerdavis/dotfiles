alias vim=nvim

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export REACT_EDITOR='nvim'

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

plugins=(git osx zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# StatusPage specific stuff
alias fs='foreman start -f Procfile.dev -c web=1,webpack=1'
alias fsw='foreman start -f Procfile.dev -c web=1,webpack=1,worker=1,worker_nm=1,worker_other=1'
alias tails='tail'
alias pcat='pygmentize -g'

# Ruby environment loader
export BUNDLER_EDITOR="nvim"
export DEPLOY_USER=`whoami`

# nvm loader
. ~/.nvm/nvm.sh

BLUE='\033[0;34m'
GREEN='\033[0;32m'
NC='\033[0m'

unset DYLD_LIBRARY_PATH
unset LD_LIBRARY_PATH

function rtest() {
  if [ "$1" != "" ] # or better, if [ -n "$1" ]
  then
      bundle exec rake test TEST=$1
  else
      bundle exec rake test
  fi
}

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

fpath=(/usr/local/share/zsh/site-functions /usr/local/share/zsh-completions /Users/tylerdavis/.oh-my-zsh/plugins/git /Users/tylerdavis/.oh-my-zsh/functions /Users/tylerdavis/.oh-my-zsh/completions /usr/local/share/zsh/site-functions /usr/share/zsh/site-functions /usr/share/zsh/5.2/functions)

fpath=(/usr/local/share/zsh/site-functions /usr/local/share/zsh-completions $fpath)
autoload -U compinit && compinit

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.atlassian.zsh ] && source ~/.atlassian.zsh
[ -f ~/.soundviz.zsh ] && source ~/.soundviz.zsh

export ANDROID_HOME=${HOME}/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
export ANDROID_SDK_ROOT=$ANDROID_HOME
export GOPATH=${HOME}/Development/go
export GOBIN=${GOPATH}/bin
export PATH=${PATH}:${GOBIN}

bindkey "^X\\x7f" backward-kill-line
