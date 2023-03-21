#!/bin/bash

CheckURL(){
echo "Enter your URL"
read a
test='^https?:\/\/([a-zA-Z0-9_\-\.]+)\.([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$'
if [[ $a =~ $test ]]; then
  echo "URL passed test"
  else
    echo "Incorrect url address"
  fi
}
CheckURL "$@"
