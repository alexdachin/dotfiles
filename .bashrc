# colors
c_black="\[\e[0;31m\]"
c_red="\[\e[0;31m\]"
c_green="\[\e[0;32m\]"
c_yellow="\[\e[0;33m\]"
c_blue="\[\e[0;34m\]"
c_magenta="\[\e[0;35m\]"
c_cyan="\[\e[0;36m\]"
c_white="\[\e[0;37m\]"
c_reset="\[\e[m\]"

# prompt
export PS1="${c_yellow}\w${c_reset} ${c_green}::${c_reset} "
export CLICOLOR=1

# history size
export HISTSIZE=999999
export HISTFILESIZE=$HISTSIZE

# language
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# editor
export VISUAL=nvim
export EDITOR=$VISUAL

# bat
export BAT_THEME=base16

# auto completion
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# rbenv
if command -v rbenv 1>/dev/null 2>&1; then
  eval "$(rbenv init -)"
fi

# nvm
mkdir -p ~/.nvm
[[ -r "/usr/local/opt/nvm/nvm.sh" ]] && . "/usr/local/opt/nvm/nvm.sh"
[[ -r "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ]] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"

# aliases
alias pwc="pwd | pbcopy"
alias gd="git diff"
alias gs="git status"
alias dc="docker-compose"

# gco - fuzzy searches and checks out git branch
function gco() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf -d $(( 2 + $(wc -l <<< "$branches") )) +m --query="$1" --select-1) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# aws-profile - fuzzy searches and sets aws profile based on credentials
function aws-profile() {
  export AWS_PROFILE="$(grep '\[.*\]' ~/.aws/credentials | tr -d '[-]' | fzf)"
}

# load extra config
[[ -r $HOME/.bashrc_extra ]] && . "$HOME/.bashrc_extra"
