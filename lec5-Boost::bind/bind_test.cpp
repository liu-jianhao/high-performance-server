#include <iostream>
#include <boost/function.hpp>
#include <boost/bind.hpp>

using namespace std;

class Foo
{
public:
    void memberFunc(double d, int i, int j)
    {
        cout << d << endl;
        cout << i << endl;
        cout << j << endl;
    }
};

int main()
{
    Foo foo;
    boost:function<void (int)> fp = boost::bind(&Foo::memberFunc, &foo, 0.5, _1, 10);
    fp(100);

    auto fp2 = boost::bind(&Foo::memberFunc, boost::ref(foo), 0.5, _1, _2);
    fp2(50, 60);

    return 0;
}