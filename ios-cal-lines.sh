#find . -name "*.m" -or -name "*.h" -or -name "*.xib" -or -name "*.c" |xargs wc -l 
# 如果要统计ios开发代码，包括头文件的，终端命令进入项目目录下，命令如下
# find . -name "*.m" -or -name "*.h" -or -name "*.xib" -or -name "*.c" |xargs wc -l  
# 列出每个文件的行数
# find . -name "*.m" -or -name "*.h" -or -name "*.xib" -or -name "*.c" |xargs grep -v "^$"|wc -l  
# 列出代码行数总和
# grep -v "^$"是去掉空行
# 注释也统计在代码量之内，毕竟也一个字一个字码出来的 
