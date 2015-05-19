#!/bin/bash --norc

currPwd=$PWD
myenv=$HOME/myenv
myenvcusto=$myenv/custom/user/$USER

cd $HOME

# link rc files
for rc in $(find $myenv -follow -maxdepth 1  -type f  -name ".*rc"); do
	ln -svf $rc
done

if [ ! -f $myenvcusto/.myenvrc ]; then
	echo "export MYENV_NAME=$USER"      >  .myenvrc
	echo "export MYENV_HOST=$HOSTNAME"  >> .myenvrc
else
	ln -svf $myenvcusto/.myenvrc
	for rc in $(find $myenvcusto -follow -type f -name ".*rc"); do
		ln -svf $rc
	done
fi

# link exotic files
ln -svf $myenv/git/.gitk
[ -f $myenvcusto/svn/config ] && ln -svf $myenvcusto/svn/config .subversion/config

# needed user tree
[ ! -d $HOME/tmp ]    && mkdir -v $HOME/tmp
[ ! -d $HOME/.local ] && mkdir -v $HOME/.local

# enjoy!

case $(ps -p $PPID -o comm=) in
	zsh)
		. .zshrc ;;
	bash)
		. .bashrc ;;
	*)
		zsh ;;
esac

cd $currPwd

