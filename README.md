# dotfiles

Install dependencies:
```
curl https://nixos.org/nix/install | sh

nix-env -i bash-5.0-p11
nix-env -i bat-0.12.1
nix-env -i buku-4.2.2
nix-env -i diff-so-fancy-1.2.7
nix-env -i fd-7.4.0
nix-env -i fzf-0.20.0
nix-env -i git-2.24.1
nix-env -i jq-1.6
nix-env -i neovim-0.4.3
nix-env -i nodejs-10.18.0
nix-env -i rustup-1.21.0
nix-env -i tmux-3.0a
nix-env -i yarn-1.21.1
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
