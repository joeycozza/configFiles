#!/bin/bash

# Setting up all symbolic links
ln -s "$HOME/Documents/configFiles/zshrc" "$HOME/.zshrc"
source "$HOME/.zshrc"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
ln -s "$CONFIG_FILES_PATH/vimrc" "$HOME/.vimrc"
ln -s "$CONFIG_FILES_PATH/vim" "$HOME/.vim"
ln -s "$CONFIG_FILES_PATH/gitConfig" "$HOME/.gitconfig"
ln -s "$CONFIG_FILES_PATH/gitignore_global" "$HOME/.gitignore_global"
ln -s "$CONFIG_FILES_PATH/vintrc.yaml" "$HOME/.vintrc.yaml"
ln -s "$CONFIG_FILES_PATH/ideavimrc" "$HOME/.ideavimrc"
ln -s "$CONFIG_FILES_PATH/eslintrc.js" "$HOME/.eslintrc.js"
ln -s "$CONFIG_FILES_PATH/coc" "$HOME/.config/coc"

# Setting up and install homebrew applications
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install fzf
"$(brew --prefix)"/opt/fzf/install
brew install ripgrep
brew install zsh-syntax-highlighting
brew tap homebrew/cask-fonts
# TODO figure out how to auto download the Nerd-Fonts patched fira-code so vim-devicons works
brew cask install font-fira-code
# hadolint is a dockerfile linter tool
brew install hadolint
# luajit is for neovim plugins and such
brew install luajit
# grip is for markdown preview github option
brew install grip
source "$HOME/.zshrc"

# installing and setting up neovim
brew install neovim
ln -s "$HOME/.vimrc" "$HOME/.config/nvim/init.vim"
curl -fLo "$HOME/local/share/nvim/site/autoload/plug.vim" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
source "$HOME/.zshrc"
sudo pip3 install neovim
sudo pip3 install vim-vint
sudo pip3 install neovim-remote
sudo pip3 install yamllint
sudo gem install neovim
nvim --headless +PlugInstall +qa
nvim --headless +UpdateRemotePlugins +qa
curl https://iterm2.com/downloads/stable/iTerm2-3_3_7.zip -o "$HOME/Downloads/iterm2Beta.zip"
curl https://nim-lang.org/choosenim/init.sh -sSf | sh

# setting up fast-node-manager and node
brew install Schniz/tap/fnm
source "$HOME/.zshrc"
fnm install v12
source "$HOME/.zshrc"
command cat default-packages | xargs npm install -g

echo ""
echo "Do an fnm default {version that was installed}"
echo "Manually set iterm2 settings to point to the configFile directory"
echo "Manually setup firacode for iterm2"
echo "Download better touch tools, karabiner"
echo "Download intelliJ community and make sure the directory matches what gitconfig is looking for"
