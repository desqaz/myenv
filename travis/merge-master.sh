#!/bin/bash --norc

echo "Branch = $TRAVIS_BRANCH"

if [ "$TRAVIS_BRANCH" = "master" ]; then 
    exit 0
fi

git fetch origin master:master || exit 1
git checkout master  	       || exit 255
git merge "$TRAVIS_BRANCH"     || exit 254

git remote add origin_http https://github.com/desqaz/myenv.git || exit 250

git push origin_http master    || exit 253

