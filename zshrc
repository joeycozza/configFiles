export ZSH=$HOME/.oh-my-zsh
# Path to your oh-my-zsh installation.

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="garyblessington"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git brew node npm)

source $ZSH/oh-my-zsh.sh
source <(antibody init)

antibody bundle < ~/Documents/configFiles/antibodyPlugins.txt

# User configuration

export PATH="/Users/joeycozza/nim/bin:/usr/local:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/mysql/bin:/usr/gcc-4.8.2/bin:/usr/local/lib/node_modules:/Library/Frameworks/Python.framework/Versions/2.7/bin:/opt/X11/bin:/usr/local/git/bin"
export EDITOR="nvim"
export VISUAL=nvim
export PATH=$JAVA_HOME/bin:$PATH
export FZF_DEFAULT_COMMAND='rg --files --hidden --smart-case --glob "!.git/*"'

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias wun="gulp watch"
alias gun="gulp run"
alias pr="open-pr master"
alias clean="rm -rf node_modules"
alias mods="npm install"
alias cleanmods="clean && mods"
alias p="ps -A | peco"
alias ppp="ggpush && pr"
alias fs="cd ~/fs"
alias gitRebaseMaster="git checkout master && ggpull && git checkout @{-1} && git rebase -i master"
alias v="$EDITOR"
# heroku local, but using Procfile.dev if there is one
alias fsh="([[ -a Procfile.dev ]] && heroku local -f Procfile.dev) || heroku local"
#similar to my vim config to open and edit .vimrc and to source .vimrc
alias ev="$EDITOR ~/.zshrc"
alias sv="source ~/.zshrc"

#piping aliases
alias -g G="| grep"
alias -g P="| peco"
alias -g T="| tail"
alias -g S="| sort"
alias -g U="| uniq"

export NVM_DIR="/Users/joeycozza/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

ulimit -n 1024

function grepex() {
  grep -r $1 --exclude-dir={bower_components,node_modules} $PWD
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
