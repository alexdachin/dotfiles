# brew
if [[ -f /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# pyenv
if type pyenv > /dev/null; then
  eval "$(pyenv init --path)"
fi
