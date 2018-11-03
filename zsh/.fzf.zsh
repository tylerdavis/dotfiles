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
export FZF_DEFAULT_COMMAND='fd --type f'

# Options to fzf command
export FZF_COMPLETION_OPTS='+c -x'

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}
