#!/bin/bash --norc

currPwd=$PWD

myenv=$(cd $(dirname $0) 2>&1 > /dev/null && pwd)
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
[ -f $myenvcusto/.gitconfig ] && ln -svf $myenvcusto/.gitconfig

# needed user tree
[ ! -d $HOME/tmp ]        && mkdir -vp $HOME/tmp
[ ! -d $HOME/tmp/vim ]    && mkdir -vp $HOME/tmp/vim
[ ! -d $HOME/.local/bin ] && mkdir -vp $HOME/.local/bin
[ ! -d $HOME/.local/lib ] && mkdir -vp $HOME/.local/lib

DepsLst=$(mktemp)
cat $myenv/tools/deps.lst | perl -p -e 's/\\\n//' > $DepsLst

#
# Packages installation
#
echo "[0;32mInstalling deps packages[0m"
type apt-get > /dev/null

if [ $? -eq 0 ]; then
	for dep in $(cat $DepsLst | grep '^pkg' | awk '{print $2}'); do
		dpkg-query -l "$dep" >/dev/null 2>/dev/null
		if [ "$?" -ne 0 ]; then
			sudo apt-get install "$dep" -y
		else 
			echo "[0;32m    --> $dep already installed[0m"
		fi
	done
fi

#
# Pip package installation 
#
echo "[0;32mInstalling python deps[0m"
type pip > /dev/null

if [ $? -eq 0 ]; then
	for dep in $(cat $DepsLst | grep '^pip' | awk '{print $2}'); do
		sudo pip install $dep
	done
fi

#
# Others installation
#
echo "[0;32mInstalling others deps[0m"

IFS=$'\n'
for dep in $(cat $DepsLst | grep '^cmd' |  awk '{for(i=1;i<$$NF;i++) $i=""; print}'); do
	echo "[0;33m$dep[0m"
	sh -c "$dep"
done

rm -f $DepsLst

# Put keys if exists
if [ ! -d $HOME/.ssh ]; then
	if [ -f $myenvcusto/enck.txt ]; then
		mkdir $HOME/.ssh
		echo "Decrypting keys for installation ..."
		openssl aes-256-cbc -d -in $myenvcusto/enck.txt -a | tar -C $HOME/.ssh -xjf -
		if [ $? -ne 0 ]; then rm -rf $HOME/.ssh; fi
	fi
fi

if [ "$USER" != "travis" ]; then
	# Set zsh by default
	CurrentShell=$(cat /etc/passwd | grep $USER | cut -d ':' -f 7)
	if [ "$CurrentShell" != "/bin/zsh" ]; then
		echo "[0;32mSetting zsh by default with chsh[0m"
		chsh -s /bin/zsh
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

