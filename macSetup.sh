#!/bin/bash

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp ~/Documents/configFiles/vimrc ~/.vimrc
cp ~/Documents/configFiles/zshrc ~/.zshrc
cp ~/Documents/configFiles/gitConfig ~/.gitconfig
source ~/.zshrc
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install fzf
$(brew --prefix)/opt/fzf/install
brew install the_silver_searcher
brew install neovim
ln -s ~/.vimrc ~/.config/nvim/init.vim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
sudo pip2 install neovim
sudo pip3 install neovim
curl https://github.com/tonsky/FiraCode/releases/download/1.204/FiraCode_1.204.zip -o ~/Downloads/FiraCode_1.204.zip
curl https://iterm2.com/downloads/beta/iTerm2-3_1_beta_10.zip -o ~/Downloads/iterm2Beta.zip
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.4/install.sh | bash
source ~/.zshrc
cp ~/Documents/configFiles/default-packages $NVM_DIR/default-packages
nvm install node
echo ""
echo "Manually set iterm2 settings to point to the configFile"
echo "Manually setup firacode for iterm2"
echo "Manually run PlugUpdate and UpdateRemotePlugins within neovim"
echo "Download better touch tools, karabiner"
