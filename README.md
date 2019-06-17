# dotfiles

Install dependencies:
```
brew install git neovim fzf yarn
npm install -g eslint_d
```

Clone:

```
git clone git@github.com:alexdachin/dotfiles.git
```

Create symlinks:

```
ln -s ~/dotfiles/.bash_profile ~/.bash_profile
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.config/nvim/init.vim ~/.config/nvim/init.vim
```

Install vim plug:

```
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

```
nvim +PlugInstall
```

