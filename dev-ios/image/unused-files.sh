#!/bin/bash

############################
##change current directory
############################
if [ `echo $0 | grep -c  "/"` -gt 0 ];then
    cd ${0%/*}
fi

cd ..
ALLHEADERS=`find . -name '*.h' | sed -n '/.*FB.*/!p' | sed -n '/.*ASI.*/!p'`
PROJ=`find . -name '*.[hm]'`

IFS="
"
for file in ${ALLHEADERS}
do
    name=`basename $file`
    result=`grep $name $PROJ`
    count=`echo -e "${result}" | wc -l`
    if [ ${count} -le 2 ];then
        echo "$file is unused now...."
    fi   
done


