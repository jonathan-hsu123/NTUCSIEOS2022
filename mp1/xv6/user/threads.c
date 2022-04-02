#include "kernel/types.h"
#include "user/setjmp.h"
#include "user/threads.h"
#include "user/user.h"
#define NULL 0

static struct thread* current_thread = NULL;
static struct thread* root_thread = NULL;
static int id = 1;
static jmp_buf env_st;
static jmp_buf env_tmp;
struct thread* stack[100] = {};
int cnt = -1;
// TODO: necessary declares, if any

struct thread *thread_create(void (*f)(void *), void *arg){
    struct thread *t = (struct thread*) malloc(sizeof(struct thread));
    //unsigned long stack_p = 0;
    unsigned long new_stack_p;
    unsigned long new_stack;
    new_stack = (unsigned long) malloc(sizeof(unsigned long)*0x100);
    new_stack_p = new_stack +0x100*8-0x2*8;
    t -> fp = f;
    t -> arg = arg;
    t -> ID  = id;
    t -> buf_set = 0;
    t -> stack = (void*) new_stack;
    t -> stack_p = (void*) new_stack_p;
    id++;
    return t;
}
void thread_add_runqueue(struct thread *t){
    if(current_thread == NULL){
        // TODO
        current_thread = t;
        root_thread = t;
        t -> left = NULL;
        t -> right = NULL;
        t -> parent = NULL;
    }
    else{
        // TODO
        if(current_thread -> left == NULL) {
            current_thread -> left = t;
            t -> parent = current_thread;
            t -> left = t -> right = NULL;
        }
        else if(current_thread -> right == NULL) {
            current_thread -> right = t;
            t -> parent = current_thread;
            t -> left = t -> right = NULL;
        }
        else {
            free(t -> stack);
            free(t);
        }
    }
}
void thread_yield(void){
    // TODO
    if(setjmp(current_thread->env) == 0){
        schedule();
        dispatch();
    }
}
void dispatch(void){
    // TODO
    if (current_thread -> buf_set == 0) {
        current_thread -> buf_set = 1;
        if (setjmp(env_tmp) == 0) {
            env_tmp -> sp = (unsigned long)current_thread -> stack_p;
            longjmp(env_tmp, 1);
        }
        current_thread -> fp(current_thread -> arg);
        thread_exit();
    }
    longjmp(current_thread -> env, 1);
}
void schedule(void){
    // TODO
    struct thread* prev = NULL;
    struct thread* curr = NULL;
    cnt = -1;
    cnt++;
    stack[cnt] = root_thread;
    while(cnt >= 0) {
        curr = stack[cnt];
        cnt--;
        if(prev == current_thread) {
            current_thread = curr;
            return;
        }
        if(curr -> right != NULL) {
            cnt++;
            stack[cnt] = curr -> right;
        }
        if(curr -> left != NULL) {
            cnt++;
            stack[cnt] = curr -> left;
        }
        prev = curr;
    }
    current_thread = root_thread;
}
void thread_exit(void){
    if(current_thread == root_thread && current_thread -> left == NULL && current_thread -> right == NULL){
        // TODO
        // Hint: No more thread to execute
        free(current_thread->stack);
        free(current_thread);
        longjmp(env_st, 1);
    }
    else{
        // TODO
        if(current_thread -> left == NULL && current_thread -> right == NULL) {
            struct thread* free_thread = current_thread;
            schedule();
            if(free_thread -> parent -> left == free_thread) free_thread -> parent -> left = NULL;
            else free_thread -> parent -> right = NULL;
            free(free_thread -> stack);
            free(free_thread);
            dispatch();
        }
        else {
            struct thread* tmp_thread = current_thread;
            struct thread* free_thread = current_thread;
            while(tmp_thread -> right != NULL || tmp_thread -> left != NULL) {
                if(tmp_thread -> right != NULL) tmp_thread = tmp_thread -> right;
                else tmp_thread = tmp_thread -> left;
            }
            if(tmp_thread -> parent -> left == tmp_thread) tmp_thread -> parent -> left = NULL;
            else tmp_thread -> parent -> right = NULL;
            if(free_thread -> parent != NULL) {
                if(free_thread -> parent -> left == free_thread) free_thread -> parent -> left = tmp_thread;
                else free_thread -> parent -> right = tmp_thread;
            }
            else root_thread = tmp_thread;
            tmp_thread -> parent = free_thread -> parent;
            tmp_thread -> left = free_thread -> left;
            tmp_thread -> right = free_thread -> right;
            if(tmp_thread -> left != NULL) tmp_thread -> left -> parent = tmp_thread;
            if(tmp_thread -> right != NULL) tmp_thread -> right -> parent = tmp_thread;
            current_thread = tmp_thread;
            schedule();
            free(free_thread -> stack);
            free(free_thread);
            dispatch();
        }
    }
}
void thread_start_threading(void){
    // TODO
    if(setjmp(env_st) == 0){
        schedule();
        dispatch();
    }
}

