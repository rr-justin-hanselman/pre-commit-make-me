#!/bin/sh

errorCode=0

assert_output() {
  local cmdArgs="$1"
  local fileArgs="$2"
  local actual="$3"
  local expectedStart="Testing that \"make $cmdArgs\" does not change files or fail, for fileset: $fileArgs*"
  if [[ "$actual" == $expectedStart ]]; then 
    return 0
  else
    return 1
  fi
}


echo "TEST: Single Make command with separator and files\n"
result=$(sh ../make-me.sh failure -- file1.txt dir2 dir3/33)
assert_output "failure" "file1.txt dir2 dir3/33" "$result"
if [ "$?" == "0" ]; then
  echo "SUCCESS"
else
  echo "FAILURE"
  errorCode=1
fi

echo "TEST: Mingle Make commands with separator and files\n"
result=$(sh ../make-me.sh failure something else -- file1.txt dir2 dir3/33)
assert_output "failure something else" "file1.txt dir2 dir3/33" "$result"
if [ "$?" == "0" ]; then
  echo "SUCCESS"
else
  echo "FAILURE"
  errorCode=1
fi

exit errorCode