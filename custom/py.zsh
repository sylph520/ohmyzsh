# PATH
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/bin/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/bin/miniconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/bin/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/bin/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
##<<< conda initialize <<<

# pip
alias pipsetthuurl="pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple"
alias pi="pip install"
alias pidr="pip install --dry-run"

#################### virtual envs
ppenv(){
	source $1/bin/activate
}
penv(){
	source $HOME/pyenvs/$1/bin/activate
}
penvrc(){
	echo "source $HOME/pyenvs/$1/bin/activate" >> .envrc&&direnv allow&&cat .envrc
}
cenv(){
	python3 -m venv $HOME/pyenvs/$1
}

# poetry
poetryd(){
  poetry add "$1@*" --dry-run
}
poetrylt(){
  poetry add $1@"<=$2"
}


# conda
alias ci='conda install'
alias ccenv='conda create --name'

condaenv2rc()
{
	echo "layout anaconda $1" >> .envrc
}

# pixi
[[ -d $HOME/.pixi/bin ]] && export PATH=$HOME/.pixi/bin:$PATH
