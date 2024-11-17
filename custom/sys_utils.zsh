# apt
alias alg='sudo apt list |grep '
alias alug='sudo apt list -u|grep '
alias alig='sudo apt list --installed|grep '
# tmux plug settings
ZSH_TMUX_AUTOSTART="false"
ZSH_TMUX_AUTOCONNECT="false"
alias ve='tmux split-window -h vim $@'
alias tmuxa='tmux a'

# vim
alias cdultisnips="cd $HOME/.vim/plugged/vim-snippets/UltiSnips"

# direnv
alias adenv="direnv allow"

# ag
alias agp='ag --python'

# fppc
alias fppc='fpp -c code'
# proxychains
alias pc="proxychains"
# gdb
alias gdb="gdb -q"
