#! /bin/zsh

# For a full list of active aliases, run `alias`.
# Misc Aliases
alias cleanmods="rm -f package-lock.json && rm -rf node_modules && npm install"
alias conf="cd $CONFIG_FILES_PATH"
alias p="ps -A | fzf"
alias v="nvim"

# Get disk usage of top 45 largest directories from within current directory
alias diskusage="du -mx | sort --reverse --numeric-sort | head -46 | tail -45 | (echo 'Mb      Directory\n-----------------' && command cat) "
alias diskusagefiles="du -a | sort --reverse --numeric-sort | head -246 | tail -245 | (echo 'Kb      Directory\n-----------------' && command cat) "

alias deleteNodeModules="find . -name node_modules -type d -prune -exec rm -rf {} +"
alias deleteBowerComponents="find . -name bower_components -type d -prune -exec rm -rf {} +"
alias cleanpackages="deleteNodeModules && deleteBowerComponents"
alias trashorig="trash **/*.orig"

#similar to my vim config to open and edit .vimrc and to source .vimrc
alias ev="nvim ~/.zshrc"
alias sv="source ~/.zshrc"

# Piping aliases
alias -g F="| fzf"
alias -g S="| sort"
alias -g U="| uniq"
alias -g C="| pbcopy"
alias -g L="| wc -l"

alias copy='eval "$(fc -ln -1) | pbcopy"'

# Useful FamilySearch Aliases
# heroku local, but using Procfile.dev if there is one
alias fsh="([[ -a Procfile.dev ]] && heroku local -f Procfile.dev) || heroku local"
alias fs="cd ~/fs"
alias nrs="npm run storybook"

# Overwriting basic commands with newer ones
alias ping="prettyping --nolegend"
alias cat="bat"

alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"
alias fixNodeGyp="sudo rm -rf $(xcode-select -print-path); sudo rm -rf /Library/Developer/CommandLineTools; xcode-select --install"

alias topen="open https://travis-ci.com/github/fs-webdev/$(basename $(pwd))"
alias hopen="open https://dashboard.heroku.com/apps/fs-$(basename $(pwd))-prod"
alias gopen="git open"
