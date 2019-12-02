# dotfiles

Install dependencies:
```
brew install bash git neovim fzf diff-so-fancy
```

Clone:

```
git clone git@github.com:alexdachin/dotfiles.git
```

Create symlinks:

```
ln -s ~/dotfiles/.bash_custom ~/.bash_custom
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.config/nvim/init.vim ~/.config/nvim/init.vim
ln -s ~/dotfiles/.gitconfig_custom ~/.gitconfig_custom

mkdir ~/Library/KeyBindings
ln -s ~/dotfiles/Library/KeyBindings/DefaultKeyBinding.dict ~/Library/KeyBindings/DefaultKeyBinding.dict
```

Load the bash custom settings into .bashrc:

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
