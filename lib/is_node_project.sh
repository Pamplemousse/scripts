#! /bin/zsh

# Function used to test if a folder is a nodeJS project
function is_node_project {
  # Validate parameters
  #   * presence in function call
  #   * existence
  if (( $# < 1 )); then
    print "usage: $0 DIR_NAME" >&2
    return 1
  elif [[ ! -d "$1" ]]; then
    print "$1 does not exist" >&2
    return 1
  fi
  # Check if the tested directory contains a package.json file
  if [[ -e "$1/package.json" ]]; then
    return 0
  else
    return 1
  fi
}
