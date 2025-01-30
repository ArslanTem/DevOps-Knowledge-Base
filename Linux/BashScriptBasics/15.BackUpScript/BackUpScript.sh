#!/bin/bash
# Backing up a directory to a compressed archive

SRC="/home/user/documents"
DEST="/home/user/backup_$(date +%F).tar.gz"

tar -czf "$DEST" "$SRC"
echo "Backup created at $DEST"
