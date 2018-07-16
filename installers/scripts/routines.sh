#!/bin/bash

# Prompts user to whether it should do something
# Return 0 if should do, 1 otherwise
function should() {
  local prompt
  prompt="$1"
  local should_var
  read -p "$prompt (yes/y/no/n) " should_var
  if [[ $should_var == "yes" || $should_var == "y" ]];
  then
    return 0
  else
    return 1
  fi
}
