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

