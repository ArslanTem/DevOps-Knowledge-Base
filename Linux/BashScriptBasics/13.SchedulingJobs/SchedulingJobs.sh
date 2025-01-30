#!/bin/bash

# This line in crontab runs a backup script every day at midnight
0 0 * * * /home/user/backup.sh

crontab -e

# Using command-line arguments

echo "Script name: $0"
echo "First argument: $1"
echo "Second argument: $2"
