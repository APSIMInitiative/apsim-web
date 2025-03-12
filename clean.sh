#!/usr/bin/env bash

# do a git clean and pull to get the latest revision
# -e switch ignores particular files
git clean -d -f\
 -e Kapture \
 -e BackupRestore
git reset --hard
git pull

# Make some scripts executable
chmod +x *.sh