
user/_mp1-7:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <f1>:
#include "user/threads.h"

#define NULL 0
int TTTTT = -1;
void f1(void *arg)
{
   0:	1141                	addi	sp,sp,-16
   2:	e406                	sd	ra,8(sp)
   4:	e022                	sd	s0,0(sp)
   6:	0800                	addi	s0,sp,16
    ++TTTTT;
   8:	00001717          	auipc	a4,0x1
   c:	c8470713          	addi	a4,a4,-892 # c8c <TTTTT>
  10:	431c                	lw	a5,0(a4)
  12:	2785                	addiw	a5,a5,1
  14:	0007859b          	sext.w	a1,a5
  18:	c31c                	sw	a5,0(a4)
    if(!(TTTTT%10000))
  1a:	6709                	lui	a4,0x2
  1c:	7107071b          	addiw	a4,a4,1808
  20:	02e7e7bb          	remw	a5,a5,a4
  24:	c79d                	beqz	a5,52 <f1+0x52>
        printf("exec thread %d\n", TTTTT);
    thread_yield();
  26:	00001097          	auipc	ra,0x1
  2a:	bb0080e7          	jalr	-1104(ra) # bd6 <thread_yield>
    if(TTTTT < 200000){
  2e:	00001717          	auipc	a4,0x1
  32:	c5e72703          	lw	a4,-930(a4) # c8c <TTTTT>
  36:	000317b7          	lui	a5,0x31
  3a:	d3f78793          	addi	a5,a5,-705 # 30d3f <__global_pointer$+0x2f8b6>
  3e:	02e7d363          	bge	a5,a4,64 <f1+0x64>
        struct thread *t = thread_create(f1, NULL);
        thread_add_runqueue(t);
    }
    thread_exit();
  42:	00001097          	auipc	ra,0x1
  46:	9f2080e7          	jalr	-1550(ra) # a34 <thread_exit>

}
  4a:	60a2                	ld	ra,8(sp)
  4c:	6402                	ld	s0,0(sp)
  4e:	0141                	addi	sp,sp,16
  50:	8082                	ret
        printf("exec thread %d\n", TTTTT);
  52:	00001517          	auipc	a0,0x1
  56:	bf650513          	addi	a0,a0,-1034 # c48 <thread_start_threading+0x3a>
  5a:	00000097          	auipc	ra,0x0
  5e:	660080e7          	jalr	1632(ra) # 6ba <printf>
  62:	b7d1                	j	26 <f1+0x26>
        struct thread *t = thread_create(f1, NULL);
  64:	4581                	li	a1,0
  66:	00000517          	auipc	a0,0x0
  6a:	f9a50513          	addi	a0,a0,-102 # 0 <f1>
  6e:	00001097          	auipc	ra,0x1
  72:	864080e7          	jalr	-1948(ra) # 8d2 <thread_create>
        thread_add_runqueue(t);
  76:	00001097          	auipc	ra,0x1
  7a:	8c0080e7          	jalr	-1856(ra) # 936 <thread_add_runqueue>
  7e:	b7d1                	j	42 <f1+0x42>

0000000000000080 <main>:

int main(int argc, char **argv)
{
  80:	1141                	addi	sp,sp,-16
  82:	e406                	sd	ra,8(sp)
  84:	e022                	sd	s0,0(sp)
  86:	0800                	addi	s0,sp,16
    printf("mp1-7\n");
  88:	00001517          	auipc	a0,0x1
  8c:	bd050513          	addi	a0,a0,-1072 # c58 <thread_start_threading+0x4a>
  90:	00000097          	auipc	ra,0x0
  94:	62a080e7          	jalr	1578(ra) # 6ba <printf>
    struct thread *t = thread_create(f1, NULL);
  98:	4581                	li	a1,0
  9a:	00000517          	auipc	a0,0x0
  9e:	f6650513          	addi	a0,a0,-154 # 0 <f1>
  a2:	00001097          	auipc	ra,0x1
  a6:	830080e7          	jalr	-2000(ra) # 8d2 <thread_create>
    thread_add_runqueue(t);
  aa:	00001097          	auipc	ra,0x1
  ae:	88c080e7          	jalr	-1908(ra) # 936 <thread_add_runqueue>
    thread_start_threading();
  b2:	00001097          	auipc	ra,0x1
  b6:	b5c080e7          	jalr	-1188(ra) # c0e <thread_start_threading>
    printf("\nexited\n");
  ba:	00001517          	auipc	a0,0x1
  be:	ba650513          	addi	a0,a0,-1114 # c60 <thread_start_threading+0x52>
  c2:	00000097          	auipc	ra,0x0
  c6:	5f8080e7          	jalr	1528(ra) # 6ba <printf>
    exit(0);
  ca:	4501                	li	a0,0
  cc:	00000097          	auipc	ra,0x0
  d0:	276080e7          	jalr	630(ra) # 342 <exit>

00000000000000d4 <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
  d4:	1141                	addi	sp,sp,-16
  d6:	e422                	sd	s0,8(sp)
  d8:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  da:	87aa                	mv	a5,a0
  dc:	0585                	addi	a1,a1,1
  de:	0785                	addi	a5,a5,1
  e0:	fff5c703          	lbu	a4,-1(a1)
  e4:	fee78fa3          	sb	a4,-1(a5)
  e8:	fb75                	bnez	a4,dc <strcpy+0x8>
    ;
  return os;
}
  ea:	6422                	ld	s0,8(sp)
  ec:	0141                	addi	sp,sp,16
  ee:	8082                	ret

00000000000000f0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  f0:	1141                	addi	sp,sp,-16
  f2:	e422                	sd	s0,8(sp)
  f4:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
  f6:	00054783          	lbu	a5,0(a0)
  fa:	cb91                	beqz	a5,10e <strcmp+0x1e>
  fc:	0005c703          	lbu	a4,0(a1)
 100:	00f71763          	bne	a4,a5,10e <strcmp+0x1e>
    p++, q++;
 104:	0505                	addi	a0,a0,1
 106:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 108:	00054783          	lbu	a5,0(a0)
 10c:	fbe5                	bnez	a5,fc <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
 10e:	0005c503          	lbu	a0,0(a1)
}
 112:	40a7853b          	subw	a0,a5,a0
 116:	6422                	ld	s0,8(sp)
 118:	0141                	addi	sp,sp,16
 11a:	8082                	ret

000000000000011c <strlen>:

uint
strlen(const char *s)
{
 11c:	1141                	addi	sp,sp,-16
 11e:	e422                	sd	s0,8(sp)
 120:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 122:	00054783          	lbu	a5,0(a0)
 126:	cf91                	beqz	a5,142 <strlen+0x26>
 128:	0505                	addi	a0,a0,1
 12a:	87aa                	mv	a5,a0
 12c:	4685                	li	a3,1
 12e:	9e89                	subw	a3,a3,a0
 130:	00f6853b          	addw	a0,a3,a5
 134:	0785                	addi	a5,a5,1
 136:	fff7c703          	lbu	a4,-1(a5)
 13a:	fb7d                	bnez	a4,130 <strlen+0x14>
    ;
  return n;
}
 13c:	6422                	ld	s0,8(sp)
 13e:	0141                	addi	sp,sp,16
 140:	8082                	ret
  for(n = 0; s[n]; n++)
 142:	4501                	li	a0,0
 144:	bfe5                	j	13c <strlen+0x20>

0000000000000146 <memset>:

void*
memset(void *dst, int c, uint n)
{
 146:	1141                	addi	sp,sp,-16
 148:	e422                	sd	s0,8(sp)
 14a:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 14c:	ca19                	beqz	a2,162 <memset+0x1c>
 14e:	87aa                	mv	a5,a0
 150:	1602                	slli	a2,a2,0x20
 152:	9201                	srli	a2,a2,0x20
 154:	00a60733          	add	a4,a2,a0
    cdst[i] = c;
 158:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 15c:	0785                	addi	a5,a5,1
 15e:	fee79de3          	bne	a5,a4,158 <memset+0x12>
  }
  return dst;
}
 162:	6422                	ld	s0,8(sp)
 164:	0141                	addi	sp,sp,16
 166:	8082                	ret

0000000000000168 <strchr>:

char*
strchr(const char *s, char c)
{
 168:	1141                	addi	sp,sp,-16
 16a:	e422                	sd	s0,8(sp)
 16c:	0800                	addi	s0,sp,16
  for(; *s; s++)
 16e:	00054783          	lbu	a5,0(a0)
 172:	cb99                	beqz	a5,188 <strchr+0x20>
    if(*s == c)
 174:	00f58763          	beq	a1,a5,182 <strchr+0x1a>
  for(; *s; s++)
 178:	0505                	addi	a0,a0,1
 17a:	00054783          	lbu	a5,0(a0)
 17e:	fbfd                	bnez	a5,174 <strchr+0xc>
      return (char*)s;
  return 0;
 180:	4501                	li	a0,0
}
 182:	6422                	ld	s0,8(sp)
 184:	0141                	addi	sp,sp,16
 186:	8082                	ret
  return 0;
 188:	4501                	li	a0,0
 18a:	bfe5                	j	182 <strchr+0x1a>

000000000000018c <gets>:

char*
gets(char *buf, int max)
{
 18c:	711d                	addi	sp,sp,-96
 18e:	ec86                	sd	ra,88(sp)
 190:	e8a2                	sd	s0,80(sp)
 192:	e4a6                	sd	s1,72(sp)
 194:	e0ca                	sd	s2,64(sp)
 196:	fc4e                	sd	s3,56(sp)
 198:	f852                	sd	s4,48(sp)
 19a:	f456                	sd	s5,40(sp)
 19c:	f05a                	sd	s6,32(sp)
 19e:	ec5e                	sd	s7,24(sp)
 1a0:	1080                	addi	s0,sp,96
 1a2:	8baa                	mv	s7,a0
 1a4:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1a6:	892a                	mv	s2,a0
 1a8:	4481                	li	s1,0
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 1aa:	4aa9                	li	s5,10
 1ac:	4b35                	li	s6,13
  for(i=0; i+1 < max; ){
 1ae:	89a6                	mv	s3,s1
 1b0:	2485                	addiw	s1,s1,1
 1b2:	0344d863          	bge	s1,s4,1e2 <gets+0x56>
    cc = read(0, &c, 1);
 1b6:	4605                	li	a2,1
 1b8:	faf40593          	addi	a1,s0,-81
 1bc:	4501                	li	a0,0
 1be:	00000097          	auipc	ra,0x0
 1c2:	19c080e7          	jalr	412(ra) # 35a <read>
    if(cc < 1)
 1c6:	00a05e63          	blez	a0,1e2 <gets+0x56>
    buf[i++] = c;
 1ca:	faf44783          	lbu	a5,-81(s0)
 1ce:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 1d2:	01578763          	beq	a5,s5,1e0 <gets+0x54>
 1d6:	0905                	addi	s2,s2,1
 1d8:	fd679be3          	bne	a5,s6,1ae <gets+0x22>
  for(i=0; i+1 < max; ){
 1dc:	89a6                	mv	s3,s1
 1de:	a011                	j	1e2 <gets+0x56>
 1e0:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 1e2:	99de                	add	s3,s3,s7
 1e4:	00098023          	sb	zero,0(s3)
  return buf;
}
 1e8:	855e                	mv	a0,s7
 1ea:	60e6                	ld	ra,88(sp)
 1ec:	6446                	ld	s0,80(sp)
 1ee:	64a6                	ld	s1,72(sp)
 1f0:	6906                	ld	s2,64(sp)
 1f2:	79e2                	ld	s3,56(sp)
 1f4:	7a42                	ld	s4,48(sp)
 1f6:	7aa2                	ld	s5,40(sp)
 1f8:	7b02                	ld	s6,32(sp)
 1fa:	6be2                	ld	s7,24(sp)
 1fc:	6125                	addi	sp,sp,96
 1fe:	8082                	ret

0000000000000200 <stat>:

int
stat(const char *n, struct stat *st)
{
 200:	1101                	addi	sp,sp,-32
 202:	ec06                	sd	ra,24(sp)
 204:	e822                	sd	s0,16(sp)
 206:	e426                	sd	s1,8(sp)
 208:	e04a                	sd	s2,0(sp)
 20a:	1000                	addi	s0,sp,32
 20c:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 20e:	4581                	li	a1,0
 210:	00000097          	auipc	ra,0x0
 214:	172080e7          	jalr	370(ra) # 382 <open>
  if(fd < 0)
 218:	02054563          	bltz	a0,242 <stat+0x42>
 21c:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 21e:	85ca                	mv	a1,s2
 220:	00000097          	auipc	ra,0x0
 224:	17a080e7          	jalr	378(ra) # 39a <fstat>
 228:	892a                	mv	s2,a0
  close(fd);
 22a:	8526                	mv	a0,s1
 22c:	00000097          	auipc	ra,0x0
 230:	13e080e7          	jalr	318(ra) # 36a <close>
  return r;
}
 234:	854a                	mv	a0,s2
 236:	60e2                	ld	ra,24(sp)
 238:	6442                	ld	s0,16(sp)
 23a:	64a2                	ld	s1,8(sp)
 23c:	6902                	ld	s2,0(sp)
 23e:	6105                	addi	sp,sp,32
 240:	8082                	ret
    return -1;
 242:	597d                	li	s2,-1
 244:	bfc5                	j	234 <stat+0x34>

0000000000000246 <atoi>:

int
atoi(const char *s)
{
 246:	1141                	addi	sp,sp,-16
 248:	e422                	sd	s0,8(sp)
 24a:	0800                	addi	s0,sp,16
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 24c:	00054603          	lbu	a2,0(a0)
 250:	fd06079b          	addiw	a5,a2,-48
 254:	0ff7f793          	andi	a5,a5,255
 258:	4725                	li	a4,9
 25a:	02f76963          	bltu	a4,a5,28c <atoi+0x46>
 25e:	86aa                	mv	a3,a0
  n = 0;
 260:	4501                	li	a0,0
  while('0' <= *s && *s <= '9')
 262:	45a5                	li	a1,9
    n = n*10 + *s++ - '0';
 264:	0685                	addi	a3,a3,1
 266:	0025179b          	slliw	a5,a0,0x2
 26a:	9fa9                	addw	a5,a5,a0
 26c:	0017979b          	slliw	a5,a5,0x1
 270:	9fb1                	addw	a5,a5,a2
 272:	fd07851b          	addiw	a0,a5,-48
  while('0' <= *s && *s <= '9')
 276:	0006c603          	lbu	a2,0(a3)
 27a:	fd06071b          	addiw	a4,a2,-48
 27e:	0ff77713          	andi	a4,a4,255
 282:	fee5f1e3          	bgeu	a1,a4,264 <atoi+0x1e>
  return n;
}
 286:	6422                	ld	s0,8(sp)
 288:	0141                	addi	sp,sp,16
 28a:	8082                	ret
  n = 0;
 28c:	4501                	li	a0,0
 28e:	bfe5                	j	286 <atoi+0x40>

0000000000000290 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 290:	1141                	addi	sp,sp,-16
 292:	e422                	sd	s0,8(sp)
 294:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 296:	02b57463          	bgeu	a0,a1,2be <memmove+0x2e>
    while(n-- > 0)
 29a:	00c05f63          	blez	a2,2b8 <memmove+0x28>
 29e:	1602                	slli	a2,a2,0x20
 2a0:	9201                	srli	a2,a2,0x20
 2a2:	00c507b3          	add	a5,a0,a2
  dst = vdst;
 2a6:	872a                	mv	a4,a0
      *dst++ = *src++;
 2a8:	0585                	addi	a1,a1,1
 2aa:	0705                	addi	a4,a4,1
 2ac:	fff5c683          	lbu	a3,-1(a1)
 2b0:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 2b4:	fee79ae3          	bne	a5,a4,2a8 <memmove+0x18>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 2b8:	6422                	ld	s0,8(sp)
 2ba:	0141                	addi	sp,sp,16
 2bc:	8082                	ret
    dst += n;
 2be:	00c50733          	add	a4,a0,a2
    src += n;
 2c2:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 2c4:	fec05ae3          	blez	a2,2b8 <memmove+0x28>
 2c8:	fff6079b          	addiw	a5,a2,-1
 2cc:	1782                	slli	a5,a5,0x20
 2ce:	9381                	srli	a5,a5,0x20
 2d0:	fff7c793          	not	a5,a5
 2d4:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 2d6:	15fd                	addi	a1,a1,-1
 2d8:	177d                	addi	a4,a4,-1
 2da:	0005c683          	lbu	a3,0(a1)
 2de:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 2e2:	fee79ae3          	bne	a5,a4,2d6 <memmove+0x46>
 2e6:	bfc9                	j	2b8 <memmove+0x28>

00000000000002e8 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 2e8:	1141                	addi	sp,sp,-16
 2ea:	e422                	sd	s0,8(sp)
 2ec:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 2ee:	ca05                	beqz	a2,31e <memcmp+0x36>
 2f0:	fff6069b          	addiw	a3,a2,-1
 2f4:	1682                	slli	a3,a3,0x20
 2f6:	9281                	srli	a3,a3,0x20
 2f8:	0685                	addi	a3,a3,1
 2fa:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
 2fc:	00054783          	lbu	a5,0(a0)
 300:	0005c703          	lbu	a4,0(a1)
 304:	00e79863          	bne	a5,a4,314 <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
 308:	0505                	addi	a0,a0,1
    p2++;
 30a:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 30c:	fed518e3          	bne	a0,a3,2fc <memcmp+0x14>
  }
  return 0;
 310:	4501                	li	a0,0
 312:	a019                	j	318 <memcmp+0x30>
      return *p1 - *p2;
 314:	40e7853b          	subw	a0,a5,a4
}
 318:	6422                	ld	s0,8(sp)
 31a:	0141                	addi	sp,sp,16
 31c:	8082                	ret
  return 0;
 31e:	4501                	li	a0,0
 320:	bfe5                	j	318 <memcmp+0x30>

0000000000000322 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 322:	1141                	addi	sp,sp,-16
 324:	e406                	sd	ra,8(sp)
 326:	e022                	sd	s0,0(sp)
 328:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 32a:	00000097          	auipc	ra,0x0
 32e:	f66080e7          	jalr	-154(ra) # 290 <memmove>
}
 332:	60a2                	ld	ra,8(sp)
 334:	6402                	ld	s0,0(sp)
 336:	0141                	addi	sp,sp,16
 338:	8082                	ret

000000000000033a <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
 33a:	4885                	li	a7,1
 ecall
 33c:	00000073          	ecall
 ret
 340:	8082                	ret

0000000000000342 <exit>:
.global exit
exit:
 li a7, SYS_exit
 342:	4889                	li	a7,2
 ecall
 344:	00000073          	ecall
 ret
 348:	8082                	ret

000000000000034a <wait>:
.global wait
wait:
 li a7, SYS_wait
 34a:	488d                	li	a7,3
 ecall
 34c:	00000073          	ecall
 ret
 350:	8082                	ret

0000000000000352 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 352:	4891                	li	a7,4
 ecall
 354:	00000073          	ecall
 ret
 358:	8082                	ret

000000000000035a <read>:
.global read
read:
 li a7, SYS_read
 35a:	4895                	li	a7,5
 ecall
 35c:	00000073          	ecall
 ret
 360:	8082                	ret

0000000000000362 <write>:
.global write
write:
 li a7, SYS_write
 362:	48c1                	li	a7,16
 ecall
 364:	00000073          	ecall
 ret
 368:	8082                	ret

000000000000036a <close>:
.global close
close:
 li a7, SYS_close
 36a:	48d5                	li	a7,21
 ecall
 36c:	00000073          	ecall
 ret
 370:	8082                	ret

0000000000000372 <kill>:
.global kill
kill:
 li a7, SYS_kill
 372:	4899                	li	a7,6
 ecall
 374:	00000073          	ecall
 ret
 378:	8082                	ret

000000000000037a <exec>:
.global exec
exec:
 li a7, SYS_exec
 37a:	489d                	li	a7,7
 ecall
 37c:	00000073          	ecall
 ret
 380:	8082                	ret

0000000000000382 <open>:
.global open
open:
 li a7, SYS_open
 382:	48bd                	li	a7,15
 ecall
 384:	00000073          	ecall
 ret
 388:	8082                	ret

000000000000038a <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
 38a:	48c5                	li	a7,17
 ecall
 38c:	00000073          	ecall
 ret
 390:	8082                	ret

0000000000000392 <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
 392:	48c9                	li	a7,18
 ecall
 394:	00000073          	ecall
 ret
 398:	8082                	ret

000000000000039a <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 39a:	48a1                	li	a7,8
 ecall
 39c:	00000073          	ecall
 ret
 3a0:	8082                	ret

00000000000003a2 <link>:
.global link
link:
 li a7, SYS_link
 3a2:	48cd                	li	a7,19
 ecall
 3a4:	00000073          	ecall
 ret
 3a8:	8082                	ret

00000000000003aa <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 3aa:	48d1                	li	a7,20
 ecall
 3ac:	00000073          	ecall
 ret
 3b0:	8082                	ret

00000000000003b2 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 3b2:	48a5                	li	a7,9
 ecall
 3b4:	00000073          	ecall
 ret
 3b8:	8082                	ret

00000000000003ba <dup>:
.global dup
dup:
 li a7, SYS_dup
 3ba:	48a9                	li	a7,10
 ecall
 3bc:	00000073          	ecall
 ret
 3c0:	8082                	ret

00000000000003c2 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 3c2:	48ad                	li	a7,11
 ecall
 3c4:	00000073          	ecall
 ret
 3c8:	8082                	ret

00000000000003ca <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 3ca:	48b1                	li	a7,12
 ecall
 3cc:	00000073          	ecall
 ret
 3d0:	8082                	ret

00000000000003d2 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 3d2:	48b5                	li	a7,13
 ecall
 3d4:	00000073          	ecall
 ret
 3d8:	8082                	ret

00000000000003da <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 3da:	48b9                	li	a7,14
 ecall
 3dc:	00000073          	ecall
 ret
 3e0:	8082                	ret

00000000000003e2 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 3e2:	1101                	addi	sp,sp,-32
 3e4:	ec06                	sd	ra,24(sp)
 3e6:	e822                	sd	s0,16(sp)
 3e8:	1000                	addi	s0,sp,32
 3ea:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 3ee:	4605                	li	a2,1
 3f0:	fef40593          	addi	a1,s0,-17
 3f4:	00000097          	auipc	ra,0x0
 3f8:	f6e080e7          	jalr	-146(ra) # 362 <write>
}
 3fc:	60e2                	ld	ra,24(sp)
 3fe:	6442                	ld	s0,16(sp)
 400:	6105                	addi	sp,sp,32
 402:	8082                	ret

0000000000000404 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 404:	7139                	addi	sp,sp,-64
 406:	fc06                	sd	ra,56(sp)
 408:	f822                	sd	s0,48(sp)
 40a:	f426                	sd	s1,40(sp)
 40c:	f04a                	sd	s2,32(sp)
 40e:	ec4e                	sd	s3,24(sp)
 410:	0080                	addi	s0,sp,64
 412:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 414:	c299                	beqz	a3,41a <printint+0x16>
 416:	0805c863          	bltz	a1,4a6 <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 41a:	2581                	sext.w	a1,a1
  neg = 0;
 41c:	4881                	li	a7,0
 41e:	fc040693          	addi	a3,s0,-64
  }

  i = 0;
 422:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 424:	2601                	sext.w	a2,a2
 426:	00001517          	auipc	a0,0x1
 42a:	85250513          	addi	a0,a0,-1966 # c78 <digits>
 42e:	883a                	mv	a6,a4
 430:	2705                	addiw	a4,a4,1
 432:	02c5f7bb          	remuw	a5,a1,a2
 436:	1782                	slli	a5,a5,0x20
 438:	9381                	srli	a5,a5,0x20
 43a:	97aa                	add	a5,a5,a0
 43c:	0007c783          	lbu	a5,0(a5)
 440:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 444:	0005879b          	sext.w	a5,a1
 448:	02c5d5bb          	divuw	a1,a1,a2
 44c:	0685                	addi	a3,a3,1
 44e:	fec7f0e3          	bgeu	a5,a2,42e <printint+0x2a>
  if(neg)
 452:	00088b63          	beqz	a7,468 <printint+0x64>
    buf[i++] = '-';
 456:	fd040793          	addi	a5,s0,-48
 45a:	973e                	add	a4,a4,a5
 45c:	02d00793          	li	a5,45
 460:	fef70823          	sb	a5,-16(a4)
 464:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 468:	02e05863          	blez	a4,498 <printint+0x94>
 46c:	fc040793          	addi	a5,s0,-64
 470:	00e78933          	add	s2,a5,a4
 474:	fff78993          	addi	s3,a5,-1
 478:	99ba                	add	s3,s3,a4
 47a:	377d                	addiw	a4,a4,-1
 47c:	1702                	slli	a4,a4,0x20
 47e:	9301                	srli	a4,a4,0x20
 480:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 484:	fff94583          	lbu	a1,-1(s2)
 488:	8526                	mv	a0,s1
 48a:	00000097          	auipc	ra,0x0
 48e:	f58080e7          	jalr	-168(ra) # 3e2 <putc>
  while(--i >= 0)
 492:	197d                	addi	s2,s2,-1
 494:	ff3918e3          	bne	s2,s3,484 <printint+0x80>
}
 498:	70e2                	ld	ra,56(sp)
 49a:	7442                	ld	s0,48(sp)
 49c:	74a2                	ld	s1,40(sp)
 49e:	7902                	ld	s2,32(sp)
 4a0:	69e2                	ld	s3,24(sp)
 4a2:	6121                	addi	sp,sp,64
 4a4:	8082                	ret
    x = -xx;
 4a6:	40b005bb          	negw	a1,a1
    neg = 1;
 4aa:	4885                	li	a7,1
    x = -xx;
 4ac:	bf8d                	j	41e <printint+0x1a>

00000000000004ae <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 4ae:	7119                	addi	sp,sp,-128
 4b0:	fc86                	sd	ra,120(sp)
 4b2:	f8a2                	sd	s0,112(sp)
 4b4:	f4a6                	sd	s1,104(sp)
 4b6:	f0ca                	sd	s2,96(sp)
 4b8:	ecce                	sd	s3,88(sp)
 4ba:	e8d2                	sd	s4,80(sp)
 4bc:	e4d6                	sd	s5,72(sp)
 4be:	e0da                	sd	s6,64(sp)
 4c0:	fc5e                	sd	s7,56(sp)
 4c2:	f862                	sd	s8,48(sp)
 4c4:	f466                	sd	s9,40(sp)
 4c6:	f06a                	sd	s10,32(sp)
 4c8:	ec6e                	sd	s11,24(sp)
 4ca:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 4cc:	0005c903          	lbu	s2,0(a1)
 4d0:	18090f63          	beqz	s2,66e <vprintf+0x1c0>
 4d4:	8aaa                	mv	s5,a0
 4d6:	8b32                	mv	s6,a2
 4d8:	00158493          	addi	s1,a1,1
  state = 0;
 4dc:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 4de:	02500a13          	li	s4,37
      if(c == 'd'){
 4e2:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c == 'l') {
 4e6:	06c00c93          	li	s9,108
        printint(fd, va_arg(ap, uint64), 10, 0);
      } else if(c == 'x') {
 4ea:	07800d13          	li	s10,120
        printint(fd, va_arg(ap, int), 16, 0);
      } else if(c == 'p') {
 4ee:	07000d93          	li	s11,112
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 4f2:	00000b97          	auipc	s7,0x0
 4f6:	786b8b93          	addi	s7,s7,1926 # c78 <digits>
 4fa:	a839                	j	518 <vprintf+0x6a>
        putc(fd, c);
 4fc:	85ca                	mv	a1,s2
 4fe:	8556                	mv	a0,s5
 500:	00000097          	auipc	ra,0x0
 504:	ee2080e7          	jalr	-286(ra) # 3e2 <putc>
 508:	a019                	j	50e <vprintf+0x60>
    } else if(state == '%'){
 50a:	01498f63          	beq	s3,s4,528 <vprintf+0x7a>
  for(i = 0; fmt[i]; i++){
 50e:	0485                	addi	s1,s1,1
 510:	fff4c903          	lbu	s2,-1(s1)
 514:	14090d63          	beqz	s2,66e <vprintf+0x1c0>
    c = fmt[i] & 0xff;
 518:	0009079b          	sext.w	a5,s2
    if(state == 0){
 51c:	fe0997e3          	bnez	s3,50a <vprintf+0x5c>
      if(c == '%'){
 520:	fd479ee3          	bne	a5,s4,4fc <vprintf+0x4e>
        state = '%';
 524:	89be                	mv	s3,a5
 526:	b7e5                	j	50e <vprintf+0x60>
      if(c == 'd'){
 528:	05878063          	beq	a5,s8,568 <vprintf+0xba>
      } else if(c == 'l') {
 52c:	05978c63          	beq	a5,s9,584 <vprintf+0xd6>
      } else if(c == 'x') {
 530:	07a78863          	beq	a5,s10,5a0 <vprintf+0xf2>
      } else if(c == 'p') {
 534:	09b78463          	beq	a5,s11,5bc <vprintf+0x10e>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
 538:	07300713          	li	a4,115
 53c:	0ce78663          	beq	a5,a4,608 <vprintf+0x15a>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 540:	06300713          	li	a4,99
 544:	0ee78e63          	beq	a5,a4,640 <vprintf+0x192>
        putc(fd, va_arg(ap, uint));
      } else if(c == '%'){
 548:	11478863          	beq	a5,s4,658 <vprintf+0x1aa>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 54c:	85d2                	mv	a1,s4
 54e:	8556                	mv	a0,s5
 550:	00000097          	auipc	ra,0x0
 554:	e92080e7          	jalr	-366(ra) # 3e2 <putc>
        putc(fd, c);
 558:	85ca                	mv	a1,s2
 55a:	8556                	mv	a0,s5
 55c:	00000097          	auipc	ra,0x0
 560:	e86080e7          	jalr	-378(ra) # 3e2 <putc>
      }
      state = 0;
 564:	4981                	li	s3,0
 566:	b765                	j	50e <vprintf+0x60>
        printint(fd, va_arg(ap, int), 10, 1);
 568:	008b0913          	addi	s2,s6,8
 56c:	4685                	li	a3,1
 56e:	4629                	li	a2,10
 570:	000b2583          	lw	a1,0(s6)
 574:	8556                	mv	a0,s5
 576:	00000097          	auipc	ra,0x0
 57a:	e8e080e7          	jalr	-370(ra) # 404 <printint>
 57e:	8b4a                	mv	s6,s2
      state = 0;
 580:	4981                	li	s3,0
 582:	b771                	j	50e <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 584:	008b0913          	addi	s2,s6,8
 588:	4681                	li	a3,0
 58a:	4629                	li	a2,10
 58c:	000b2583          	lw	a1,0(s6)
 590:	8556                	mv	a0,s5
 592:	00000097          	auipc	ra,0x0
 596:	e72080e7          	jalr	-398(ra) # 404 <printint>
 59a:	8b4a                	mv	s6,s2
      state = 0;
 59c:	4981                	li	s3,0
 59e:	bf85                	j	50e <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 5a0:	008b0913          	addi	s2,s6,8
 5a4:	4681                	li	a3,0
 5a6:	4641                	li	a2,16
 5a8:	000b2583          	lw	a1,0(s6)
 5ac:	8556                	mv	a0,s5
 5ae:	00000097          	auipc	ra,0x0
 5b2:	e56080e7          	jalr	-426(ra) # 404 <printint>
 5b6:	8b4a                	mv	s6,s2
      state = 0;
 5b8:	4981                	li	s3,0
 5ba:	bf91                	j	50e <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 5bc:	008b0793          	addi	a5,s6,8
 5c0:	f8f43423          	sd	a5,-120(s0)
 5c4:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 5c8:	03000593          	li	a1,48
 5cc:	8556                	mv	a0,s5
 5ce:	00000097          	auipc	ra,0x0
 5d2:	e14080e7          	jalr	-492(ra) # 3e2 <putc>
  putc(fd, 'x');
 5d6:	85ea                	mv	a1,s10
 5d8:	8556                	mv	a0,s5
 5da:	00000097          	auipc	ra,0x0
 5de:	e08080e7          	jalr	-504(ra) # 3e2 <putc>
 5e2:	4941                	li	s2,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 5e4:	03c9d793          	srli	a5,s3,0x3c
 5e8:	97de                	add	a5,a5,s7
 5ea:	0007c583          	lbu	a1,0(a5)
 5ee:	8556                	mv	a0,s5
 5f0:	00000097          	auipc	ra,0x0
 5f4:	df2080e7          	jalr	-526(ra) # 3e2 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 5f8:	0992                	slli	s3,s3,0x4
 5fa:	397d                	addiw	s2,s2,-1
 5fc:	fe0914e3          	bnez	s2,5e4 <vprintf+0x136>
        printptr(fd, va_arg(ap, uint64));
 600:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 604:	4981                	li	s3,0
 606:	b721                	j	50e <vprintf+0x60>
        s = va_arg(ap, char*);
 608:	008b0993          	addi	s3,s6,8
 60c:	000b3903          	ld	s2,0(s6)
        if(s == 0)
 610:	02090163          	beqz	s2,632 <vprintf+0x184>
        while(*s != 0){
 614:	00094583          	lbu	a1,0(s2)
 618:	c9a1                	beqz	a1,668 <vprintf+0x1ba>
          putc(fd, *s);
 61a:	8556                	mv	a0,s5
 61c:	00000097          	auipc	ra,0x0
 620:	dc6080e7          	jalr	-570(ra) # 3e2 <putc>
          s++;
 624:	0905                	addi	s2,s2,1
        while(*s != 0){
 626:	00094583          	lbu	a1,0(s2)
 62a:	f9e5                	bnez	a1,61a <vprintf+0x16c>
        s = va_arg(ap, char*);
 62c:	8b4e                	mv	s6,s3
      state = 0;
 62e:	4981                	li	s3,0
 630:	bdf9                	j	50e <vprintf+0x60>
          s = "(null)";
 632:	00000917          	auipc	s2,0x0
 636:	63e90913          	addi	s2,s2,1598 # c70 <thread_start_threading+0x62>
        while(*s != 0){
 63a:	02800593          	li	a1,40
 63e:	bff1                	j	61a <vprintf+0x16c>
        putc(fd, va_arg(ap, uint));
 640:	008b0913          	addi	s2,s6,8
 644:	000b4583          	lbu	a1,0(s6)
 648:	8556                	mv	a0,s5
 64a:	00000097          	auipc	ra,0x0
 64e:	d98080e7          	jalr	-616(ra) # 3e2 <putc>
 652:	8b4a                	mv	s6,s2
      state = 0;
 654:	4981                	li	s3,0
 656:	bd65                	j	50e <vprintf+0x60>
        putc(fd, c);
 658:	85d2                	mv	a1,s4
 65a:	8556                	mv	a0,s5
 65c:	00000097          	auipc	ra,0x0
 660:	d86080e7          	jalr	-634(ra) # 3e2 <putc>
      state = 0;
 664:	4981                	li	s3,0
 666:	b565                	j	50e <vprintf+0x60>
        s = va_arg(ap, char*);
 668:	8b4e                	mv	s6,s3
      state = 0;
 66a:	4981                	li	s3,0
 66c:	b54d                	j	50e <vprintf+0x60>
    }
  }
}
 66e:	70e6                	ld	ra,120(sp)
 670:	7446                	ld	s0,112(sp)
 672:	74a6                	ld	s1,104(sp)
 674:	7906                	ld	s2,96(sp)
 676:	69e6                	ld	s3,88(sp)
 678:	6a46                	ld	s4,80(sp)
 67a:	6aa6                	ld	s5,72(sp)
 67c:	6b06                	ld	s6,64(sp)
 67e:	7be2                	ld	s7,56(sp)
 680:	7c42                	ld	s8,48(sp)
 682:	7ca2                	ld	s9,40(sp)
 684:	7d02                	ld	s10,32(sp)
 686:	6de2                	ld	s11,24(sp)
 688:	6109                	addi	sp,sp,128
 68a:	8082                	ret

000000000000068c <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 68c:	715d                	addi	sp,sp,-80
 68e:	ec06                	sd	ra,24(sp)
 690:	e822                	sd	s0,16(sp)
 692:	1000                	addi	s0,sp,32
 694:	e010                	sd	a2,0(s0)
 696:	e414                	sd	a3,8(s0)
 698:	e818                	sd	a4,16(s0)
 69a:	ec1c                	sd	a5,24(s0)
 69c:	03043023          	sd	a6,32(s0)
 6a0:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 6a4:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 6a8:	8622                	mv	a2,s0
 6aa:	00000097          	auipc	ra,0x0
 6ae:	e04080e7          	jalr	-508(ra) # 4ae <vprintf>
}
 6b2:	60e2                	ld	ra,24(sp)
 6b4:	6442                	ld	s0,16(sp)
 6b6:	6161                	addi	sp,sp,80
 6b8:	8082                	ret

00000000000006ba <printf>:

void
printf(const char *fmt, ...)
{
 6ba:	711d                	addi	sp,sp,-96
 6bc:	ec06                	sd	ra,24(sp)
 6be:	e822                	sd	s0,16(sp)
 6c0:	1000                	addi	s0,sp,32
 6c2:	e40c                	sd	a1,8(s0)
 6c4:	e810                	sd	a2,16(s0)
 6c6:	ec14                	sd	a3,24(s0)
 6c8:	f018                	sd	a4,32(s0)
 6ca:	f41c                	sd	a5,40(s0)
 6cc:	03043823          	sd	a6,48(s0)
 6d0:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 6d4:	00840613          	addi	a2,s0,8
 6d8:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 6dc:	85aa                	mv	a1,a0
 6de:	4505                	li	a0,1
 6e0:	00000097          	auipc	ra,0x0
 6e4:	dce080e7          	jalr	-562(ra) # 4ae <vprintf>
}
 6e8:	60e2                	ld	ra,24(sp)
 6ea:	6442                	ld	s0,16(sp)
 6ec:	6125                	addi	sp,sp,96
 6ee:	8082                	ret

00000000000006f0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6f0:	1141                	addi	sp,sp,-16
 6f2:	e422                	sd	s0,8(sp)
 6f4:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6f6:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6fa:	00000797          	auipc	a5,0x0
 6fe:	59e7b783          	ld	a5,1438(a5) # c98 <freep>
 702:	a805                	j	732 <free+0x42>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 704:	4618                	lw	a4,8(a2)
 706:	9db9                	addw	a1,a1,a4
 708:	feb52c23          	sw	a1,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 70c:	6398                	ld	a4,0(a5)
 70e:	6318                	ld	a4,0(a4)
 710:	fee53823          	sd	a4,-16(a0)
 714:	a091                	j	758 <free+0x68>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 716:	ff852703          	lw	a4,-8(a0)
 71a:	9e39                	addw	a2,a2,a4
 71c:	c790                	sw	a2,8(a5)
    p->s.ptr = bp->s.ptr;
 71e:	ff053703          	ld	a4,-16(a0)
 722:	e398                	sd	a4,0(a5)
 724:	a099                	j	76a <free+0x7a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 726:	6398                	ld	a4,0(a5)
 728:	00e7e463          	bltu	a5,a4,730 <free+0x40>
 72c:	00e6ea63          	bltu	a3,a4,740 <free+0x50>
{
 730:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 732:	fed7fae3          	bgeu	a5,a3,726 <free+0x36>
 736:	6398                	ld	a4,0(a5)
 738:	00e6e463          	bltu	a3,a4,740 <free+0x50>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 73c:	fee7eae3          	bltu	a5,a4,730 <free+0x40>
  if(bp + bp->s.size == p->s.ptr){
 740:	ff852583          	lw	a1,-8(a0)
 744:	6390                	ld	a2,0(a5)
 746:	02059713          	slli	a4,a1,0x20
 74a:	9301                	srli	a4,a4,0x20
 74c:	0712                	slli	a4,a4,0x4
 74e:	9736                	add	a4,a4,a3
 750:	fae60ae3          	beq	a2,a4,704 <free+0x14>
    bp->s.ptr = p->s.ptr;
 754:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 758:	4790                	lw	a2,8(a5)
 75a:	02061713          	slli	a4,a2,0x20
 75e:	9301                	srli	a4,a4,0x20
 760:	0712                	slli	a4,a4,0x4
 762:	973e                	add	a4,a4,a5
 764:	fae689e3          	beq	a3,a4,716 <free+0x26>
  } else
    p->s.ptr = bp;
 768:	e394                	sd	a3,0(a5)
  freep = p;
 76a:	00000717          	auipc	a4,0x0
 76e:	52f73723          	sd	a5,1326(a4) # c98 <freep>
}
 772:	6422                	ld	s0,8(sp)
 774:	0141                	addi	sp,sp,16
 776:	8082                	ret

0000000000000778 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 778:	7139                	addi	sp,sp,-64
 77a:	fc06                	sd	ra,56(sp)
 77c:	f822                	sd	s0,48(sp)
 77e:	f426                	sd	s1,40(sp)
 780:	f04a                	sd	s2,32(sp)
 782:	ec4e                	sd	s3,24(sp)
 784:	e852                	sd	s4,16(sp)
 786:	e456                	sd	s5,8(sp)
 788:	e05a                	sd	s6,0(sp)
 78a:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 78c:	02051493          	slli	s1,a0,0x20
 790:	9081                	srli	s1,s1,0x20
 792:	04bd                	addi	s1,s1,15
 794:	8091                	srli	s1,s1,0x4
 796:	0014899b          	addiw	s3,s1,1
 79a:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 79c:	00000517          	auipc	a0,0x0
 7a0:	4fc53503          	ld	a0,1276(a0) # c98 <freep>
 7a4:	c515                	beqz	a0,7d0 <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7a6:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 7a8:	4798                	lw	a4,8(a5)
 7aa:	02977f63          	bgeu	a4,s1,7e8 <malloc+0x70>
 7ae:	8a4e                	mv	s4,s3
 7b0:	0009871b          	sext.w	a4,s3
 7b4:	6685                	lui	a3,0x1
 7b6:	00d77363          	bgeu	a4,a3,7bc <malloc+0x44>
 7ba:	6a05                	lui	s4,0x1
 7bc:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
 7c0:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 7c4:	00000917          	auipc	s2,0x0
 7c8:	4d490913          	addi	s2,s2,1236 # c98 <freep>
  if(p == (char*)-1)
 7cc:	5afd                	li	s5,-1
 7ce:	a88d                	j	840 <malloc+0xc8>
    base.s.ptr = freep = prevp = &base;
 7d0:	00000797          	auipc	a5,0x0
 7d4:	4e078793          	addi	a5,a5,1248 # cb0 <base>
 7d8:	00000717          	auipc	a4,0x0
 7dc:	4cf73023          	sd	a5,1216(a4) # c98 <freep>
 7e0:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
 7e2:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
 7e6:	b7e1                	j	7ae <malloc+0x36>
      if(p->s.size == nunits)
 7e8:	02e48b63          	beq	s1,a4,81e <malloc+0xa6>
        p->s.size -= nunits;
 7ec:	4137073b          	subw	a4,a4,s3
 7f0:	c798                	sw	a4,8(a5)
        p += p->s.size;
 7f2:	1702                	slli	a4,a4,0x20
 7f4:	9301                	srli	a4,a4,0x20
 7f6:	0712                	slli	a4,a4,0x4
 7f8:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 7fa:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 7fe:	00000717          	auipc	a4,0x0
 802:	48a73d23          	sd	a0,1178(a4) # c98 <freep>
      return (void*)(p + 1);
 806:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 80a:	70e2                	ld	ra,56(sp)
 80c:	7442                	ld	s0,48(sp)
 80e:	74a2                	ld	s1,40(sp)
 810:	7902                	ld	s2,32(sp)
 812:	69e2                	ld	s3,24(sp)
 814:	6a42                	ld	s4,16(sp)
 816:	6aa2                	ld	s5,8(sp)
 818:	6b02                	ld	s6,0(sp)
 81a:	6121                	addi	sp,sp,64
 81c:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 81e:	6398                	ld	a4,0(a5)
 820:	e118                	sd	a4,0(a0)
 822:	bff1                	j	7fe <malloc+0x86>
  hp->s.size = nu;
 824:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 828:	0541                	addi	a0,a0,16
 82a:	00000097          	auipc	ra,0x0
 82e:	ec6080e7          	jalr	-314(ra) # 6f0 <free>
  return freep;
 832:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 836:	d971                	beqz	a0,80a <malloc+0x92>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 838:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 83a:	4798                	lw	a4,8(a5)
 83c:	fa9776e3          	bgeu	a4,s1,7e8 <malloc+0x70>
    if(p == freep)
 840:	00093703          	ld	a4,0(s2)
 844:	853e                	mv	a0,a5
 846:	fef719e3          	bne	a4,a5,838 <malloc+0xc0>
  p = sbrk(nu * sizeof(Header));
 84a:	8552                	mv	a0,s4
 84c:	00000097          	auipc	ra,0x0
 850:	b7e080e7          	jalr	-1154(ra) # 3ca <sbrk>
  if(p == (char*)-1)
 854:	fd5518e3          	bne	a0,s5,824 <malloc+0xac>
        return 0;
 858:	4501                	li	a0,0
 85a:	bf45                	j	80a <malloc+0x92>

000000000000085c <setjmp>:
 85c:	e100                	sd	s0,0(a0)
 85e:	e504                	sd	s1,8(a0)
 860:	01253823          	sd	s2,16(a0)
 864:	01353c23          	sd	s3,24(a0)
 868:	03453023          	sd	s4,32(a0)
 86c:	03553423          	sd	s5,40(a0)
 870:	03653823          	sd	s6,48(a0)
 874:	03753c23          	sd	s7,56(a0)
 878:	05853023          	sd	s8,64(a0)
 87c:	05953423          	sd	s9,72(a0)
 880:	05a53823          	sd	s10,80(a0)
 884:	05b53c23          	sd	s11,88(a0)
 888:	06153023          	sd	ra,96(a0)
 88c:	06253423          	sd	sp,104(a0)
 890:	4501                	li	a0,0
 892:	8082                	ret

0000000000000894 <longjmp>:
 894:	6100                	ld	s0,0(a0)
 896:	6504                	ld	s1,8(a0)
 898:	01053903          	ld	s2,16(a0)
 89c:	01853983          	ld	s3,24(a0)
 8a0:	02053a03          	ld	s4,32(a0)
 8a4:	02853a83          	ld	s5,40(a0)
 8a8:	03053b03          	ld	s6,48(a0)
 8ac:	03853b83          	ld	s7,56(a0)
 8b0:	04053c03          	ld	s8,64(a0)
 8b4:	04853c83          	ld	s9,72(a0)
 8b8:	05053d03          	ld	s10,80(a0)
 8bc:	05853d83          	ld	s11,88(a0)
 8c0:	06053083          	ld	ra,96(a0)
 8c4:	06853103          	ld	sp,104(a0)
 8c8:	c199                	beqz	a1,8ce <longjmp_1>
 8ca:	852e                	mv	a0,a1
 8cc:	8082                	ret

00000000000008ce <longjmp_1>:
 8ce:	4505                	li	a0,1
 8d0:	8082                	ret

00000000000008d2 <thread_create>:
static jmp_buf env_tmp;
struct thread* stack[100] = {};
int cnt = -1;
// TODO: necessary declares, if any

struct thread *thread_create(void (*f)(void *), void *arg){
 8d2:	7179                	addi	sp,sp,-48
 8d4:	f406                	sd	ra,40(sp)
 8d6:	f022                	sd	s0,32(sp)
 8d8:	ec26                	sd	s1,24(sp)
 8da:	e84a                	sd	s2,16(sp)
 8dc:	e44e                	sd	s3,8(sp)
 8de:	1800                	addi	s0,sp,48
 8e0:	89aa                	mv	s3,a0
 8e2:	892e                	mv	s2,a1
    struct thread *t = (struct thread*) malloc(sizeof(struct thread));
 8e4:	0b000513          	li	a0,176
 8e8:	00000097          	auipc	ra,0x0
 8ec:	e90080e7          	jalr	-368(ra) # 778 <malloc>
 8f0:	84aa                	mv	s1,a0
    //unsigned long stack_p = 0;
    unsigned long new_stack_p;
    unsigned long new_stack;
    new_stack = (unsigned long) malloc(sizeof(unsigned long)*0x100);
 8f2:	6505                	lui	a0,0x1
 8f4:	80050513          	addi	a0,a0,-2048 # 800 <malloc+0x88>
 8f8:	00000097          	auipc	ra,0x0
 8fc:	e80080e7          	jalr	-384(ra) # 778 <malloc>
    new_stack_p = new_stack +0x100*8-0x2*8;
    t -> fp = f;
 900:	0134b023          	sd	s3,0(s1)
    t -> arg = arg;
 904:	0124b423          	sd	s2,8(s1)
    t -> ID  = id;
 908:	00000717          	auipc	a4,0x0
 90c:	38c70713          	addi	a4,a4,908 # c94 <id>
 910:	431c                	lw	a5,0(a4)
 912:	08f4a823          	sw	a5,144(s1)
    t -> buf_set = 0;
 916:	0804aa23          	sw	zero,148(s1)
    t -> stack = (void*) new_stack;
 91a:	e888                	sd	a0,16(s1)
    new_stack_p = new_stack +0x100*8-0x2*8;
 91c:	7f050513          	addi	a0,a0,2032
    t -> stack_p = (void*) new_stack_p;
 920:	ec88                	sd	a0,24(s1)
    id++;
 922:	2785                	addiw	a5,a5,1
 924:	c31c                	sw	a5,0(a4)
    return t;
}
 926:	8526                	mv	a0,s1
 928:	70a2                	ld	ra,40(sp)
 92a:	7402                	ld	s0,32(sp)
 92c:	64e2                	ld	s1,24(sp)
 92e:	6942                	ld	s2,16(sp)
 930:	69a2                	ld	s3,8(sp)
 932:	6145                	addi	sp,sp,48
 934:	8082                	ret

0000000000000936 <thread_add_runqueue>:
void thread_add_runqueue(struct thread *t){
 936:	1101                	addi	sp,sp,-32
 938:	ec06                	sd	ra,24(sp)
 93a:	e822                	sd	s0,16(sp)
 93c:	e426                	sd	s1,8(sp)
 93e:	1000                	addi	s0,sp,32
 940:	84aa                	mv	s1,a0
    if(current_thread == NULL){
 942:	00000797          	auipc	a5,0x0
 946:	3667b783          	ld	a5,870(a5) # ca8 <current_thread>
 94a:	c385                	beqz	a5,96a <thread_add_runqueue+0x34>
        t -> right = NULL;
        t -> parent = NULL;
    }
    else{
        // TODO
        if(current_thread -> left == NULL) {
 94c:	6fd8                	ld	a4,152(a5)
 94e:	c329                	beqz	a4,990 <thread_add_runqueue+0x5a>
            current_thread -> left = t;
            t -> parent = current_thread;
            t -> left = t -> right = NULL;
        }
        else if(current_thread -> right == NULL) {
 950:	73d8                	ld	a4,160(a5)
 952:	c731                	beqz	a4,99e <thread_add_runqueue+0x68>
            current_thread -> right = t;
            t -> parent = current_thread;
            t -> left = t -> right = NULL;
        }
        else {
            free(t -> stack);
 954:	6908                	ld	a0,16(a0)
 956:	00000097          	auipc	ra,0x0
 95a:	d9a080e7          	jalr	-614(ra) # 6f0 <free>
            free(t);
 95e:	8526                	mv	a0,s1
 960:	00000097          	auipc	ra,0x0
 964:	d90080e7          	jalr	-624(ra) # 6f0 <free>
        }
    }
}
 968:	a839                	j	986 <thread_add_runqueue+0x50>
        current_thread = t;
 96a:	00000797          	auipc	a5,0x0
 96e:	32a7bf23          	sd	a0,830(a5) # ca8 <current_thread>
        root_thread = t;
 972:	00000797          	auipc	a5,0x0
 976:	32a7b723          	sd	a0,814(a5) # ca0 <root_thread>
        t -> left = NULL;
 97a:	08053c23          	sd	zero,152(a0)
        t -> right = NULL;
 97e:	0a053023          	sd	zero,160(a0)
        t -> parent = NULL;
 982:	0a053423          	sd	zero,168(a0)
}
 986:	60e2                	ld	ra,24(sp)
 988:	6442                	ld	s0,16(sp)
 98a:	64a2                	ld	s1,8(sp)
 98c:	6105                	addi	sp,sp,32
 98e:	8082                	ret
            current_thread -> left = t;
 990:	efc8                	sd	a0,152(a5)
            t -> parent = current_thread;
 992:	f55c                	sd	a5,168(a0)
            t -> left = t -> right = NULL;
 994:	0a053023          	sd	zero,160(a0)
 998:	08053c23          	sd	zero,152(a0)
 99c:	b7ed                	j	986 <thread_add_runqueue+0x50>
            current_thread -> right = t;
 99e:	f3c8                	sd	a0,160(a5)
            t -> parent = current_thread;
 9a0:	f55c                	sd	a5,168(a0)
            t -> left = t -> right = NULL;
 9a2:	0a053023          	sd	zero,160(a0)
 9a6:	08053c23          	sd	zero,152(a0)
 9aa:	bff1                	j	986 <thread_add_runqueue+0x50>

00000000000009ac <schedule>:
        current_thread -> fp(current_thread -> arg);
        thread_exit();
    }
    longjmp(current_thread -> env, 1);
}
void schedule(void){
 9ac:	1141                	addi	sp,sp,-16
 9ae:	e422                	sd	s0,8(sp)
 9b0:	0800                	addi	s0,sp,16
    // TODO
    struct thread* prev = NULL;
    struct thread* curr = NULL;
    cnt = -1;
    cnt++;
    stack[cnt] = root_thread;
 9b2:	00000897          	auipc	a7,0x0
 9b6:	2ee8b883          	ld	a7,750(a7) # ca0 <root_thread>
 9ba:	00000797          	auipc	a5,0x0
 9be:	3117b323          	sd	a7,774(a5) # cc0 <stack>
    while(cnt >= 0) {
        curr = stack[cnt];
        cnt--;
        if(prev == current_thread) {
 9c2:	00000817          	auipc	a6,0x0
 9c6:	2e683803          	ld	a6,742(a6) # ca8 <current_thread>
    struct thread* prev = NULL;
 9ca:	4701                	li	a4,0
    while(cnt >= 0) {
 9cc:	4781                	li	a5,0
        curr = stack[cnt];
 9ce:	00000597          	auipc	a1,0x0
 9d2:	2f258593          	addi	a1,a1,754 # cc0 <stack>
 9d6:	a025                	j	9fe <schedule+0x52>
 9d8:	00000797          	auipc	a5,0x0
 9dc:	2aa7ac23          	sw	a0,696(a5) # c90 <cnt>
            current_thread = curr;
 9e0:	00000797          	auipc	a5,0x0
 9e4:	2ce7b423          	sd	a4,712(a5) # ca8 <current_thread>
            return;
 9e8:	a099                	j	a2e <schedule+0x82>
        cnt--;
 9ea:	87aa                	mv	a5,a0
        }
        if(curr -> right != NULL) {
            cnt++;
            stack[cnt] = curr -> right;
        }
        if(curr -> left != NULL) {
 9ec:	6f50                	ld	a2,152(a4)
 9ee:	c611                	beqz	a2,9fa <schedule+0x4e>
            cnt++;
 9f0:	2785                	addiw	a5,a5,1
            stack[cnt] = curr -> left;
 9f2:	00379693          	slli	a3,a5,0x3
 9f6:	96ae                	add	a3,a3,a1
 9f8:	e290                	sd	a2,0(a3)
    while(cnt >= 0) {
 9fa:	0207c263          	bltz	a5,a1e <schedule+0x72>
        curr = stack[cnt];
 9fe:	86ba                	mv	a3,a4
 a00:	00379713          	slli	a4,a5,0x3
 a04:	972e                	add	a4,a4,a1
 a06:	6318                	ld	a4,0(a4)
        cnt--;
 a08:	fff7851b          	addiw	a0,a5,-1
        if(prev == current_thread) {
 a0c:	fcd806e3          	beq	a6,a3,9d8 <schedule+0x2c>
        if(curr -> right != NULL) {
 a10:	7350                	ld	a2,160(a4)
 a12:	de61                	beqz	a2,9ea <schedule+0x3e>
            stack[cnt] = curr -> right;
 a14:	00379693          	slli	a3,a5,0x3
 a18:	96ae                	add	a3,a3,a1
 a1a:	e290                	sd	a2,0(a3)
 a1c:	bfc1                	j	9ec <schedule+0x40>
 a1e:	00000717          	auipc	a4,0x0
 a22:	26f72923          	sw	a5,626(a4) # c90 <cnt>
        }
        prev = curr;
    }
    current_thread = root_thread;
 a26:	00000797          	auipc	a5,0x0
 a2a:	2917b123          	sd	a7,642(a5) # ca8 <current_thread>
}
 a2e:	6422                	ld	s0,8(sp)
 a30:	0141                	addi	sp,sp,16
 a32:	8082                	ret

0000000000000a34 <thread_exit>:
void thread_exit(void){
 a34:	1101                	addi	sp,sp,-32
 a36:	ec06                	sd	ra,24(sp)
 a38:	e822                	sd	s0,16(sp)
 a3a:	e426                	sd	s1,8(sp)
 a3c:	1000                	addi	s0,sp,32
    if(current_thread == root_thread && current_thread -> left == NULL && current_thread -> right == NULL){
 a3e:	00000497          	auipc	s1,0x0
 a42:	26a4b483          	ld	s1,618(s1) # ca8 <current_thread>
 a46:	00000797          	auipc	a5,0x0
 a4a:	25a7b783          	ld	a5,602(a5) # ca0 <root_thread>
 a4e:	06f48c63          	beq	s1,a5,ac6 <thread_exit+0x92>
        free(current_thread);
        longjmp(env_st, 1);
    }
    else{
        // TODO
        if(current_thread -> left == NULL && current_thread -> right == NULL) {
 a52:	6cd8                	ld	a4,152(s1)
 a54:	87a6                	mv	a5,s1
 a56:	c745                	beqz	a4,afe <thread_exit+0xca>
            dispatch();
        }
        else {
            struct thread* tmp_thread = current_thread;
            struct thread* free_thread = current_thread;
            while(tmp_thread -> right != NULL || tmp_thread -> left != NULL) {
 a58:	873e                	mv	a4,a5
 a5a:	73dc                	ld	a5,160(a5)
 a5c:	fff5                	bnez	a5,a58 <thread_exit+0x24>
 a5e:	6f5c                	ld	a5,152(a4)
 a60:	ffe5                	bnez	a5,a58 <thread_exit+0x24>
                if(tmp_thread -> right != NULL) tmp_thread = tmp_thread -> right;
                else tmp_thread = tmp_thread -> left;
            }
            if(tmp_thread -> parent -> left == tmp_thread) tmp_thread -> parent -> left = NULL;
 a62:	775c                	ld	a5,168(a4)
 a64:	6fd4                	ld	a3,152(a5)
 a66:	0ce68a63          	beq	a3,a4,b3a <thread_exit+0x106>
            else tmp_thread -> parent -> right = NULL;
 a6a:	0a07b023          	sd	zero,160(a5)
            if(free_thread -> parent != NULL) {
 a6e:	74dc                	ld	a5,168(s1)
 a70:	cbf1                	beqz	a5,b44 <thread_exit+0x110>
                if(free_thread -> parent -> left == free_thread) free_thread -> parent -> left = tmp_thread;
 a72:	6fd4                	ld	a3,152(a5)
 a74:	0cd48663          	beq	s1,a3,b40 <thread_exit+0x10c>
                else free_thread -> parent -> right = tmp_thread;
 a78:	f3d8                	sd	a4,160(a5)
            }
            else root_thread = tmp_thread;
            tmp_thread -> parent = free_thread -> parent;
 a7a:	74dc                	ld	a5,168(s1)
 a7c:	f75c                	sd	a5,168(a4)
            tmp_thread -> left = free_thread -> left;
 a7e:	6cdc                	ld	a5,152(s1)
 a80:	ef5c                	sd	a5,152(a4)
            tmp_thread -> right = free_thread -> right;
 a82:	70d4                	ld	a3,160(s1)
 a84:	f354                	sd	a3,160(a4)
            if(tmp_thread -> left != NULL) tmp_thread -> left -> parent = tmp_thread;
 a86:	c391                	beqz	a5,a8a <thread_exit+0x56>
 a88:	f7d8                	sd	a4,168(a5)
            if(tmp_thread -> right != NULL) tmp_thread -> right -> parent = tmp_thread;
 a8a:	735c                	ld	a5,160(a4)
 a8c:	c391                	beqz	a5,a90 <thread_exit+0x5c>
 a8e:	f7d8                	sd	a4,168(a5)
            current_thread = tmp_thread;
 a90:	00000797          	auipc	a5,0x0
 a94:	20e7bc23          	sd	a4,536(a5) # ca8 <current_thread>
            schedule();
 a98:	00000097          	auipc	ra,0x0
 a9c:	f14080e7          	jalr	-236(ra) # 9ac <schedule>
            free(free_thread -> stack);
 aa0:	6888                	ld	a0,16(s1)
 aa2:	00000097          	auipc	ra,0x0
 aa6:	c4e080e7          	jalr	-946(ra) # 6f0 <free>
            free(free_thread);
 aaa:	8526                	mv	a0,s1
 aac:	00000097          	auipc	ra,0x0
 ab0:	c44080e7          	jalr	-956(ra) # 6f0 <free>
            dispatch();
 ab4:	00000097          	auipc	ra,0x0
 ab8:	09a080e7          	jalr	154(ra) # b4e <dispatch>
        }
    }
}
 abc:	60e2                	ld	ra,24(sp)
 abe:	6442                	ld	s0,16(sp)
 ac0:	64a2                	ld	s1,8(sp)
 ac2:	6105                	addi	sp,sp,32
 ac4:	8082                	ret
    if(current_thread == root_thread && current_thread -> left == NULL && current_thread -> right == NULL){
 ac6:	6cd8                	ld	a4,152(s1)
 ac8:	87a6                	mv	a5,s1
 aca:	f759                	bnez	a4,a58 <thread_exit+0x24>
 acc:	70d8                	ld	a4,160(s1)
 ace:	f749                	bnez	a4,a58 <thread_exit+0x24>
        free(current_thread->stack);
 ad0:	6888                	ld	a0,16(s1)
 ad2:	00000097          	auipc	ra,0x0
 ad6:	c1e080e7          	jalr	-994(ra) # 6f0 <free>
        free(current_thread);
 ada:	00000517          	auipc	a0,0x0
 ade:	1ce53503          	ld	a0,462(a0) # ca8 <current_thread>
 ae2:	00000097          	auipc	ra,0x0
 ae6:	c0e080e7          	jalr	-1010(ra) # 6f0 <free>
        longjmp(env_st, 1);
 aea:	4585                	li	a1,1
 aec:	00000517          	auipc	a0,0x0
 af0:	4f450513          	addi	a0,a0,1268 # fe0 <env_st>
 af4:	00000097          	auipc	ra,0x0
 af8:	da0080e7          	jalr	-608(ra) # 894 <longjmp>
 afc:	b7c1                	j	abc <thread_exit+0x88>
        if(current_thread -> left == NULL && current_thread -> right == NULL) {
 afe:	70d8                	ld	a4,160(s1)
 b00:	ff21                	bnez	a4,a58 <thread_exit+0x24>
            schedule();
 b02:	00000097          	auipc	ra,0x0
 b06:	eaa080e7          	jalr	-342(ra) # 9ac <schedule>
            if(free_thread -> parent -> left == free_thread) free_thread -> parent -> left = NULL;
 b0a:	74dc                	ld	a5,168(s1)
 b0c:	6fd8                	ld	a4,152(a5)
 b0e:	02e48363          	beq	s1,a4,b34 <thread_exit+0x100>
            else free_thread -> parent -> right = NULL;
 b12:	0a07b023          	sd	zero,160(a5)
            free(free_thread -> stack);
 b16:	6888                	ld	a0,16(s1)
 b18:	00000097          	auipc	ra,0x0
 b1c:	bd8080e7          	jalr	-1064(ra) # 6f0 <free>
            free(free_thread);
 b20:	8526                	mv	a0,s1
 b22:	00000097          	auipc	ra,0x0
 b26:	bce080e7          	jalr	-1074(ra) # 6f0 <free>
            dispatch();
 b2a:	00000097          	auipc	ra,0x0
 b2e:	024080e7          	jalr	36(ra) # b4e <dispatch>
        if(current_thread -> left == NULL && current_thread -> right == NULL) {
 b32:	b769                	j	abc <thread_exit+0x88>
            if(free_thread -> parent -> left == free_thread) free_thread -> parent -> left = NULL;
 b34:	0807bc23          	sd	zero,152(a5)
 b38:	bff9                	j	b16 <thread_exit+0xe2>
            if(tmp_thread -> parent -> left == tmp_thread) tmp_thread -> parent -> left = NULL;
 b3a:	0807bc23          	sd	zero,152(a5)
 b3e:	bf05                	j	a6e <thread_exit+0x3a>
                if(free_thread -> parent -> left == free_thread) free_thread -> parent -> left = tmp_thread;
 b40:	efd8                	sd	a4,152(a5)
 b42:	bf25                	j	a7a <thread_exit+0x46>
            else root_thread = tmp_thread;
 b44:	00000797          	auipc	a5,0x0
 b48:	14e7be23          	sd	a4,348(a5) # ca0 <root_thread>
 b4c:	b73d                	j	a7a <thread_exit+0x46>

0000000000000b4e <dispatch>:
void dispatch(void){
 b4e:	1141                	addi	sp,sp,-16
 b50:	e406                	sd	ra,8(sp)
 b52:	e022                	sd	s0,0(sp)
 b54:	0800                	addi	s0,sp,16
    if (current_thread -> buf_set == 0) {
 b56:	00000797          	auipc	a5,0x0
 b5a:	1527b783          	ld	a5,338(a5) # ca8 <current_thread>
 b5e:	0947a703          	lw	a4,148(a5)
 b62:	eb05                	bnez	a4,b92 <dispatch+0x44>
        current_thread -> buf_set = 1;
 b64:	4705                	li	a4,1
 b66:	08e7aa23          	sw	a4,148(a5)
        if (setjmp(env_tmp) == 0) {
 b6a:	00000517          	auipc	a0,0x0
 b6e:	4e650513          	addi	a0,a0,1254 # 1050 <env_tmp>
 b72:	00000097          	auipc	ra,0x0
 b76:	cea080e7          	jalr	-790(ra) # 85c <setjmp>
 b7a:	c91d                	beqz	a0,bb0 <dispatch+0x62>
        current_thread -> fp(current_thread -> arg);
 b7c:	00000797          	auipc	a5,0x0
 b80:	12c7b783          	ld	a5,300(a5) # ca8 <current_thread>
 b84:	6398                	ld	a4,0(a5)
 b86:	6788                	ld	a0,8(a5)
 b88:	9702                	jalr	a4
        thread_exit();
 b8a:	00000097          	auipc	ra,0x0
 b8e:	eaa080e7          	jalr	-342(ra) # a34 <thread_exit>
    longjmp(current_thread -> env, 1);
 b92:	4585                	li	a1,1
 b94:	00000517          	auipc	a0,0x0
 b98:	11453503          	ld	a0,276(a0) # ca8 <current_thread>
 b9c:	02050513          	addi	a0,a0,32
 ba0:	00000097          	auipc	ra,0x0
 ba4:	cf4080e7          	jalr	-780(ra) # 894 <longjmp>
}
 ba8:	60a2                	ld	ra,8(sp)
 baa:	6402                	ld	s0,0(sp)
 bac:	0141                	addi	sp,sp,16
 bae:	8082                	ret
            env_tmp -> sp = (unsigned long)current_thread -> stack_p;
 bb0:	00000797          	auipc	a5,0x0
 bb4:	0f87b783          	ld	a5,248(a5) # ca8 <current_thread>
 bb8:	6f9c                	ld	a5,24(a5)
 bba:	00000717          	auipc	a4,0x0
 bbe:	4ef73f23          	sd	a5,1278(a4) # 10b8 <env_tmp+0x68>
            longjmp(env_tmp, 1);
 bc2:	4585                	li	a1,1
 bc4:	00000517          	auipc	a0,0x0
 bc8:	48c50513          	addi	a0,a0,1164 # 1050 <env_tmp>
 bcc:	00000097          	auipc	ra,0x0
 bd0:	cc8080e7          	jalr	-824(ra) # 894 <longjmp>
 bd4:	b765                	j	b7c <dispatch+0x2e>

0000000000000bd6 <thread_yield>:
void thread_yield(void){
 bd6:	1141                	addi	sp,sp,-16
 bd8:	e406                	sd	ra,8(sp)
 bda:	e022                	sd	s0,0(sp)
 bdc:	0800                	addi	s0,sp,16
    if(setjmp(current_thread->env) == 0){
 bde:	00000517          	auipc	a0,0x0
 be2:	0ca53503          	ld	a0,202(a0) # ca8 <current_thread>
 be6:	02050513          	addi	a0,a0,32
 bea:	00000097          	auipc	ra,0x0
 bee:	c72080e7          	jalr	-910(ra) # 85c <setjmp>
 bf2:	c509                	beqz	a0,bfc <thread_yield+0x26>
}
 bf4:	60a2                	ld	ra,8(sp)
 bf6:	6402                	ld	s0,0(sp)
 bf8:	0141                	addi	sp,sp,16
 bfa:	8082                	ret
        schedule();
 bfc:	00000097          	auipc	ra,0x0
 c00:	db0080e7          	jalr	-592(ra) # 9ac <schedule>
        dispatch();
 c04:	00000097          	auipc	ra,0x0
 c08:	f4a080e7          	jalr	-182(ra) # b4e <dispatch>
}
 c0c:	b7e5                	j	bf4 <thread_yield+0x1e>

0000000000000c0e <thread_start_threading>:
void thread_start_threading(void){
 c0e:	1141                	addi	sp,sp,-16
 c10:	e406                	sd	ra,8(sp)
 c12:	e022                	sd	s0,0(sp)
 c14:	0800                	addi	s0,sp,16
    // TODO
    if(setjmp(env_st) == 0){
 c16:	00000517          	auipc	a0,0x0
 c1a:	3ca50513          	addi	a0,a0,970 # fe0 <env_st>
 c1e:	00000097          	auipc	ra,0x0
 c22:	c3e080e7          	jalr	-962(ra) # 85c <setjmp>
 c26:	c509                	beqz	a0,c30 <thread_start_threading+0x22>
        schedule();
        dispatch();
    }
}
 c28:	60a2                	ld	ra,8(sp)
 c2a:	6402                	ld	s0,0(sp)
 c2c:	0141                	addi	sp,sp,16
 c2e:	8082                	ret
        schedule();
 c30:	00000097          	auipc	ra,0x0
 c34:	d7c080e7          	jalr	-644(ra) # 9ac <schedule>
        dispatch();
 c38:	00000097          	auipc	ra,0x0
 c3c:	f16080e7          	jalr	-234(ra) # b4e <dispatch>
}
 c40:	b7e5                	j	c28 <thread_start_threading+0x1a>
