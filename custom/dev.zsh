export PATH="$HOME/bin/ampl_bin:$PATH"

dlig ()
{
  if [[ -e ".gitignore" ]]; then
    echo "gitignore file already exists"
    echo "downloading as X.gitignore instead, e.g., Python.gitignore. Proceed? [y/N]"
    read -r download_asitis
    if [[ "$download_asitis" != [Yy] ]]; then
      echo "exit with doing nothing"
      return
    fi
  fi

  ignore_lang=$1
  # echo "${(C)1}"
  echo "downloading ${(C)1}.gitignore as .gitignore. Proceed? [y/N]"
  read -r confirm 
  if [[ "$confirm" != [Yy] ]]; then
    echo "exit with doing nothing"
    return
  else
    curl https://ghfast.top/https://raw.githubusercontent.com/sylph520/gitignore/refs/heads/main/${(C)1}.gitignore -o .gitignore
  fi
}
