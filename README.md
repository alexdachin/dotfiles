# dotfiles

Install dependencies:
```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install bat
brew install diff-so-fancy
brew install fd
brew install fzf
brew install git
brew install jq
brew install nvim
brew install rustup
brew install tmux
brew install yarn
brew install zsh

python3 -m pip install --user --upgrade pynvim
python3 -m pip install buku

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Clone:

```
git clone git@github.com:alexdachin/dotfiles.git
```

Create symlinks:

```
mkdir -p ~/.config/nvim
ln -s ~/dotfiles/.config/nvim/init.vim ~/.config/nvim/init.vim
ln -s ~/dotfiles/.zshcustom ~/.zshcustom
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.gitconfig_custom ~/.gitconfig_custom
```

Load the zsh custom settings into .zshrc:

```
if [ -f $HOME/.zshcustom ]; then
  source $HOME/.zshcustom
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
