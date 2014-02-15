#!/bin/bash --norc
shname=`echo "$0" | gawk -F / '{print $NF}'`

. $LIBS_PATH/colors
. $LIBS_PATH/debug


trap '' INT

if [ $# -lt 1 ]; then
   echo "--------------------------------------------------------------------------------"
   echo "Usage : $shname [command]"
   echo "   command : A shell/script command"
   echo "--------------------------------------------------------------------------------"
   exit 1
fi


declare -i start_date_sec=`date +%s`
declare -i start_date_ms=`date +%N | sed s@'^0'@@`

$*
ret=$?

declare -i end_date_ms=`date +%N | sed s@'^0'@@`
declare -i end_date_sec=`date +%s`

declare -i duration_ms=(end_date_ms-start_date_ms)/1000000
declare -i duration=end_date_sec-start_date_sec

declare -i min=duration/60
declare -i sec=duration%60


duration_msg=

if [ $min -gt 0 ]; then
   duration_msg="$min minute"
   [ $min -gt 1 ] && duration_msg="${duration_msg}s"
   duration_msg="${duration_msg} "
fi

duration_msg="${duration_msg}$sec sec"

if [ $sec -eq 0 -a $min -eq 0 ]; then
   duration_msg="$duration_ms ms"
fi


date=`date +%H:%M:%S`

if [ $ret -eq 0 ]; then
   status="${COL_SUCCESS}OK${COL_RST}"
else
   status="${COL_ERROR}KO${COL_RST}"
fi


IFS=" "
if [ $ret -eq 0 ]; then
   date="${COL_SUCCESS}${date}${COL_RST}"
else
   date="${COL_ERROR}${date}${COL_RST}"
fi

DirName="`dirname $PWD`/"
ListArg=`echo $* | sed s@"$DirName"@@g`


disp-frame "--------------------------------------------------------------------------------"
echo "[$date] ${COL_BOLD}${ListArg}${COL_RST} [$status] ($duration_msg)" | tee .dt.log
disp-frame "--------------------------------------------------------------------------------"

exit $ret

