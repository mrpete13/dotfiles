#! /bin/bash

### This script is for configuring my preferred setup for arch linux.
### The following programs will need to be installed with the archinstall tool on the live-iso:
###     zsh git curl wget

sudo pacman -Syu firefox htop tree make inkscape xorg-xcursorgen

mkdir -p ~/devel/rust
mkdir -p ~/devel/bash
mkdir -p ~/devel/python
mkdir -p ~/Downloads/repos
mkdir -p ~/Downloads/fonts

git clone https://github.com/mrpete13/dotfiles.git ~/Downloads/repos
ln -s ~/Downloads/repos/dotfiles/.aliases ~/.aliases
ln -s ~/Downloads/repos/dotfiles/.bash_scripts ~/.bash_scripts
ln -s ~/Downloads/repos/dotfiles/.zshrc ~/.zshrc

# Install Rust-lang
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install yay pacman helper
git clone https://aur.archlinux.org/yay.git ~/Downloads/repos
cd ~/Downloads/repos/yay
sudo pacman -Si

# Configure oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
curl -sS https://starship.rs/install.sh | sh
#echo "eval \"$(starship init zsh)\"" >> ~/.zshrc
source ~/.zshrc

wget -O ~/Downloads/fonts/FiraCode/FiraMono.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraMono.zip && unzip ~/Downloads/fonts/FiraCode/FiraMono.zip
sudo cp -r ~/Downloads/fonts/FiraCode /usr/share/fonts

# Icons & cursor
git clone https://github.com/bikass/kora.git ~/Downloads/repos/
ln -s ~/Downloads/repos/kora ~/.local/share/icons/kora
git clone https://github.com/varlesh/volantes-cursors.git ~/Downloads/repos
cd ~/Downloads/repos/volantes-cursors
make build
sudo make install
cd ~

# Install rust programs with cargo
cargo install ripgrep
cargo isntall bat 
cargo install dust