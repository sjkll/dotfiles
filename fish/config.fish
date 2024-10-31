set PATH /opt/homebrew/sbin $PATH
set PATH /opt/homebrew/bin $PATH
set PATH $PATH $HOME/.local/bin
set -gx GOPATH $HOME/go
set -gx PATH $PATH $GOPATH/bin

set -gx GPG_TTY (tty)

alias ls='eza'
alias ll='eza -alF'
alias la='eza -a'
alias l='eza -lF'
alias tree='eza --tree -I ".venv|__pycache__"'
alias zet='cd ~/Notes'
alias nvim="HTTP_PROXY=http://vscode:vscode@107.174.249.60:31208 /opt/homebrew/bin/nvim"

set -U fish_greeting

# Created by `pipx` on 2024-09-03 17:15:04
set PATH $PATH /Users/user/.local/bin
