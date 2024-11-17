alias ci='conda install'
alias ccenv='conda create --name'

condaenv2rc()
{
	echo "layout anaconda $1" >> .envrc
}
