# postgres
export PGHOME="$HOME/bin/pg124"
export PGBIN="$PGHOME/bin/"
export PSQL_PAGER="pspg"
alias expg="export PATH=$PGBIN:$PATH"
alias expgrc="echo 'export PATH=$PGBIN:$PATH' >> .envrc&&direnv allow&&cat .envrc"
alias pgstart="$PGHOME/bin/pg_ctl -D $PGHOME/data -l logfile start"
alias pgstop="$PGHOME/bin/pg_ctl -D $PGHOME/data stop"
alias pgrestart="$PGHOME/bin/pg_ctl -D $PGHOME/data restart"
alias psqld="$PGHOME/bin/psql -d"
alias pgclid="pgcli -h /tmp -p 51204 -d"

wgetpgsrc(){
	wget https://ftp.postgresql.org/pub/source/v$1/postgresql-$1.tar.bz2
}

