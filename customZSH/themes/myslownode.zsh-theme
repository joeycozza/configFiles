ZSH_THEME_NVM_PROMPT_PREFIX="%{$fg[green]%}⬢ "
ZSH_THEME_NVM_PROMPT_SUFFIX=""

ZSH_THEME_GIT_PROMPT_PREFIX="(%{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

ZSH_THEME_BOWER_SYMBOL="\u24B7"
ZSH_THEME_NPM_PROMPT_PREFIX="%{$fg[red]%}\u24C3"
ZSH_THEME_PACKAGE_SYMBOL="\u24C5"

local node_version='$(nvm_prompt_info)'
local npm_version='$(npm_prompt_info)'
local package_version='$(package_json_info)'
local bower_version='$(bower_json_info)'
local gitBranch='$(git_prompt_info)'

local cyanColor='%F{cyan}'
local lastDirectoryOfCWD='%1~'

PROMPT='${cyanColor}${lastDirectoryOfCWD}%{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%}% %{$reset_color%}: '
RPROMPT="${node_version}%{$reset_color%}${npm_version}${package_version}${bower_version}"
