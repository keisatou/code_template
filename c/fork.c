#include <sys/types.h>
#include <sys/wait.h>   /* waitpid() */
#include <signal.h>
#include <stdio.h>
#include <unistd.h>     /* fork() getpid() getppid() sleep() _exit() */

#define CHILD_NUM 3

void child_waiter(int signum);
void doChildWork(void);

int main()
{
    pid_t pid;
    int i;
    signal(SIGCHLD, child_waiter);
    setvbuf(stdout, (char *)NULL, _IONBF, 0);
    for (i = 0; i < CHILD_NUM; i++) {
        switch (fork()) {
            case -1:
                fprintf(stderr, "fork failed\n");
                return 1;
            case 0:     // child
                doChildWork();
            default:    // parent
                // do nothing
                sleep(10); // suspend for 10sec or until signal-handler is called.
                printf("PARENT pid: %d\n", getpid());
        }
    }
}

void child_waiter(int signum)
{
    if (signum == SIGCHLD) {
        while (waitpid(-1, NULL, WNOHANG) > 0)
            ;
        printf("wait completed!\n");
    }
}

void doChildWork(void)
{
    // do something valuable here.
    printf("my parent pid: %d\n", getppid());
    _exit(10);
}
