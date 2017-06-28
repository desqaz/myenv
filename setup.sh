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
		sudo "$@"
	else
		echo "[0;1;33m    --> $@ ignored (need sudo)[0m"
	fi
}

myenv=$(cd $(dirname $0) 2>&1 > /dev/null && pwd)
myenvcusto=$myenv/custom/user/$USER
myenvsetup=$myenv/setup
myenvdepsdir=$myenvsetup/deps.d
myenvdepscustodir=$myenvcusto/setup/deps.d

cd $HOME

# Link myenv root
if [ $myenv != $HOME/myenv ] && [ ! -e $HOME/myenv ]; then
	ln -sv $myenv $HOME/myenv
fi

# link rc files
echo "Linking rc files"

rclist="$myenv/.bashrc $myenv/.zshrc $myenv/.vimrc $myenvcusto/.minirc.dfl"

for rc in $rclist; do ln -svf $rc; done


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

export myenvDistro=

if [ "$1" != "nopack" ]; then
	#
	# Packages installation
	#
	echo "[0;32mInstalling deps packages[0m"

	type apt-get 2> /dev/null
	if [ $? -eq 0 ]; then
		myenvDistro='debian'
		function packageGet {
		   	SUDO apt-get install "$1" -y
			return $?
	   	}
		function packageCheck {
		   	dpkg-query -l "$1" 2>/dev/null | grep "^ii[[:space:]]*$1"
	   	}
		function packageSearch {
			echo $1 #stub
		}
	fi

	type pacman 2> /dev/null
	if [ $? -eq 0 ]; then
		myenvDistro='arch'
		SUDO pacman -Sy
		function packageGet   {
		   	SUDO pacman --color auto -S --force --noconfirm "$1"
			return $?
	   	}
		function packageCheck {
		   	pacman --color auto -Q "$1" 2>/dev/null
	   	}
		function packageSearch {
		 	pacsearch "^$dep$"	
		}
	fi
	for depnames in $(cat $DepsLst | grep '^pkg' | awk '{print $2}'); do
		depOk=0
		for dep in $(echo $depnames | awk -F ',' '{for(i=1; i<=NF; i++){print $i}}'); do
			if [ $dep = '-' ] && [ $depOk = 0 ]; then
				echo "[0;33m$depnames ignored[0m"
			   	depOk=2; break;
		   	fi
			if [ -z "$(packageCheck $dep)" ]; then
				if [ -n "$(packageSearch $dep)" ]; then
					packageGet $dep
					if [ $? -eq 0 ]; then depOk=1; break; fi
			   	fi
			else 
				echo "[0;1;36m$dep[0;36m already installed[0m"
				depOk=1; break;
			fi
		done
		if [ $depOk = 0 ]; then
			echo "[0;1;31mNo corresponding package installed for '$depnames'[0m"
		fi
	done

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
fi

#
# Others installation
#
echo "[0;32mInstalling deps.d[0m"
for dep in $(find $myenvdepsdir -type f | sort -n 2>/dev/null); do
	echo "[0;1;34m$dep[0m"
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
		echo "[0;1;34m$dep[0m"
		bash -c "$dep"
	done
fi

#
# Others custom installation
#
if [ -d $myenvdepscustodir ]; then
	echo "[0;32mInstalling custom deps.d[0m"
	for dep in $(find $myenvdepscustodir -type f | sort -n 2>/dev/null); do
		echo "[0;1;34m$dep[0m"
		. $dep
	done
fi

rm -f $DepsLst

# SSH config
if [ ! -d $HOME/.ssh ]; then
	if [ -f $myenvcusto/enck/ssh ]; then
		mkdir $HOME/.ssh
		echo "[0;1;36mInstalling ssh key...[0m"
		openssl aes-256-cbc -md md5 -d -in $myenvcusto/enck/ssh -a | tar -C $HOME/.ssh -xjf -
		if [ $? -ne 0 ]; then rm -rf $HOME/.ssh; fi
	fi
fi

[ -f $myenvcusto/.sshconfig ] && ln -svf $myenvcusto/.sshconfig $HOME/.ssh/config

# BCOMPARE config
if [ ! -f $HOME/.config/bcompare/BC4Key.txt ] && [ -f $myenvcusto/enck/bcp ]; then
	echo "[0;1;36mInstalling bcompare key...[0m"
	mkdir -vp $HOME/.config/bcompare
	openssl aes-256-cbc -md md5 -d -in $myenvcusto/enck/bcp -a > $HOME/.config/bcompare/BC4Key.txt
	if [ $? -ne 0 ]; then rm -rf $HOME/.config/bcompare/BC4Key.txt; fi
fi

if [ "$USER" != "travis" ]; then
	# Set zsh by default
	CurrentShell=$(cat /etc/passwd | grep $USER | cut -d ':' -f 7)
	if [ "$CurrentShell" != "/bin/zsh" ]; then
		echo "[0;1;36mSetting zsh by default with chsh...[0m"
		chsh -s /bin/zsh
	fi
fi


# source custom rc



# enjoy!

case $(ps -p $PPID -o comm=) in
	zsh)
		. $HOME/.zshrc ;;
	bash)
		. $HOME/.bashrc ;;
	*)
		zsh ;;
esac

cd $currPwd

