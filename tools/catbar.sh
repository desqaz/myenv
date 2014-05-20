#!/bin/bash --norc

Verbose=n

File=$1
if [ $# -ne 1 ] || [ ! -e $File ]; then
   echo "Usage : $0 <File>" >&2
   exit 1
fi
FileSize=$(stat --format=%s $File)
ColCount=$(tput cols 2>/dev/null)
ColCount=$(stty size | awk '{print $2}' 2>/dev/null)
if [ "$ColCount" = "" ]; then
   ColCount=80
fi
ProgressBarSize=$(( $ColCount - 10))

BlockSize=$(( $FileSize / 100 ))
if [ $BlockSize -lt 4096 ]; then
   BlockSize=4096
fi
BlockCount=$(( $FileSize / $BlockSize))
LastBlockSize=$(( $FileSize % $BlockSize))

FillChar="#"
EmptyChar="-"

if [ "$Verbose" = "y" ]; then
   echo "FileSize : $FileSize" >&2
   echo "ProgressBarSize : $ProgressBarSize" >&2
   echo "BlockSize : $BlockSize" >&2
   echo "BlockCount : $BlockCount" >&2
   echo "LastBlockSize : $LastBlockSize" >&2
fi

displayProgressBar () {

   Percent=$1

   ProgressBar=
   FillCharCount=$(( $ProgressBarSize * $Percent / 100 ))
   EmptyCharCount=$(( $ProgressBarSize - $FillCharCount ))
   for (( j=0; j<$FillCharCount; j++ )); do
      ProgressBar="${ProgressBar}$FillChar"
   done
   for (( j=0; j<$EmptyCharCount; j++ )); do
      ProgressBar="${ProgressBar}$EmptyChar"
   done
   printf "[%s] [%d %%]\r" "$ProgressBar" "$Percent" >&2
   if [ $Percent -eq 100 ]; then
      echo "" >&2
   fi
}

for (( i=0; i<$BlockCount; i++ )); do
   Percent=$(( i * 100 / $BlockCount ))
   dd if=$File bs=$BlockSize count=1 skip=$i status=none
   displayProgressBar $Percent
done
dd if=$File bs=1 count=$LastBlockSize skip=$(( $BlockCount * $BlockSize )) status=none
displayProgressBar 100

