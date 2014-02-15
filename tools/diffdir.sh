#!/bin/bash --norc
shname=`echo "$0" | gawk -F / '{print $NF}'`
Description="Directory or svn url comparaison with vim"

if [ "$1" = "-k" ]; then
   USE_KDIFF3=y
   shift
fi

if [ $# -ne 2 -o "$1" = "-h" ]; then
   echo "Usage :"
   echo "   $shname [-h|-k] <Dir1|URL1> <Dir2|URL2>"
   echo
   echo "Description :"
   echo "   $Description"
   echo
   echo "Parameters :"
   echo "   [-h]       Display this help"
   echo "   [-k]       Use KDiff3 instead of gvim"
   echo
   exit 1
fi


# Check if args are url
res1=`echo $1 | grep "^[[:alpha:]]\+://"`
res2=`echo $2 | grep "^[[:alpha:]]\+://"`

if [ "$res1" != "" ]; then
   # Export dir to tmp dir
   dir1="$TMPDIR/${RANDOM}~"
   echo "Exporting $1 to $dir1 to be compared..."
   svn export $1 $dir1 > /dev/null;
   if [ $? != 0 ]; then
      echo "Error : Could not export $1 !!"
      exit 1;
   fi
   dirnamea='+let g:DirDiffNameA = "'$1'"'
else
   dir1=$1
   dirnamea=
fi

if [ "$res2" != "" ]; then
   # Export dir to tmp dir
   dir2="$TMPDIR/${RANDOM}~"
   echo "Exporting $2 to $dir2 to be compared..."
   svn export $2 $dir2 > /dev/null;
   if [ $? != 0 ]; then
      echo "Error : Could not export $2 !!"
      exit 1;
   fi
   dirnameb='+let g:DirDiffNameB = "'$2'"'
else
   dir2=$2
   dirnameb=
fi

if [ "$USE_KDIFF3" = "y" ]; then
   kdiff3 $dir1 $dir2 
else
   gvim -geometry 168x60 --nofork                    \
            +'let g:DirDiffExcludes = ".svn,.*.swp"' \
            "$dirnamea"                              \
            "$dirnameb"                              \
            +'DirDiff '"$dir1"' '"$dir2"''

   if [ "$dirnamea" != "" ]; then
      echo "Removing temp dir $dir1..."
      rm -rf "$dir1"
   fi

   if [ "$dirnameb" != "" ]; then
      echo "Removing temp dir $dir2..."
      rm -rf "$dir2"
   fi
fi

