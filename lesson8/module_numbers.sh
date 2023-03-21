#!/bin/bash
Checknum() {
  echo "Enter phone number"
  read -r a
regex="(\+(375) (29|33|44|25) \d{7}) | \+(375)(29|33|44|25)\d{7}) || (\+(375)\-(29|33|44|25)\-[0-9]{7})"
if [[ $a =~ $regex ]]; then
  echo "valid phone number"
  else
    echo "Invalid phone number"
fi
}
Checknum "$@"

