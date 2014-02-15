
export MYENV_ROOT=$HOME/myenv

export LC_ALL=C
export USE_SPLASH=y
export MANPAGER=manpagervim.sh
export SHELL=$(which zsh)

export TOOLS_ROOT=$MYENV_ROOT/tools
export PATH=$TOOLS_ROOT:$PATH
export GVIM_PATH=$MYENV_ROOT/gvim
export VIM=$GVIM_PATH
export LIBS_PATH=$TOOLS_ROOT/libs
export ZSH_PATH=$MYENV_ROOT/zsh

. $ZSH_PATH/profile

umask 007

