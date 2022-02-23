#include "kernel/types.h"
#include "kernel/fs.h"
#include "kernel/stat.h"
#include "user/user.h"

char*
fmtname(char *path)
{
  static char buf[DIRSIZ+1];
  char *p;

  // Find first character after last slash.
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
    ;
  p++;

  // Return blank-padded name.
  if(strlen(p) >= DIRSIZ)
    return p;
  memmove(buf, p, strlen(p));
  memset(buf+strlen(p), '\0', DIRSIZ-strlen(p));
  return buf;
}

void tree(char dir_name[], int level, int* dir_cnt, int* file_cnt, int last_file) {
    char buf[512], *p;
    int fd = open(dir_name, 0), fd2;
    int cnt = 0;
    struct dirent de;
    struct stat st;
    strcpy(buf, dir_name);
    p = buf+strlen(buf);
    *p++ = '/';
    while(read(fd, &de, sizeof(de)) == sizeof(de)) cnt++;
    close(fd);
    fd = open(dir_name, 0);
    for(int i = 0; i < cnt - 1; i++) {
      read(fd, &de, sizeof(de));
      if(de.name[0] == '.' || de.inum == 0) continue;
      memmove(p, de.name, DIRSIZ);
      p[DIRSIZ] = 0;
      fd2 = open(buf, 0);
      fstat(fd2, &st);
      for(int j = 0; j < last_file; j++) printf("    ");
      printf("|");
      for(int j = 0; j < level - 1 - last_file; j++) printf("   |");
      printf("\n");
      for(int j = 0; j < last_file; j++) printf("    ");
      for(int j = 0; j < level - 1 - last_file; j++) printf("|   ");
      printf("+-- %s\n", fmtname(buf));
      if(st.type == T_DIR) {
        (*dir_cnt)++;
        tree(buf, level + 1, dir_cnt, file_cnt, last_file);
      }
      else (*file_cnt)++;
      close(fd2);
    }
    read(fd, &de, sizeof(de));
    if(de.name[0] == '.' || de.inum == 0) return;
    memmove(p, de.name, DIRSIZ);
    p[DIRSIZ] = 0;
    fd2 = open(buf, 0);
    fstat(fd2, &st);
    for(int j = 0; j < last_file; j++) printf("    ");
    printf("|");
    for(int j = 0; j < level - 1 - last_file; j++) printf("   |");
    printf("\n");
    for(int j = 0; j < last_file; j++) printf("    ");
    for(int j = 0; j < level - 1 - last_file; j++) printf("|   ");
    printf("+-- %s\n", fmtname(buf));
    if(st.type == T_DIR) {
      (*dir_cnt)++;
      tree(buf, level + 1, dir_cnt, file_cnt, last_file + 1);
    }
    else (*file_cnt)++;
    close(fd2);
}

int main(int argc, char *argv[]) {
    if(argc != 2) {
        fprintf(2, "usage: tree [DIR]\n");
    }
    int p[2];
    pipe(p);
    int pid = fork();
    if(pid == 0) {
        int dir_cnt = 0, file_cnt = 0;
        int fd;
        struct stat st;
        if((fd = open(argv[1], 0)) < 0){
           printf("%s [error opening dir]\n", argv[1]);
           write(p[1], &dir_cnt, sizeof(int));
           write(p[1], &file_cnt, sizeof(int));
           exit(0);
        }
        if(fstat(fd, &st) < 0 || st.type == T_FILE){
           close(fd);
           printf("%s [error opening dir]\n", argv[1]);
           write(p[1], &dir_cnt, sizeof(int));
           write(p[1], &file_cnt, sizeof(int));
           exit(0);
        }
        close(fd);
        printf("%s\n", argv[1]);
        tree(argv[1], 1, &dir_cnt, &file_cnt, 0);
        write(p[1], &dir_cnt, sizeof(int));
        write(p[1], &file_cnt, sizeof(int));
        exit(0);
    }
    int dir_cnt, file_cnt;
    read(p[0], &dir_cnt, sizeof(int));
    read(p[0], &file_cnt, sizeof(int));
    printf("\n%d directories, %d files\n", dir_cnt, file_cnt);
    close(p[0]);
    close(p[1]);
    wait(0);
    exit(0);
}
