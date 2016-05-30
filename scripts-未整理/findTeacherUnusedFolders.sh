#!/bin/bash

#############################
###change current directory
#############################
if [ `echo $0 | grep -c  "/"` -gt 0 ];then
    cd ${0%/*}
fi

cd ..

FOLDERS=`find . -type d`
IFS="
"
for folder in ${FOLDERS}
do
    count=`ls -l ${folder} | wc -l`
    if [ ${count} -le 0 ];then
        needOutput=1

        prefix1=`echo ${folder} | cut -c 1-7`
        prefix2=`echo ${folder} | cut -c 1-21`
        if [ ${prefix1} = './.git/' ]; then
            needOutput=0
        fi

        if [ ${needOutput} -eq 1 ]; then
            echo "${folder} is empty now...."
        fi
    fi   
done

echo -e "\n#########################################################################################\n"
