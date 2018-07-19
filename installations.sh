#!/bin/bash

INSTALL=$1

VALIDINSTALLSTEPS=(
  'bootstrap' 'provision' 'build-brew' 'build-git'
  'build-node' 'build-git' 'build-ruby'
  'build-python' 'build-go' 'build-packagetools' 'build-vim'
  'security'
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
  echo "   script-step    bootstrap, provision, build-brew"
  echo "                  build-git, build-node, build-ruby, build-packagetools"
  echo "                  build-vim, build-python, build-go"
  echo "                  security"
  return 1
}

if [ -z $INSTALL ];
then
  INSTALL=( "${VALIDINSTALLSTEPS[@]}" )
else
  if ! is_single_install_valid; then
    print_usage
    exit 1
  fi
  INSTALL=( $INSTALL )
fi

source ./installers/scripts/routines.sh
for STEP in "${INSTALL[@]}"; do
  source ./installers/scripts/$STEP $(pwd)
done
