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
	export VIM=$GVIM_PATH
	export LIBS_PATH=$TOOLS_ROOT/libs
	export ZSH_PATH=$MYENV_ROOT/zsh

	. $ZSH_PATH/profile

	for file in $(find $ZSH_PATH/customrc -type f 2>/dev/null); do
		. $file
	done

	umask 007
fi
