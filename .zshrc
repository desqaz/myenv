if [[ $- == *i* ]]; then
	export MYENV_ROOT=$HOME/myenv

	export LC_ALL=C
	export USE_SPLASH=
	export MANPAGER=manpagervim.sh
	export SHELL=$(which zsh)

	export TOOLS_ROOT=$MYENV_ROOT/tools
	export TOOLS_BIN=$MYENV_ROOT/bin
	export PREBUILTS_BIN=$MYENV_ROOT/prebuilts/bin
	export LOCAL_BIN=$HOME/.local/bin
	export LOCAL_LIB=$HOME/.local/lib
	export LOCAL_PKG_CONFIG_PATH=$HOME/.local/lib/pkgconfig
	export LOCAL_MAN=$HOME/.local/share/man

	export MYPATH__PATH=$TOOLS_ROOT:$TOOLS_BIN:$PREBUILTS_BIN:$LOCAL_BIN
	export PATH=$MYPATH__PATH:$PATH:/usr/sbin:/sbin

	export MYPATH__LD_LIBRARY_PATH=$LOCAL_LIB
	export LD_LIBRARY_PATH=$MYPATH__LD_LIBRARY_PATH:$LD_LIBRARY_PATH

	export MYPATH__PKG_CONFIG_PATH=$LOCAL_PKG_CONFIG_PATH
	export PKG_CONFIG_PATH=$MYPATH__PKG_CONFIG_PATH:$PKG_CONFIG_PATH

	export MYPATH__MANPATH=$LOCAL_MAN
	export MANPATH=$MYPATH__MANPATH:$MANPATH

	export GVIM_PATH=$MYENV_ROOT/gvim
	export SH_PATH=$MYENV_ROOT/sh
	export ZSH_PATH=$MYENV_ROOT/zsh

	export GPG_TTY=$(tty)


	# Shell variables
	for f in $(find $SH_PATH -type d); do
		[ -f $f/vars ] && . $f/vars
	done

	# ZSH 
	. $ZSH_PATH/init
	
	# Shell functions
	for f in $(find $SH_PATH -type d); do
		[ -f $f/funktions ] && . $f/funktions
	done

	# RC scripts
	for file in $(find $SH_PATH/rc.d -type f | sort -n 2>/dev/null); do
		. $file
	done

	umask 007

	[ -f $HOME/.myenvrc ] && . $HOME/.myenvrc

	export MYENV_CUSTOM_USER_ROOT=$MYENV_ROOT/custom/user/$MYENV_NAME
	[ -f $MYENV_CUSTOM_USER_ROOT/zshrc ] && . $MYENV_CUSTOM_USER_ROOT/zshrc

	for file in $(find $MYENV_CUSTOM_USER_ROOT/rc.d -type f 2>/dev/null | sort -n 2>/dev/null); do
		. $file
	done

	return 0
fi
