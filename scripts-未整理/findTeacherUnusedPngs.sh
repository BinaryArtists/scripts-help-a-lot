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
PROJ3=`find . -name '*.storyboard'`

PROJ=`echo -e "${PROJ1}\n${PROJ2}\n${PROJ3}"`

IFS="
"
for png in `find . -name '*.png' ! -name 'Default*.png' ! -name '*@3x.png'`
do
    name=`basename -s .png $png`
    name=`basename -s ~ipad $name`
    name=`basename -s @2x $name`
    if ! grep -q $name $PROJ; then
        echo "$png is not referenced"
    fi
done
