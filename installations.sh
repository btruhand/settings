#!/bin/bash

INSTALL=$1
# assume target home is given as second argument for now
TARGET_HOME="${2:-$HOME}"

VALIDINSTALLSTEPS=(
  ### PROVISION AND BOOTSTRAP MUST BE THE FIRST TWO
  'provision' 'bootstrap'
  'build-brew' 'build-zsh' 'build-node' 'build-ruby'
  'build-python' 'build-go' 'build-vim'
  'build-aws' 'security'
  'build-docker' 'build-vscode'
)

is_single_install_valid() {
  for STEP in "${VALIDINSTALLSTEPS[@]}"; do
    [[ $STEP == $INSTALL ]] && return 0
  done
  return 1
}

print_usage() {
  echo "./installations.sh [script-step]"
  echo "Arguments:"
  echo "   script-step    provision, bootstrap, build-brew"
  echo "                  build-git, build-node, build-ruby"
  echo "                  build-conda, build-vim, build-python, build-go"
  echo "                  build-zsh, build-aws, security"
  echo "                  build-docker, build-vscode"
  return 1
}

if [ -z $INSTALL ]; then
  INSTALL=("${VALIDINSTALLSTEPS[@]}")
else
  if ! is_single_install_valid; then
    print_usage
    exit 1
  fi
  INSTALL=($INSTALL)
fi

source ./installers/scripts/routines.sh

echo "Target home is: $TARGET_HOME"

for STEP in "${INSTALL[@]}"; do
  echo "**************************************"
  echo "******** RUNNING SCRIPT $STEP ********"
  echo "**************************************"

  if should "Run installer $STEP?"; then
    source $(pwd)/installers/scripts/$STEP $(pwd) $2
  fi

  echo "**************************************"
  echo "********* DONE SCRIPT $STEP **********"
  echo "**************************************"
  echo
done
