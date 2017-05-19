# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="garyblessington"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git brew colorize node npm k)

source $ZSH/oh-my-zsh.sh
source <(antibody init)

antibody bundle < ~/Documents/configFiles/antibodyPlugins.txt

# User configuration

export PATH="/Users/joeycozza/nim/bin:/Users/joeycozza/.nvm/v0.10.32/bin:/usr/local:/usr/local/sbin:/usr/local/bin:/Library/Frameworks/Python.framework/Versions/2.7/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin:/usr/local/mysql/bin:/usr/gcc-4.8.2/bin:/usr/local/lib/node_modules:/Developer/SDKs/adt-bundle-mac-x86_64-20140321/sdk/platform-tools:/Developer/SDKs/adt-bundle-mac-x86_64-20140321/sdk/tools:/Library/Frameworks/Python.framework/Versions/2.7/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/git/bin"
export EDITOR="nvim"
export GROW_NPM_TOKEN="3457676d-d485-47fe-8dd7-d7a37a06d8dd"
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home
export PATH=$JAVA_HOME/bin:$PATH

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias wun="gulp watch"
alias gun="gulp run"
alias pr="open-pr develop"
alias pun="gulp run --dsEnv=production"
alias clean="noti rm -rf node_modules"
alias mods="noti yarn"
alias cleanmods="clean && mods"
alias p="ps -A | peco"
alias up="git hf update"
alias ppp="ggpush && pr"
alias iso="cd ~/modulesGrow/grow-isomorphic"
alias model="cd ~/modulesGrow/grow-models"
alias grow="cd ~/grow"
alias v="$EDITOR"
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

source /Users/joeycozza/.gulp.plugin.zsh/gulp.plugin.zsh
ulimit -n 1024

function grepex() {
  grep -r $1 --exclude-dir={bower_components,node_modules} $PWD
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
source /Users/joeycozza/.gulp.plugin.zsh/gulp.plugin.zsh
