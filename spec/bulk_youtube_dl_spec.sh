#! /bin/zsh
test_returns_an_error_message_if_no_source_is_passed_as_parameter() {
  bulk_youtube_dl >${stdout_file} 2> ${stderr_file}
  assertEquals 'usage: bulk_youtube_dl SOURCE DESTINATION' "`cat ${stderr_file}`"
}

test_returns_an_error_message_if_the_source_does_not_exists() {
  bulk_youtube_dl "${source}_diff" "${destination}" >${stdout_file} 2>${stderr_file}
  assertEquals "${source}_diff does not exist" "`cat ${stderr_file}`"
}

test_returns_an_error_message_if_no_destination_is_passed_as_parameter() {
  bulk_youtube_dl "${source}" >${stdout_file} 2> ${stderr_file}
  assertEquals 'usage: bulk_youtube_dl SOURCE DESTINATION' "`cat ${stderr_file}`"
}

test_returns_an_error_message_if_the_destination_does_not_exists() {
  bulk_youtube_dl "${source}" "${destination}_diff" >${stdout_file} 2>${stderr_file}
  assertEquals "${destination}_diff does not exist" "`cat ${stderr_file}`"
}

test_download_the_content_and_name_the_file_properly() {
  bulk_youtube_dl "${source}" "${destination}" >${stdout_file} 2>${stderr_file}
  assertEquals "`ls ${destination}`" "Rick Astley - Never Gonna Give You Up.mp3"
}

#---------------------------------------------------------------
# Set-up
#

# Set-up some file to write stream outputs to
oneTimeSetUp() {
  output_dir="${SHUNIT_TMPDIR}/output"
  stdout_file="${output_dir}/stdout"
  stderr_file="${output_dir}/stderr"
  mkdir $output_dir
}

setUp() {
  source="${SHUNIT_TMPDIR}/src"
  touch $source
  cat > $source << EOF
https://www.youtube.com/watch?v=dQw4w9WgXcQ
EOF

  destination="${SHUNIT_TMPDIR}/dst"
  mkdir $destination
}

# Remove all the unnecessary stuff we created
tearDown() {
  rm $source
  rm -r $destination
}

# load script to test
source ~/Workspace/tools/scripts/lib/bulk_youtube_dl.sh

# load shunit2 with zsh support
setopt shwordsplit
SHUNIT_PARENT=$0
. ~/Workspace/tools/shunit2-2.1.6/src/shunit2
