#!/bin/bash --norc

cmd=$(git diff $2 $3 --no-ext-diff --no-prefix  | sed -e "s/^diff --git [^[:space:]]*/Index:/" -e "s/^index.*/===================================================================/")

if [ -n "$1" ]; then
	echo "$cmd" > $1
else
	echo "$cmd"
fi

