# apt
alias alg='sudo apt list |grep '
alias alug='sudo apt list -u|grep '
alias alig='sudo apt list --installed|grep '
# tmux plug settings
ZSH_TMUX_AUTOSTART="false"
ZSH_TMUX_AUTOCONNECT="false"
alias ve='tmux split-window -h vim $@'
alias tmuxa='tmux a'
alias tls='tmux ls'

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


alias cnv='NVIM_APPNAME=nvim-nvchad nvim'
alias lnv='NVIM_APPNAME=nvim-lazyvim nvim'
alias astronv='NVIM_APPNAME=nvim-astro nvim'

alias lg='lazygit'

# linux brew
if [ -d /home/linuxbrew ]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# autojump
. /usr/share/autojump/autojump.sh
# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

alias delta='git-delta-snap.delta'
