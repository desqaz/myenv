#!/bin/sh

CurrentOrigin=$(git config remote.origin.url)
if [ $? -ne 0 ]; then
	echo "This not a git repo with origin configured"
	exit 1
fi

NewOrigin=$(echo $CurrentOrigin | sed 's?^https://github.com/?git@github.com:?')
echo "Setting up origin from '$CurrentOrigin' to '$NewOrigin' ..."
git remote set-url origin $NewOrigin
if [ $? -ne 0 ]; then
	echo "Failed to setup new origin"
	exit 1
fi
echo "Done !"
