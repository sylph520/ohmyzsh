# sys
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

alias cpd="cp -r"
function cpdate {
	local src="$1"
    local dst="${src}.$(date +%Y%m%d-%H%M%S)"
	cp "$src" "$dst"
}
alias nvi="nvim"
alias tf="tail -f"
vlf() {vi "$(find $1 -type f -printf '%T@ %p\n' | sort -n | tail -1 | cut -f2- -d' ')"}
tlf() {tail -f "$(find $1 -type f -printf '%T@ %p\n' | sort -n | tail -1 | cut -f2- -d' ')"}

alias pgrepa='pgrep -a'
alias klf="kill -9"

# nav
alias xopen="xdg-open ."
mkcd(){mkdir -p "$1" && cd "$1"}
rmcd(){dir=$PWD && rm -rf * && cd .. && rm -d $dir}
backcd(){cd .. && cd $1}
backmkcd(){cd .. && mkdir $1 && cd $1}
alias rmr="rm -r"

