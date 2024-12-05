#!/usr/bin/env bash

# do a git clean and pull to get the latest revision
# -e switch ignores particular files
git clean -d -x -f\
 -e Infrastructure
git reset --hard
git pull

# Make some scripts executable
chmod +x *.sh