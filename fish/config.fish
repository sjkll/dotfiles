set PATH /opt/homebrew/sbin $PATH
set PATH /opt/homebrew/bin $PATH
set PATH $PATH $HOME/.local/bin

set -gx GPG_TTY (tty)

alias ll='exa -alF'
alias la='exa -a'
alias l='exa -lF'
alias tree='exa --tree -I ".venv"'
alias zet='cd ~/Notes'

set -U fish_greeting
