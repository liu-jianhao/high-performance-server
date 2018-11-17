#include "Thread.h"
#include <boost/bind.hpp>
#include <iostream>
#include <unistd.h>

using namespace std;

class Foo
{
public:
    void MemberFunc(int x)
    {
        while(x--)
        {
            cout << "this is a test\n";
            sleep(1);
        }
    }
};

void ThreadFunc()
{
    cout << "ThreadFunc() ...\n";
}

int main()
{
    Thread t1(ThreadFunc);
    Foo foo;
    Thread t2(boost::bind(&Foo::MemberFunc, boost::ref(foo), 5));

    t1.Start();
    t2.Start();
    t1.Join();
    t2.Join();

    return 0;
}