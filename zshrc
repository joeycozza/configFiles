export ZSH=$HOME/.oh-my-zsh
# Path to your oh-my-zsh installation.

ZSH_CUSTOM=$HOME/Documents/configFiles/customZSH
ZSH_THEME="mynode"

source $ZSH/oh-my-zsh.sh
source <(antibody init)

antibody bundle < $HOME/Documents/configFiles/antibodyPlugins.txt

# User configuration
export EDITOR="nvim"
export VISUAL=nvim
export FZF_DEFAULT_COMMAND='rg --files --hidden --smart-case --glob "!.git/*"'
export NVM_DIR="$HOME/.nvm"

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

[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

ulimit -n 1024

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
