#!/bin/bash --norc

echo "TRAVIS_BRANCH = $TRAVIS_BRANCH"

if [ "$TRAVIS_BRANCH" = "master" ]; then 
    exit 0
fi

git fetch origin master:master 							|| exit 1
git checkout master  	       							|| exit 2
git merge "$TRAVIS_BRANCH"     							|| exit 3

git remote add\
  	origin_http https://github.com/desqaz/myenv.git || exit 4

git push origin_http master    							|| exit 5

