alias mzshrc="vim ~/.zshrc"
alias szshrc="source ~/.zshrc"

mzsh()
{
	rcfile=$HOME/.zsh-configs/$1.zsh
	vi $rcfile
}
alias mzshl='ls $HOME/.zsh-configs'
alias mzshm="vim $HOME/.zsh-configs/conf_mgr.zsh"
# conf diff and backup
conf()
{
	local vloc="$HOME/.vimrc"
	local vsloc="$HOME/dev_confs/.vimrc"
	local tloc="$HOME/.tmux.conf.local"
	local tsloc="$HOME/dev_confs/.tmux.conf.local"
	local aloc="$HOME/.config/awesome/rc.lua"
	local asloc="$HOME/dev_confs/rc.lua"
	local zloc="$HOME/.zshrc"
	local zsloc="$HOME/dev_confs/.zshrc"
	if [ $1 = 'df' ];
	then
		if [ $2 = 'vimrc' ]
		then
			diff $vloc $vsloc
		elif [ $2 = 'tmux' ]
		then
			diff $tloc $tsloc  
		elif [ $2 = 'awesome' ]
		then
			diff $aloc $asloc 
		elif [ $2 = 'zshrc' ]
		then
			diff $zloc $zsloc 
		else
			echo 'error'
		fi
	elif [ $1 = 'st' ]
	then
		if [ $2 = 'vimrc' ]
		then
			cp $vloc $vsloc
		elif [ $2 = 'tmux' ]
		then
			cp $tloc $tsloc  
		elif [ $2 = 'awesome' ]
		then 
			cp $aloc $asloc 
		elif [ $2 = 'zshrc' ]
		then
			cp $zloc $zsloc 
		else
			echo "error"
		fi
	elif [ $1 = 'sf' ]
	then
		if [ $2 = 'vimrc' ]
		then
			cp $vsloc $vloc 
		elif [ $2 = 'tmux' ]
		then
			cp $tsloc $tloc 
		elif [ $2 = 'awesome' ]
		then
			cp $asloc $aloc 
		elif [ $2 = 'zshrc' ]
		then
			cp $zsloc $zloc 
		else
			echo "error"
		fi
	elif [ $1 = 'stz' ]
	then
		cp $zloc $zsloc 
	elif [ $1 = 'stv' ]
	then
		cp $vloc $vsloc 
	elif [ $1 = 'sfz' ]
	then
		cp $zsloc $zloc 
	elif [ $1 = 'sfv' ]
	then
		cp $vsloc $vloc 
	elif [ &1 = 'dl' ]
	then
		sh bin/setup_proxy.sh
		if [ $2 = 'vimrc' ]
		then
			proxychains curl https://3d7225475533824317a911d5cae538749acb1c0c@raw.githubusercontent.com/sylph520/dev_confs/master/.vimrc --output $vloc
		elif [ $2 = 'tmux' ]
		then
			proxychains curl https://3d7225475533824317a911d5cae538749acb1c0c@raw.githubusercontent.com/sylph520/dev_confs/master/.tmux.conf.local --output $tloc
		elif [ $2 = 'awesome' ]
		then
			proxychains curl https://3d7225475533824317a911d5cae538749acb1c0c@raw.githubusercontent.com/sylph520/dev_confs/master/rc.lua --output $aloc
		elif [ $2 = 'zshrc' ]
		then
			proxychains curl https://3d7225475533824317a911d5cae538749acb1c0c@raw.githubusercontent.com/sylph520/dev_confs/master/.zshrc --output ~/.zshrc
		else
			echo "error"
		fi
	else
		echo "error"
	fi
}

alias confgit="git -C $HOME/dev_confs"
alias confga="git -C $HOME/dev_confs/ add "
alias confgst="git -C $HOME/dev_confs/ status"
alias confgp="git -C $HOME/dev_confs push"
alias confgl="git -C $HOME/dev_confs pull"
alias confgc="git -C $HOME/dev_confs commit -m "
alias confgdf="git -C $HOME/dev_confs diff "

