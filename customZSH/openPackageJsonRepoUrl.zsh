function openPackageJsonRepoUrl() {
  if [ ! -f package.json ]; then
    echo "package.json not found"
  else
    local url=$(cat package.json | json repository.url)
    if [ ! "$url" ]; then
      echo "repository.url not found in package.json"
    else
      open $url
    fi
  fi
}
