#! /bin/zsh

function open_git_repo() {
  local config_location

  if [ -f .git/config ]; then
    config_location='.git/config'
  elif [ -f ../.git/config ]; then
    config_location='../.git/config'
  elif [ -f ../../.git/config ]; then
    config_location='../../.git/config'
  fi

  [[ -f $config_location ]] || return

  local url_line_with_git_at="$(grep 'git@' $config_location)"

  if [ "$url_line_with_git_at" ]; then
    local repo_name=$(grep url $config_location | sed -E s/.*://)

    if [ ! "$repo_name" ]; then
      echo "git repo_name not found"
    else
      open "https://github.com/$repo_name"
    fi
  else 
    local repo_url=$(grep url $config_location | sed -E s/.*https:/https:/)

    if [ ! "$repo_url" ]; then
      echo "git repo url not found"
    else
      open "$repo_url"
    fi
  fi
}

# Show current package version
function package_json_info() {
  # Show package version only when repository is a package
  [[ -f package.json ]] || return

  # Grep and cut out package version
  # Grep -E does not support \d for digits shortcut, should use [:digit:] or [0-9] instead
  local package_version=$(grep -E '"version": "v?([0-9]+\.){1,}' package.json | cut -d\" -f4 2> /dev/null)

  # Handle version not found
  if [ ! "$package_version" ]; then
    package_version="⚠"
  fi

  echo " ${ZSH_THEME_PACKAGE_SYMBOL} ${package_version}"
}

# Show current bower version
function bower_json_info() {
  # Show bower version only when repository has a bower.json
  [[ -f bower.json ]] || return

  # Grep and cut out bower version
  # Grep -E does not support \d for digits shortcut, should use [:digit:] or [0-9] instead
  local bower_version=$(grep -E '"version": "v?([0-9]+\.){1,}' bower.json | cut -d\" -f4 2> /dev/null)

  # Handle version not found
  if [ ! "$bower_version" ]; then
    bower_version="⚠"
  fi

  echo " ${ZSH_THEME_BOWER_SYMBOL} ${bower_version}"
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

