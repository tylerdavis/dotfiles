# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/tmd/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/Users/tmd/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/tmd/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/tmd/.fzf/shell/key-bindings.zsh"
