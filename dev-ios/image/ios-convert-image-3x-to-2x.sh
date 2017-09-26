#! /bin/bash

# print usage
usage() {
    cat << EOF
    Usage:
        convertImage.sh <src directory> <dest directory>
EOF
}

if [ $# -ne 1 ]; then
    usage
    exit 1
fi

# $1 is dst file
function process() {
    src_file=$1
    dst_dir=$(pwd)

    echo -e "\033[32mprocess file name: $src_file \033[0m" 

    # 获得去掉文件名的纯路径
    src_path=`dirname $src_file`

    # 获得去掉路径的纯文件名
    filename=`basename $src_file`

    # 获得文件名字 (不包括扩展名)
    name=`echo "$filename" | cut -d'.' -f1`

    # remove @3x in filename if there is
    name=`echo "$name" | cut -d"@" -f1`

    # 获得文件扩展名
    extension=`echo "$filename" | cut -d'.' -f2`
    dest_file="$dst_dir/${name}@2x.${extension}"

    convert $src_file -resize 66% $dest_file
}

# search file
function search_and_process_file() {
    echo -e "\033[31msearching $1 ... \033[0m"
    
    cd $1
  
    #这里可以修改为判断文件类型，如.c,.java等等文件类型，修改一下grep条件就可以了  
    filelist=$(ls -l | grep "@3x" | awk '{print $9}')
    
    for filename in $filelist
    do
        process "$1/$filename"
    done
  
    # 遍历当前目录，当判断其为目录时，则进入该目录递归调用该函数；  
    dirlist=$(ls)

    for dirname in $dirlist
    do
        if [[ -d "$dirname" ]]; then
            cd $dirname
  
            #SearchCfile 这里有bug，跳转到根目录了
            #这里把当前的目录作为参数输入
            search_and_process_file $(pwd)

            cd ..
        fi
    done
}

# Excute
nowdir=$(cd $1; pwd) 

search_and_process_file $nowdir
