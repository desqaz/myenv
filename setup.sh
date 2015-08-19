#!/bin/bash --norc

currPwd=$PWD
isSudo=255

function SUDO () {
	if [ $isSudo -eq 255 ]; then
		echo "Check sudo rights..."
		sudo -l > /dev/null 2>/dev/null
		if [ $? -eq 0 ]; then
			isSudo=1
		else
			isSudo=0
		fi
	fi
	if [ $isSudo -eq 1 ]; then
		sudo $@
	else
		echo "[0;1;33m    --> $@ ignored (need sudo)[0m"
	fi
}

myenv=$(cd $(dirname $0) 2>&1 > /dev/null && pwd)
myenvcusto=$myenv/custom/user/$USER
myenvsetup=$myenv/setup
myenvdepsdir=$myenvsetup/deps.d

cd $HOME

# Link myenv root
if [ $myenv != $HOME/myenv ] && [ ! -e $HOME/myenv ]; then
	ln -sv $myenv $HOME/myenv
fi

# link rc files
echo "Linking rc files"

for rc in $myenv/.bashrc $myenv/.zshrc $myenv/.vimrc $myenv/.tmux.conf; do
	ln -svf $rc
done

if [ ! -f .myenvrc ]; then
	echo "export MYENV_NAME=$USER"      >  .myenvrc
	echo "export MYENV_HOST=$HOSTNAME"  >> .myenvrc
fi

cp -vf $myenvcusto/.myenv.extravim $HOME

# link exotic files
ln -svf $myenv/git/.gitk
[ -f $myenvcusto/svn/config ] && mkdir -vp .subversion && ln -svf $myenvcusto/svn/config .subversion/config
[ -f $myenvcusto/.gitconfig ] && ln -svf $myenvcusto/.gitconfig

# needed user tree
[ ! -d $HOME/tmp ]        && mkdir -vp $HOME/tmp
[ ! -d $HOME/tmp/vim ]    && mkdir -vp $HOME/tmp/vim
[ ! -d $HOME/.local/bin ] && mkdir -vp $HOME/.local/bin
[ ! -d $HOME/.local/lib ] && mkdir -vp $HOME/.local/lib

DepsLst=$(mktemp)
cat $myenvsetup/deps.lst | perl -p -e 's/\\\n//' > $DepsLst

#
# Packages installation
#
echo "[0;32mInstalling deps packages[0m"
type apt-get > /dev/null 2> /dev/null
if [ $? -eq 0 ]; then
	for dep in $(cat $DepsLst | grep '^pkg' | awk '{print $2}'); do
		isInstalled=$(dpkg-query -l "$dep" 2>/dev/null | grep "^ii[[:space:]]*$dep")
		if [ "$?" -ne 0 ] || [ -z "$isInstalled" ]; then
			SUDO apt-get install "$dep" -y
		else 
			echo "[0;36m    --> $dep already installed[0m"
		fi
	done
fi

#
# easy_install package installation 
#
echo "[0;32mInstalling python easy_install deps[0m"
type easy_install > /dev/null 2> /dev/null
if [ $? -eq 0 ]; then
	for dep in $(cat $DepsLst | grep -w '^eins' | awk '{print $2}'); do
		SUDO easy_install -U $dep
	done
fi

#
# easy_install3 package installation 
#
echo "[0;32mInstalling python3 easy_install deps[0m"
type easy_install3 > /dev/null 2> /dev/null
if [ $? -eq 0 ]; then
	for dep in $(cat $DepsLst | grep -w '^eins3' | awk '{print $2}'); do
		SUDO easy_install3 -U $dep
	done
fi

#
# Pip package installation 
#
echo "[0;32mInstalling python pip deps[0m"
type pip > /dev/null 2> /dev/null
if [ $? -eq 0 ]; then
	for dep in $(cat $DepsLst | grep -w '^pip' | awk '{print $2}'); do
		SUDO pip install --upgrade $dep
	done
fi

#
# Pip3 package installation 
#
echo "[0;32mInstalling python3 pip deps[0m"
type pip3 > /dev/null 2> /dev/null
if [ $? -eq 0 ]; then
	for dep in $(cat $DepsLst | grep -w '^pip3' | awk '{print $2}'); do
		SUDO pip3 install --upgrade $dep
	done
fi

#
# Others installation
#
echo "[0;32mInstalling deps.d[0m"
for dep in $(find $myenvdepsdir -type f); do
	echo "[0;33m$dep[0m"
	. $dep
done

#
# Extra command 
#
echo "[0;32mExecuting extra cmd[0m"
IFS=$'\n'
export -f SUDO
export isSudo
if [ $? -eq 0 ]; then
	for dep in $(cat $DepsLst | grep -w '^cmd' |  awk '{for(i=1;i<$$NF;i++) $i=""; print}'); do
		echo "[0;33m$dep[0m"
		bash -c "$dep"
	done
fi

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

