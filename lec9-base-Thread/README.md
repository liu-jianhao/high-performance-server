# Thread

+ __thread:线程局部存储，只能修饰POD类型(与C兼容的原始数据类型)


测试程序输出：
```shell
pid=15933, tid=15933
tid=15934
t1.tid=15934
tid=15935, x=42
t2.tid=15935
tid=15936, Foo::x_=87.530000
tid=15937, Foo::x_=87.530000, text=Shuo Chen
tid=15938
tid=15953
number of created threads 6
```
