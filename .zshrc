# prompt
PROMPT="%F{yellow}%~%f %F{green}::%f "

# history
HISTSIZE=999999
SAVEHIST=999999
setopt INC_APPEND_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE

# language
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# editor
export VISUAL=nvim
export EDITOR=$VISUAL

# vi mode (check if fzf history still works)
# bindkey -v

# bat
export BAT_THEME=base16

# aliases
alias gd="git diff"
alias gs="git status"
alias dc="docker-compose"
alias reload_history="fc -RI"

# volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# pyenv
if type pyenv > /dev/null; then
  eval "$(pyenv init -)"
fi

# chruby
if [[ -f $(brew --prefix)/opt/chruby/share/chruby/chruby.sh ]]; then
  source $(brew --prefix)/opt/chruby/share/chruby/chruby.sh
  chruby ruby-3.1.2
fi

# remove slash from word characters
WORDCHARS="${WORDCHARS/\//}"

# fzf
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh

# aws-profile - fuzzy searches and sets aws profile based on credentials
function aws-profile() {
  export AWS_PROFILE="$(grep '\[.*\]' ~/.aws/credentials | tr -d '[-]' | fzf)"
}

# dart pub
export PATH="$HOME/.pub-cache/bin:$PATH"

# load extra config
[[ -f $HOME/.zshrc_extra ]] && . "$HOME/.zshrc_extra"
