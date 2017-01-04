#! /usr/bin/python2

import sys
import re

ansiColors = {
	"black"   : "\x1b[0;1;30m"
,	"red"     : "\x1b[0;1;31m"
,	"green"   : "\x1b[0;1;32m"
,	"yellow"  : "\x1b[0;1;33m"
,	"blue"    : "\x1b[0;1;34m"
,	"magenta" : "\x1b[0;1;35m"
,	"cyan"    : "\x1b[0;1;36m"
,	"white"   : "\x1b[0;1;37m"
,	"reset"   : "\x1b[0m"
}


matchList = [
	# armcc
	# "..\drivers\gps\gps.c", line 561: Warning:  #177-D: function "uart3_rx_event_handler" was declared but never referenced
	# ..\drivers\gps\gps.c: 14 warnings, 0 errors
	# Warning: C9933W: Waiting for license...
	{
			"name"   : "armcc warning"
		,	"match"  : '"([^"]+)",\s+line\s+([0-9]+):\s+(Warning):.*$'
		,	"colors" : [ ansiColors['magenta'], ansiColors['cyan'], ansiColors['yellow'] ]
	}
	,{
			"name"   : "armcc error"
		,	"match"  : '"([^"]+)",\s+line\s+([0-9]+):\s+(Error):.*$'
		,	"colors" : [ ansiColors['magenta'], ansiColors['cyan'], ansiColors['red'] ]
	}
	,{
			"name"   : "armcc error/warning summary"
		,	"match"  : '([^:]+):\s+([0-9]+)\s+warnings,\s+([0-9]+)\s+errors.*$'
		,	"colors" : [ ansiColors['magenta'], ansiColors['yellow'], ansiColors['red'] ]
	}
	,{
			"name"   : "armcc generic warning"
		,	"match"  : '(Warning):\s+([^:]+):.*$'
		,	"colors" : [ ansiColors['yellow'], ansiColors['cyan'] ]
	}
	# gcc
	#
	,{
			"name"   : "gcc warning"
		,	"match"  : "([^:]+):([0-9]+):\s*([wW]arning).*$"
		,	"colors" : [ ansiColors['magenta'], ansiColors['cyan'], ansiColors['yellow'] ]
	}
	,{
			"name"   : "gcc error"
		,	"match"  : "([^:]+):([0-9]+):\s*([eE]rror).*$"
		,	"colors" : [ ansiColors['magenta'], ansiColors['cyan'], ansiColors['red'] ]
	}
	,{
			"name"   : "gcc fatal error"
		,	"match"  : "([^:]+):([0-9]+):\s*(fatal\s*error).*$"
		,	"colors" : [ ansiColors['magenta'], ansiColors['cyan'], ansiColors['red'] ]
	}
	,{
			"name"   : "gcc note"
		,	"match"  : "([^:]+):([0-9]+):\s*([nN]ote).*$"
		,	"colors" : [ ansiColors['magenta'], ansiColors['cyan'], ansiColors['white'] ]
	}
	#
	# lmake
	#
	,{
			"name"   : "summary"
		,	"match"  : "^\*\*\*\s+(SUMMARY).*$"
		,	"colors" : [ ansiColors['cyan'] ]
	}
	,{
			"name"   : "summary error"
		,	"match"  : "^\*\*\*\s+(error)\s+([>\w]+)\s+\|(.*)$"
		,	"colors" : [ ansiColors['red'], ansiColors['yellow'], ansiColors['magenta'] ]
	}
]

def colorLine(line):
	outputLine = line
	for matchElt in matchList:
		try:
			m = re.match(matchElt["match"], line)
			if m:
				beginIdx = 0
				outputLine = ""
				for g in range(1, len(m.groups()) + 1):
					outputLine +=                   \
							line[beginIdx:m.start(g)] \
						+  matchElt["colors"][g - 1] \
						+  line[m.start(g):m.end(g)] \
						+  ansiColors["reset"]
					beginIdx = m.end(g)
				outputLine += line[beginIdx:]
				break
		except:
			sys.stdout.write("-------------- Error in lm script --------------\n")
			sys.stdout.write(" Rule '%s' is broken\n" % matchElt["name"])
			sys.stdout.write(" Line : %s" % line)
			sys.stdout.write("------------------------------------------------\n")
			outputLine = line
	
	sys.stdout.write(outputLine)


if __name__ == "__main__":
	while True:
		line = sys.stdin.readline()
		if not line:
			break;
		colorLine(line)

