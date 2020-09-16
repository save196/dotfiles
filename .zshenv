export TERMCAP=$termcap
typeset -U PATH path
path=("$HOME/.local/bin/statusbar" "$path[@]")
export PATH
ZDOTDIR=("$HOME/.config/zsh")
export ZDOTDIR
export EDITOR='nvim'
export TERMINAL="st"
export BROWSER="firefox"
export READER="zathura"
