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
gitmirror="https://ghfast.top/https://github.com/"
alias gitsetghp="git config --global url."$gitmirror".insteadOf "https://github.com/""
alias gitunsetghp="git config --global --unset url."$gitmirror".insteadOf"

alias gitsetproxy='git config --global http.proxy "socks5://127.0.0.1:1080"; git config --global https.proxy "socks5://127.0.0.1:1080"'
alias gitunsetproxy='git config --global --unset http.proxy; git config --global --unset https.proxy'


## git alias
alias ga="git add"
alias gap="git add -p"

alias gdf='git diff '
alias gdfc='git diff --cached'
alias gst="git status"
alias gstu="git status -uno"
alias gitc='git -C'
alias gitcconf="git -C $HOME/dev_confs"

alias glch="git rev-parse --short HEAD"
alias glchc="git rev-parse HEAD"
alias gsp="git stash push"

alias glogaes="git log --oneline --decorate --graph --exclude=refs/stash --all"

alias grls="git remote get-url --all origin"
alias grset="git remote set-url origin"

alias gp="git push"
