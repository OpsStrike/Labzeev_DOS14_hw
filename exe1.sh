#!/bin/bash

usage() {
  echo "Enter args: add/div/sub/mult"
  exit 1
}

function1()
{
  if [ $opt == add ]; then
echo "Enter the first value"
read a
echo "Enter second value"
read b

   sum=`echo "$a + $b" | bc`
   echo "sum=$sum"

   elif [ $opt == div ]; then
  echo "Enter the first value"
  read a
  echo "Enter second value"
  read b
     div=`echo "scale=3; "$a / $b"" | bc -l`
  echo result="$div"

   elif [ $opt == mult ]; then
      echo "Enter the first value"
             read a
             echo "Enter second value"
             read b
     mul=`echo "$a * $b" | bc`
     echo result="$mul"

    elif [ $opt == sub ]; then
      echo "Enter the first value"
      read a
      echo "Enter second value"
      read b
     min=`echo "$a - $b" | bc`
     echo result="$min"
    fi
}

opt=$1
case $opt
in
    add) function1 ;;
    div) function1 ;;
    mult) function1 ;;
    sub) function1 ;;
    *) usage
       exit ;;
esac

main () {
  if [[ $# -lt 1 ]]; then
    usage
    fi

}


