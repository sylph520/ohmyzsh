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

# --- Core function using standard ls (Recommended fix) ---
function _get_latest_subfolder {
  # ls -td1: Sort by time (newest first), list directories, one per line.
  # The "*/" ensures only directories are listed.
  local LATEST_FOLDER
  LATEST_FOLDER=$(ls -td1 -- */ 2>/dev/null | head -n 1 | sed 's:/*$::')

  if [[ -z "$LATEST_FOLDER" ]]; then
    # Return empty string for the alias substitution if nothing is found
    echo ""
    return 1
  fi

  echo "$LATEST_FOLDER"
  return 0
}
alias -g ltd='$( _get_latest_subfolder )'

# Function to find the latest (most recently modified) FILE
function _get_latest_file {
  local LATEST_FILE
  # Use zsh globbing for files, ensuring no directories are matched
  # *(N.om[1]): (N) no match error, (.) regular file only, (om[1]) order modified, first one
  LATEST_FILE=$(echo *(N.om[1]))

  if [[ -z "$LATEST_FILE" ]]; then
    # Fallback to the safer ls method if the Zsh glob fails (rare, but good practice)
    LATEST_FILE=$(ls -t1F | grep -v '/' | head -n 1)
  fi

  if [[ -z "$LATEST_FILE" ]]; then
    echo ""
    return 1
  fi

  echo "$LATEST_FILE"
  return 0
}
alias -g ltf='$( _get_latest_file )'

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
