if [[ $- == *i* ]]; then
   export MYENV_ROOT=$HOME/myenv
   
   export LC_ALL=C
   export USE_SPLASH=
   export MANPAGER=manpagervim.sh
   export SHELL=$(which zsh)
   
   export TOOLS_ROOT=$MYENV_ROOT/tools
   export TOOLS_BIN=$MYENV_ROOT/bin

	export MYPATH__PATH=$TOOLS_ROOT:$TOOLS_BIN:$HOME/.local/bin:$PATH
	export PATH=$MYPATH__PATH:$PATH
	
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
