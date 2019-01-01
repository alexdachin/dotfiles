# dotfiles

Clone:

```
git clone git@github.com:alexdachin/dotfiles.git
```

Create symlinks:

```
ln -s ~/dotfiles/.bash_profile ~/.bash_profile
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.vimrc ~/.vimrc
```

Install vim plug:

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

```
vim +PlugInstall +qall
```
