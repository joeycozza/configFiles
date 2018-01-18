export ZSH=$HOME/.oh-my-zsh
# Path to your oh-my-zsh installation.

ZSH_CUSTOM=$HOME/Documents/configFiles/customZSH
ZSH_THEME="mynode"

source $ZSH/oh-my-zsh.sh
source <(antibody init)

antibody bundle < ~/Documents/configFiles/antibodyPlugins.txt

# User configuration
export EDITOR="nvim"
export VISUAL=nvim
export FZF_DEFAULT_COMMAND='rg --files --hidden --smart-case --glob "!.git/*"'
export NVM_DIR="/Users/joeycozza/.nvm"

export PATH="/bin:$PATH"
export PATH="/sbin:$PATH"
export PATH="/usr/bin:$PATH"
export PATH="/usr/sbin:$PATH"
export PATH="/usr/local:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/git/bin:$PATH"
export PATH="/usr/local/mysql/bin:$PATH"
export PATH="/usr/local/lib/node_modules:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/usr/gcc-4.8.2/bin:$PATH"
export PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:$PATH"
export PATH="/opt/X11/bin:$PATH"
export PATH="$JAVA_HOME/bin:$PATH"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias ggpull='git pull origin $(git_current_branch)'
alias ggpush='git push origin $(git_current_branch)'
alias pr="open-pr master"
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias ppp="ggpush && pr"
alias cleanmods="rm -f package-lock.json && rm -rf node_modules && npm install"
alias p="ps -A | peco"
alias fs="cd ~/fs"
alias gitRebaseMaster="git checkout master && ggpull && git checkout @{-1} && git rebase -i master"
alias v="$EDITOR"
# open up neovim with saved session info
alias vs="$EDITOR -S"
# heroku local, but using Procfile.dev if there is one
alias fsh="([[ -a Procfile.dev ]] && heroku local -f Procfile.dev) || heroku local"
#similar to my vim config to open and edit .vimrc and to source .vimrc
alias ev="$EDITOR ~/.zshrc"
alias sv="source ~/.zshrc"

#piping aliases
alias -g P="| peco"
alias -g S="| sort"
alias -g U="| uniq"


[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

ulimit -n 1024

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
