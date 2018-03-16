#!/bin/bash

SCRIPT=../lib/common_memory_address.rb

setup() {
  input_file=$(mktemp)
}

teardown() {
  rm $input_file
}


test_can_format_output_in_base_2() {
  echo "0xff" >> $input_file

  actual_result=$($SCRIPT -f $input_file -b 2)
  expected_result="0b11111111"

  assert_equals "$expected_result" "$actual_result"
}

test_can_format_output_in_base_16() {
  echo "0xff" >> $input_file

  actual_result=$($SCRIPT -f $input_file -b 16)
  expected_result="0xff"

  assert_equals "$expected_result" "$actual_result"
}

test_calculate_common_bits_between_several_addresses() {
  cat << __EOF__ >"$input_file"
0xffffffff
0xfffffff
0xffffff
0xfffff
0xffff
0xff
0xf
__EOF__

  actual_result=$($SCRIPT -f $input_file)
  expected_result="0xf"

  assert_equals "$expected_result" "$actual_result"
}
