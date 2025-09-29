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


source $ZSH/oh-my-zsh.sh
. /usr/share/autojump/autojump.sh

##############################   PATH   ##############################
########## pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"  # For login shells
# eval "$(pyenv init -)"  # For interactive shells
eval "$(pyenv virtualenv-init -)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
##<<< conda initialize <<<

export PATH="$PATH:$HOME/.local/bin"

###### node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

###### rust
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

############################### softwares ##############################
export PATH=$HOME/go/bin:$PATH
export PATH=$HOME/.pixi/bin:$PATH
export PATH="/opt/mssql-tools18/bin:$PATH"
export PATH="$HOME/bin/ampl_bin:$PATH"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
#####################end of the file ####################
