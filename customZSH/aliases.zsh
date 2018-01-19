# For a full list of active aliases, run `alias`.

# Misc Aliases
alias cleanmods="rm -f package-lock.json && rm -rf node_modules && npm install"
alias conf="cd $CONFIG_FILES_PATH"
alias p="ps -A | peco"
alias v="nvim"
alias vs="nvim -S"

#similar to my vim config to open and edit .vimrc and to source .vimrc
alias ev="nvim ~/.zshrc"
alias sv="source ~/.zshrc"

# Piping aliases
alias -g P="| peco"
alias -g S="| sort"
alias -g U="| uniq"

# Useful FamilySearch Aliases
# heroku local, but using Procfile.dev if there is one
alias fsh="([[ -a Procfile.dev ]] && heroku local -f Procfile.dev) || heroku local"
alias fs="cd ~/fs"

# Git Based Aliases
alias ggpull='git pull origin $(git_current_branch)'
alias ggpush='git push origin $(git_current_branch)'
alias pr="open-pr master"
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias ppp="ggpush && pr"
alias gitRebaseMaster="git checkout master && ggpull && git checkout @{-1} && git rebase -i master"
alias or="openPackageJsonRepoUrl"
