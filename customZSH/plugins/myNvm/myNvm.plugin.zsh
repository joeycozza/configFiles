#!/usr/bin/env zsh

# Set NVM_DIR if it isn't already defined
[[ -z "$NVM_DIR" ]] && export NVM_DIR="$HOME/.nvm"

# Load nvm if it exists
[[ -f "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"

# Setup the tab completion that comes with nvm if it exists
[[ -r "$NVM_DIR/bash_completion" ]] && \. $NVM_DIR/bash_completion
