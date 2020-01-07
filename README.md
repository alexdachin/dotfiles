# dotfiles

Install dependencies:
```
curl https://nixos.org/nix/install | sh

nix-env -i bat-0.12.1
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

pip3 install buku

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Clone:

```
git clone git@github.com:alexdachin/dotfiles.git
```

Create symlinks:

```
ln -s ~/dotfiles/.zshcustom ~/.zshcustom
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
mkdir -p ~/.config/nvim && ln -s ~/dotfiles/.config/nvim/init.vim ~/.config/nvim/init.vim
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
