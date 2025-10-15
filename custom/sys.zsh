## PATH
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

## Display

## Inspect
alias llt="ll -t"
alias lsd="ls -d */"
alias lld="ls -al|grep '^d'"
alias lgrep="ls|grep"
alias lsgrep="ls|grep"
alias llgrep="ll|grep"
alias lsagrep="lsa|grep"
alias llagrep="ll -a|grep"
alias -g listg="list|grep"
alias -g hless=" --help|less"
lth() {ll -t|head -n 5}
llth() { ll -t $2|head -n $1}
lltt() { ll -t $2|tail -n $1}

alias tree2="tree -L 2"

alias pgrepa='pgrep -a'

# Vi style incremental cmd hist search
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward
bindkey '^h' backward-delete-char
bindkey '^w' backward-delete-word

alias tf="tail -f"
alias nvi="nvim"
vlf() {vi "$(find $1 -type f -printf '%T@ %p\n' | sort -n | tail -1 | cut -f2- -d' ')"}
tlf() {tail -f "$(find $1 -type f -printf '%T@ %p\n' | sort -n | tail -1 | cut -f2- -d' ')"}

## Nav
alias xopen="xdg-open ."
mkcd(){mkdir -p "$1" && cd "$1"}
rmcd(){dir=$PWD && rm -rf * && cd .. && rm -d $dir}
backcd(){cd .. && cd $1}
backmkcd(){cd .. && mkdir $1 && cd $1}


## File/dir operations
alias cpd="cp -r"
alias rmr="trash-put"
# alias mv="mv -vn"
function cpdate {
	local src="$1"
    local dst="${src}.$(date +%Y%m%d-%H%M%S)"
	cp "$src" "$dst"
}

# Process operations
alias klf="kill -9"
