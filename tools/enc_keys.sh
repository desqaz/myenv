#! /bin/sh

myenv=$HOME/myenv
myenvcusto=$myenv/custom/user/$USER
DefOutEncFile=$myenvcusto/enck.txt

if [ $# -ne 1 ]; then
	OutEncFile=$DefOutEncFile
else
	if [ "$1" = "-h" ]; then
		echo "Usage : $0 <output_enc_file>"
		echo " By default <output_enc_file> = $DefOutEncFile"
		exit 0
	fi
	OutEncFile=$1
fi

touch $OutEncFile
if [ $? -ne 0 ]; then
	echo "Unable to create output enc file"
	exit 1
fi

KeysList=$(find $HOME/.ssh -maxdepth 1  -name "id_*")

if [ "$KeysList" = "" ]; then
	echo "No keys to encode"
	exit 0
fi

TmpDir=$(mktemp -d)
if [ ! -d $TmpDir ]; then
	echo "Unable to create temp dir"
	exit 1
fi

echo "Build keys tar ..."
KeysDir=$TmpDir/keys
mkdir $KeysDir
cp -a $KeysList $KeysDir/.
KeysTar=$TmpDir/keys.tar.bz2
tar -cjf $KeysTar -C $KeysDir .

echo "Encrypt keys tar ..."
openssl aes-256-cbc -in $KeysTar -a > $OutEncFile

rm -rf $TmpDir

echo "All done !"
