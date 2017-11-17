#!/bin/bash

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
ln -s ~/Documents/configFiles/vimrc ~/.vimrc
ln -s ~/Documents/configFiles/vim ~/.vim
ln -s ~/Documents/configFiles/zshrc ~/.zshrc
ln -s ~/Documents/configFiles/gitConfig ~/.gitconfig
ln -s ~/Documents/configFiles/gitignore_global ~/.gitignore_global
ln -s ~/Documents/configFiles/vintrc.yaml ~/.vintrc.yaml
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install fzf
$(brew --prefix)/opt/fzf/install
brew install neovim
brew install --HEAD universal-ctags/universal-ctags/universal-ctags
brew install peco
brew install ripgrep
brew install zsh-syntax-highlighting
# luajit is for neovim plugins and such
brew install luajit
# grip is for markdown preview github option
brew install grip
source ~/.zshrc
ln -s ~/.vimrc ~/.config/nvim/init.vim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
sudo pip3 install neovim
sudo pip3 install vim-vint
sudo pip3 install neovim-remote
sudo gem install neovim
nvim --headless +PlugInstall +qa
nvim --headless +UpdateRemotePlugins +qa
curl https://github.com/tonsky/FiraCode/releases/download/1.204/FiraCode_1.204.zip -o ~/Downloads/FiraCode_1.204.zip
curl https://iterm2.com/downloads/beta/iTerm2-3_1_beta_10.zip -o ~/Downloads/iterm2Beta.zip
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.4/install.sh | bash
source ~/.zshrc
cp ~/Documents/configFiles/default-packages $NVM_DIR/default-packages
nvm install node
echo ""
echo "Manually set iterm2 settings to point to the configFile"
echo "Manually setup firacode for iterm2"
echo "Download better touch tools, karabiner"
