#!/bin/sh

gitclone() {
  git clone "$1" && cd "$(basename "$1" .git)" || return
}

# Git Based Aliases
alias ggpull='git pull origin $(git_current_branch)'
alias ggpush='git push origin $(git_current_branch)'
alias pr="open-pr master"
alias ppp="ggpush && pr"
