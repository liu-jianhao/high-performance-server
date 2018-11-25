# Exception类

## stackTrace
`Exception`类用了`CurrentThread`类中的`stackTrace`方法，
而`stackTrace`方法中用到了两个主要的函数是`backtrace`和`backtrace_symbols`：
+ backtrace，栈回溯，保存各个栈帧的地址
+ backtrace_symbols，根据地址，转成相应的函数符号。
详细的应用方法可以`man`一下。

## 测试
在测试代码中，
1. `main`函数中调用`foo`函数
2. `foo`函数中调用`Bar`类对象的`test`方法
3. `test`方法中打印栈回溯信息

以下是测试代码的一部分输出：
```
Stack inside std::function:
./exception_test(Bar::test(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >)+0xa0) [0x561a0f0760f0]
./exception_test(foo()+0x32) [0x561a0f075dc2]
./exception_test(main+0x6) [0x561a0f075c16]
/lib/x86_64-linux-gnu/libc.so.6(__libc_start_main+0xe7) [0x7efeec29ba87]
./exception_test(_start+0x2a) [0x561a0f075caa]
```