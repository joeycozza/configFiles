#! /bin/zsh

PACKAGE_SYMBOL="\u24C5"
NODE_SYMBOL="⬢ "

# get the node.js version
function node_prompt_info() {
  local node_prompt
  node_prompt=$(node -v 2>/dev/null)
  [[ "${node_prompt}x" == "x" ]] && return
  node_prompt=${node_prompt:1}
  echo "${ZSH_THEME_NODE_PROMPT_PREFIX}${node_prompt}${ZSH_THEME_NODE_PROMPT_SUFFIX}"
}

# Show current package version
function package_json_info() {
  # Show package version only when repository is a package
  [[ -f package.json ]] || return

  # Grep and cut out package version
  local package_version=$(grep -E '"version": "v?([0-9]+\.){1,}' package.json | cut -d\" -f4 2> /dev/null)

  # Handle version not found
  if [ ! "$package_version" ]; then
    package_version="⚠"
  fi

  echo "${PACKAGE_SYMBOL} ${package_version}"
}

# 
# get the npm version
function npm_prompt_info() {
  [[ -f "$NVM_DIR/nvm.sh" ]] || return
  local npm_prompt
  npm_prompt=$(npm -v 2>/dev/null)
  [[ "${npm_prompt}x" == "x" ]] && return
  echo " ${ZSH_THEME_NPM_PROMPT_PREFIX} ${npm_prompt}"
}

# clone the provided repo name from fs-webdev
function fsclone() {
  gitclone https://github.com/fs-webdev/$1.git
}
