ZSH_THEME_NVM_PROMPT_PREFIX="%{$fg[green]%}⬢ "
ZSH_THEME_NVM_PROMPT_SUFFIX=""

ZSH_THEME_GIT_PROMPT_PREFIX="(%{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

ZSH_THEME_PACKAGE_SYMBOL="*"

local node_version='$(nvm_prompt_info)'
local package_version='$(package_json_info)'

PROMPT='%{$fg[cyan]%}%c%{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%}% %{$reset_color%}: '
RPROMPT="${node_version}%{$reset_color%} ${package_version}"
