# git
## git proxy
gcpgh() {
      git clone https://mirror.ghproxy.com/$1
}
gcpfg() {
      local url="$1"
      url = "${url/github.com/hub.fgit.cf}"
      git clone "$url"
}

alias gitsetghp='git config --global url."https://ghp.ci/https://github.com/".insteadOf "https://github.com/"'
alias gitunsetghp='git config --global --unset url."https://mirror.ghproxy.com/https://github.com/".insteadOf'
alias gitsetfgit='git config --global url."https://hub.fgit.cf/".insteadOf "https://github.com/"'
alias gitunsetfgit='git config --global --unset url."https://hub.fgit.cf/".insteadOf'

alias gitsetproxy='git config --global http.proxy "socks5://127.0.0.1:1080"; git config --global https.proxy "socks5://127.0.0.1:1080"'
alias gitunsetproxy='git config --global --unset http.proxy; git config --global --unset https.proxy'


## git alias
alias glogaes="git log --oneline --decorate --graph --exclude=refs/stash --all"
alias gdf='git diff '
alias gdfc='git diff --cached'
alias gstu="git status -uno"
alias gitc='git -C'
alias gitcconf="git -C $HOME/dev_confs"
alias glch="git rev-parse --short HEAD"
alias glchc="git rev-parse HEAD"
alias gsp="git stash push"

alias grls="git remote get-url --all origin"
alias grset="git remote set-url origin"
