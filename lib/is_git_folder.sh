#! /bin/zsh

# Function used to test if a folder contains data from a git repository
function is_git_folder {
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
  # Check if the tested directory contains a .git subfolder
  if [[ -d "$1/.git" ]]; then
    return 0
  else
    return 1
  fi
}
