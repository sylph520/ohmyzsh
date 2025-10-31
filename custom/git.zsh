# git
## git proxy
if [ -d $HOME/bin/git_bin ]; then
	export PATH="$HOME/bin/git_bin/bin:$PATH"
	export GIT_EXEC_PATH=$HOME/bin/git_bin/libexec/git-core
fi

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

function git_to_ssh {
  # 1. Get the current HTTPS URL for the 'origin' remote
  local CURRENT_URL
  CURRENT_URL=$(git config --get remote.origin.url 2>/dev/null)

  # Check for errors and if already SSH
  if [[ -z "$CURRENT_URL" ]]; then
    echo "❌ Error: Could not find 'origin' remote URL. Are you in a Git repository?"
    return 1
  fi
  if [[ "$CURRENT_URL" == git@* ]]; then
    echo "✅ Remote origin is already using the SSH protocol: $CURRENT_URL"
    return 0
  fi

  # 2. Construct the new SSH URL using sed for precise conversion
  local NEW_URL
  NEW_URL=$(echo "$CURRENT_URL" | sed -E 's#^https://([^/]+)/(.+)#git@\1:\2#')

  # Fail if conversion did not happen (URL is unchanged)
  if [[ "$NEW_URL" == "$CURRENT_URL" ]]; then
      echo "⚠️ Conversion failed. Please verify the URL format is standard HTTPS."
      echo "   Current URL: $CURRENT_URL"
      return 1
  fi

  # --- CONFIRMATION PROMPT ---
  echo "--- URL Change Confirmation ---"
  echo "You are about to change the Git Remote 'origin' URL:"
  echo "  Old URL (HTTPS): **$CURRENT_URL**"
  echo "  New URL (SSH):   **$NEW_URL**"

  # Ask for confirmation
  read -r -q "?Do you want to apply this change? (y/N) "
  echo # Print a newline after the prompt

  if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "✅ Confirmation received. Applying change..."
  else
    echo "✋ Change cancelled by user."
    return 0
  fi

  # 3. Apply the new URL
  if git remote set-url origin "$NEW_URL"; then
    echo "✅ Success! Remote URL has been updated."

    # Optional Verification
    local VERIFY_URL
    VERIFY_URL=$(git config --get remote.origin.url)

    if [[ "$VERIFY_URL" == "$NEW_URL" ]]; then
        echo "✨ Verification: The new 'origin' URL is correct in your config."
    fi

  else
    echo "❌ Failed to set new remote URL using 'git remote set-url'."
    return 1
  fi
}
# --- GLOBAL ALIAS (Still the same) ---
alias -g g2ssh='git_to_ssh'


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
alias gl="git pull"
alias gcm="git commit -m"

eval "$(ssh-agent -s)" > /dev/null
if [ -f ~/.ssh/id_ed25519 ]; then
        ssh-add ~/.ssh/id_ed25519 2>/dev/null
elif [ -f ~/.ssh/id_rsa ]; then
        ssh-add ~/.ssh/id_rsa 2>/dev/null
fi
