#!/bin/bash --norc
shname=`echo "$0" | gawk -F / '{print $NF}'`

env | grep -n --color=auto $1

