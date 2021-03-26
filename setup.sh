#!/bin/bash

# brew packages
brew install bash bash-completion
brew install bat dust exa fd ripgrep sd # rust ❤️
brew install fzf
brew install git git-delta # git with fancy diffs 🎩
brew install jq # json diffs
brew install nvm pyenv rbenv # version managers
brew install rustup
brew install tmux

# nightly neovim 🌚
brew install --HEAD luajit
brew install --HEAD neovim

# node version
. "/usr/local/opt/nvm/nvm.sh"
nvm install 12
nvm use 12
nvm alias default 12

# yarn
npm install -g yarn

# language servers
yarn global add typescript typescript-language-server # tsserver
brew install hashicorp/tap/terraform-ls # terraformls

# python versions
pyenv install 2.7.18
pyenv install 3.8.6
pyenv global 3.8.6 2.7.18

# python client for nvim
pip3 install --user --upgrade pynvim

# ruby version
rbenv install 3.0.0
rbenv global 3.0.0

# create symlinks
mkdir -p ~/.config/nvim
ln -s ~/dotfiles/.config/nvim/init.vim ~/.config/nvim/init.vim
ln -s ~/dotfiles/.bash_profile ~/.bash_profile
ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.doom.d ~/.doom.d

# install vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim +PlugInstall
