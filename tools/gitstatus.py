#!/usr/bin/env python2
# -*- coding: UTF-8 -*-

from __future__ import print_function

# change those symbols to whatever you prefer
symbols = {'ahead of': '↑', 'behind': '↓', 'prehash':':'}

from subprocess import Popen, PIPE

import sys
gitsym = Popen(['git', 'symbolic-ref', 'HEAD'], stdout=PIPE, stderr=PIPE)
branch, error = gitsym.communicate()

error_string = error.decode('utf-8')

if 'fatal: Not a git repository' in error_string:
	sys.exit(0)

branch = branch.strip()[11:]

res, err = Popen(['git','-c','color.status=false','status','--short','--untracked-files=all', '--ignore-submodules=dirty'], stdout=PIPE, stderr=PIPE).communicate()
err_string = err.decode('utf-8')
if 'fatal' in err_string:
	sys.exit(0)
nb_changed   = 0
nb_staged    = 0
nb_U         = 0
nb_untracked = 0
statusList = [(line[0], line[1]) for line in res.splitlines()]
for X,Y in statusList:
    if X == 'U' or Y == 'U':
        nb_U += 1
    elif X not in [' ', '?', '!']:
        nb_staged += 1
        if Y not in [' ', '?', '!']:
            nb_changed += 1
    elif Y not in [' ', '?', '!']:
        nb_changed += 1
    elif  X == '?' or Y == '?':
        nb_untracked += 1

staged = str(nb_staged)
changed = str(nb_changed)
conflicts = str(nb_U)
untracked = str(nb_untracked)
if not nb_changed and not nb_staged and not nb_U and not nb_untracked:
	clean = '1'
else:
	clean = '0'

remote = ''
remote_nosym = ''
remote_url = ''

if not branch: # not on any branch
	branch = symbols['prehash']+ Popen(['git','rev-parse','--short','HEAD'], stdout=PIPE).communicate()[0][:-1]
	remote_name = Popen(['git','remote'], stdout=PIPE).communicate()[0].strip()
	if remote_name:
		remote_url = Popen(['git','config','remote.%s.url' % remote_name], stdout=PIPE).communicate()[0].strip()
else:
	remote_name = Popen(['git','config','branch.%s.remote' % branch], stdout=PIPE).communicate()[0].strip()
	if remote_name:
		remote_url = Popen(['git','config','remote.%s.url' % remote_name], stdout=PIPE).communicate()[0].strip()
		merge_name = Popen(['git','config','branch.%s.merge' % branch], stdout=PIPE).communicate()[0].strip()
		if remote_name == '.': # local
			remote_ref = merge_name
		else:
			remote_ref = 'refs/remotes/%s/%s' % (remote_name, merge_name[11:])
		revgit = Popen(['git', 'rev-list', '--left-right', '%s...HEAD' % remote_ref],stdout=PIPE, stderr=PIPE)
		revlist = revgit.communicate()[0]
		if revgit.poll(): # fallback to local
			revlist = Popen(['git', 'rev-list', '--left-right', '%s...HEAD' % merge_name],stdout=PIPE, stderr=PIPE).communicate()[0]
		behead = revlist.splitlines()
		ahead = len([x for x in behead if x[0]=='>'])
		behind = len(behead) - ahead
		if behind:
			remote += '%s%s' % (symbols['behind'], behind)
			remote_nosym += '%s' % (behind)
		if ahead:
			remote += '%s%s' % (symbols['ahead of'], ahead)
			remote_nosym += '%s' % (ahead)

if not remote_url:
	remote_url = Popen(['git','svn','info','--url'], stdout=PIPE).communicate()[0].strip()

out = '\n'.join([
	str(branch),
	str(remote_url),
	remote,
	remote_nosym,
	staged,
	conflicts,
	changed,
	untracked,
	clean])
print(out)

