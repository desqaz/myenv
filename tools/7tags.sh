#!/bin/sh

# Set Variables
WorksetPath=$(pwd)

TAGS_IGNORE_FILE=$WorksetPath/.7tags.ignore
TAGS_ADD_FILE=$WorksetPath/.7tags.add
VIMTAGSPATHROOT=$HOME/.vimtagsroot
VIMTAGSPATH=$VIMTAGSPATHROOT/$(echo $WorksetPath | sed -e 's/[^[:alnum:]]/_/g')
if test -d $VIMTAGSPATH; then
	rm -rf $VIMTAGSPATH
fi
mkdir -p $VIMTAGSPATH
echo "Tags artifact will be stored at $VIMTAGSPATH" >&2
CSCOPE_DB="$VIMTAGSPATH/cscope.out"
tagsfile="$VIMTAGSPATH/tags"
TAGS_HL="$VIMTAGSPATH/tags_hl.vim"
FilesList=$VIMTAGSPATH/files.list
VimServerName="$WorksetPath"

# Set default behaviour
UpdateFilesList=y
UpdateTags=y

# Parse argument
while [ $# -gt 0 ]; do
   case "$1" in
      -nolist)
         UpdateFilesList=n
         shift
         ;;
      -notag)
         UpdateTags=n
         shift
         ;;
   esac
done

IgnoreDirCmd="-path '*\.svn' -prune -o -path '*\.git' -prune -o "

# Grap ignore dir list
if [ -e $TAGS_IGNORE_FILE ]; then
   IgnoreDirList=$(cat $TAGS_IGNORE_FILE | dos2unix |sed -e 's/^[[:space:]]*#.*$//' -e '/^$/d')
fi
for dir in $IgnoreDirList; do
   IgnoreDirCmd=$(echo -n "$IgnoreDirCmd -path '"'*'"$dir""' -prune -o ")
   echo "  -> Ignoring directory : $dir ..." >&2
done

if [ "$UpdateFilesList" = "y" ]; then
   echo "Updating files list ..." >&2
   mkdir -p $VIMTAGSPATH
cat << EOF > $VIMTAGSPATH/find_cmd
find     $WorksetPath/ $IgnoreDirCmd -type f -name '*.h'                  >  $FilesList
find     $WorksetPath/ $IgnoreDirCmd -type f -name '*.hpp'                >> $FilesList
find     $WorksetPath/ $IgnoreDirCmd -type f -name '*.c'                  >> $FilesList
find     $WorksetPath/ $IgnoreDirCmd -type f -name '*.cc'                 >> $FilesList
find     $WorksetPath/ $IgnoreDirCmd -type f -name '*.cpp'                >> $FilesList
find     $WorksetPath/ $IgnoreDirCmd -type f -name '*.config'             >> $FilesList
find     $WorksetPath/ $IgnoreDirCmd -type f -regex '.*\.make?$' -print   >> $FilesList
find     $WorksetPath/ $IgnoreDirCmd -type f -iname 'makefile' -print     >> $FilesList
EOF
if [ -e $TAGS_ADD_FILE ]; then
   AddDirList=$(cat $TAGS_ADD_FILE | dos2unix | sed -e 's/^[[:space:]]*#.*$//' -e '/^$/d')
fi
for dir in $AddDirList; do
   echo "  -> Adding directory : $dir ..." >&2
cat << EOF >> $VIMTAGSPATH/find_cmd
find    $WorksetPath/$dir/  -type f -name '*.h'                  >> $FilesList
find    $WorksetPath/$dir/  -type f -name '*.hpp'                >> $FilesList
find    $WorksetPath/$dir/  -type f -name '*.c'                  >> $FilesList
find    $WorksetPath/$dir/  -type f -name '*.cc'                 >> $FilesList
find    $WorksetPath/$dir/  -type f -name '*.cpp'                >> $FilesList
find    $WorksetPath/$dir/  -type f -name '*.config'             >> $FilesList
find    $WorksetPath/$dir/  -type f -regex '.*\.make?$' -print   >> $FilesList
find    $WorksetPath/$dir/  -type f -iname 'makefile' -print     >> $FilesList
EOF
done
   . $VIMTAGSPATH/find_cmd
fi

if [ "$UpdateTags" = "y" ]; then
   if [ -e $FilesList ]; then
      echo "Updating CSCOPE database ..." >&2
      cscope -Rbkc -i $FilesList -f $CSCOPE_DB 2>/dev/null

      echo "Updating CTAGS database ..." >&2
      ctags --fields=+lStn --extra=+f --tag-relative=yes -L $FilesList -f $tagsfile  && sed -i '/EXPORT_SYMBOL/d' $tagsfile
      sed -n '/^\(\w\+\)\t[^\"]*\"\t\(t\|f\|d\|e\).*$/ s//syntax keyword c_\2 \1/p' $tagsfile | sort -u > $TAGS_HL
   else
      echo "Files list does not exist, you cannot use -nolist option !" >&2
      exit 255
   fi
fi

# Build file to source for use in vim
cat << EOF > $VIMTAGSPATH/export_var_for_vim
export VIMTAGSPATH="$VIMTAGSPATH"
export CSCOPE_DB="$CSCOPE_DB"
export tagsfile="$tagsfile"
export TAGS_HL="$TAGS_HL"
export VIMPROJSERVERNAME="$VimServerName"
EOF

echo $VIMTAGSPATH/export_var_for_vim

