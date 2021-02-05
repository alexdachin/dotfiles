# dotfiles

Clone:

```
git clone git@github.com:alexdachin/dotfiles.git
```

Install dependencies:

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install $(<packages.txt)

python3 -m pip install --user --upgrade pynvim
```

Create symlinks:

```
mkdir -p ~/.config/nvim
ln -s ~/dotfiles/.config/nvim/init.vim ~/.config/nvim/init.vim
ln -s ~/dotfiles/.bash_custom ~/.bash_custom
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.gitconfig_custom ~/.gitconfig_custom
ln -s ~/dotfiles/.doom.d ~/.doom.d
```

Load the bash custom settings into .bash_profile:

```
if [ -f $HOME/.bash_custom ]; then
  source $HOME/.bash_custom
fi
```

Load the git configuration into .gitconfig:

```
[include]
	path = .gitconfig_custom
```

Install vim plug:

```
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

```
nvim +PlugInstall
```

Install emacs / spacemacs:

```
brew tap d12frosted/emacs-plus
brew install emacs-plus@27 --with-modern-sexy-v1-icon
brew link emacs-plus
ln -s /usr/local/opt/emacs-plus/Emacs.app /Applications/Emacs.app

git clone https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install
```
