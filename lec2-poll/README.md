## SIGPIPE
如果客户端关闭套接字`close`，而服务器调用了一次`write`，服务器会接收到一个`RST`段(TCP)，如果服务器再次调用`write`就会产生`SIGPIPE`信号。

## TIME_WAIT
应尽量避免`TIME_WAIT`状态。

如果服务器主动断开连接(先于client调用close)，服务器就会进入`TIME_WAIT`

## poll
![](https://img-blog.csdnimg.cn/20181114102022698.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlc3Ricm9va2xpdQ==,size_16,color_FFFFFF,t_70)

## 编译运行程序
编译
```shell
make
```
运行
```shell
./echo_server_poll
```
在另外一个终端中执行客户端程序
```shell
$ nc localhost 8888
```


## 问题
1. `read()`可能并没有把`connfd`所对应的接受缓冲区的数据都读完，那么`connfd`仍然是活跃的。我们应该将读到的数据保存在`connfd`的应用层缓冲区中。

2. `write()`发送的时候我们也应该有一个应用层发送缓冲区。`POLLOUT`事件触发条件，`connfd`的发送缓冲区不满(可以容纳数据)

## EMFILE处理
![](https://img-blog.csdnimg.cn/20181114123953600.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlc3Ricm9va2xpdQ==,size_16,color_FFFFFF,t_70)