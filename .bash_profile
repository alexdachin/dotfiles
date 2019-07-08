# colors
s1="\[\e[0;31m\]"
s2="\[\e[0;33m\]"
s3="\[\e[0;32m\]"
r="\[\e[m\]"

# prompt
export PS1="${s1}\u${r} in ${s2}\W${r} ${s3}::${r} "
export CLICOLOR=1

# history size
export HISTFILESIZE=1000000
export HISTSIZE=1000000

# language
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# aliases
alias pwc='pwd | pbcopy'

# editor
export VISUAL=nvim
export EDITOR="$VISUAL"

# auto completion
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

if [ -f $HOME/.bash_profile_private ]; then
  source $HOME/.bash_profile_private
fi
