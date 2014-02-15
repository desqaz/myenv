#! /bin/sh

ManpageTitle=$(ps -p $(ps -p $$ -o ppid=) -o args= | gawk '{print $NF}')
ManpageTitle="MANPAGE\ :\ $ManpageTitle"

col -b | gvim -c "set ft=man nomod nolist titlestring=$ManpageTitle" - > /dev/null 

