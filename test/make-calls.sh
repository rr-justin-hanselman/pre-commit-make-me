#!/bin/sh

errorCode=0

assert_output() {
  local cmdArgs="$1"
  local actual="$2"
  local expectedStart="Testing that \"make $cmdArgs\" does not change files or fail*"
  if [[ "$actual" == $expectedStart ]]; then 
    return 0
  else
    return 1
  fi
}


echo "TEST: Single Make command"
result=$(sh ../make-me.sh failure)
assert_output "failure" "$result"
if [ "$?" == "0" ]; then
  echo "SUCCESS"
else
  echo "FAILURE"
  errorCode=1
fi

echo "TEST: Multiple Make commands"
result=$(sh ../make-me.sh failure something else)
assert_output "failure something else" "$result"
if [ "$?" == "0" ]; then
  echo "SUCCESS"
else
  echo "FAILURE"
  errorCode=1
fi

exit $errorCode