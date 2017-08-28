#!/bin/bash  
  
  
#########注意：这里获取的是'某天'的'上一周'时间############  
#得到今天是第几周  
this_week=$(date +%W)  
  
#得到某天是第几周  
before_week=$(date -d $* +%W)  
  
#某天-今天=周差  
subweek=$[before_week-$this_week-1]  
  
#利用加减周数获取，获取某周的‘今天’  
today=`date -d "$subweek week" +%Y%m%d`
  
#获取today究竟是一个周的哪一天  
whichday=$(date -d $today +%w)  
  
#用(today-whichday)+1，就是某周的第一天，这里是星期一  
startday=`date -d "$today -$[${whichday}-1] days" +%Y%m%d`  
  
#某周的最后一天，星期日为最后一天  
endday=`date -d "$startday +6 days" +%Y%m%d`  
  
echo $startday   
echo $endday  
  
#get week by year : 2013W32  
week=$(date -d $startday +%W)  
year=$(date -d $* +%Y)  
yearweek=${year}W${week}  



-----------------------------------


#取得入参的时间  
indate=$*;  
  
if [ ! $indate ]; then  
  indate=$(date +%Y%m%d)  
fi  
  
#取得统计日期（一般为入参的上周的今天）  
statday=`date -d "$indate -1 weeks" +%Y%m%d`  
  
#得到是当周的周几 (0为星期日，1为星期一,...6为星期六)  
whichday=$(date -d $statday +%w)  
  
#用(statday-whichday)+1，就是某周的第一天，这里是星期一  
if [ $whichday == 0 ]; then  
  startday=`date -d "$statday -6 days" +%Y%m%d`  
else  
  startday=`date -d "$statday -$[${whichday} - 1] days" +%Y%m%d`  
fi  
  
#某周的最后一天，星期日为最后一天  
endday=`date -d "$startday +6 days" +%Y%m%d` 


------------------------------------



 SHELL DATE 命令详解
author:润明 2012-1-31 QQ:226399587  http://blog.csdn.net/runming918
 
使用方式 : date [-u] [-d datestr] [-s datestr] [--utc] [--universal] [--date=datestr] [--set=datestr] [--help] [--version] [+FORMAT] [MMDDhhmm[[CC]YY][.ss]]
 
说明 : date 可以用来显示或设定系统的日期与时间，在显示方面，使用者可以设定欲显示的格式，格式设定为一个加号后接数个标记，其中可用的标记列表如下 :
 
时间方面 :
% : 印出
% %n : 下一行
%t : 跳格
%H : 小时(00..23)
%I : 小时(01..12)
%k : 小时(0..23)
%l : 小时(1..12)
%M : 分钟(00..59)
%p : 显示本地 AM 或 PM
%r : 直接显示时间 (12 小时制，格式为 hh:mm:ss [AP]M)
%s : 从 1970 年 1 月 1 日 00:00:00 UTC 到目前为止的秒数 %S : 秒(00..61)
%T : 直接显示时间 (24 小时制)
%X : 相当于 %H:%M:%S
%Z : 显示时区
 
日期方面 :
%a : 星期几 (Sun..Sat)
%A : 星期几 (Sunday..Saturday)
%b : 月份 (Jan..Dec)
%B : 月份 (January..December)
%c : 直接显示日期与时间
%d : 日 (01..31)
%D : 直接显示日期 (mm/dd/yy)
%h : 同 %b
%j : 一年中的第几天 (001..366)
%m : 月份 (01..12)
%U : 一年中的第几周 (00..53) (以 Sunday 为一周的第一天的情形)
%w : 一周中的第几天 (0..6)
%W : 一年中的第几周 (00..53) (以 Monday 为一周的第一天的情形)
%x : 直接显示日期 (mm/dd/yy)
%y : 年份的最后两位数字 (00.99)
%Y : 完整年份 (0000..9999)
 
若是不以加号作为开头，则表示要设定时间，而时间格式为 MMDDhhmm[[CC]YY][.ss]，
其中 MM 为月份，
DD 为日，
hh 为小时，
mm 为分钟，
CC 为年份前两位数字，
YY 为年份后两位数字，
ss 为秒数
 
把计 :
-d datestr : 显示 datestr 中所设定的时间 (非系统时间)
–help : 显示辅助讯息
-s datestr : 将系统时间设为 datestr 中所设定的时间
-u : 显示目前的格林威治时间
–version : 显示版本编号
 
例子 :
显示时间后跳行，再显示目前日期 : date +%T%n%D
显示月份与日数 : date +%B %d
显示日期与设定时间(12:34:56) : date –date 12:34:56
注意 : 当你不希望出现无意义的 0 时(比如说 1999/03/07)，则可以在标记中插入 – 符号，比如说 date +%-H:%-M:%-S 会把时分秒中无意义的 0 给去掉，像是原本的 08:09:04 会变为 8:9:4。另外，只有取得权限者(比如说 root)才能设定系统时间。 当你以 root 身分更改了系统时间之后，请记得以 clock -w 来将系统时间写入 CMOS 中，这样下次重新开机时系统时间才会持续抱持最新的正确值。
 
创建以当前时间为文件名的
mkdir `date +%Y%m%d`
备份以时间做为文件名的
tar cvf ./htdocs`date +%Y%m%d`.tar ./*
 
 
date命令如何获得上星期的日期?
lastmonth=`date +%Y-%m --date="-1 month"`"-01";
然后 awk -v 作为一个参数这样传进去简单点。
#date -d "-1 week" "+%Y%m%d %A"
举一反三:date命令获得前天，昨天，明天，后天，上个月，下个月的日期
    date -d "-2 day" "+%Y%m%d %A"   或 date --date="2 days ago" "+%Y%m%d %A"
    date -d "-1 day" "+%Y%m%d %A"   或 date --date="1 day ago" "+%Y%m%d %A"
    date -d "1 day" "+%Y%m%d %A"
    date -d "2 day" "+%Y%m%d %A"
    date -d "-1 month" "+%Y%m%d %A"
    date -d "1 month" "+%Y%m%d %A"
echo `date -d "-1 month" "+%Y-%m-%d %X"`
 
还有其他用法:
date +%s   可以得到UNIX的时间戳;