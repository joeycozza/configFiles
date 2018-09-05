#! /bin/zsh

# For a full list of active aliases, run `alias`.
# Misc Aliases
alias cleanmods="rm -f package-lock.json && rm -rf node_modules && npm install"
alias conf="cd $CONFIG_FILES_PATH"
alias p="ps -A | fzf"
alias v="nvim"
alias vs="nvim -S"

# Get disk usage of top 40 largest directories from within current directory
alias diskusage="du -mx | sort --reverse --numeric-sort | head -46 | tail -45 | (echo 'Mb      Directory\n-----------------' && cat) "
alias deleteNodeModules="find . -name node_modules -type d -prune -exec rm -rf {} +"
alias deleteBowerComponents="find . -name bower_components -type d -prune -exec rm -rf {} +"
alias cleanpackages="deleteNodeModules && deleteBowerComponents"

#similar to my vim config to open and edit .vimrc and to source .vimrc
alias ev="nvim ~/.zshrc"
alias sv="source ~/.zshrc"

# Piping aliases
alias -g F="| fzf"
alias -g S="| sort"
alias -g U="| uniq"

# Useful FamilySearch Aliases
# heroku local, but using Procfile.dev if there is one
alias fsh="([[ -a Procfile.dev ]] && heroku local -f Procfile.dev) || heroku local"
alias fs="cd ~/fs"

# Overwriting basic commands with newer ones
alias ping="prettyping --nolegend"
alias cat="bat"
