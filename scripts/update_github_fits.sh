#!/usr/bin/env bash
set -e
# ./orderly migrate
# ./orderly rebuild

TODAY=$(date "+%Y-%m-%d")
DATE=${1:-$TODAY}

echo "*** Deploy Key"
REMOTE_URL=git@github.com:mrc-ide/nimue_global_fits.git

## NOTE, uses one directory above the root
export GIT_SSH_COMMAND="ssh -i ../.ssh/gh_fits/id_rsa"

git -C gh-fits config user.email "gregbarnsley@hotmail.co.uk"
git -C gh-fits config user.name "GBarnsley"

echo "*** Create Commits"
git -C gh-fits add standard
git -C gh-fits commit -m "Update fits for version ${DATE}"

echo "*** Push to GitHub"
git -C gh-fits push

