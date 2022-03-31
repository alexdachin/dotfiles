# p10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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

# p10k
if [[ -f /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme ]]; then
  source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme
fi

[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# pyenv
if type pyenv > /dev/null; then
  eval "$(pyenv init -)"
fi

# chruby
if [[ -f /usr/local/opt/chruby/share/chruby/chruby.sh ]]; then
  source /usr/local/opt/chruby/share/chruby/chruby.sh
  chruby ruby-3.0.3
fi

# remove slash from word characters
WORDCHARS="${WORDCHARS/\//}"

# fzf
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh

# aws-profile - fuzzy searches and sets aws profile based on credentials
function aws-profile() {
  export AWS_PROFILE="$(grep '\[.*\]' ~/.aws/credentials | tr -d '[-]' | fzf)"
}

# load extra config
[[ -f $HOME/.zshrc_extra ]] && . "$HOME/.zshrc_extra"
