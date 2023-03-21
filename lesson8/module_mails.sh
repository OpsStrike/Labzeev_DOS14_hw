#!/bin/bash

Checkmail(){
echo "Enter your URL"
read a
test='^(.*[a-zA-Z0-9_\-\.].*)@([a-z])*\.(com|ru|by)$'
#echo "$test"
if [[ $a =~ $test ]]; then
  echo "Valid mailbox"
  else
    echo "Incorrect mailbox"
  fi
}

Checkmail "$@"