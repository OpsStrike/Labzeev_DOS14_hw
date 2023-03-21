#!/bin/bash
Pass_ver() {

   echo "Enter pass:"
   stty -echo
   read a
    stty echo
  if ! [[ "$a" =~ ^[A-Z][a-z0-9]*$ ]]; then
      echo "use capital letters"
          return 1
  elif ! [[ "$a" =~ [0-9] ]]; then
      echo "use some numbers"
          return 1
  else
      echo "Good Password"
  fi
}
Pass_ver "$@"
