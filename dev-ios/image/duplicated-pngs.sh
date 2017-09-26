#!/bin/bash

############################
##change current directory
############################
if [ `echo $0 | grep -c  "/"` -gt 0 ];then
    cd ${0%/*}
fi

cd ..
PROJ1=`find . -name '*.xib'`
PROJ2=`find . -name '*.[hm]'`

PROJ=`echo -e "${PROJ1}\n${PROJ2}"`

IFS="
"

TempResult=''

for png in `find . -name '*.png'`
do
    name=`basename -s .png $png`
    TempResult=`echo -e "${TempResult}\n${name}"`
done

echo -e "${TempResult}" | sort | uniq -c | sort -r | awk '$1 > 1 {print $2}' | more
