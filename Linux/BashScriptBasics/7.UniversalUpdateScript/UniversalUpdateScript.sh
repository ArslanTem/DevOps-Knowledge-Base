#!/bin/bash
# Updating package lists and upgrading installed packages

if [ -f /etc/debian_version ]; then
  sudo apt update && sudo apt upgrade -y
elif [ -f /etc/redhat-release ]; then
  sudo yum update -y
else
  echo "Unsupported OS."
fi
