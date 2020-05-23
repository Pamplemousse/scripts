#!/usr/env/bin zsh
# Usage: bytdl SOURCES DESTINATION
# source is a file with one url per line
# destination is the destination folder the content will be downloaded to

function bulk_youtube_dl {
  if (( $# < 2 )); then
    echo "usage: bulk_youtube_dl SOURCE DESTINATION" >&2
    return 1
  elif [[ ! -f "$1" ]]; then
    echo "$1 does not exist" >&2
    return 1
  elif [[ ! -d "$2" ]]; then
    echo "$2 does not exist" >&2
    return 1
  fi

  while read -r url; do
    youtube-dl --exec "mv {} $2" -x --audio-format mp3 -o "%(title)s.%(ext)s" $url
  done <<< $(cat "$1")
}
