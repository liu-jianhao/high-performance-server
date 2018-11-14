![](https://img-blog.csdnimg.cn/20181114090419361.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlc3Ricm9va2xpdQ==,size_16,color_FFFFFF,t_70)

1. 队列 + 连接池
主要的业务逻辑挪到应用服务器处理，数据库只做辅助的业务处理

2. 缓存
缓存更新 缓存time out

如果缓存失效，重新去数据库查询，实时性较差

数据库中的数据更新，立即通知前端缓存更新，实时性较高

3. nosql key/value
分布式缓存
+ redis
+ memcached

4. 对数据库进行负载均衡
数据分区（分库、分表）

5. 任务服务器
可以监视应用服务器的负载。
任务服务器的负载均衡

6. 服务器四大杀手
+ 数据拷贝	缓存
+ 环境切换	该不该使用多线程，单核服务器采用状态机效率最高，多核使用多线程
+ 内存分配	内存池
+ 锁竞争