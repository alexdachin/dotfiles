#!/bin/zsh

function ask_yes_no() {
    read "RESPONSE?$1 [y/N]: "
    case $(echo "$RESPONSE" | tr '[:upper:]' '[:lower:]') in
        y|yes) echo "yes" ;;
        *)     echo "no" ;;
    esac
}

if [[ $(ask_yes_no "👉 Install Xcode command line tools?") = "yes" ]]; then
  echo "👉 Installing Xcode command line tools ..."
  xcode-select --install
fi

if [[ $(ask_yes_no "👉 Set up macOS settings?") = "yes" ]]; then
  echo "👉 Setting up macOS settings ..."
  defaults write -g ApplePressAndHoldEnabled -bool false
  defaults write com.apple.screencapture "disable-shadow" -bool true
  defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
fi

if [[ $(ask_yes_no "👉 Install brew 🍺?") = "yes" ]]; then
  echo "👉 Installing brew ..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if [[ $(ask_yes_no "👉 Symlink config files?") = "yes" ]]; then
  echo "👉 Symlinking config files ..."
  # kitty
  mkdir -p ~/.config/kitty
  ln -s ~/.dotfiles/.config/kitty/kitty.conf ~/.config/kitty/kitty.conf
  # nvim
  ln -s ~/.dotfiles/.config/nvim ~/.config/nvim
  # git
  ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
  # zsh
  ln -s ~/.dotfiles/.zprofile ~/.zprofile
  ln -s ~/.dotfiles/.zshrc ~/.zshrc
  source ~/.zprofile
  source ~/.zshrc
  # tmux
  ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
  # ideavim
  ln -s ~/.dotfiles/.ideavimrc ~/.ideavimrc
fi

if [[ $(ask_yes_no "👉 Install common brew packages?") = "yes" ]]; then
  echo "👉 Installing common brew packages ..."
  brew install bat dust eza fd ripgrep sd # rust ❤️
  brew install fx
  brew install fzf
  brew install git git-delta # git with fancy diffs 🎩
  brew install jq # json diffs
  brew install neovim # editor
  brew install pyenv # version managers
  brew install rustup
  brew install go
  brew install zsh
fi

if [[ $(ask_yes_no "👉 Install fzf shell extensions?") = "yes" ]]; then
  echo "👉 Installing fzf shell extensions ..."
  echo "👉 DO NOT UPDATE SHELL CONFIGURATION FILES ..."
  $(brew --prefix)/opt/fzf/install
fi

if [[ $(ask_yes_no "👉 Install and configure volta?") = "yes" ]]; then
  echo "👉 Installing and configuring volta ..."
  curl https://get.volta.sh | bash -s -- --skip-setup
  volta install node
  volta install yarn
  volta install pnpm
fi

if [[ $(ask_yes_no "👉 Configure pyenv?") = "yes" ]]; then
  echo "👉 Configuring pyenv ..."
  brew install openssl readline sqlite3 xz zlib # python build dependencies
  pyenv install 2
  pyenv install 3
  pyenv global 3 2
fi

if [[ $(ask_yes_no "👉 Install sdkman?") = "yes" ]]; then
  echo "👉 Installing sdkman ..."
  curl -s "https://get.sdkman.io" | bash
  source "$HOME/.sdkman/bin/sdkman-init.sh"
  sdk install java 25.0.3-amzn
  sdk default java 25.0.3-amzn
  sdk install maven
fi

if [[ $(ask_yes_no "👉 Install fonts?") = "yes" ]]; then
  echo "👉 Installing fonts ..."
  # iosevka
  brew install --cask font-iosevka
  # symbols nerd font
  # curl "https://raw.githubusercontent.com/ryanoasis/nerd-fonts/refs/heads/master/patched-fonts/NerdFontsSymbolsOnly/SymbolsNerdFont-Regular.ttf" -o ~/Library/Fonts/symbols-nerd-font-regular.ttf
  # curl "https://raw.githubusercontent.com/ryanoasis/nerd-fonts/refs/heads/master/patched-fonts/NerdFontsSymbolsOnly/SymbolsNerdFontMono-Regular.ttf" -o ~/Library/Fonts/symbols-nerd-font-mono-regular.ttf
fi
