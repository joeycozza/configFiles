# PACKAGE
# Show current package version
function package_json_info() {
  # Show package version only when repository is a package
  # @todo: add more package managers
  [[ -f package.json ]] || return

  # Grep and cut out package version
  # Grep -E does not support \d for digits shortcut, should use [:digit:] or [0-9] instead
  local package_version=$(grep -E '"version": "v?([0-9]+\.){1,}' package.json | cut -d\" -f4 2> /dev/null)

  # Handle version not found
  if [ ! "$package_version" ]; then
    package_version=" ⚠"
  else
    package_version=" v${package_version}"
  fi

  echo "${ZSH_THEME_PACKAGE_SYMBOL}${package_version}"
}
