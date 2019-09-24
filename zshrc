#! /bin/zsh

ZSH_DISABLE_COMPFIX=true

# That cmd will profile starting up zsh 
# https://github.com/robbyrussell/oh-my-zsh/issues/5327#issuecomment-298378567 for more info and help debugging
if [[ -v ZSH_PROF ]]; then
  # run the following command to use this zsh/zprof stuff
  # "env ZSH_PROF=1 zsh -ic zprof"
  zmodload zsh/zprof

  # nvim startup profiling. run the command, and then look at trash.log
  # "nvim --startuptime trash.log"
fi

export ZSH=$HOME/.oh-my-zsh
export CONFIG_FILES_PATH=$HOME/Documents/configFiles

ZSH_CUSTOM=$CONFIG_FILES_PATH/customZSH
ZSH_THEME="minimal"

plugins=(
  gulpComplete
  myNvm
  openPr
  gitHelpers
)

bindkey '\C-e' edit-command-line

source $ZSH/oh-my-zsh.sh

# User configuration
export EDITOR="nvim"
export VISUAL=nvim
export MANPAGER="sh -c 'col -b | bat -l man -p'"
export FZF_DEFAULT_COMMAND='rg --files --glob "!.git/*"'
export RIPGREP_CONFIG_PATH="$CONFIG_FILES_PATH/ripgreprc"

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

export PATH="/Users/joeycozza/bin:$PATH"
export PATH="/Users/joeycozza/Library/Python/2.7/bin:$PATH"

export PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:$PATH"
export PATH="/opt/X11/bin:$PATH"
export PATH="$JAVA_HOME/bin:$PATH"

ulimit -n 1024

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f "${HOME}/.iterm2_shell_integration.zsh" ] && source "${HOME}/.iterm2_shell_integration.zsh"
[ -f /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
eval "$(fnm env --multi)"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

iterm2_print_user_vars() {
  iterm2_set_user_var nodeVersion ${NODE_SYMBOL}$(node -v)
}
