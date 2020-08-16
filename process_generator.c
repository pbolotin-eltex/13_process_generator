#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>

int main() {
    pid_t cpid, pid, ppid, w;
    cpid = fork();
    if(-1 == cpid) {
        perror("Fork fail\n");
        exit(EXIT_FAILURE);
    }
    switch(cpid) {
        /*Child*/
        case 0:
            pid =  getpid();
            ppid = getppid();
            printf("Child process has  pid:%d, and ppid:%d\n", pid, ppid);
            exit(EXIT_SUCCESS);
        break;
        /*Parent*/
        default:
            pid =  getpid();
            ppid = getppid();
            printf("Parent process has pid:%d, and ppid:%d\n", pid, ppid);
            w = waitpid(cpid, NULL, 0);
            printf("Waitpid returned   pid:%d\n", w);
        break;
    }
    return 0;
}
