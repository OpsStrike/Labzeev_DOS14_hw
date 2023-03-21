#!/bin/bash
#set -x
PS3="Select numbers: "

select point in phone url mails password quit
do
  case $point in
  phone)
    . ./module_numbers.sh;;
  url)
    . ./module_url.sh;;
  mails)
    . ./module_mail.sh;;
  password)
    . ./Module_password.sh ;;
  quit)
    break;;
  *)
    echo "Invalid value"
  esac
    echo "Element is $point"
    echo "Menu entry is $REPLY"
done


