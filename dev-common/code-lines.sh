#!/bin/sh

# 指定要搜索哪个目录
dir=$1

# 获取当前git用户的名称
user_name=`git config --list | grep user.name | sed 's/^user\.name\=//g'`

# 将要搜索这些目录
search_dirs=()

# 总行数
total_adds=0
total_dels=0

# 统计出要处理的目录
function search_dir()
{
    for file in `ls $1 | grep -v node_modules`  # 过滤掉node_modules目录
    do
        if [ -d $1"/"$file ]
        then
            ls -a $1"/"$file | grep -wq .git && search_dirs=("${search_dirs[@]}" $1"/"$file) || search_dir $1"/"$file
        fi
    done
}

search_dir $dir

# 开始统计代码行数
for proj in ${search_dirs[@]}
do
    result=`cd $proj && git log --since=1.month-ago --oneline --author="$user_name" --pretty=tformat: --numstat 2>/dev/null | awk '
    BEGIN {
        adds=0; dels=0; total=0; proj="'"$proj"'"
    }
    {
        adds+=$1; dels+=$2; total+=$1+$2
    }
    END {
        if ( total ) {
            printf "%s 增加 %s 删除 %s 总数 %s", proj, adds, dels, total
        }
    }'`
    if [ -n "$result" ]
    then
        each_result+=$result"\n"
    fi
done

echo "$each_result" | column -t
echo "$each_result" | awk '
    BEGIN {
        adds=0; dels=0; total=0
    }
    {
        adds+=$3; dels+=$5; total+=$7
    }
    END {
        if ( total ) {
            printf "最近一个月，新增:%s，删除:%s，总数:%s\n", adds, dels, total
        }
    }
    '

