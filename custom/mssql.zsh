if [[ -d /opt/mssql-tools18/bin ]]; then
  export PATH="$PATH:/opt/mssql-tools18/bin"
  alias sqlcmds='/opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -No -P Sql123456'
  alias sqlgo='sqlcmd -U sa -P Sql123456'
fi
