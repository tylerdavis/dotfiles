alias ll='ls -alF'
alias la='ls -A'
alias l='ls -lah'
alias ..='cd ..'

function ta () {
  if tmux has-session; then
    tmux -2 attach
  else
    tmux -2
  fi
}
