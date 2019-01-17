# color
s1="\[\e[0;31m\]"
s2="\[\e[0;33m\]"
s3="\[\e[0;32m\]"
r="\[\e[m\]"

export PS1="${s1}\u${r} in ${s2}\W${r} ${s3}::${r} "
export CLICOLOR=1

# history size
export HISTFILESIZE=1000000
export HISTSIZE=1000000

if [ -f $HOME/.bash_profile_private ]; then
  source $HOME/.bash_profile_private
fi
