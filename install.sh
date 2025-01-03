#!/bin/bash
# Install brew packages from brew-list.txt
xargs brew install < brew-list.txt

read -p "Press Enter to continue to installing oh-my-zsh and powerlevel10k..."

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

mv $HOME/.zshrc $HOME/.zshrc.bak
cp ./.zshrc $HOME
source $HOME/.zshrc
