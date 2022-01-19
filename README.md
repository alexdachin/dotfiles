# dotfiles

## Clone

```
git clone git@github.com:alexdachin/dotfiles.git ~/.dotfiles
```

## Setup
- Run `setup.sh`

## Extend
To further extend the git config, use `.gitconfig_extra`.

## Experiments

### Emacs
```
brew tap d12frosted/emacs-plus
brew install emacs-plus@27 --with-modern-sexy-v1-icon
brew link emacs-plus
ln -s /usr/local/opt/emacs-plus/Emacs.app /Applications/Emacs.app

git clone https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install
```