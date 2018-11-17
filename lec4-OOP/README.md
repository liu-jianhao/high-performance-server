# 面向对象的编程风格

## 问题与解答
1. 为什么`phread_create()`函数不可以直接传入`Run()`？
因为要求的是C风格的函数指针，而`Run()`函数是一个成员函数，隐含的第一个参数是`Thread*(this)`，调用的时候是`thiscall`约定。

所以要用一个普通的函数，可以用一个全局函数，但是这样就会暴露给别人。

因此用一个静态成员的函数指针就可以解决这个问题。

2. 为什么`Run()`要为`private`的？
因为如果不设置为`private`的，那么就违背了库的初衷。`Run()`函数是一个纯虚函数，
是提供给用户继承`Thread`类并实现自己的`Run()`，然后进行回调。

## 编译运行
```shell
$ ./build.sh
```

```shell
$ ./build/bin/Thread_test
Thread ...
TestThread ...
this is a test ...
this is a test ...
this is a test ...
this is a test ...
this is a test ...
~TestThread ...
~Thread ...
```