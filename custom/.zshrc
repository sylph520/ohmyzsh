zstyle ':omz:update' mode disabled
# if [ -z $TERM_PROGRAM ]; then
# 	tmux has -t dft &> /dev/null
# 	if [ $? != 0 ]; then
# 		tmux new -s dft
# 	elif [ -z $TMUX ]; then
# 		tmux attach -t dft
# 	fi
# fi
unsetopt AUTO_CD

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="ys"

# Would you like to use another custom folder than $ZSH/custom?
setopt EXTENDED_HISTORY
alias timehist='perl -lne '\''m#: (\d+):\d+;(.+)# && printf "%s :: %s\n",scalar localtime $1,$2'\'' $HISTFILE | less'

DISABLE_AUTO_TITLE="yes"

# vi style incremental search
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward
bindkey '^h' backward-delete-char
bindkey '^w' backward-delete-word

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(tmux vi-mode history-substring-search direnv
per-directory-history
)
if [[ -r /etc/os-release ]]; then
	source /etc/os-release
	if [[ $ID == "debian" || $ID_LIKE == *"debian"* ]]; then
		plugins+=(debian)
	fi
fi

export PATH="$PATH:$HOME/.local/bin"

source $ZSH/oh-my-zsh.sh

#####################end of the file ####################
