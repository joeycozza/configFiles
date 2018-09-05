#!/bin/sh

gitclone() {
  git clone "$1" && cd "$(basename "$1" .git)" || return
}

# Git Based Aliases
alias ggpull='git pull origin $(git_current_branch)'
alias ggpush='git push origin $(git_current_branch)'
alias pr="open-pr master"
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias ppp="ggpush && pr"
alias gitRebaseMaster="git checkout master && ggpull && git checkout @{-1} && git rebase -i master"
alias or="open_git_repo"

