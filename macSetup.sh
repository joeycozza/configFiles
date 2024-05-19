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
mkdir "$HOME/.config/bat"
ln -s "$CONFIG_FILES_PATH/batConfig" "$HOME/.config/bat/config"
ln -s "$CONFIG_FILES_PATH/lua-format" "$HOME/.lua-format"

# Setting up and install homebrew applications
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install fzf
"$(brew --prefix)"/opt/fzf/install
brew install ripgrep
brew install zsh-syntax-highlighting
brew tap homebrew/cask-fonts
brew install --cask font-fira-code-nerd-font
source "$HOME/.zshrc"

# installing and setting up neovim
brew install neovim
ln -s "$CONFIG_FILES_PATH/nvim" "$HOME/.config/nvim/"
source "$HOME/.zshrc"

curl https://iterm2.com/downloads/beta/iTerm2-3_5_0beta26.zip -o "$HOME/Downloads/iterm2Beta.zip"

# setting up fast-node-manager and node
brew install Schniz/tap/fnm
source "$HOME/.zshrc"
fnm install v20
source "$HOME/.zshrc"
command cat default-packages | xargs npm install -g

echo ""
echo "Do an fnm default {version that was installed}"
echo "Manually set iterm2 settings to point to the configFile directory"
echo "Manually setup firacode nerd font for iterm2 (already installed by brew)"
echo "Download better touch tools, karabiner"
