* [group by、having、where、order by的使用](https://blog.csdn.net/will130/article/details/49784625)


# 查询

### 数目、偏移

```
select * from table limit 2,1;
//含义是跳过2条取出1条数据，limit后面是从第2条开始读，读取1条信息，即读取第3条数据

select * from table limit 2 offset 1;
//含义是从第1条（不包括）数据开始取出2条数据，limit后面跟的是2条数据，offset后面是从第1条开始读取，即读取第2,3条
```

### 排序查询 + 偏移、数目限制

```
sql? select * from orders order by company [asc|desc] limit 2 offset 9;
```