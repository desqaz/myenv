#!/bin/bash --norc

currPwd=$PWD

myenv=$(cd $(dirname $0) 2&>1 > /dev/null && pwd)
myenvcusto=$myenv/custom/user/$USER

cd $HOME

# link rc files
echo "Linking rc files"

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


#
# Packages installation
#
echo "[0;32mInstalling deps packages[0m"
type apt-get 2&>1 > /dev/null

if [ $? -eq 0 ]; then
	for dep in $(cat $myenv/tools/deps.lst | grep '^pkg' | awk '{print $2}'); do
		sudo apt-get install "$dep"
	done
fi

#
# Binaries installation 
#
echo "[0;32mInstalling deps binaries[0m"
type yum 2&>1 > /dev/null

if [ $? -eq 0 ]; then
	for dep in $(cat $myenv/tools/deps.lst | grep '^pip' | awk '{print $2}'); do
		sudo pip install $dep
	done
fi

#
# Others installation
#
echo "[0;32mInstalling others deps[0m"

for dep in "$(cat $myenv/tools/deps.lst | grep '^cmd' |  awk '{for(i=1;i<$$NF;i++) $i=""; print}')"; do
	echo "[0;33m$dep[0m"
	sh -c "$dep"
done

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

