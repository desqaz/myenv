![MyEnv](https://raw.githubusercontent.com/desqaz/myenv/master/logos/myenv-logo.png)

| Branch | Status                                                                                                      |
|--------|-------------------------------------------------------------------------------------------------------------|
| master | [![Build Status](https://travis-ci.org/desqaz/myenv.svg?branch=master)](https://travis-ci.org/desqaz/myenv) |
| sndev  | [![Build Status](https://travis-ci.org/desqaz/myenv.svg?branch=sndev)](https://travis-ci.org/desqaz/myenv)  |
| jldev  | [![Build Status](https://travis-ci.org/desqaz/myenv.svg?branch=jldev)](https://travis-ci.org/desqaz/myenv)  |


# Cheat sheet
## vim
| Key             | Action                                       |
|-----------------|----------------------------------------------|
| F4              | Toggle functions list panel                  |
| F3              | Update functions list panel                  |
| F7              | Delete buffer                                |
| F9              | Remove current highlighting                  |
| Ctrl-D          | Toggle Nerd tree file explorer panel         |
| Ctrl-B          | Open MRU (Most Recently Used) panel          |
| Ctrl-PageUp     | Previous diff                                |
| Ctrl-PageDown   | Next diff                                    |
| ,l              | Reload ~/.vimrc                              |
| ,#              | Comment block with starting #                |
| ,/              | Comment block with starting //               |
| ,"              | Comment block with starting "                |
| ,d              | Add doxygen header above c function          |
| ,t              | Align ending '\' in multiple lines defines   |
| g-leftClick     | Go to symbol definition                      |
| Ctrl-t          | Come back after jumping to symbol definition |
| Ctrl-Tab        | Navigate across buffer                       |
| Ctrl-w s        | Split window horizontally                    |
| Ctrl-w v        | Split window vertically                      |
| Ctrl-w q        | Close window                                 |
| Ctrl-w arrow    | Navigate across windows                      |

## Shell alias
| Suffix alias | Command |
|--------------|---------|
| CEW          | '2>&1 &#124; sed -e "s/\(^[^:]\+:\)\([0-9:]*\)\([[:space:]]*\)\([wW]arning\)/\1\2\3\4/g;" \ <br>        -e "s/\(^[^:]\+:\)\([0-9:]*\)\([[:space:]]*\)\([nN]ote\)/\1\2\3\4/g;" \ <br>         -e "s/\(^[^:]\+:\)\([0-9:]*\)\([[:space:]]*\)\(fatal[[:space:]]error\)/\1\2\3\4/g;" \ <br>                           -e "s/\(^[^:]\+:\)\([0-9:]*\)\([[:space:]]*\)\([eE]rror\)/\1\2\3\4/g;"' <br>|
| F            | ' &#124; sed -e "s/\x1B\[[0-9;]*[mK]//g" ' |
| V            | ' &#124; vi -R -' |
| VF           | ' &#124; sed -e "s/\x1B\[[0-9;]*[mK]//g" &#124; vi -R -' |
| VGP          | '&#124; awk -F : "{print $1}" &#124; sort -u &#124; xargs gvim' |
| XGP          | '&#124; xargs grep --color=auto -IsHnr' |

| Alias    | Command |
|----------|---------|
| _        | '$TOOLS_ROOT/dt.sh' |
| _vi      | 'gvim -g -geometry 200x60' |
| a        | alias |
| bcp      | bcompare |
| cls      | clear |
| cpf      | 'cp -rf' |
| e        | export |
| ga       | ' git add' |
| gb       | ' git branch' |
| gci      | 'git commit' |
| gck      | 'git checkout' |
| gd       | ' git diff' |
| glog     | 'git log --graph --format="%Cgreen%h%Creset %Cblue[%an - %ar]%Creset %s"' |
| gls      | 'git log -2 --stat' |
| gm       | ' git commit --amend --no-edit' |
| gme      | 'git commit --amend' |
| gp       | 'grep  -Is --exclude-dir=.svn --exclude-dir=.git --exclude-dir=%MAKE --exclude-dir=%STATE --exclude-dir=products -r -n --color=auto' |
| gpa      | 'grep -r -n --color=auto' |
| gpi      | 'grep -Is --exclude-dir=.svn --exclude-dir=.git --exclude-dir=%MAKE --exclude-dir=%STATE --exclude-dir=products -ri -n --color=auto' |
| gpl      | 'git pull' |
| gpp      | 'git pull && git push' |
| gps      | 'git push' |
| gs       | ' git status' |
| h        | 'history 50' |
| hh       | 'h -50' |
| k        | '$TOOLS_ROOT/k.sh' |
| ka       | '$TOOLS_ROOT/k.sh -a' |
| lW       | 'lshow -D' |
| la       | 'll -a' |
| ll       | 'ls -lh' |
| ls       | 'ls --color=auto' |
| lt       | 'tree  -aCl      -I .svn' |
| lta      | 'tree -pshaClug -I .svn' |
| ltd      | 'tree -aCld     -I .svn' |
| ltr      | 'tree -paCl     -I .svn' |
| lts      | 'tree -shaCl    -I .svn' |
| lu       | 'ls | xargs du -sh' |
| lw       | 'lshow -d' |
| md       | mkdir |
| md5      | md5sum |
| mk       | '$TOOLS_ROOT/dt.sh lmake' |
| mwstat   | 'lmstat -c 27020@signisntp -f' |
| rcz      | 'source ~/.zshrc' |
| resource | '. ~/.bashrc' |
| rmf      | 'rm -rf' |
| sdi      | 'svn diff --diff-cmd=/home/jlabarthe/myenv/tools/svn_diff_wrapper_bc' |
| sdiv     | 'svn diff --diff-cmd=/home/jlabarthe/myenv/tools/svn_diff_wrapper_vi' |
| sha      | sha1sum |
| so       | setopt |
| tp       | 'top -d 1' |
| u        | unset |
| uo       | unsetopt |
| which    | '\which' |

