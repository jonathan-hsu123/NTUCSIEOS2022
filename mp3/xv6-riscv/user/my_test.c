#include "kernel/types.h"
#include "user/user.h"
#include "user/threads.h"
int a = 0, main_id;
void handler(void *arg){
    printf("not be executed\n");
}
void go_to_2F(){
    a+= 1;
    printf("2he2he2he2he2he\n");
    thrdresume(main_id); // switch back to line 12
}
int main(){
    main_id = thrdstop(10, -1, handler, (void *)0xbbbb87);
    cancelthrdstop(main_id, 0);
    if( a == 0 ){
        go_to_2F();
    }
    else{
        printf("back from 2F\n");
    }
    exit(0);
}
/*
22 The output is:
23 2he2he2he2he2he
24 back from 2F
25 */