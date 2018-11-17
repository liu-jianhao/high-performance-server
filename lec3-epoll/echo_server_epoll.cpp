#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <signal.h>
#include <sys/wait.h>
#include <sys/epoll.h>

#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <errno.h>
#include <string.h>

#include <vector>
#include <iostream>
#include <algorithm>

#define PORT 8888

#define ERR_EXIT(n)         \
    do                      \
    {                       \
        perror(n);          \
        exit(EXIT_FAILURE); \
    } while (0)

typedef std::vector<struct epoll_event> EventList;

int main()
{
    signal(SIGPIPE, SIG_IGN);
    signal(SIGCHLD, SIG_IGN);

    int listenfd;

    if ((listenfd = socket(PF_INET, SOCK_STREAM | SOCK_NONBLOCK | SOCK_CLOEXEC, IPPROTO_TCP)) < 0)
    {
        ERR_EXIT("socket");
    }

    struct sockaddr_in servaddr;
    memset(&servaddr, 0, sizeof(servaddr));
    servaddr.sin_family = AF_INET;
    servaddr.sin_port = htons(PORT);
    servaddr.sin_addr.s_addr = htonl(INADDR_ANY);

    int on = 1;
    if (setsockopt(listenfd, SOL_SOCKET, SO_REUSEADDR, &on, sizeof(on)) < 0)
    {
        ERR_EXIT("setsockopt");
    }

    if (bind(listenfd, (struct sockaddr *)&servaddr, sizeof(servaddr)) < 0)
    {
        ERR_EXIT("bind");
    }
    if (listen(listenfd, SOMAXCONN) < 0)
    {
        ERR_EXIT("listen");
    }

    std::vector<int> clients;
    int epollfd;
    epollfd = epoll_create1(EPOLL_CLOEXEC);

    struct epoll_event event;
    event.data.fd = listenfd;
    event.events = EPOLLIN;
    epoll_ctl(epollfd, EPOLL_CTL_ADD, listenfd, &event);

    EventList events(16);

    int nready;

    struct sockaddr_in peeraddr;
    socklen_t peerlen;
    int connfd;

    while (1)
    {
        nready = epoll_wait(epollfd, &*events.begin(), static_cast<int>(events.size()), -1);
        if (nready == -1)
        {
            if (errno == EINTR)
            {
                continue;
            }

            ERR_EXIT("poll");
        }

        if (nready == 0)
        {
            continue;
        }

        if ((size_t)nready == events.size())
        {
            events.resize(events.size() * 2);
        }

        for (int i = 0; i < nready; ++i)
        {
            if (events[i].data.fd == listenfd)
            {
                peerlen = sizeof(peeraddr);
                connfd = accept4(listenfd, (struct sockaddr *)&peeraddr, &peerlen, SOCK_NONBLOCK | SOCK_CLOEXEC);

                if (connfd == -1)
                {
                    ERR_EXIT("accept4");
                }

                std::cout << "ip = " << inet_ntoa(peeraddr.sin_addr) << " port = " << ntohs(peeraddr.sin_port) << std::endl;

                clients.push_back(connfd);

                event.data.fd = connfd;
                event.events = EPOLLIN;
                epoll_ctl(epollfd, EPOLL_CTL_ADD, connfd, &event);
            }
            else if(events[i].events & EPOLLIN)
            {
                connfd = events[i].data.fd;
                if(connfd < 0)
                {
                    continue;
                }

                char buf[1024] = {0};
                int ret = read(connfd, buf, 1024);
                if (ret == -1)
                {
                    ERR_EXIT("read");
                    }
                    if (ret == 0)
                    {
                        std::cout << "client close" << std::endl;
                        close(connfd);
                        event = events[i];
                        epoll_ctl(epollfd, EPOLL_CTL_DEL, connfd, &event);
                        clients.erase(std::remove(clients.begin(), clients.end(), connfd), clients.end());
                        continue;
                    }

                    std::cout << buf;
                    write(connfd, buf, strlen(buf));
            }
        }
    }

    return 0;
}