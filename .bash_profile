# nvm
mkdir -p ~/.nvm
[[ -r "/usr/local/opt/nvm/nvm.sh" ]] && . "/usr/local/opt/nvm/nvm.sh"
[[ -r "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ]] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"

# pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
fi

# rbenv
if command -v rbenv 1>/dev/null 2>&1; then
  eval "$(rbenv init -)"
fi

source ~/.bashrc
