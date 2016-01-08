#! /bin/zsh

test_returns_true_if_folder_contains_a_package_dot_json() {
  touch "${test_dir}/package.json"
  assertTrue 'returns true if folder contains a package.json' "is_node_project ${test_dir}"
}


test_returns_false_if_folder_does_not_contains_a_package_dot_json() {
  assertFalse 'returns false if folder does not contains a package.json' "is_node_project ${test_dir}"
}

test_returns_an_error_message_if_no_folder_is_passed_as_parameter() {
  is_node_project >${stdout_file} 2>${stderr_file}
  assertNotNull 'returns an error message if no folder is passed as parameter' "`cat ${stderr_file}`"
}

test_returns_an_error_message_if_folder_does_not_exists() {
  is_node_project "${test_dir}_diff" >${stdout_file} 2>${stderr_file}
  assertNotNull 'returns an error message if folder does not exists' "`cat ${stderr_file}`"
}


#---------------------------------------------------------------
# Set-up
#

# Set-up some file to write stream outputs to
oneTimeSetUp() {
  output_dir="${SHUNIT_TMPDIR}/output"
  stdout_file="${output_dir}/stdout"
  stderr_file="${output_dir}/stderr"
  mkdir "$output_dir"
}

setUp() {
  test_dir="${SHUNIT_TMPDIR}/test_dir"
  mkdir "${test_dir}"
}

# Remove all the unnecessary stuff we created
tearDown() {
  rm -fr "${test_dir}"
}

# load script to test
source lib/is_node_project.sh

# load shunit2 with zsh support
setopt shwordsplit
SHUNIT_PARENT=$0
. ~/Workspace/tools/shunit2-2.1.6/src/shunit2
