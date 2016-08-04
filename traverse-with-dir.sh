#!/bin/bash  
  
# $1是运行脚本时，输入的第一个参数，这里指的是使用者希望搜索的目录  
# 下面的代码是对目录进行判断，如果为空则使用脚本所在的目录；否则，搜索用户输入的目录  
if [[ -z "$1" ]] || [[ ! -d "$1" ]]; then  
    echo "The directory is empty or not exist!"  
    echo "It will use the current directory."  
    nowdir=$(pwd)  
else  
    nowdir=$(cd $1; pwd)  
fi  
# echo "$nowdir"  
  
# 递归函数的实现  
function search_file() {
    echo -e "\033[31msearching $1 ... \033[0m"
    
    cd $1
  
    #这里可以修改为判断文件类型，如.c,.java等等文件类型，修改一下grep条件就可以了  
    filelist=$(ls -l | grep "^-" | awk '{print $9}')
    
    for filename in $filelist
    do
        echo $filename
    done
  
    # 遍历当前目录，当判断其为目录时，则进入该目录递归调用该函数；  
    dirlist=$(ls)

    for dirname in $dirlist
    do
        if [[ -d "$dirname" ]]; then
            cd $dirname
  
            #SearchCfile 这里有bug，跳转到根目录了
            #这里把当前的目录作为参数输入
            search_file $(pwd)

            cd ..
        fi
    done
}
  
search_file $nowdir
