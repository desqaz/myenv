#!/bin/bash --norc

currPwd=$PWD
myenv=$HOME/myenv
myenvcusto=$myenv/custom/user/$USER

cd $HOME

# link rc files
for rc in $myenv/.bashrc $myenv/.zshrc $myenv/.vimrc $myenv/.tmux.conf; do
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

# Put keys if exists
if [ ! -d $HOME/.ssh ]; then
	if [ -f $myenvcusto/enck.txt ]; then
		mkdir $HOME/.ssh
		echo "Decrypting keys for installation ..."
		openssl aes-256-cbc -d -in $myenvcusto/enck.txt -a | tar -C $HOME/.ssh -xjf -
		if [ $? -ne 0 ]; then rm -rf $HOME/.ssh; fi
	fi
fi

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

