#! /bin/sh

ManPageName="..."
ParentPid=$$
while [ 1 ]; do
	if [ "$ParentPid" = "1" ]; then
		break
	fi
	CommandName=$(ps -p $ParentPid -o args=)
	if [ "$(echo $CommandName | awk '{print $1}' | sed 's@^.*\(man\)$@\1@')" = "man" ]; then
		ManPageName=$(echo $CommandName | awk '{print $2}')
		break
	fi
	ParentPid=$(ps -p $ParentPid -o ppid=)
done

ManpageTitle="MANPAGE\ :\ $ManPageName"

col -b | gvim  -c "set ft=man nomod nolist titlestring=$ManpageTitle" - > /dev/null

