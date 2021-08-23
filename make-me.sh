#!/bin/sh

cmdArgs=""
fileArgs=""
precomArgsFound=""
for arg in "$@"
do
  if [ "$arg" == "--" ]; then
    precomArgsFound=true
  elif [[ "$precomArgsFound" ]]; then 
    if [[ ${#fileArgs} -gt 0 ]]; then
      fileArgs="$fileArgs $arg"
    else
      fileArgs="$arg"
    fi
  else
    if [[ ${#cmdArgs} -gt 0 ]]; then
      cmdArgs="$cmdArgs $arg"
    else 
      cmdArgs="$arg"
    fi
  fi
done

# Simple command that will proxy your make commands for you
echo "Testing that \"make $cmdArgs\" does not change files or fail, for fileset: $fileArgs"
make $cmdArgs