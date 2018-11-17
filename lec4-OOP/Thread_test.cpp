#include "Thread.h"
#include <iostream>
#include <unistd.h>

using namespace std;

class TestThread : public Thread
{
    public:
    TestThread(int count) : count_(count)
    {
        cout << "TestThread ...\n";
    }

    ~TestThread()
    {
        cout << "~TestThread ...\n";
    }

    void Run()
    {
        while(count_--)
        {
            cout << "this is a test ...\n";
            sleep(1);
        }
    }

    int count_;
};


int main()
{
    // TestThread t(5);
    // t.Start();
    // t.Join();

    TestThread* t2 = new TestThread(5);
    t2->SetAutoDelete(true);
    t2->Start();
    t2->Join();

    while(1)
        sleep(1);
    return 0;
}