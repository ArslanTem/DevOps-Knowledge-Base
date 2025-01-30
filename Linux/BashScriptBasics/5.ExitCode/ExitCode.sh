#!/bin/bash
# Checking the exit status of a command

ls /nonexistent_directory

if [ $? -eq 0 ]; then
  echo "Command succeeded."
else
  echo "Command failed."
fi
