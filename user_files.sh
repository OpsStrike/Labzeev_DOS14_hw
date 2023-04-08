#!/bin/bash
if [ "$(id -u)" -eq 0 ]; then
  find . -mtime -1
  else
    find . -user tima -mtime -1
    fi
