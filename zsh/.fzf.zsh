# Setup fzf
# ---------
if [[ ! "$PATH" == */home/tyler/.fzf/bin* ]]; then
  export PATH="$PATH:/home/tyler/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/tyler/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/tyler/.fzf/shell/key-bindings.zsh"

# Custom command
export FZF_DEFAULT_COMMAND='
  (git ls-tree -r --name-only HEAD ||
   find . -path "*/\.*" -prune -o -type f -print -o -type l -print |
      sed s/^..//) 2> /dev/null'

