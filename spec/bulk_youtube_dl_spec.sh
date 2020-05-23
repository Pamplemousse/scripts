#!/usr/env/bin bash

source '../lib/bulk_youtube_dl.sh'

setup_suite() {
  source=$(mktemp)
  destination=$(mktemp -d)

  cat >"$source" << EOF
https://www.youtube.com/watch?v=dQw4w9WgXcQ
EOF
}

_youtube-dl() {
    touch "${destination}/Rick Astley - Never Gonna Give You Up.mp3"
}
fake youtube-dl _youtube-dl


test_returns_an_error_message_if_no_source_is_passed_as_parameter() {
  expected_message='usage: bulk_youtube_dl SOURCE DESTINATION'

  assert 'echo "$(bulk_youtube_dl 2>&1)" | grep "$expected_message"'
}

test_returns_an_error_message_if_the_source_does_not_exists() {
  expected_message="${source}_diff does not exist"

  assert 'echo "$(bulk_youtube_dl "${source}_diff" "$destination" 2>&1)" | grep "$expected_message"'
}

test_returns_an_error_message_if_the_destination_does_not_exists() {
  expected_message="${destination}_diff does not exist"

  assert 'echo "$(bulk_youtube_dl "$source" "${destination}_diff" 2>&1)" | grep "$expected_message"'
}

test_download_the_content_and_name_the_file_properly() {
  bulk_youtube_dl "$source" "$destination"
  assert_equals 'Rick Astley - Never Gonna Give You Up.mp3' "$(ls "$destination")"
}
