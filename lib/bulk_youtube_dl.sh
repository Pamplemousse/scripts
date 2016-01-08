#! /bin/zsh
# Usage: bytdl SOURCES DESTINATION
# source is a file with one url per line
# destination is the destination folder the content will be downloaded to

alias bytdl="bulk_youtube_dl"

function bulk_youtube_dl {
  # Validate parameters
  #   * presence in function call
  #   * existence
  if (( $# < 2 )); then
    print "usage: $0 SOURCE DESTINATION" >&2
    return 1
  elif [[ ! -f "$1" ]]; then
    print "$1 does not exist" >&2
    return 1
  elif [[ ! -d "$2" ]]; then
    echo 'test'
    print "$2 does not exist" >&2
    return 1
  fi

  zmodload zsh/mapfile
  file_lines=( "${(f)mapfile[$1]}" )
  for url in $file_lines
  do
    youtube-dl --exec "mv {} $2" -x --audio-format mp3 -o "%(title)s.%(ext)s" $url
    (( POS++ ))
  done
}
