
user/_test2:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <f1>:
#define NULL 0

#define NUM_CALL_THRD 40

void f1( void *k )
{
       0:	7179                	addi	sp,sp,-48
       2:	f406                	sd	ra,40(sp)
       4:	f022                	sd	s0,32(sp)
       6:	1800                	addi	s0,sp,48
       8:	fca43c23          	sd	a0,-40(s0)
    int *kk = (int *)k;
       c:	fd843783          	ld	a5,-40(s0)
      10:	fef43423          	sd	a5,-24(s0)
    *kk = *(int *)k + 1;
      14:	fd843783          	ld	a5,-40(s0)
      18:	439c                	lw	a5,0(a5)
      1a:	2785                	addiw	a5,a5,1
      1c:	0007871b          	sext.w	a4,a5
      20:	fe843783          	ld	a5,-24(s0)
      24:	c398                	sw	a4,0(a5)
    if( *kk <= NUM_CALL_THRD )
      26:	fe843783          	ld	a5,-24(s0)
      2a:	439c                	lw	a5,0(a5)
      2c:	873e                	mv	a4,a5
      2e:	02800793          	li	a5,40
      32:	02e7c563          	blt	a5,a4,5c <f1+0x5c>
    {
        struct thread *t1 = thread_create(f1, k, 3);
      36:	460d                	li	a2,3
      38:	fd843583          	ld	a1,-40(s0)
      3c:	00000517          	auipc	a0,0x0
      40:	fc450513          	addi	a0,a0,-60 # 0 <f1>
      44:	00001097          	auipc	ra,0x1
      48:	e44080e7          	jalr	-444(ra) # e88 <thread_create>
      4c:	fea43023          	sd	a0,-32(s0)
        thread_add_runqueue(t1);
      50:	fe043503          	ld	a0,-32(s0)
      54:	00001097          	auipc	ra,0x1
      58:	0f6080e7          	jalr	246(ra) # 114a <thread_add_runqueue>
    }    
    thread_exit();
      5c:	00001097          	auipc	ra,0x1
      60:	5f0080e7          	jalr	1520(ra) # 164c <thread_exit>
}
      64:	0001                	nop
      66:	70a2                	ld	ra,40(sp)
      68:	7402                	ld	s0,32(sp)
      6a:	6145                	addi	sp,sp,48
      6c:	8082                	ret

000000000000006e <main>:

int main()
{
      6e:	1101                	addi	sp,sp,-32
      70:	ec06                	sd	ra,24(sp)
      72:	e822                	sd	s0,16(sp)
      74:	1000                	addi	s0,sp,32
    int test2k = 0;
      76:	fe042223          	sw	zero,-28(s0)
    struct thread *t1 = thread_create(f1, &test2k, 3);
      7a:	fe440793          	addi	a5,s0,-28
      7e:	460d                	li	a2,3
      80:	85be                	mv	a1,a5
      82:	00000517          	auipc	a0,0x0
      86:	f7e50513          	addi	a0,a0,-130 # 0 <f1>
      8a:	00001097          	auipc	ra,0x1
      8e:	dfe080e7          	jalr	-514(ra) # e88 <thread_create>
      92:	fea43423          	sd	a0,-24(s0)
    thread_add_runqueue(t1);
      96:	fe843503          	ld	a0,-24(s0)
      9a:	00001097          	auipc	ra,0x1
      9e:	0b0080e7          	jalr	176(ra) # 114a <thread_add_runqueue>
    thread_start_threading();
      a2:	00001097          	auipc	ra,0x1
      a6:	6e6080e7          	jalr	1766(ra) # 1788 <thread_start_threading>
    printf("test2k==%d\n", test2k);
      aa:	fe442783          	lw	a5,-28(s0)
      ae:	85be                	mv	a1,a5
      b0:	00001517          	auipc	a0,0x1
      b4:	73050513          	addi	a0,a0,1840 # 17e0 <thread_start_threading+0x58>
      b8:	00001097          	auipc	ra,0x1
      bc:	a2a080e7          	jalr	-1494(ra) # ae2 <printf>
    if( test2k != NUM_CALL_THRD + 1 ){
      c0:	fe442783          	lw	a5,-28(s0)
      c4:	873e                	mv	a4,a5
      c6:	02900793          	li	a5,41
      ca:	02f70163          	beq	a4,a5,ec <main+0x7e>
        printf("FAILED. test2k should equal to %d\n", NUM_CALL_THRD + 1);
      ce:	02900593          	li	a1,41
      d2:	00001517          	auipc	a0,0x1
      d6:	71e50513          	addi	a0,a0,1822 # 17f0 <thread_start_threading+0x68>
      da:	00001097          	auipc	ra,0x1
      de:	a08080e7          	jalr	-1528(ra) # ae2 <printf>
        exit(0);
      e2:	4501                	li	a0,0
      e4:	00000097          	auipc	ra,0x0
      e8:	4b8080e7          	jalr	1208(ra) # 59c <exit>
    }
    printf("eac8a36c12c94b93e22928c1174372d15dca00a5724481788a7a0a901e065338 3\n", test2k);
      ec:	fe442783          	lw	a5,-28(s0)
      f0:	85be                	mv	a1,a5
      f2:	00001517          	auipc	a0,0x1
      f6:	72650513          	addi	a0,a0,1830 # 1818 <thread_start_threading+0x90>
      fa:	00001097          	auipc	ra,0x1
      fe:	9e8080e7          	jalr	-1560(ra) # ae2 <printf>
    
    exit(0);
     102:	4501                	li	a0,0
     104:	00000097          	auipc	ra,0x0
     108:	498080e7          	jalr	1176(ra) # 59c <exit>

000000000000010c <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
     10c:	7179                	addi	sp,sp,-48
     10e:	f422                	sd	s0,40(sp)
     110:	1800                	addi	s0,sp,48
     112:	fca43c23          	sd	a0,-40(s0)
     116:	fcb43823          	sd	a1,-48(s0)
  char *os;

  os = s;
     11a:	fd843783          	ld	a5,-40(s0)
     11e:	fef43423          	sd	a5,-24(s0)
  while((*s++ = *t++) != 0)
     122:	0001                	nop
     124:	fd043703          	ld	a4,-48(s0)
     128:	00170793          	addi	a5,a4,1
     12c:	fcf43823          	sd	a5,-48(s0)
     130:	fd843783          	ld	a5,-40(s0)
     134:	00178693          	addi	a3,a5,1
     138:	fcd43c23          	sd	a3,-40(s0)
     13c:	00074703          	lbu	a4,0(a4)
     140:	00e78023          	sb	a4,0(a5)
     144:	0007c783          	lbu	a5,0(a5)
     148:	fff1                	bnez	a5,124 <strcpy+0x18>
    ;
  return os;
     14a:	fe843783          	ld	a5,-24(s0)
}
     14e:	853e                	mv	a0,a5
     150:	7422                	ld	s0,40(sp)
     152:	6145                	addi	sp,sp,48
     154:	8082                	ret

0000000000000156 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     156:	1101                	addi	sp,sp,-32
     158:	ec22                	sd	s0,24(sp)
     15a:	1000                	addi	s0,sp,32
     15c:	fea43423          	sd	a0,-24(s0)
     160:	feb43023          	sd	a1,-32(s0)
  while(*p && *p == *q)
     164:	a819                	j	17a <strcmp+0x24>
    p++, q++;
     166:	fe843783          	ld	a5,-24(s0)
     16a:	0785                	addi	a5,a5,1
     16c:	fef43423          	sd	a5,-24(s0)
     170:	fe043783          	ld	a5,-32(s0)
     174:	0785                	addi	a5,a5,1
     176:	fef43023          	sd	a5,-32(s0)
  while(*p && *p == *q)
     17a:	fe843783          	ld	a5,-24(s0)
     17e:	0007c783          	lbu	a5,0(a5)
     182:	cb99                	beqz	a5,198 <strcmp+0x42>
     184:	fe843783          	ld	a5,-24(s0)
     188:	0007c703          	lbu	a4,0(a5)
     18c:	fe043783          	ld	a5,-32(s0)
     190:	0007c783          	lbu	a5,0(a5)
     194:	fcf709e3          	beq	a4,a5,166 <strcmp+0x10>
  return (uchar)*p - (uchar)*q;
     198:	fe843783          	ld	a5,-24(s0)
     19c:	0007c783          	lbu	a5,0(a5)
     1a0:	0007871b          	sext.w	a4,a5
     1a4:	fe043783          	ld	a5,-32(s0)
     1a8:	0007c783          	lbu	a5,0(a5)
     1ac:	2781                	sext.w	a5,a5
     1ae:	40f707bb          	subw	a5,a4,a5
     1b2:	2781                	sext.w	a5,a5
}
     1b4:	853e                	mv	a0,a5
     1b6:	6462                	ld	s0,24(sp)
     1b8:	6105                	addi	sp,sp,32
     1ba:	8082                	ret

00000000000001bc <strlen>:

uint
strlen(const char *s)
{
     1bc:	7179                	addi	sp,sp,-48
     1be:	f422                	sd	s0,40(sp)
     1c0:	1800                	addi	s0,sp,48
     1c2:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
     1c6:	fe042623          	sw	zero,-20(s0)
     1ca:	a031                	j	1d6 <strlen+0x1a>
     1cc:	fec42783          	lw	a5,-20(s0)
     1d0:	2785                	addiw	a5,a5,1
     1d2:	fef42623          	sw	a5,-20(s0)
     1d6:	fec42783          	lw	a5,-20(s0)
     1da:	fd843703          	ld	a4,-40(s0)
     1de:	97ba                	add	a5,a5,a4
     1e0:	0007c783          	lbu	a5,0(a5)
     1e4:	f7e5                	bnez	a5,1cc <strlen+0x10>
    ;
  return n;
     1e6:	fec42783          	lw	a5,-20(s0)
}
     1ea:	853e                	mv	a0,a5
     1ec:	7422                	ld	s0,40(sp)
     1ee:	6145                	addi	sp,sp,48
     1f0:	8082                	ret

00000000000001f2 <memset>:

void*
memset(void *dst, int c, uint n)
{
     1f2:	7179                	addi	sp,sp,-48
     1f4:	f422                	sd	s0,40(sp)
     1f6:	1800                	addi	s0,sp,48
     1f8:	fca43c23          	sd	a0,-40(s0)
     1fc:	87ae                	mv	a5,a1
     1fe:	8732                	mv	a4,a2
     200:	fcf42a23          	sw	a5,-44(s0)
     204:	87ba                	mv	a5,a4
     206:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
     20a:	fd843783          	ld	a5,-40(s0)
     20e:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
     212:	fe042623          	sw	zero,-20(s0)
     216:	a00d                	j	238 <memset+0x46>
    cdst[i] = c;
     218:	fec42783          	lw	a5,-20(s0)
     21c:	fe043703          	ld	a4,-32(s0)
     220:	97ba                	add	a5,a5,a4
     222:	fd442703          	lw	a4,-44(s0)
     226:	0ff77713          	andi	a4,a4,255
     22a:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
     22e:	fec42783          	lw	a5,-20(s0)
     232:	2785                	addiw	a5,a5,1
     234:	fef42623          	sw	a5,-20(s0)
     238:	fec42703          	lw	a4,-20(s0)
     23c:	fd042783          	lw	a5,-48(s0)
     240:	2781                	sext.w	a5,a5
     242:	fcf76be3          	bltu	a4,a5,218 <memset+0x26>
  }
  return dst;
     246:	fd843783          	ld	a5,-40(s0)
}
     24a:	853e                	mv	a0,a5
     24c:	7422                	ld	s0,40(sp)
     24e:	6145                	addi	sp,sp,48
     250:	8082                	ret

0000000000000252 <strchr>:

char*
strchr(const char *s, char c)
{
     252:	1101                	addi	sp,sp,-32
     254:	ec22                	sd	s0,24(sp)
     256:	1000                	addi	s0,sp,32
     258:	fea43423          	sd	a0,-24(s0)
     25c:	87ae                	mv	a5,a1
     25e:	fef403a3          	sb	a5,-25(s0)
  for(; *s; s++)
     262:	a01d                	j	288 <strchr+0x36>
    if(*s == c)
     264:	fe843783          	ld	a5,-24(s0)
     268:	0007c703          	lbu	a4,0(a5)
     26c:	fe744783          	lbu	a5,-25(s0)
     270:	0ff7f793          	andi	a5,a5,255
     274:	00e79563          	bne	a5,a4,27e <strchr+0x2c>
      return (char*)s;
     278:	fe843783          	ld	a5,-24(s0)
     27c:	a821                	j	294 <strchr+0x42>
  for(; *s; s++)
     27e:	fe843783          	ld	a5,-24(s0)
     282:	0785                	addi	a5,a5,1
     284:	fef43423          	sd	a5,-24(s0)
     288:	fe843783          	ld	a5,-24(s0)
     28c:	0007c783          	lbu	a5,0(a5)
     290:	fbf1                	bnez	a5,264 <strchr+0x12>
  return 0;
     292:	4781                	li	a5,0
}
     294:	853e                	mv	a0,a5
     296:	6462                	ld	s0,24(sp)
     298:	6105                	addi	sp,sp,32
     29a:	8082                	ret

000000000000029c <gets>:

char*
gets(char *buf, int max)
{
     29c:	7179                	addi	sp,sp,-48
     29e:	f406                	sd	ra,40(sp)
     2a0:	f022                	sd	s0,32(sp)
     2a2:	1800                	addi	s0,sp,48
     2a4:	fca43c23          	sd	a0,-40(s0)
     2a8:	87ae                	mv	a5,a1
     2aa:	fcf42a23          	sw	a5,-44(s0)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     2ae:	fe042623          	sw	zero,-20(s0)
     2b2:	a8a1                	j	30a <gets+0x6e>
    cc = read(0, &c, 1);
     2b4:	fe740793          	addi	a5,s0,-25
     2b8:	4605                	li	a2,1
     2ba:	85be                	mv	a1,a5
     2bc:	4501                	li	a0,0
     2be:	00000097          	auipc	ra,0x0
     2c2:	2f6080e7          	jalr	758(ra) # 5b4 <read>
     2c6:	87aa                	mv	a5,a0
     2c8:	fef42423          	sw	a5,-24(s0)
    if(cc < 1)
     2cc:	fe842783          	lw	a5,-24(s0)
     2d0:	2781                	sext.w	a5,a5
     2d2:	04f05763          	blez	a5,320 <gets+0x84>
      break;
    buf[i++] = c;
     2d6:	fec42783          	lw	a5,-20(s0)
     2da:	0017871b          	addiw	a4,a5,1
     2de:	fee42623          	sw	a4,-20(s0)
     2e2:	873e                	mv	a4,a5
     2e4:	fd843783          	ld	a5,-40(s0)
     2e8:	97ba                	add	a5,a5,a4
     2ea:	fe744703          	lbu	a4,-25(s0)
     2ee:	00e78023          	sb	a4,0(a5)
    if(c == '\n' || c == '\r')
     2f2:	fe744783          	lbu	a5,-25(s0)
     2f6:	873e                	mv	a4,a5
     2f8:	47a9                	li	a5,10
     2fa:	02f70463          	beq	a4,a5,322 <gets+0x86>
     2fe:	fe744783          	lbu	a5,-25(s0)
     302:	873e                	mv	a4,a5
     304:	47b5                	li	a5,13
     306:	00f70e63          	beq	a4,a5,322 <gets+0x86>
  for(i=0; i+1 < max; ){
     30a:	fec42783          	lw	a5,-20(s0)
     30e:	2785                	addiw	a5,a5,1
     310:	0007871b          	sext.w	a4,a5
     314:	fd442783          	lw	a5,-44(s0)
     318:	2781                	sext.w	a5,a5
     31a:	f8f74de3          	blt	a4,a5,2b4 <gets+0x18>
     31e:	a011                	j	322 <gets+0x86>
      break;
     320:	0001                	nop
      break;
  }
  buf[i] = '\0';
     322:	fec42783          	lw	a5,-20(s0)
     326:	fd843703          	ld	a4,-40(s0)
     32a:	97ba                	add	a5,a5,a4
     32c:	00078023          	sb	zero,0(a5)
  return buf;
     330:	fd843783          	ld	a5,-40(s0)
}
     334:	853e                	mv	a0,a5
     336:	70a2                	ld	ra,40(sp)
     338:	7402                	ld	s0,32(sp)
     33a:	6145                	addi	sp,sp,48
     33c:	8082                	ret

000000000000033e <stat>:

int
stat(const char *n, struct stat *st)
{
     33e:	7179                	addi	sp,sp,-48
     340:	f406                	sd	ra,40(sp)
     342:	f022                	sd	s0,32(sp)
     344:	1800                	addi	s0,sp,48
     346:	fca43c23          	sd	a0,-40(s0)
     34a:	fcb43823          	sd	a1,-48(s0)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     34e:	4581                	li	a1,0
     350:	fd843503          	ld	a0,-40(s0)
     354:	00000097          	auipc	ra,0x0
     358:	288080e7          	jalr	648(ra) # 5dc <open>
     35c:	87aa                	mv	a5,a0
     35e:	fef42623          	sw	a5,-20(s0)
  if(fd < 0)
     362:	fec42783          	lw	a5,-20(s0)
     366:	2781                	sext.w	a5,a5
     368:	0007d463          	bgez	a5,370 <stat+0x32>
    return -1;
     36c:	57fd                	li	a5,-1
     36e:	a035                	j	39a <stat+0x5c>
  r = fstat(fd, st);
     370:	fec42783          	lw	a5,-20(s0)
     374:	fd043583          	ld	a1,-48(s0)
     378:	853e                	mv	a0,a5
     37a:	00000097          	auipc	ra,0x0
     37e:	27a080e7          	jalr	634(ra) # 5f4 <fstat>
     382:	87aa                	mv	a5,a0
     384:	fef42423          	sw	a5,-24(s0)
  close(fd);
     388:	fec42783          	lw	a5,-20(s0)
     38c:	853e                	mv	a0,a5
     38e:	00000097          	auipc	ra,0x0
     392:	236080e7          	jalr	566(ra) # 5c4 <close>
  return r;
     396:	fe842783          	lw	a5,-24(s0)
}
     39a:	853e                	mv	a0,a5
     39c:	70a2                	ld	ra,40(sp)
     39e:	7402                	ld	s0,32(sp)
     3a0:	6145                	addi	sp,sp,48
     3a2:	8082                	ret

00000000000003a4 <atoi>:

int
atoi(const char *s)
{
     3a4:	7179                	addi	sp,sp,-48
     3a6:	f422                	sd	s0,40(sp)
     3a8:	1800                	addi	s0,sp,48
     3aa:	fca43c23          	sd	a0,-40(s0)
  int n;

  n = 0;
     3ae:	fe042623          	sw	zero,-20(s0)
  while('0' <= *s && *s <= '9')
     3b2:	a815                	j	3e6 <atoi+0x42>
    n = n*10 + *s++ - '0';
     3b4:	fec42703          	lw	a4,-20(s0)
     3b8:	87ba                	mv	a5,a4
     3ba:	0027979b          	slliw	a5,a5,0x2
     3be:	9fb9                	addw	a5,a5,a4
     3c0:	0017979b          	slliw	a5,a5,0x1
     3c4:	0007871b          	sext.w	a4,a5
     3c8:	fd843783          	ld	a5,-40(s0)
     3cc:	00178693          	addi	a3,a5,1
     3d0:	fcd43c23          	sd	a3,-40(s0)
     3d4:	0007c783          	lbu	a5,0(a5)
     3d8:	2781                	sext.w	a5,a5
     3da:	9fb9                	addw	a5,a5,a4
     3dc:	2781                	sext.w	a5,a5
     3de:	fd07879b          	addiw	a5,a5,-48
     3e2:	fef42623          	sw	a5,-20(s0)
  while('0' <= *s && *s <= '9')
     3e6:	fd843783          	ld	a5,-40(s0)
     3ea:	0007c783          	lbu	a5,0(a5)
     3ee:	873e                	mv	a4,a5
     3f0:	02f00793          	li	a5,47
     3f4:	00e7fb63          	bgeu	a5,a4,40a <atoi+0x66>
     3f8:	fd843783          	ld	a5,-40(s0)
     3fc:	0007c783          	lbu	a5,0(a5)
     400:	873e                	mv	a4,a5
     402:	03900793          	li	a5,57
     406:	fae7f7e3          	bgeu	a5,a4,3b4 <atoi+0x10>
  return n;
     40a:	fec42783          	lw	a5,-20(s0)
}
     40e:	853e                	mv	a0,a5
     410:	7422                	ld	s0,40(sp)
     412:	6145                	addi	sp,sp,48
     414:	8082                	ret

0000000000000416 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     416:	7139                	addi	sp,sp,-64
     418:	fc22                	sd	s0,56(sp)
     41a:	0080                	addi	s0,sp,64
     41c:	fca43c23          	sd	a0,-40(s0)
     420:	fcb43823          	sd	a1,-48(s0)
     424:	87b2                	mv	a5,a2
     426:	fcf42623          	sw	a5,-52(s0)
  char *dst;
  const char *src;

  dst = vdst;
     42a:	fd843783          	ld	a5,-40(s0)
     42e:	fef43423          	sd	a5,-24(s0)
  src = vsrc;
     432:	fd043783          	ld	a5,-48(s0)
     436:	fef43023          	sd	a5,-32(s0)
  if (src > dst) {
     43a:	fe043703          	ld	a4,-32(s0)
     43e:	fe843783          	ld	a5,-24(s0)
     442:	02e7fc63          	bgeu	a5,a4,47a <memmove+0x64>
    while(n-- > 0)
     446:	a00d                	j	468 <memmove+0x52>
      *dst++ = *src++;
     448:	fe043703          	ld	a4,-32(s0)
     44c:	00170793          	addi	a5,a4,1
     450:	fef43023          	sd	a5,-32(s0)
     454:	fe843783          	ld	a5,-24(s0)
     458:	00178693          	addi	a3,a5,1
     45c:	fed43423          	sd	a3,-24(s0)
     460:	00074703          	lbu	a4,0(a4)
     464:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     468:	fcc42783          	lw	a5,-52(s0)
     46c:	fff7871b          	addiw	a4,a5,-1
     470:	fce42623          	sw	a4,-52(s0)
     474:	fcf04ae3          	bgtz	a5,448 <memmove+0x32>
     478:	a891                	j	4cc <memmove+0xb6>
  } else {
    dst += n;
     47a:	fcc42783          	lw	a5,-52(s0)
     47e:	fe843703          	ld	a4,-24(s0)
     482:	97ba                	add	a5,a5,a4
     484:	fef43423          	sd	a5,-24(s0)
    src += n;
     488:	fcc42783          	lw	a5,-52(s0)
     48c:	fe043703          	ld	a4,-32(s0)
     490:	97ba                	add	a5,a5,a4
     492:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
     496:	a01d                	j	4bc <memmove+0xa6>
      *--dst = *--src;
     498:	fe043783          	ld	a5,-32(s0)
     49c:	17fd                	addi	a5,a5,-1
     49e:	fef43023          	sd	a5,-32(s0)
     4a2:	fe843783          	ld	a5,-24(s0)
     4a6:	17fd                	addi	a5,a5,-1
     4a8:	fef43423          	sd	a5,-24(s0)
     4ac:	fe043783          	ld	a5,-32(s0)
     4b0:	0007c703          	lbu	a4,0(a5)
     4b4:	fe843783          	ld	a5,-24(s0)
     4b8:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     4bc:	fcc42783          	lw	a5,-52(s0)
     4c0:	fff7871b          	addiw	a4,a5,-1
     4c4:	fce42623          	sw	a4,-52(s0)
     4c8:	fcf048e3          	bgtz	a5,498 <memmove+0x82>
  }
  return vdst;
     4cc:	fd843783          	ld	a5,-40(s0)
}
     4d0:	853e                	mv	a0,a5
     4d2:	7462                	ld	s0,56(sp)
     4d4:	6121                	addi	sp,sp,64
     4d6:	8082                	ret

00000000000004d8 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
     4d8:	7139                	addi	sp,sp,-64
     4da:	fc22                	sd	s0,56(sp)
     4dc:	0080                	addi	s0,sp,64
     4de:	fca43c23          	sd	a0,-40(s0)
     4e2:	fcb43823          	sd	a1,-48(s0)
     4e6:	87b2                	mv	a5,a2
     4e8:	fcf42623          	sw	a5,-52(s0)
  const char *p1 = s1, *p2 = s2;
     4ec:	fd843783          	ld	a5,-40(s0)
     4f0:	fef43423          	sd	a5,-24(s0)
     4f4:	fd043783          	ld	a5,-48(s0)
     4f8:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
     4fc:	a0a1                	j	544 <memcmp+0x6c>
    if (*p1 != *p2) {
     4fe:	fe843783          	ld	a5,-24(s0)
     502:	0007c703          	lbu	a4,0(a5)
     506:	fe043783          	ld	a5,-32(s0)
     50a:	0007c783          	lbu	a5,0(a5)
     50e:	02f70163          	beq	a4,a5,530 <memcmp+0x58>
      return *p1 - *p2;
     512:	fe843783          	ld	a5,-24(s0)
     516:	0007c783          	lbu	a5,0(a5)
     51a:	0007871b          	sext.w	a4,a5
     51e:	fe043783          	ld	a5,-32(s0)
     522:	0007c783          	lbu	a5,0(a5)
     526:	2781                	sext.w	a5,a5
     528:	40f707bb          	subw	a5,a4,a5
     52c:	2781                	sext.w	a5,a5
     52e:	a01d                	j	554 <memcmp+0x7c>
    }
    p1++;
     530:	fe843783          	ld	a5,-24(s0)
     534:	0785                	addi	a5,a5,1
     536:	fef43423          	sd	a5,-24(s0)
    p2++;
     53a:	fe043783          	ld	a5,-32(s0)
     53e:	0785                	addi	a5,a5,1
     540:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
     544:	fcc42783          	lw	a5,-52(s0)
     548:	fff7871b          	addiw	a4,a5,-1
     54c:	fce42623          	sw	a4,-52(s0)
     550:	f7dd                	bnez	a5,4fe <memcmp+0x26>
  }
  return 0;
     552:	4781                	li	a5,0
}
     554:	853e                	mv	a0,a5
     556:	7462                	ld	s0,56(sp)
     558:	6121                	addi	sp,sp,64
     55a:	8082                	ret

000000000000055c <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
     55c:	7179                	addi	sp,sp,-48
     55e:	f406                	sd	ra,40(sp)
     560:	f022                	sd	s0,32(sp)
     562:	1800                	addi	s0,sp,48
     564:	fea43423          	sd	a0,-24(s0)
     568:	feb43023          	sd	a1,-32(s0)
     56c:	87b2                	mv	a5,a2
     56e:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
     572:	fdc42783          	lw	a5,-36(s0)
     576:	863e                	mv	a2,a5
     578:	fe043583          	ld	a1,-32(s0)
     57c:	fe843503          	ld	a0,-24(s0)
     580:	00000097          	auipc	ra,0x0
     584:	e96080e7          	jalr	-362(ra) # 416 <memmove>
     588:	87aa                	mv	a5,a0
}
     58a:	853e                	mv	a0,a5
     58c:	70a2                	ld	ra,40(sp)
     58e:	7402                	ld	s0,32(sp)
     590:	6145                	addi	sp,sp,48
     592:	8082                	ret

0000000000000594 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
     594:	4885                	li	a7,1
 ecall
     596:	00000073          	ecall
 ret
     59a:	8082                	ret

000000000000059c <exit>:
.global exit
exit:
 li a7, SYS_exit
     59c:	4889                	li	a7,2
 ecall
     59e:	00000073          	ecall
 ret
     5a2:	8082                	ret

00000000000005a4 <wait>:
.global wait
wait:
 li a7, SYS_wait
     5a4:	488d                	li	a7,3
 ecall
     5a6:	00000073          	ecall
 ret
     5aa:	8082                	ret

00000000000005ac <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
     5ac:	4891                	li	a7,4
 ecall
     5ae:	00000073          	ecall
 ret
     5b2:	8082                	ret

00000000000005b4 <read>:
.global read
read:
 li a7, SYS_read
     5b4:	4895                	li	a7,5
 ecall
     5b6:	00000073          	ecall
 ret
     5ba:	8082                	ret

00000000000005bc <write>:
.global write
write:
 li a7, SYS_write
     5bc:	48c1                	li	a7,16
 ecall
     5be:	00000073          	ecall
 ret
     5c2:	8082                	ret

00000000000005c4 <close>:
.global close
close:
 li a7, SYS_close
     5c4:	48d5                	li	a7,21
 ecall
     5c6:	00000073          	ecall
 ret
     5ca:	8082                	ret

00000000000005cc <kill>:
.global kill
kill:
 li a7, SYS_kill
     5cc:	4899                	li	a7,6
 ecall
     5ce:	00000073          	ecall
 ret
     5d2:	8082                	ret

00000000000005d4 <exec>:
.global exec
exec:
 li a7, SYS_exec
     5d4:	489d                	li	a7,7
 ecall
     5d6:	00000073          	ecall
 ret
     5da:	8082                	ret

00000000000005dc <open>:
.global open
open:
 li a7, SYS_open
     5dc:	48bd                	li	a7,15
 ecall
     5de:	00000073          	ecall
 ret
     5e2:	8082                	ret

00000000000005e4 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
     5e4:	48c5                	li	a7,17
 ecall
     5e6:	00000073          	ecall
 ret
     5ea:	8082                	ret

00000000000005ec <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
     5ec:	48c9                	li	a7,18
 ecall
     5ee:	00000073          	ecall
 ret
     5f2:	8082                	ret

00000000000005f4 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
     5f4:	48a1                	li	a7,8
 ecall
     5f6:	00000073          	ecall
 ret
     5fa:	8082                	ret

00000000000005fc <link>:
.global link
link:
 li a7, SYS_link
     5fc:	48cd                	li	a7,19
 ecall
     5fe:	00000073          	ecall
 ret
     602:	8082                	ret

0000000000000604 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
     604:	48d1                	li	a7,20
 ecall
     606:	00000073          	ecall
 ret
     60a:	8082                	ret

000000000000060c <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
     60c:	48a5                	li	a7,9
 ecall
     60e:	00000073          	ecall
 ret
     612:	8082                	ret

0000000000000614 <dup>:
.global dup
dup:
 li a7, SYS_dup
     614:	48a9                	li	a7,10
 ecall
     616:	00000073          	ecall
 ret
     61a:	8082                	ret

000000000000061c <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
     61c:	48ad                	li	a7,11
 ecall
     61e:	00000073          	ecall
 ret
     622:	8082                	ret

0000000000000624 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
     624:	48b1                	li	a7,12
 ecall
     626:	00000073          	ecall
 ret
     62a:	8082                	ret

000000000000062c <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
     62c:	48b5                	li	a7,13
 ecall
     62e:	00000073          	ecall
 ret
     632:	8082                	ret

0000000000000634 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
     634:	48b9                	li	a7,14
 ecall
     636:	00000073          	ecall
 ret
     63a:	8082                	ret

000000000000063c <thrdstop>:
.global thrdstop
thrdstop:
 li a7, SYS_thrdstop
     63c:	48d9                	li	a7,22
 ecall
     63e:	00000073          	ecall
 ret
     642:	8082                	ret

0000000000000644 <thrdresume>:
.global thrdresume
thrdresume:
 li a7, SYS_thrdresume
     644:	48dd                	li	a7,23
 ecall
     646:	00000073          	ecall
 ret
     64a:	8082                	ret

000000000000064c <cancelthrdstop>:
.global cancelthrdstop
cancelthrdstop:
 li a7, SYS_cancelthrdstop
     64c:	48e1                	li	a7,24
 ecall
     64e:	00000073          	ecall
 ret
     652:	8082                	ret

0000000000000654 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
     654:	1101                	addi	sp,sp,-32
     656:	ec06                	sd	ra,24(sp)
     658:	e822                	sd	s0,16(sp)
     65a:	1000                	addi	s0,sp,32
     65c:	87aa                	mv	a5,a0
     65e:	872e                	mv	a4,a1
     660:	fef42623          	sw	a5,-20(s0)
     664:	87ba                	mv	a5,a4
     666:	fef405a3          	sb	a5,-21(s0)
  write(fd, &c, 1);
     66a:	feb40713          	addi	a4,s0,-21
     66e:	fec42783          	lw	a5,-20(s0)
     672:	4605                	li	a2,1
     674:	85ba                	mv	a1,a4
     676:	853e                	mv	a0,a5
     678:	00000097          	auipc	ra,0x0
     67c:	f44080e7          	jalr	-188(ra) # 5bc <write>
}
     680:	0001                	nop
     682:	60e2                	ld	ra,24(sp)
     684:	6442                	ld	s0,16(sp)
     686:	6105                	addi	sp,sp,32
     688:	8082                	ret

000000000000068a <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     68a:	7139                	addi	sp,sp,-64
     68c:	fc06                	sd	ra,56(sp)
     68e:	f822                	sd	s0,48(sp)
     690:	0080                	addi	s0,sp,64
     692:	87aa                	mv	a5,a0
     694:	8736                	mv	a4,a3
     696:	fcf42623          	sw	a5,-52(s0)
     69a:	87ae                	mv	a5,a1
     69c:	fcf42423          	sw	a5,-56(s0)
     6a0:	87b2                	mv	a5,a2
     6a2:	fcf42223          	sw	a5,-60(s0)
     6a6:	87ba                	mv	a5,a4
     6a8:	fcf42023          	sw	a5,-64(s0)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     6ac:	fe042423          	sw	zero,-24(s0)
  if(sgn && xx < 0){
     6b0:	fc042783          	lw	a5,-64(s0)
     6b4:	2781                	sext.w	a5,a5
     6b6:	c38d                	beqz	a5,6d8 <printint+0x4e>
     6b8:	fc842783          	lw	a5,-56(s0)
     6bc:	2781                	sext.w	a5,a5
     6be:	0007dd63          	bgez	a5,6d8 <printint+0x4e>
    neg = 1;
     6c2:	4785                	li	a5,1
     6c4:	fef42423          	sw	a5,-24(s0)
    x = -xx;
     6c8:	fc842783          	lw	a5,-56(s0)
     6cc:	40f007bb          	negw	a5,a5
     6d0:	2781                	sext.w	a5,a5
     6d2:	fef42223          	sw	a5,-28(s0)
     6d6:	a029                	j	6e0 <printint+0x56>
  } else {
    x = xx;
     6d8:	fc842783          	lw	a5,-56(s0)
     6dc:	fef42223          	sw	a5,-28(s0)
  }

  i = 0;
     6e0:	fe042623          	sw	zero,-20(s0)
  do{
    buf[i++] = digits[x % base];
     6e4:	fc442783          	lw	a5,-60(s0)
     6e8:	fe442703          	lw	a4,-28(s0)
     6ec:	02f777bb          	remuw	a5,a4,a5
     6f0:	0007861b          	sext.w	a2,a5
     6f4:	fec42783          	lw	a5,-20(s0)
     6f8:	0017871b          	addiw	a4,a5,1
     6fc:	fee42623          	sw	a4,-20(s0)
     700:	00001697          	auipc	a3,0x1
     704:	1a868693          	addi	a3,a3,424 # 18a8 <digits>
     708:	02061713          	slli	a4,a2,0x20
     70c:	9301                	srli	a4,a4,0x20
     70e:	9736                	add	a4,a4,a3
     710:	00074703          	lbu	a4,0(a4)
     714:	ff040693          	addi	a3,s0,-16
     718:	97b6                	add	a5,a5,a3
     71a:	fee78023          	sb	a4,-32(a5)
  }while((x /= base) != 0);
     71e:	fc442783          	lw	a5,-60(s0)
     722:	fe442703          	lw	a4,-28(s0)
     726:	02f757bb          	divuw	a5,a4,a5
     72a:	fef42223          	sw	a5,-28(s0)
     72e:	fe442783          	lw	a5,-28(s0)
     732:	2781                	sext.w	a5,a5
     734:	fbc5                	bnez	a5,6e4 <printint+0x5a>
  if(neg)
     736:	fe842783          	lw	a5,-24(s0)
     73a:	2781                	sext.w	a5,a5
     73c:	cf95                	beqz	a5,778 <printint+0xee>
    buf[i++] = '-';
     73e:	fec42783          	lw	a5,-20(s0)
     742:	0017871b          	addiw	a4,a5,1
     746:	fee42623          	sw	a4,-20(s0)
     74a:	ff040713          	addi	a4,s0,-16
     74e:	97ba                	add	a5,a5,a4
     750:	02d00713          	li	a4,45
     754:	fee78023          	sb	a4,-32(a5)

  while(--i >= 0)
     758:	a005                	j	778 <printint+0xee>
    putc(fd, buf[i]);
     75a:	fec42783          	lw	a5,-20(s0)
     75e:	ff040713          	addi	a4,s0,-16
     762:	97ba                	add	a5,a5,a4
     764:	fe07c703          	lbu	a4,-32(a5)
     768:	fcc42783          	lw	a5,-52(s0)
     76c:	85ba                	mv	a1,a4
     76e:	853e                	mv	a0,a5
     770:	00000097          	auipc	ra,0x0
     774:	ee4080e7          	jalr	-284(ra) # 654 <putc>
  while(--i >= 0)
     778:	fec42783          	lw	a5,-20(s0)
     77c:	37fd                	addiw	a5,a5,-1
     77e:	fef42623          	sw	a5,-20(s0)
     782:	fec42783          	lw	a5,-20(s0)
     786:	2781                	sext.w	a5,a5
     788:	fc07d9e3          	bgez	a5,75a <printint+0xd0>
}
     78c:	0001                	nop
     78e:	0001                	nop
     790:	70e2                	ld	ra,56(sp)
     792:	7442                	ld	s0,48(sp)
     794:	6121                	addi	sp,sp,64
     796:	8082                	ret

0000000000000798 <printptr>:

static void
printptr(int fd, uint64 x) {
     798:	7179                	addi	sp,sp,-48
     79a:	f406                	sd	ra,40(sp)
     79c:	f022                	sd	s0,32(sp)
     79e:	1800                	addi	s0,sp,48
     7a0:	87aa                	mv	a5,a0
     7a2:	fcb43823          	sd	a1,-48(s0)
     7a6:	fcf42e23          	sw	a5,-36(s0)
  int i;
  putc(fd, '0');
     7aa:	fdc42783          	lw	a5,-36(s0)
     7ae:	03000593          	li	a1,48
     7b2:	853e                	mv	a0,a5
     7b4:	00000097          	auipc	ra,0x0
     7b8:	ea0080e7          	jalr	-352(ra) # 654 <putc>
  putc(fd, 'x');
     7bc:	fdc42783          	lw	a5,-36(s0)
     7c0:	07800593          	li	a1,120
     7c4:	853e                	mv	a0,a5
     7c6:	00000097          	auipc	ra,0x0
     7ca:	e8e080e7          	jalr	-370(ra) # 654 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
     7ce:	fe042623          	sw	zero,-20(s0)
     7d2:	a82d                	j	80c <printptr+0x74>
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
     7d4:	fd043783          	ld	a5,-48(s0)
     7d8:	93f1                	srli	a5,a5,0x3c
     7da:	00001717          	auipc	a4,0x1
     7de:	0ce70713          	addi	a4,a4,206 # 18a8 <digits>
     7e2:	97ba                	add	a5,a5,a4
     7e4:	0007c703          	lbu	a4,0(a5)
     7e8:	fdc42783          	lw	a5,-36(s0)
     7ec:	85ba                	mv	a1,a4
     7ee:	853e                	mv	a0,a5
     7f0:	00000097          	auipc	ra,0x0
     7f4:	e64080e7          	jalr	-412(ra) # 654 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
     7f8:	fec42783          	lw	a5,-20(s0)
     7fc:	2785                	addiw	a5,a5,1
     7fe:	fef42623          	sw	a5,-20(s0)
     802:	fd043783          	ld	a5,-48(s0)
     806:	0792                	slli	a5,a5,0x4
     808:	fcf43823          	sd	a5,-48(s0)
     80c:	fec42783          	lw	a5,-20(s0)
     810:	873e                	mv	a4,a5
     812:	47bd                	li	a5,15
     814:	fce7f0e3          	bgeu	a5,a4,7d4 <printptr+0x3c>
}
     818:	0001                	nop
     81a:	0001                	nop
     81c:	70a2                	ld	ra,40(sp)
     81e:	7402                	ld	s0,32(sp)
     820:	6145                	addi	sp,sp,48
     822:	8082                	ret

0000000000000824 <vprintf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
     824:	715d                	addi	sp,sp,-80
     826:	e486                	sd	ra,72(sp)
     828:	e0a2                	sd	s0,64(sp)
     82a:	0880                	addi	s0,sp,80
     82c:	87aa                	mv	a5,a0
     82e:	fcb43023          	sd	a1,-64(s0)
     832:	fac43c23          	sd	a2,-72(s0)
     836:	fcf42623          	sw	a5,-52(s0)
  char *s;
  int c, i, state;

  state = 0;
     83a:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
     83e:	fe042223          	sw	zero,-28(s0)
     842:	a42d                	j	a6c <vprintf+0x248>
    c = fmt[i] & 0xff;
     844:	fe442783          	lw	a5,-28(s0)
     848:	fc043703          	ld	a4,-64(s0)
     84c:	97ba                	add	a5,a5,a4
     84e:	0007c783          	lbu	a5,0(a5)
     852:	fcf42e23          	sw	a5,-36(s0)
    if(state == 0){
     856:	fe042783          	lw	a5,-32(s0)
     85a:	2781                	sext.w	a5,a5
     85c:	eb9d                	bnez	a5,892 <vprintf+0x6e>
      if(c == '%'){
     85e:	fdc42783          	lw	a5,-36(s0)
     862:	0007871b          	sext.w	a4,a5
     866:	02500793          	li	a5,37
     86a:	00f71763          	bne	a4,a5,878 <vprintf+0x54>
        state = '%';
     86e:	02500793          	li	a5,37
     872:	fef42023          	sw	a5,-32(s0)
     876:	a2f5                	j	a62 <vprintf+0x23e>
      } else {
        putc(fd, c);
     878:	fdc42783          	lw	a5,-36(s0)
     87c:	0ff7f713          	andi	a4,a5,255
     880:	fcc42783          	lw	a5,-52(s0)
     884:	85ba                	mv	a1,a4
     886:	853e                	mv	a0,a5
     888:	00000097          	auipc	ra,0x0
     88c:	dcc080e7          	jalr	-564(ra) # 654 <putc>
     890:	aac9                	j	a62 <vprintf+0x23e>
      }
    } else if(state == '%'){
     892:	fe042783          	lw	a5,-32(s0)
     896:	0007871b          	sext.w	a4,a5
     89a:	02500793          	li	a5,37
     89e:	1cf71263          	bne	a4,a5,a62 <vprintf+0x23e>
      if(c == 'd'){
     8a2:	fdc42783          	lw	a5,-36(s0)
     8a6:	0007871b          	sext.w	a4,a5
     8aa:	06400793          	li	a5,100
     8ae:	02f71463          	bne	a4,a5,8d6 <vprintf+0xb2>
        printint(fd, va_arg(ap, int), 10, 1);
     8b2:	fb843783          	ld	a5,-72(s0)
     8b6:	00878713          	addi	a4,a5,8
     8ba:	fae43c23          	sd	a4,-72(s0)
     8be:	4398                	lw	a4,0(a5)
     8c0:	fcc42783          	lw	a5,-52(s0)
     8c4:	4685                	li	a3,1
     8c6:	4629                	li	a2,10
     8c8:	85ba                	mv	a1,a4
     8ca:	853e                	mv	a0,a5
     8cc:	00000097          	auipc	ra,0x0
     8d0:	dbe080e7          	jalr	-578(ra) # 68a <printint>
     8d4:	a269                	j	a5e <vprintf+0x23a>
      } else if(c == 'l') {
     8d6:	fdc42783          	lw	a5,-36(s0)
     8da:	0007871b          	sext.w	a4,a5
     8de:	06c00793          	li	a5,108
     8e2:	02f71663          	bne	a4,a5,90e <vprintf+0xea>
        printint(fd, va_arg(ap, uint64), 10, 0);
     8e6:	fb843783          	ld	a5,-72(s0)
     8ea:	00878713          	addi	a4,a5,8
     8ee:	fae43c23          	sd	a4,-72(s0)
     8f2:	639c                	ld	a5,0(a5)
     8f4:	0007871b          	sext.w	a4,a5
     8f8:	fcc42783          	lw	a5,-52(s0)
     8fc:	4681                	li	a3,0
     8fe:	4629                	li	a2,10
     900:	85ba                	mv	a1,a4
     902:	853e                	mv	a0,a5
     904:	00000097          	auipc	ra,0x0
     908:	d86080e7          	jalr	-634(ra) # 68a <printint>
     90c:	aa89                	j	a5e <vprintf+0x23a>
      } else if(c == 'x') {
     90e:	fdc42783          	lw	a5,-36(s0)
     912:	0007871b          	sext.w	a4,a5
     916:	07800793          	li	a5,120
     91a:	02f71463          	bne	a4,a5,942 <vprintf+0x11e>
        printint(fd, va_arg(ap, int), 16, 0);
     91e:	fb843783          	ld	a5,-72(s0)
     922:	00878713          	addi	a4,a5,8
     926:	fae43c23          	sd	a4,-72(s0)
     92a:	4398                	lw	a4,0(a5)
     92c:	fcc42783          	lw	a5,-52(s0)
     930:	4681                	li	a3,0
     932:	4641                	li	a2,16
     934:	85ba                	mv	a1,a4
     936:	853e                	mv	a0,a5
     938:	00000097          	auipc	ra,0x0
     93c:	d52080e7          	jalr	-686(ra) # 68a <printint>
     940:	aa39                	j	a5e <vprintf+0x23a>
      } else if(c == 'p') {
     942:	fdc42783          	lw	a5,-36(s0)
     946:	0007871b          	sext.w	a4,a5
     94a:	07000793          	li	a5,112
     94e:	02f71263          	bne	a4,a5,972 <vprintf+0x14e>
        printptr(fd, va_arg(ap, uint64));
     952:	fb843783          	ld	a5,-72(s0)
     956:	00878713          	addi	a4,a5,8
     95a:	fae43c23          	sd	a4,-72(s0)
     95e:	6398                	ld	a4,0(a5)
     960:	fcc42783          	lw	a5,-52(s0)
     964:	85ba                	mv	a1,a4
     966:	853e                	mv	a0,a5
     968:	00000097          	auipc	ra,0x0
     96c:	e30080e7          	jalr	-464(ra) # 798 <printptr>
     970:	a0fd                	j	a5e <vprintf+0x23a>
      } else if(c == 's'){
     972:	fdc42783          	lw	a5,-36(s0)
     976:	0007871b          	sext.w	a4,a5
     97a:	07300793          	li	a5,115
     97e:	04f71c63          	bne	a4,a5,9d6 <vprintf+0x1b2>
        s = va_arg(ap, char*);
     982:	fb843783          	ld	a5,-72(s0)
     986:	00878713          	addi	a4,a5,8
     98a:	fae43c23          	sd	a4,-72(s0)
     98e:	639c                	ld	a5,0(a5)
     990:	fef43423          	sd	a5,-24(s0)
        if(s == 0)
     994:	fe843783          	ld	a5,-24(s0)
     998:	eb8d                	bnez	a5,9ca <vprintf+0x1a6>
          s = "(null)";
     99a:	00001797          	auipc	a5,0x1
     99e:	ec678793          	addi	a5,a5,-314 # 1860 <thread_start_threading+0xd8>
     9a2:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
     9a6:	a015                	j	9ca <vprintf+0x1a6>
          putc(fd, *s);
     9a8:	fe843783          	ld	a5,-24(s0)
     9ac:	0007c703          	lbu	a4,0(a5)
     9b0:	fcc42783          	lw	a5,-52(s0)
     9b4:	85ba                	mv	a1,a4
     9b6:	853e                	mv	a0,a5
     9b8:	00000097          	auipc	ra,0x0
     9bc:	c9c080e7          	jalr	-868(ra) # 654 <putc>
          s++;
     9c0:	fe843783          	ld	a5,-24(s0)
     9c4:	0785                	addi	a5,a5,1
     9c6:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
     9ca:	fe843783          	ld	a5,-24(s0)
     9ce:	0007c783          	lbu	a5,0(a5)
     9d2:	fbf9                	bnez	a5,9a8 <vprintf+0x184>
     9d4:	a069                	j	a5e <vprintf+0x23a>
        }
      } else if(c == 'c'){
     9d6:	fdc42783          	lw	a5,-36(s0)
     9da:	0007871b          	sext.w	a4,a5
     9de:	06300793          	li	a5,99
     9e2:	02f71463          	bne	a4,a5,a0a <vprintf+0x1e6>
        putc(fd, va_arg(ap, uint));
     9e6:	fb843783          	ld	a5,-72(s0)
     9ea:	00878713          	addi	a4,a5,8
     9ee:	fae43c23          	sd	a4,-72(s0)
     9f2:	439c                	lw	a5,0(a5)
     9f4:	0ff7f713          	andi	a4,a5,255
     9f8:	fcc42783          	lw	a5,-52(s0)
     9fc:	85ba                	mv	a1,a4
     9fe:	853e                	mv	a0,a5
     a00:	00000097          	auipc	ra,0x0
     a04:	c54080e7          	jalr	-940(ra) # 654 <putc>
     a08:	a899                	j	a5e <vprintf+0x23a>
      } else if(c == '%'){
     a0a:	fdc42783          	lw	a5,-36(s0)
     a0e:	0007871b          	sext.w	a4,a5
     a12:	02500793          	li	a5,37
     a16:	00f71f63          	bne	a4,a5,a34 <vprintf+0x210>
        putc(fd, c);
     a1a:	fdc42783          	lw	a5,-36(s0)
     a1e:	0ff7f713          	andi	a4,a5,255
     a22:	fcc42783          	lw	a5,-52(s0)
     a26:	85ba                	mv	a1,a4
     a28:	853e                	mv	a0,a5
     a2a:	00000097          	auipc	ra,0x0
     a2e:	c2a080e7          	jalr	-982(ra) # 654 <putc>
     a32:	a035                	j	a5e <vprintf+0x23a>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     a34:	fcc42783          	lw	a5,-52(s0)
     a38:	02500593          	li	a1,37
     a3c:	853e                	mv	a0,a5
     a3e:	00000097          	auipc	ra,0x0
     a42:	c16080e7          	jalr	-1002(ra) # 654 <putc>
        putc(fd, c);
     a46:	fdc42783          	lw	a5,-36(s0)
     a4a:	0ff7f713          	andi	a4,a5,255
     a4e:	fcc42783          	lw	a5,-52(s0)
     a52:	85ba                	mv	a1,a4
     a54:	853e                	mv	a0,a5
     a56:	00000097          	auipc	ra,0x0
     a5a:	bfe080e7          	jalr	-1026(ra) # 654 <putc>
      }
      state = 0;
     a5e:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
     a62:	fe442783          	lw	a5,-28(s0)
     a66:	2785                	addiw	a5,a5,1
     a68:	fef42223          	sw	a5,-28(s0)
     a6c:	fe442783          	lw	a5,-28(s0)
     a70:	fc043703          	ld	a4,-64(s0)
     a74:	97ba                	add	a5,a5,a4
     a76:	0007c783          	lbu	a5,0(a5)
     a7a:	dc0795e3          	bnez	a5,844 <vprintf+0x20>
    }
  }
}
     a7e:	0001                	nop
     a80:	0001                	nop
     a82:	60a6                	ld	ra,72(sp)
     a84:	6406                	ld	s0,64(sp)
     a86:	6161                	addi	sp,sp,80
     a88:	8082                	ret

0000000000000a8a <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
     a8a:	7159                	addi	sp,sp,-112
     a8c:	fc06                	sd	ra,56(sp)
     a8e:	f822                	sd	s0,48(sp)
     a90:	0080                	addi	s0,sp,64
     a92:	fcb43823          	sd	a1,-48(s0)
     a96:	e010                	sd	a2,0(s0)
     a98:	e414                	sd	a3,8(s0)
     a9a:	e818                	sd	a4,16(s0)
     a9c:	ec1c                	sd	a5,24(s0)
     a9e:	03043023          	sd	a6,32(s0)
     aa2:	03143423          	sd	a7,40(s0)
     aa6:	87aa                	mv	a5,a0
     aa8:	fcf42e23          	sw	a5,-36(s0)
  va_list ap;

  va_start(ap, fmt);
     aac:	03040793          	addi	a5,s0,48
     ab0:	fcf43423          	sd	a5,-56(s0)
     ab4:	fc843783          	ld	a5,-56(s0)
     ab8:	fd078793          	addi	a5,a5,-48
     abc:	fef43423          	sd	a5,-24(s0)
  vprintf(fd, fmt, ap);
     ac0:	fe843703          	ld	a4,-24(s0)
     ac4:	fdc42783          	lw	a5,-36(s0)
     ac8:	863a                	mv	a2,a4
     aca:	fd043583          	ld	a1,-48(s0)
     ace:	853e                	mv	a0,a5
     ad0:	00000097          	auipc	ra,0x0
     ad4:	d54080e7          	jalr	-684(ra) # 824 <vprintf>
}
     ad8:	0001                	nop
     ada:	70e2                	ld	ra,56(sp)
     adc:	7442                	ld	s0,48(sp)
     ade:	6165                	addi	sp,sp,112
     ae0:	8082                	ret

0000000000000ae2 <printf>:

void
printf(const char *fmt, ...)
{
     ae2:	7159                	addi	sp,sp,-112
     ae4:	f406                	sd	ra,40(sp)
     ae6:	f022                	sd	s0,32(sp)
     ae8:	1800                	addi	s0,sp,48
     aea:	fca43c23          	sd	a0,-40(s0)
     aee:	e40c                	sd	a1,8(s0)
     af0:	e810                	sd	a2,16(s0)
     af2:	ec14                	sd	a3,24(s0)
     af4:	f018                	sd	a4,32(s0)
     af6:	f41c                	sd	a5,40(s0)
     af8:	03043823          	sd	a6,48(s0)
     afc:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
     b00:	04040793          	addi	a5,s0,64
     b04:	fcf43823          	sd	a5,-48(s0)
     b08:	fd043783          	ld	a5,-48(s0)
     b0c:	fc878793          	addi	a5,a5,-56
     b10:	fef43423          	sd	a5,-24(s0)
  vprintf(1, fmt, ap);
     b14:	fe843783          	ld	a5,-24(s0)
     b18:	863e                	mv	a2,a5
     b1a:	fd843583          	ld	a1,-40(s0)
     b1e:	4505                	li	a0,1
     b20:	00000097          	auipc	ra,0x0
     b24:	d04080e7          	jalr	-764(ra) # 824 <vprintf>
}
     b28:	0001                	nop
     b2a:	70a2                	ld	ra,40(sp)
     b2c:	7402                	ld	s0,32(sp)
     b2e:	6165                	addi	sp,sp,112
     b30:	8082                	ret

0000000000000b32 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     b32:	7179                	addi	sp,sp,-48
     b34:	f422                	sd	s0,40(sp)
     b36:	1800                	addi	s0,sp,48
     b38:	fca43c23          	sd	a0,-40(s0)
  Header *bp, *p;

  bp = (Header*)ap - 1;
     b3c:	fd843783          	ld	a5,-40(s0)
     b40:	17c1                	addi	a5,a5,-16
     b42:	fef43023          	sd	a5,-32(s0)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     b46:	00001797          	auipc	a5,0x1
     b4a:	d8a78793          	addi	a5,a5,-630 # 18d0 <freep>
     b4e:	639c                	ld	a5,0(a5)
     b50:	fef43423          	sd	a5,-24(s0)
     b54:	a815                	j	b88 <free+0x56>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     b56:	fe843783          	ld	a5,-24(s0)
     b5a:	639c                	ld	a5,0(a5)
     b5c:	fe843703          	ld	a4,-24(s0)
     b60:	00f76f63          	bltu	a4,a5,b7e <free+0x4c>
     b64:	fe043703          	ld	a4,-32(s0)
     b68:	fe843783          	ld	a5,-24(s0)
     b6c:	02e7eb63          	bltu	a5,a4,ba2 <free+0x70>
     b70:	fe843783          	ld	a5,-24(s0)
     b74:	639c                	ld	a5,0(a5)
     b76:	fe043703          	ld	a4,-32(s0)
     b7a:	02f76463          	bltu	a4,a5,ba2 <free+0x70>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     b7e:	fe843783          	ld	a5,-24(s0)
     b82:	639c                	ld	a5,0(a5)
     b84:	fef43423          	sd	a5,-24(s0)
     b88:	fe043703          	ld	a4,-32(s0)
     b8c:	fe843783          	ld	a5,-24(s0)
     b90:	fce7f3e3          	bgeu	a5,a4,b56 <free+0x24>
     b94:	fe843783          	ld	a5,-24(s0)
     b98:	639c                	ld	a5,0(a5)
     b9a:	fe043703          	ld	a4,-32(s0)
     b9e:	faf77ce3          	bgeu	a4,a5,b56 <free+0x24>
      break;
  if(bp + bp->s.size == p->s.ptr){
     ba2:	fe043783          	ld	a5,-32(s0)
     ba6:	479c                	lw	a5,8(a5)
     ba8:	1782                	slli	a5,a5,0x20
     baa:	9381                	srli	a5,a5,0x20
     bac:	0792                	slli	a5,a5,0x4
     bae:	fe043703          	ld	a4,-32(s0)
     bb2:	973e                	add	a4,a4,a5
     bb4:	fe843783          	ld	a5,-24(s0)
     bb8:	639c                	ld	a5,0(a5)
     bba:	02f71763          	bne	a4,a5,be8 <free+0xb6>
    bp->s.size += p->s.ptr->s.size;
     bbe:	fe043783          	ld	a5,-32(s0)
     bc2:	4798                	lw	a4,8(a5)
     bc4:	fe843783          	ld	a5,-24(s0)
     bc8:	639c                	ld	a5,0(a5)
     bca:	479c                	lw	a5,8(a5)
     bcc:	9fb9                	addw	a5,a5,a4
     bce:	0007871b          	sext.w	a4,a5
     bd2:	fe043783          	ld	a5,-32(s0)
     bd6:	c798                	sw	a4,8(a5)
    bp->s.ptr = p->s.ptr->s.ptr;
     bd8:	fe843783          	ld	a5,-24(s0)
     bdc:	639c                	ld	a5,0(a5)
     bde:	6398                	ld	a4,0(a5)
     be0:	fe043783          	ld	a5,-32(s0)
     be4:	e398                	sd	a4,0(a5)
     be6:	a039                	j	bf4 <free+0xc2>
  } else
    bp->s.ptr = p->s.ptr;
     be8:	fe843783          	ld	a5,-24(s0)
     bec:	6398                	ld	a4,0(a5)
     bee:	fe043783          	ld	a5,-32(s0)
     bf2:	e398                	sd	a4,0(a5)
  if(p + p->s.size == bp){
     bf4:	fe843783          	ld	a5,-24(s0)
     bf8:	479c                	lw	a5,8(a5)
     bfa:	1782                	slli	a5,a5,0x20
     bfc:	9381                	srli	a5,a5,0x20
     bfe:	0792                	slli	a5,a5,0x4
     c00:	fe843703          	ld	a4,-24(s0)
     c04:	97ba                	add	a5,a5,a4
     c06:	fe043703          	ld	a4,-32(s0)
     c0a:	02f71563          	bne	a4,a5,c34 <free+0x102>
    p->s.size += bp->s.size;
     c0e:	fe843783          	ld	a5,-24(s0)
     c12:	4798                	lw	a4,8(a5)
     c14:	fe043783          	ld	a5,-32(s0)
     c18:	479c                	lw	a5,8(a5)
     c1a:	9fb9                	addw	a5,a5,a4
     c1c:	0007871b          	sext.w	a4,a5
     c20:	fe843783          	ld	a5,-24(s0)
     c24:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
     c26:	fe043783          	ld	a5,-32(s0)
     c2a:	6398                	ld	a4,0(a5)
     c2c:	fe843783          	ld	a5,-24(s0)
     c30:	e398                	sd	a4,0(a5)
     c32:	a031                	j	c3e <free+0x10c>
  } else
    p->s.ptr = bp;
     c34:	fe843783          	ld	a5,-24(s0)
     c38:	fe043703          	ld	a4,-32(s0)
     c3c:	e398                	sd	a4,0(a5)
  freep = p;
     c3e:	00001797          	auipc	a5,0x1
     c42:	c9278793          	addi	a5,a5,-878 # 18d0 <freep>
     c46:	fe843703          	ld	a4,-24(s0)
     c4a:	e398                	sd	a4,0(a5)
}
     c4c:	0001                	nop
     c4e:	7422                	ld	s0,40(sp)
     c50:	6145                	addi	sp,sp,48
     c52:	8082                	ret

0000000000000c54 <morecore>:

static Header*
morecore(uint nu)
{
     c54:	7179                	addi	sp,sp,-48
     c56:	f406                	sd	ra,40(sp)
     c58:	f022                	sd	s0,32(sp)
     c5a:	1800                	addi	s0,sp,48
     c5c:	87aa                	mv	a5,a0
     c5e:	fcf42e23          	sw	a5,-36(s0)
  char *p;
  Header *hp;

  if(nu < 4096)
     c62:	fdc42783          	lw	a5,-36(s0)
     c66:	0007871b          	sext.w	a4,a5
     c6a:	6785                	lui	a5,0x1
     c6c:	00f77563          	bgeu	a4,a5,c76 <morecore+0x22>
    nu = 4096;
     c70:	6785                	lui	a5,0x1
     c72:	fcf42e23          	sw	a5,-36(s0)
  p = sbrk(nu * sizeof(Header));
     c76:	fdc42783          	lw	a5,-36(s0)
     c7a:	0047979b          	slliw	a5,a5,0x4
     c7e:	2781                	sext.w	a5,a5
     c80:	2781                	sext.w	a5,a5
     c82:	853e                	mv	a0,a5
     c84:	00000097          	auipc	ra,0x0
     c88:	9a0080e7          	jalr	-1632(ra) # 624 <sbrk>
     c8c:	fea43423          	sd	a0,-24(s0)
  if(p == (char*)-1)
     c90:	fe843703          	ld	a4,-24(s0)
     c94:	57fd                	li	a5,-1
     c96:	00f71463          	bne	a4,a5,c9e <morecore+0x4a>
    return 0;
     c9a:	4781                	li	a5,0
     c9c:	a03d                	j	cca <morecore+0x76>
  hp = (Header*)p;
     c9e:	fe843783          	ld	a5,-24(s0)
     ca2:	fef43023          	sd	a5,-32(s0)
  hp->s.size = nu;
     ca6:	fe043783          	ld	a5,-32(s0)
     caa:	fdc42703          	lw	a4,-36(s0)
     cae:	c798                	sw	a4,8(a5)
  free((void*)(hp + 1));
     cb0:	fe043783          	ld	a5,-32(s0)
     cb4:	07c1                	addi	a5,a5,16
     cb6:	853e                	mv	a0,a5
     cb8:	00000097          	auipc	ra,0x0
     cbc:	e7a080e7          	jalr	-390(ra) # b32 <free>
  return freep;
     cc0:	00001797          	auipc	a5,0x1
     cc4:	c1078793          	addi	a5,a5,-1008 # 18d0 <freep>
     cc8:	639c                	ld	a5,0(a5)
}
     cca:	853e                	mv	a0,a5
     ccc:	70a2                	ld	ra,40(sp)
     cce:	7402                	ld	s0,32(sp)
     cd0:	6145                	addi	sp,sp,48
     cd2:	8082                	ret

0000000000000cd4 <malloc>:

void*
malloc(uint nbytes)
{
     cd4:	7139                	addi	sp,sp,-64
     cd6:	fc06                	sd	ra,56(sp)
     cd8:	f822                	sd	s0,48(sp)
     cda:	0080                	addi	s0,sp,64
     cdc:	87aa                	mv	a5,a0
     cde:	fcf42623          	sw	a5,-52(s0)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     ce2:	fcc46783          	lwu	a5,-52(s0)
     ce6:	07bd                	addi	a5,a5,15
     ce8:	8391                	srli	a5,a5,0x4
     cea:	2781                	sext.w	a5,a5
     cec:	2785                	addiw	a5,a5,1
     cee:	fcf42e23          	sw	a5,-36(s0)
  if((prevp = freep) == 0){
     cf2:	00001797          	auipc	a5,0x1
     cf6:	bde78793          	addi	a5,a5,-1058 # 18d0 <freep>
     cfa:	639c                	ld	a5,0(a5)
     cfc:	fef43023          	sd	a5,-32(s0)
     d00:	fe043783          	ld	a5,-32(s0)
     d04:	ef95                	bnez	a5,d40 <malloc+0x6c>
    base.s.ptr = freep = prevp = &base;
     d06:	00001797          	auipc	a5,0x1
     d0a:	bba78793          	addi	a5,a5,-1094 # 18c0 <base>
     d0e:	fef43023          	sd	a5,-32(s0)
     d12:	00001797          	auipc	a5,0x1
     d16:	bbe78793          	addi	a5,a5,-1090 # 18d0 <freep>
     d1a:	fe043703          	ld	a4,-32(s0)
     d1e:	e398                	sd	a4,0(a5)
     d20:	00001797          	auipc	a5,0x1
     d24:	bb078793          	addi	a5,a5,-1104 # 18d0 <freep>
     d28:	6398                	ld	a4,0(a5)
     d2a:	00001797          	auipc	a5,0x1
     d2e:	b9678793          	addi	a5,a5,-1130 # 18c0 <base>
     d32:	e398                	sd	a4,0(a5)
    base.s.size = 0;
     d34:	00001797          	auipc	a5,0x1
     d38:	b8c78793          	addi	a5,a5,-1140 # 18c0 <base>
     d3c:	0007a423          	sw	zero,8(a5)
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     d40:	fe043783          	ld	a5,-32(s0)
     d44:	639c                	ld	a5,0(a5)
     d46:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
     d4a:	fe843783          	ld	a5,-24(s0)
     d4e:	4798                	lw	a4,8(a5)
     d50:	fdc42783          	lw	a5,-36(s0)
     d54:	2781                	sext.w	a5,a5
     d56:	06f76863          	bltu	a4,a5,dc6 <malloc+0xf2>
      if(p->s.size == nunits)
     d5a:	fe843783          	ld	a5,-24(s0)
     d5e:	4798                	lw	a4,8(a5)
     d60:	fdc42783          	lw	a5,-36(s0)
     d64:	2781                	sext.w	a5,a5
     d66:	00e79963          	bne	a5,a4,d78 <malloc+0xa4>
        prevp->s.ptr = p->s.ptr;
     d6a:	fe843783          	ld	a5,-24(s0)
     d6e:	6398                	ld	a4,0(a5)
     d70:	fe043783          	ld	a5,-32(s0)
     d74:	e398                	sd	a4,0(a5)
     d76:	a82d                	j	db0 <malloc+0xdc>
      else {
        p->s.size -= nunits;
     d78:	fe843783          	ld	a5,-24(s0)
     d7c:	4798                	lw	a4,8(a5)
     d7e:	fdc42783          	lw	a5,-36(s0)
     d82:	40f707bb          	subw	a5,a4,a5
     d86:	0007871b          	sext.w	a4,a5
     d8a:	fe843783          	ld	a5,-24(s0)
     d8e:	c798                	sw	a4,8(a5)
        p += p->s.size;
     d90:	fe843783          	ld	a5,-24(s0)
     d94:	479c                	lw	a5,8(a5)
     d96:	1782                	slli	a5,a5,0x20
     d98:	9381                	srli	a5,a5,0x20
     d9a:	0792                	slli	a5,a5,0x4
     d9c:	fe843703          	ld	a4,-24(s0)
     da0:	97ba                	add	a5,a5,a4
     da2:	fef43423          	sd	a5,-24(s0)
        p->s.size = nunits;
     da6:	fe843783          	ld	a5,-24(s0)
     daa:	fdc42703          	lw	a4,-36(s0)
     dae:	c798                	sw	a4,8(a5)
      }
      freep = prevp;
     db0:	00001797          	auipc	a5,0x1
     db4:	b2078793          	addi	a5,a5,-1248 # 18d0 <freep>
     db8:	fe043703          	ld	a4,-32(s0)
     dbc:	e398                	sd	a4,0(a5)
      return (void*)(p + 1);
     dbe:	fe843783          	ld	a5,-24(s0)
     dc2:	07c1                	addi	a5,a5,16
     dc4:	a091                	j	e08 <malloc+0x134>
    }
    if(p == freep)
     dc6:	00001797          	auipc	a5,0x1
     dca:	b0a78793          	addi	a5,a5,-1270 # 18d0 <freep>
     dce:	639c                	ld	a5,0(a5)
     dd0:	fe843703          	ld	a4,-24(s0)
     dd4:	02f71063          	bne	a4,a5,df4 <malloc+0x120>
      if((p = morecore(nunits)) == 0)
     dd8:	fdc42783          	lw	a5,-36(s0)
     ddc:	853e                	mv	a0,a5
     dde:	00000097          	auipc	ra,0x0
     de2:	e76080e7          	jalr	-394(ra) # c54 <morecore>
     de6:	fea43423          	sd	a0,-24(s0)
     dea:	fe843783          	ld	a5,-24(s0)
     dee:	e399                	bnez	a5,df4 <malloc+0x120>
        return 0;
     df0:	4781                	li	a5,0
     df2:	a819                	j	e08 <malloc+0x134>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     df4:	fe843783          	ld	a5,-24(s0)
     df8:	fef43023          	sd	a5,-32(s0)
     dfc:	fe843783          	ld	a5,-24(s0)
     e00:	639c                	ld	a5,0(a5)
     e02:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
     e06:	b791                	j	d4a <malloc+0x76>
  }
}
     e08:	853e                	mv	a0,a5
     e0a:	70e2                	ld	ra,56(sp)
     e0c:	7442                	ld	s0,48(sp)
     e0e:	6121                	addi	sp,sp,64
     e10:	8082                	ret

0000000000000e12 <setjmp>:
     e12:	e100                	sd	s0,0(a0)
     e14:	e504                	sd	s1,8(a0)
     e16:	01253823          	sd	s2,16(a0)
     e1a:	01353c23          	sd	s3,24(a0)
     e1e:	03453023          	sd	s4,32(a0)
     e22:	03553423          	sd	s5,40(a0)
     e26:	03653823          	sd	s6,48(a0)
     e2a:	03753c23          	sd	s7,56(a0)
     e2e:	05853023          	sd	s8,64(a0)
     e32:	05953423          	sd	s9,72(a0)
     e36:	05a53823          	sd	s10,80(a0)
     e3a:	05b53c23          	sd	s11,88(a0)
     e3e:	06153023          	sd	ra,96(a0)
     e42:	06253423          	sd	sp,104(a0)
     e46:	4501                	li	a0,0
     e48:	8082                	ret

0000000000000e4a <longjmp>:
     e4a:	6100                	ld	s0,0(a0)
     e4c:	6504                	ld	s1,8(a0)
     e4e:	01053903          	ld	s2,16(a0)
     e52:	01853983          	ld	s3,24(a0)
     e56:	02053a03          	ld	s4,32(a0)
     e5a:	02853a83          	ld	s5,40(a0)
     e5e:	03053b03          	ld	s6,48(a0)
     e62:	03853b83          	ld	s7,56(a0)
     e66:	04053c03          	ld	s8,64(a0)
     e6a:	04853c83          	ld	s9,72(a0)
     e6e:	05053d03          	ld	s10,80(a0)
     e72:	05853d83          	ld	s11,88(a0)
     e76:	06053083          	ld	ra,96(a0)
     e7a:	06853103          	ld	sp,104(a0)
     e7e:	c199                	beqz	a1,e84 <longjmp_1>
     e80:	852e                	mv	a0,a1
     e82:	8082                	ret

0000000000000e84 <longjmp_1>:
     e84:	4505                	li	a0,1
     e86:	8082                	ret

0000000000000e88 <thread_create>:
static jmp_buf env_st;
static int threading_system_time = 0;
static struct adding_thread_node* adding_queue = NULL; 
// static jmp_buf env_tmp;

struct thread *thread_create(void (*f)(void *), void *arg, int execution_time_quantum){
     e88:	715d                	addi	sp,sp,-80
     e8a:	e486                	sd	ra,72(sp)
     e8c:	e0a2                	sd	s0,64(sp)
     e8e:	0880                	addi	s0,sp,80
     e90:	fca43423          	sd	a0,-56(s0)
     e94:	fcb43023          	sd	a1,-64(s0)
     e98:	87b2                	mv	a5,a2
     e9a:	faf42e23          	sw	a5,-68(s0)
    struct thread *t = (struct thread*) malloc(sizeof(struct thread));
     e9e:	0c800513          	li	a0,200
     ea2:	00000097          	auipc	ra,0x0
     ea6:	e32080e7          	jalr	-462(ra) # cd4 <malloc>
     eaa:	fea43423          	sd	a0,-24(s0)
    //unsigned long stack_p = 0;
    unsigned long new_stack_p;
    unsigned long new_stack;
    new_stack = (unsigned long) malloc(sizeof(unsigned long)*0x200);
     eae:	6505                	lui	a0,0x1
     eb0:	00000097          	auipc	ra,0x0
     eb4:	e24080e7          	jalr	-476(ra) # cd4 <malloc>
     eb8:	87aa                	mv	a5,a0
     eba:	fef43023          	sd	a5,-32(s0)
    new_stack_p = new_stack +0x200*8-0x2*8;
     ebe:	fe043703          	ld	a4,-32(s0)
     ec2:	6785                	lui	a5,0x1
     ec4:	17c1                	addi	a5,a5,-16
     ec6:	97ba                	add	a5,a5,a4
     ec8:	fcf43c23          	sd	a5,-40(s0)
    t->fp = f;
     ecc:	fe843783          	ld	a5,-24(s0)
     ed0:	fc843703          	ld	a4,-56(s0)
     ed4:	e398                	sd	a4,0(a5)
    t->arg = arg;
     ed6:	fe843783          	ld	a5,-24(s0)
     eda:	fc043703          	ld	a4,-64(s0)
     ede:	e798                	sd	a4,8(a5)
    t->ID  = -1;
     ee0:	fe843783          	ld	a5,-24(s0)
     ee4:	577d                	li	a4,-1
     ee6:	08e7a823          	sw	a4,144(a5) # 1090 <add_from_adding_queue+0x12>
    t->buf_set = 0;
     eea:	fe843783          	ld	a5,-24(s0)
     eee:	0807ae23          	sw	zero,156(a5)
    t->stack = (void*) new_stack;
     ef2:	fe043703          	ld	a4,-32(s0)
     ef6:	fe843783          	ld	a5,-24(s0)
     efa:	eb98                	sd	a4,16(a5)
    t->stack_p = (void*) new_stack_p;
     efc:	fd843703          	ld	a4,-40(s0)
     f00:	fe843783          	ld	a5,-24(s0)
     f04:	ef98                	sd	a4,24(a5)
    t->next = NULL;
     f06:	fe843783          	ld	a5,-24(s0)
     f0a:	0a07b423          	sd	zero,168(a5)
    t->previous = NULL;
     f0e:	fe843783          	ld	a5,-24(s0)
     f12:	0a07b023          	sd	zero,160(a5)
    t->remain_execution_time = execution_time_quantum * TIME_QUANTUM_SIZE;
     f16:	fbc42703          	lw	a4,-68(s0)
     f1a:	87ba                	mv	a5,a4
     f1c:	0027979b          	slliw	a5,a5,0x2
     f20:	9fb9                	addw	a5,a5,a4
     f22:	0007871b          	sext.w	a4,a5
     f26:	fe843783          	ld	a5,-24(s0)
     f2a:	0ae7aa23          	sw	a4,180(a5)
    t->quantum = 0;
     f2e:	fe843783          	ld	a5,-24(s0)
     f32:	0c07a223          	sw	zero,196(a5)

    t->is_yield = 0;
     f36:	fe843783          	ld	a5,-24(s0)
     f3a:	0a07ae23          	sw	zero,188(a5)
    t->is_exited = 0;
     f3e:	fe843783          	ld	a5,-24(s0)
     f42:	0c07a023          	sw	zero,192(a5)
    return t;
     f46:	fe843783          	ld	a5,-24(s0)
}
     f4a:	853e                	mv	a0,a5
     f4c:	60a6                	ld	ra,72(sp)
     f4e:	6406                	ld	s0,64(sp)
     f50:	6161                	addi	sp,sp,80
     f52:	8082                	ret

0000000000000f54 <thread_add_at>:

void thread_add_at( struct thread *t, int adding_time ){
     f54:	7179                	addi	sp,sp,-48
     f56:	f406                	sd	ra,40(sp)
     f58:	f022                	sd	s0,32(sp)
     f5a:	1800                	addi	s0,sp,48
     f5c:	fca43c23          	sd	a0,-40(s0)
     f60:	87ae                	mv	a5,a1
     f62:	fcf42a23          	sw	a5,-44(s0)
    struct adding_thread_node *tmp_node = (struct adding_thread_node*) malloc(sizeof(struct adding_thread_node));
     f66:	02000513          	li	a0,32
     f6a:	00000097          	auipc	ra,0x0
     f6e:	d6a080e7          	jalr	-662(ra) # cd4 <malloc>
     f72:	fea43423          	sd	a0,-24(s0)
    tmp_node->thrd = t;
     f76:	fe843783          	ld	a5,-24(s0)
     f7a:	fd843703          	ld	a4,-40(s0)
     f7e:	e398                	sd	a4,0(a5)
    tmp_node->adding_time = adding_time;
     f80:	fe843783          	ld	a5,-24(s0)
     f84:	fd442703          	lw	a4,-44(s0)
     f88:	cf98                	sw	a4,24(a5)
    tmp_node->previous = NULL;
     f8a:	fe843783          	ld	a5,-24(s0)
     f8e:	0007b423          	sd	zero,8(a5)
    tmp_node->next = NULL;
     f92:	fe843783          	ld	a5,-24(s0)
     f96:	0007b823          	sd	zero,16(a5)

    if(adding_queue == NULL){
     f9a:	00001797          	auipc	a5,0x1
     f9e:	9c678793          	addi	a5,a5,-1594 # 1960 <adding_queue>
     fa2:	639c                	ld	a5,0(a5)
     fa4:	eb8d                	bnez	a5,fd6 <thread_add_at+0x82>
        adding_queue = tmp_node;
     fa6:	00001797          	auipc	a5,0x1
     faa:	9ba78793          	addi	a5,a5,-1606 # 1960 <adding_queue>
     fae:	fe843703          	ld	a4,-24(s0)
     fb2:	e398                	sd	a4,0(a5)
        adding_queue->previous = tmp_node;
     fb4:	00001797          	auipc	a5,0x1
     fb8:	9ac78793          	addi	a5,a5,-1620 # 1960 <adding_queue>
     fbc:	639c                	ld	a5,0(a5)
     fbe:	fe843703          	ld	a4,-24(s0)
     fc2:	e798                	sd	a4,8(a5)
        adding_queue->next = tmp_node;
     fc4:	00001797          	auipc	a5,0x1
     fc8:	99c78793          	addi	a5,a5,-1636 # 1960 <adding_queue>
     fcc:	639c                	ld	a5,0(a5)
     fce:	fe843703          	ld	a4,-24(s0)
     fd2:	eb98                	sd	a4,16(a5)
        return;
     fd4:	a04d                	j	1076 <thread_add_at+0x122>
    }
    else{
        if(adding_queue->previous == adding_queue){
     fd6:	00001797          	auipc	a5,0x1
     fda:	98a78793          	addi	a5,a5,-1654 # 1960 <adding_queue>
     fde:	639c                	ld	a5,0(a5)
     fe0:	6798                	ld	a4,8(a5)
     fe2:	00001797          	auipc	a5,0x1
     fe6:	97e78793          	addi	a5,a5,-1666 # 1960 <adding_queue>
     fea:	639c                	ld	a5,0(a5)
     fec:	04f71363          	bne	a4,a5,1032 <thread_add_at+0xde>
            //Single node in queue
            adding_queue->previous = tmp_node;
     ff0:	00001797          	auipc	a5,0x1
     ff4:	97078793          	addi	a5,a5,-1680 # 1960 <adding_queue>
     ff8:	639c                	ld	a5,0(a5)
     ffa:	fe843703          	ld	a4,-24(s0)
     ffe:	e798                	sd	a4,8(a5)
            adding_queue->next = tmp_node;
    1000:	00001797          	auipc	a5,0x1
    1004:	96078793          	addi	a5,a5,-1696 # 1960 <adding_queue>
    1008:	639c                	ld	a5,0(a5)
    100a:	fe843703          	ld	a4,-24(s0)
    100e:	eb98                	sd	a4,16(a5)
            tmp_node->previous = adding_queue;
    1010:	00001797          	auipc	a5,0x1
    1014:	95078793          	addi	a5,a5,-1712 # 1960 <adding_queue>
    1018:	6398                	ld	a4,0(a5)
    101a:	fe843783          	ld	a5,-24(s0)
    101e:	e798                	sd	a4,8(a5)
            tmp_node->next = adding_queue;
    1020:	00001797          	auipc	a5,0x1
    1024:	94078793          	addi	a5,a5,-1728 # 1960 <adding_queue>
    1028:	6398                	ld	a4,0(a5)
    102a:	fe843783          	ld	a5,-24(s0)
    102e:	eb98                	sd	a4,16(a5)
    1030:	a099                	j	1076 <thread_add_at+0x122>
        }
        else{
            //Two or more nodes in queue
            adding_queue->previous->next = tmp_node;
    1032:	00001797          	auipc	a5,0x1
    1036:	92e78793          	addi	a5,a5,-1746 # 1960 <adding_queue>
    103a:	639c                	ld	a5,0(a5)
    103c:	679c                	ld	a5,8(a5)
    103e:	fe843703          	ld	a4,-24(s0)
    1042:	eb98                	sd	a4,16(a5)
            tmp_node->previous = adding_queue->previous;
    1044:	00001797          	auipc	a5,0x1
    1048:	91c78793          	addi	a5,a5,-1764 # 1960 <adding_queue>
    104c:	639c                	ld	a5,0(a5)
    104e:	6798                	ld	a4,8(a5)
    1050:	fe843783          	ld	a5,-24(s0)
    1054:	e798                	sd	a4,8(a5)
            tmp_node->next = adding_queue;
    1056:	00001797          	auipc	a5,0x1
    105a:	90a78793          	addi	a5,a5,-1782 # 1960 <adding_queue>
    105e:	6398                	ld	a4,0(a5)
    1060:	fe843783          	ld	a5,-24(s0)
    1064:	eb98                	sd	a4,16(a5)
            adding_queue->previous = tmp_node;
    1066:	00001797          	auipc	a5,0x1
    106a:	8fa78793          	addi	a5,a5,-1798 # 1960 <adding_queue>
    106e:	639c                	ld	a5,0(a5)
    1070:	fe843703          	ld	a4,-24(s0)
    1074:	e798                	sd	a4,8(a5)
        }
    }
}
    1076:	70a2                	ld	ra,40(sp)
    1078:	7402                	ld	s0,32(sp)
    107a:	6145                	addi	sp,sp,48
    107c:	8082                	ret

000000000000107e <add_from_adding_queue>:

void add_from_adding_queue(){
    107e:	7179                	addi	sp,sp,-48
    1080:	f406                	sd	ra,40(sp)
    1082:	f022                	sd	s0,32(sp)
    1084:	1800                	addi	s0,sp,48
    struct adding_thread_node *tmp_node = adding_queue ;
    1086:	00001797          	auipc	a5,0x1
    108a:	8da78793          	addi	a5,a5,-1830 # 1960 <adding_queue>
    108e:	639c                	ld	a5,0(a5)
    1090:	fef43423          	sd	a5,-24(s0)
    while( tmp_node != NULL ){
    1094:	a04d                	j	1136 <add_from_adding_queue+0xb8>
        struct adding_thread_node *to_remove = tmp_node;
    1096:	fe843783          	ld	a5,-24(s0)
    109a:	fef43023          	sd	a5,-32(s0)
        tmp_node = tmp_node->next;
    109e:	fe843783          	ld	a5,-24(s0)
    10a2:	6b9c                	ld	a5,16(a5)
    10a4:	fef43423          	sd	a5,-24(s0)
        if( threading_system_time >= to_remove->adding_time ){
    10a8:	fe043783          	ld	a5,-32(s0)
    10ac:	4f98                	lw	a4,24(a5)
    10ae:	00001797          	auipc	a5,0x1
    10b2:	8aa78793          	addi	a5,a5,-1878 # 1958 <threading_system_time>
    10b6:	439c                	lw	a5,0(a5)
    10b8:	06e7c663          	blt	a5,a4,1124 <add_from_adding_queue+0xa6>
            // printf("adding\n");
            thread_add_runqueue( to_remove->thrd ) ;
    10bc:	fe043783          	ld	a5,-32(s0)
    10c0:	639c                	ld	a5,0(a5)
    10c2:	853e                	mv	a0,a5
    10c4:	00000097          	auipc	ra,0x0
    10c8:	086080e7          	jalr	134(ra) # 114a <thread_add_runqueue>
            if( to_remove->next != to_remove ){
    10cc:	fe043783          	ld	a5,-32(s0)
    10d0:	6b9c                	ld	a5,16(a5)
    10d2:	fe043703          	ld	a4,-32(s0)
    10d6:	02f70a63          	beq	a4,a5,110a <add_from_adding_queue+0x8c>
                //Connect the remaining queue
                struct adding_thread_node *to_remove_next = to_remove->next;
    10da:	fe043783          	ld	a5,-32(s0)
    10de:	6b9c                	ld	a5,16(a5)
    10e0:	fcf43c23          	sd	a5,-40(s0)
                to_remove_next->previous = to_remove->previous;
    10e4:	fe043783          	ld	a5,-32(s0)
    10e8:	6798                	ld	a4,8(a5)
    10ea:	fd843783          	ld	a5,-40(s0)
    10ee:	e798                	sd	a4,8(a5)
                to_remove->previous->next = to_remove_next;
    10f0:	fe043783          	ld	a5,-32(s0)
    10f4:	679c                	ld	a5,8(a5)
    10f6:	fd843703          	ld	a4,-40(s0)
    10fa:	eb98                	sd	a4,16(a5)
                free( to_remove ) ;
    10fc:	fe043503          	ld	a0,-32(s0)
    1100:	00000097          	auipc	ra,0x0
    1104:	a32080e7          	jalr	-1486(ra) # b32 <free>
    1108:	a831                	j	1124 <add_from_adding_queue+0xa6>
            }
            else{
                //No more node in adding_queue
                free( to_remove ) ;
    110a:	fe043503          	ld	a0,-32(s0)
    110e:	00000097          	auipc	ra,0x0
    1112:	a24080e7          	jalr	-1500(ra) # b32 <free>
                adding_queue = NULL;
    1116:	00001797          	auipc	a5,0x1
    111a:	84a78793          	addi	a5,a5,-1974 # 1960 <adding_queue>
    111e:	0007b023          	sd	zero,0(a5)
                break;
    1122:	a839                	j	1140 <add_from_adding_queue+0xc2>
            }
        }

        if( tmp_node == adding_queue )
    1124:	00001797          	auipc	a5,0x1
    1128:	83c78793          	addi	a5,a5,-1988 # 1960 <adding_queue>
    112c:	639c                	ld	a5,0(a5)
    112e:	fe843703          	ld	a4,-24(s0)
    1132:	00f70663          	beq	a4,a5,113e <add_from_adding_queue+0xc0>
    while( tmp_node != NULL ){
    1136:	fe843783          	ld	a5,-24(s0)
    113a:	ffb1                	bnez	a5,1096 <add_from_adding_queue+0x18>
            break;
    }
}
    113c:	a011                	j	1140 <add_from_adding_queue+0xc2>
            break;
    113e:	0001                	nop
}
    1140:	0001                	nop
    1142:	70a2                	ld	ra,40(sp)
    1144:	7402                	ld	s0,32(sp)
    1146:	6145                	addi	sp,sp,48
    1148:	8082                	ret

000000000000114a <thread_add_runqueue>:

void thread_add_runqueue(struct thread *t){
    114a:	1101                	addi	sp,sp,-32
    114c:	ec22                	sd	s0,24(sp)
    114e:	1000                	addi	s0,sp,32
    1150:	fea43423          	sd	a0,-24(s0)
    t->start_time = threading_system_time;
    1154:	00001797          	auipc	a5,0x1
    1158:	80478793          	addi	a5,a5,-2044 # 1958 <threading_system_time>
    115c:	4398                	lw	a4,0(a5)
    115e:	fe843783          	ld	a5,-24(s0)
    1162:	0ae7ac23          	sw	a4,184(a5)
    // printf("thread %d start time is: %d\n",  t->ID, t->start_time);
    t->ID  = id;
    1166:	00000797          	auipc	a5,0x0
    116a:	75678793          	addi	a5,a5,1878 # 18bc <id>
    116e:	4398                	lw	a4,0(a5)
    1170:	fe843783          	ld	a5,-24(s0)
    1174:	08e7a823          	sw	a4,144(a5)
    id ++;
    1178:	00000797          	auipc	a5,0x0
    117c:	74478793          	addi	a5,a5,1860 # 18bc <id>
    1180:	439c                	lw	a5,0(a5)
    1182:	2785                	addiw	a5,a5,1
    1184:	0007871b          	sext.w	a4,a5
    1188:	00000797          	auipc	a5,0x0
    118c:	73478793          	addi	a5,a5,1844 # 18bc <id>
    1190:	c398                	sw	a4,0(a5)
    if(current_thread == NULL){
    1192:	00000797          	auipc	a5,0x0
    1196:	74678793          	addi	a5,a5,1862 # 18d8 <current_thread>
    119a:	639c                	ld	a5,0(a5)
    119c:	eb8d                	bnez	a5,11ce <thread_add_runqueue+0x84>
        current_thread = t;
    119e:	00000797          	auipc	a5,0x0
    11a2:	73a78793          	addi	a5,a5,1850 # 18d8 <current_thread>
    11a6:	fe843703          	ld	a4,-24(s0)
    11aa:	e398                	sd	a4,0(a5)
        current_thread->previous = t;
    11ac:	00000797          	auipc	a5,0x0
    11b0:	72c78793          	addi	a5,a5,1836 # 18d8 <current_thread>
    11b4:	639c                	ld	a5,0(a5)
    11b6:	fe843703          	ld	a4,-24(s0)
    11ba:	f3d8                	sd	a4,160(a5)
        current_thread->next = t;
    11bc:	00000797          	auipc	a5,0x0
    11c0:	71c78793          	addi	a5,a5,1820 # 18d8 <current_thread>
    11c4:	639c                	ld	a5,0(a5)
    11c6:	fe843703          	ld	a4,-24(s0)
    11ca:	f7d8                	sd	a4,168(a5)
        return;
    11cc:	a06d                	j	1276 <thread_add_runqueue+0x12c>
    }
    else{
        if(current_thread->previous->ID == current_thread->ID){
    11ce:	00000797          	auipc	a5,0x0
    11d2:	70a78793          	addi	a5,a5,1802 # 18d8 <current_thread>
    11d6:	639c                	ld	a5,0(a5)
    11d8:	73dc                	ld	a5,160(a5)
    11da:	0907a703          	lw	a4,144(a5)
    11de:	00000797          	auipc	a5,0x0
    11e2:	6fa78793          	addi	a5,a5,1786 # 18d8 <current_thread>
    11e6:	639c                	ld	a5,0(a5)
    11e8:	0907a783          	lw	a5,144(a5)
    11ec:	04f71363          	bne	a4,a5,1232 <thread_add_runqueue+0xe8>
            //Single thread in queue
            current_thread->previous = t;
    11f0:	00000797          	auipc	a5,0x0
    11f4:	6e878793          	addi	a5,a5,1768 # 18d8 <current_thread>
    11f8:	639c                	ld	a5,0(a5)
    11fa:	fe843703          	ld	a4,-24(s0)
    11fe:	f3d8                	sd	a4,160(a5)
            current_thread->next = t;
    1200:	00000797          	auipc	a5,0x0
    1204:	6d878793          	addi	a5,a5,1752 # 18d8 <current_thread>
    1208:	639c                	ld	a5,0(a5)
    120a:	fe843703          	ld	a4,-24(s0)
    120e:	f7d8                	sd	a4,168(a5)
            t->previous = current_thread;
    1210:	00000797          	auipc	a5,0x0
    1214:	6c878793          	addi	a5,a5,1736 # 18d8 <current_thread>
    1218:	6398                	ld	a4,0(a5)
    121a:	fe843783          	ld	a5,-24(s0)
    121e:	f3d8                	sd	a4,160(a5)
            t->next = current_thread;
    1220:	00000797          	auipc	a5,0x0
    1224:	6b878793          	addi	a5,a5,1720 # 18d8 <current_thread>
    1228:	6398                	ld	a4,0(a5)
    122a:	fe843783          	ld	a5,-24(s0)
    122e:	f7d8                	sd	a4,168(a5)
    1230:	a099                	j	1276 <thread_add_runqueue+0x12c>
        }
        else{
            //Two or more threads in queue
            current_thread->previous->next = t;
    1232:	00000797          	auipc	a5,0x0
    1236:	6a678793          	addi	a5,a5,1702 # 18d8 <current_thread>
    123a:	639c                	ld	a5,0(a5)
    123c:	73dc                	ld	a5,160(a5)
    123e:	fe843703          	ld	a4,-24(s0)
    1242:	f7d8                	sd	a4,168(a5)
            t->previous = current_thread->previous;
    1244:	00000797          	auipc	a5,0x0
    1248:	69478793          	addi	a5,a5,1684 # 18d8 <current_thread>
    124c:	639c                	ld	a5,0(a5)
    124e:	73d8                	ld	a4,160(a5)
    1250:	fe843783          	ld	a5,-24(s0)
    1254:	f3d8                	sd	a4,160(a5)
            t->next = current_thread;
    1256:	00000797          	auipc	a5,0x0
    125a:	68278793          	addi	a5,a5,1666 # 18d8 <current_thread>
    125e:	6398                	ld	a4,0(a5)
    1260:	fe843783          	ld	a5,-24(s0)
    1264:	f7d8                	sd	a4,168(a5)
            current_thread->previous = t;
    1266:	00000797          	auipc	a5,0x0
    126a:	67278793          	addi	a5,a5,1650 # 18d8 <current_thread>
    126e:	639c                	ld	a5,0(a5)
    1270:	fe843703          	ld	a4,-24(s0)
    1274:	f3d8                	sd	a4,160(a5)
        }
    }
}
    1276:	6462                	ld	s0,24(sp)
    1278:	6105                	addi	sp,sp,32
    127a:	8082                	ret

000000000000127c <my_thrdstop_handler>:

void my_thrdstop_handler(void *arg){
    127c:	7179                	addi	sp,sp,-48
    127e:	f406                	sd	ra,40(sp)
    1280:	f022                	sd	s0,32(sp)
    1282:	1800                	addi	s0,sp,48
    1284:	fca43c23          	sd	a0,-40(s0)
    uint64 myarg = (uint64) arg;
    1288:	fd843783          	ld	a5,-40(s0)
    128c:	fef43423          	sd	a5,-24(s0)
    // printf("thrd%d execute %p\n", current_thread->ID, myarg);
    current_thread->remain_execution_time -= myarg ;
    1290:	00000797          	auipc	a5,0x0
    1294:	64878793          	addi	a5,a5,1608 # 18d8 <current_thread>
    1298:	639c                	ld	a5,0(a5)
    129a:	0b47a783          	lw	a5,180(a5)
    129e:	0007871b          	sext.w	a4,a5
    12a2:	fe843783          	ld	a5,-24(s0)
    12a6:	2781                	sext.w	a5,a5
    12a8:	40f707bb          	subw	a5,a4,a5
    12ac:	0007871b          	sext.w	a4,a5
    12b0:	00000797          	auipc	a5,0x0
    12b4:	62878793          	addi	a5,a5,1576 # 18d8 <current_thread>
    12b8:	639c                	ld	a5,0(a5)
    12ba:	2701                	sext.w	a4,a4
    12bc:	0ae7aa23          	sw	a4,180(a5)
    // printf("my_thrdstop_handler%d threading_system_time %d\n", current_thread->ID, threading_system_time + myarg);
    if( current_thread->remain_execution_time <= 0 )
    12c0:	00000797          	auipc	a5,0x0
    12c4:	61878793          	addi	a5,a5,1560 # 18d8 <current_thread>
    12c8:	639c                	ld	a5,0(a5)
    12ca:	0b47a783          	lw	a5,180(a5)
    12ce:	02f04a63          	bgtz	a5,1302 <my_thrdstop_handler+0x86>
    {
        thread_exit();
    12d2:	00000097          	auipc	ra,0x0
    12d6:	37a080e7          	jalr	890(ra) # 164c <thread_exit>
        threading_system_time += myarg ;
    12da:	fe843783          	ld	a5,-24(s0)
    12de:	0007871b          	sext.w	a4,a5
    12e2:	00000797          	auipc	a5,0x0
    12e6:	67678793          	addi	a5,a5,1654 # 1958 <threading_system_time>
    12ea:	439c                	lw	a5,0(a5)
    12ec:	2781                	sext.w	a5,a5
    12ee:	9fb9                	addw	a5,a5,a4
    12f0:	2781                	sext.w	a5,a5
    12f2:	0007871b          	sext.w	a4,a5
    12f6:	00000797          	auipc	a5,0x0
    12fa:	66278793          	addi	a5,a5,1634 # 1958 <threading_system_time>
    12fe:	c398                	sw	a4,0(a5)
        // printf("%d\n", threading_system_time);
        add_from_adding_queue() ;
        schedule();
        dispatch();
    }
}
    1300:	a081                	j	1340 <my_thrdstop_handler+0xc4>
        threading_system_time += myarg ;
    1302:	fe843783          	ld	a5,-24(s0)
    1306:	0007871b          	sext.w	a4,a5
    130a:	00000797          	auipc	a5,0x0
    130e:	64e78793          	addi	a5,a5,1614 # 1958 <threading_system_time>
    1312:	439c                	lw	a5,0(a5)
    1314:	2781                	sext.w	a5,a5
    1316:	9fb9                	addw	a5,a5,a4
    1318:	2781                	sext.w	a5,a5
    131a:	0007871b          	sext.w	a4,a5
    131e:	00000797          	auipc	a5,0x0
    1322:	63a78793          	addi	a5,a5,1594 # 1958 <threading_system_time>
    1326:	c398                	sw	a4,0(a5)
        add_from_adding_queue() ;
    1328:	00000097          	auipc	ra,0x0
    132c:	d56080e7          	jalr	-682(ra) # 107e <add_from_adding_queue>
        schedule();
    1330:	00000097          	auipc	ra,0x0
    1334:	286080e7          	jalr	646(ra) # 15b6 <schedule>
        dispatch();
    1338:	00000097          	auipc	ra,0x0
    133c:	0ec080e7          	jalr	236(ra) # 1424 <dispatch>
}
    1340:	0001                	nop
    1342:	70a2                	ld	ra,40(sp)
    1344:	7402                	ld	s0,32(sp)
    1346:	6145                	addi	sp,sp,48
    1348:	8082                	ret

000000000000134a <thread_yield>:

void thread_yield(void){
    134a:	1101                	addi	sp,sp,-32
    134c:	ec06                	sd	ra,24(sp)
    134e:	e822                	sd	s0,16(sp)
    1350:	1000                	addi	s0,sp,32
    int consume_ticks = cancelthrdstop( current_thread->thrdstop_context_id, 0 ); // cancel previous thrdstop and save the current thread context
    1352:	00000797          	auipc	a5,0x0
    1356:	58678793          	addi	a5,a5,1414 # 18d8 <current_thread>
    135a:	639c                	ld	a5,0(a5)
    135c:	0b07a783          	lw	a5,176(a5)
    1360:	4581                	li	a1,0
    1362:	853e                	mv	a0,a5
    1364:	fffff097          	auipc	ra,0xfffff
    1368:	2e8080e7          	jalr	744(ra) # 64c <cancelthrdstop>
    136c:	87aa                	mv	a5,a0
    136e:	fef42623          	sw	a5,-20(s0)
    if( current_thread->is_yield == 0 )
    1372:	00000797          	auipc	a5,0x0
    1376:	56678793          	addi	a5,a5,1382 # 18d8 <current_thread>
    137a:	639c                	ld	a5,0(a5)
    137c:	0bc7a783          	lw	a5,188(a5)
    1380:	e7d1                	bnez	a5,140c <thread_yield+0xc2>
    {
        current_thread->remain_execution_time -= consume_ticks ;
    1382:	00000797          	auipc	a5,0x0
    1386:	55678793          	addi	a5,a5,1366 # 18d8 <current_thread>
    138a:	639c                	ld	a5,0(a5)
    138c:	0b47a683          	lw	a3,180(a5)
    1390:	00000797          	auipc	a5,0x0
    1394:	54878793          	addi	a5,a5,1352 # 18d8 <current_thread>
    1398:	639c                	ld	a5,0(a5)
    139a:	fec42703          	lw	a4,-20(s0)
    139e:	40e6873b          	subw	a4,a3,a4
    13a2:	2701                	sext.w	a4,a4
    13a4:	0ae7aa23          	sw	a4,180(a5)

        current_thread->is_yield = 1;
    13a8:	00000797          	auipc	a5,0x0
    13ac:	53078793          	addi	a5,a5,1328 # 18d8 <current_thread>
    13b0:	639c                	ld	a5,0(a5)
    13b2:	4705                	li	a4,1
    13b4:	0ae7ae23          	sw	a4,188(a5)
        // printf("thread_yield threading_system_time %d\n", threading_system_time + consume_ticks);

        if( current_thread->remain_execution_time <= 0 )
    13b8:	00000797          	auipc	a5,0x0
    13bc:	52078793          	addi	a5,a5,1312 # 18d8 <current_thread>
    13c0:	639c                	ld	a5,0(a5)
    13c2:	0b47a783          	lw	a5,180(a5)
    13c6:	00f04763          	bgtz	a5,13d4 <thread_yield+0x8a>
        {
            thread_exit();
    13ca:	00000097          	auipc	ra,0x0
    13ce:	282080e7          	jalr	642(ra) # 164c <thread_exit>
        }
    }
    else{
        current_thread->is_yield = 0;
    }
}
    13d2:	a0a1                	j	141a <thread_yield+0xd0>
            threading_system_time += consume_ticks ;
    13d4:	00000797          	auipc	a5,0x0
    13d8:	58478793          	addi	a5,a5,1412 # 1958 <threading_system_time>
    13dc:	439c                	lw	a5,0(a5)
    13de:	fec42703          	lw	a4,-20(s0)
    13e2:	9fb9                	addw	a5,a5,a4
    13e4:	0007871b          	sext.w	a4,a5
    13e8:	00000797          	auipc	a5,0x0
    13ec:	57078793          	addi	a5,a5,1392 # 1958 <threading_system_time>
    13f0:	c398                	sw	a4,0(a5)
            add_from_adding_queue() ;
    13f2:	00000097          	auipc	ra,0x0
    13f6:	c8c080e7          	jalr	-884(ra) # 107e <add_from_adding_queue>
            schedule();
    13fa:	00000097          	auipc	ra,0x0
    13fe:	1bc080e7          	jalr	444(ra) # 15b6 <schedule>
            dispatch();
    1402:	00000097          	auipc	ra,0x0
    1406:	022080e7          	jalr	34(ra) # 1424 <dispatch>
}
    140a:	a801                	j	141a <thread_yield+0xd0>
        current_thread->is_yield = 0;
    140c:	00000797          	auipc	a5,0x0
    1410:	4cc78793          	addi	a5,a5,1228 # 18d8 <current_thread>
    1414:	639c                	ld	a5,0(a5)
    1416:	0a07ae23          	sw	zero,188(a5)
}
    141a:	0001                	nop
    141c:	60e2                	ld	ra,24(sp)
    141e:	6442                	ld	s0,16(sp)
    1420:	6105                	addi	sp,sp,32
    1422:	8082                	ret

0000000000001424 <dispatch>:

void dispatch(void){
    1424:	7179                	addi	sp,sp,-48
    1426:	f406                	sd	ra,40(sp)
    1428:	f022                	sd	s0,32(sp)
    142a:	ec26                	sd	s1,24(sp)
    142c:	1800                	addi	s0,sp,48
    if(current_thread->buf_set)
    142e:	00000797          	auipc	a5,0x0
    1432:	4aa78793          	addi	a5,a5,1194 # 18d8 <current_thread>
    1436:	639c                	ld	a5,0(a5)
    1438:	09c7a783          	lw	a5,156(a5)
    143c:	c7ad                	beqz	a5,14a6 <dispatch+0x82>
    {
        uint64 next_time = (TIME_QUANTUM_SIZE >= current_thread->remain_execution_time )? current_thread->remain_execution_time: TIME_QUANTUM_SIZE;
    143e:	00000797          	auipc	a5,0x0
    1442:	49a78793          	addi	a5,a5,1178 # 18d8 <current_thread>
    1446:	639c                	ld	a5,0(a5)
    1448:	0b47a783          	lw	a5,180(a5)
    144c:	0007869b          	sext.w	a3,a5
    1450:	4715                	li	a4,5
    1452:	00d75363          	bge	a4,a3,1458 <dispatch+0x34>
    1456:	4795                	li	a5,5
    1458:	2781                	sext.w	a5,a5
    145a:	fcf43823          	sd	a5,-48(s0)
        // printf("next time = %p\n", current_thread->thrdstop_context_id);
        thrdstop( next_time, current_thread->thrdstop_context_id, my_thrdstop_handler, (void *)next_time ); 
    145e:	fd043783          	ld	a5,-48(s0)
    1462:	0007871b          	sext.w	a4,a5
    1466:	00000797          	auipc	a5,0x0
    146a:	47278793          	addi	a5,a5,1138 # 18d8 <current_thread>
    146e:	639c                	ld	a5,0(a5)
    1470:	0b07a783          	lw	a5,176(a5)
    1474:	fd043683          	ld	a3,-48(s0)
    1478:	00000617          	auipc	a2,0x0
    147c:	e0460613          	addi	a2,a2,-508 # 127c <my_thrdstop_handler>
    1480:	85be                	mv	a1,a5
    1482:	853a                	mv	a0,a4
    1484:	fffff097          	auipc	ra,0xfffff
    1488:	1b8080e7          	jalr	440(ra) # 63c <thrdstop>
        thrdresume(current_thread->thrdstop_context_id);
    148c:	00000797          	auipc	a5,0x0
    1490:	44c78793          	addi	a5,a5,1100 # 18d8 <current_thread>
    1494:	639c                	ld	a5,0(a5)
    1496:	0b07a783          	lw	a5,176(a5)
    149a:	853e                	mv	a0,a5
    149c:	fffff097          	auipc	ra,0xfffff
    14a0:	1a8080e7          	jalr	424(ra) # 644 <thrdresume>
    14a4:	a859                	j	153a <dispatch+0x116>
    }
    else // init
    {

        current_thread->buf_set = 1;
    14a6:	00000797          	auipc	a5,0x0
    14aa:	43278793          	addi	a5,a5,1074 # 18d8 <current_thread>
    14ae:	639c                	ld	a5,0(a5)
    14b0:	4705                	li	a4,1
    14b2:	08e7ae23          	sw	a4,156(a5)
        unsigned long new_stack_p;
        new_stack_p = (unsigned long) current_thread->stack_p;      
    14b6:	00000797          	auipc	a5,0x0
    14ba:	42278793          	addi	a5,a5,1058 # 18d8 <current_thread>
    14be:	639c                	ld	a5,0(a5)
    14c0:	6f9c                	ld	a5,24(a5)
    14c2:	fcf43c23          	sd	a5,-40(s0)

        current_thread->thrdstop_context_id = thrdstop( TIME_QUANTUM_SIZE, -1, my_thrdstop_handler, (void *)TIME_QUANTUM_SIZE);
    14c6:	00000797          	auipc	a5,0x0
    14ca:	41278793          	addi	a5,a5,1042 # 18d8 <current_thread>
    14ce:	6384                	ld	s1,0(a5)
    14d0:	4695                	li	a3,5
    14d2:	00000617          	auipc	a2,0x0
    14d6:	daa60613          	addi	a2,a2,-598 # 127c <my_thrdstop_handler>
    14da:	55fd                	li	a1,-1
    14dc:	4515                	li	a0,5
    14de:	fffff097          	auipc	ra,0xfffff
    14e2:	15e080e7          	jalr	350(ra) # 63c <thrdstop>
    14e6:	87aa                	mv	a5,a0
    14e8:	0af4a823          	sw	a5,176(s1)
        if( current_thread->thrdstop_context_id < 0 )
    14ec:	00000797          	auipc	a5,0x0
    14f0:	3ec78793          	addi	a5,a5,1004 # 18d8 <current_thread>
    14f4:	639c                	ld	a5,0(a5)
    14f6:	0b07a783          	lw	a5,176(a5)
    14fa:	0007df63          	bgez	a5,1518 <dispatch+0xf4>
        {
            printf("error: number of threads may exceed\n");
    14fe:	00000517          	auipc	a0,0x0
    1502:	36a50513          	addi	a0,a0,874 # 1868 <thread_start_threading+0xe0>
    1506:	fffff097          	auipc	ra,0xfffff
    150a:	5dc080e7          	jalr	1500(ra) # ae2 <printf>
            exit(1);
    150e:	4505                	li	a0,1
    1510:	fffff097          	auipc	ra,0xfffff
    1514:	08c080e7          	jalr	140(ra) # 59c <exit>
        }
        
        // set sp to stack pointer of current thread.
        asm volatile("mv sp, %0" : : "r" (new_stack_p));
    1518:	fd843783          	ld	a5,-40(s0)
    151c:	813e                	mv	sp,a5
        current_thread->fp(current_thread->arg);
    151e:	00000797          	auipc	a5,0x0
    1522:	3ba78793          	addi	a5,a5,954 # 18d8 <current_thread>
    1526:	639c                	ld	a5,0(a5)
    1528:	6398                	ld	a4,0(a5)
    152a:	00000797          	auipc	a5,0x0
    152e:	3ae78793          	addi	a5,a5,942 # 18d8 <current_thread>
    1532:	639c                	ld	a5,0(a5)
    1534:	679c                	ld	a5,8(a5)
    1536:	853e                	mv	a0,a5
    1538:	9702                	jalr	a4
       
    }
    thread_exit();
    153a:	00000097          	auipc	ra,0x0
    153e:	112080e7          	jalr	274(ra) # 164c <thread_exit>
}
    1542:	0001                	nop
    1544:	70a2                	ld	ra,40(sp)
    1546:	7402                	ld	s0,32(sp)
    1548:	64e2                	ld	s1,24(sp)
    154a:	6145                	addi	sp,sp,48
    154c:	8082                	ret

000000000000154e <min_exec_time>:
struct thread* min_exec_time(struct thread *a, struct thread *b) {
    154e:	1101                	addi	sp,sp,-32
    1550:	ec22                	sd	s0,24(sp)
    1552:	1000                	addi	s0,sp,32
    1554:	fea43423          	sd	a0,-24(s0)
    1558:	feb43023          	sd	a1,-32(s0)
    if(a -> remain_execution_time == b -> remain_execution_time) {
    155c:	fe843783          	ld	a5,-24(s0)
    1560:	0b47a703          	lw	a4,180(a5)
    1564:	fe043783          	ld	a5,-32(s0)
    1568:	0b47a783          	lw	a5,180(a5)
    156c:	02f71263          	bne	a4,a5,1590 <min_exec_time+0x42>
        return a -> ID < b -> ID ? a : b;
    1570:	fe843783          	ld	a5,-24(s0)
    1574:	0907a703          	lw	a4,144(a5)
    1578:	fe043783          	ld	a5,-32(s0)
    157c:	0907a783          	lw	a5,144(a5)
    1580:	00f75563          	bge	a4,a5,158a <min_exec_time+0x3c>
    1584:	fe843783          	ld	a5,-24(s0)
    1588:	a01d                	j	15ae <min_exec_time+0x60>
    158a:	fe043783          	ld	a5,-32(s0)
    158e:	a005                	j	15ae <min_exec_time+0x60>
    }
    return a -> remain_execution_time < b -> remain_execution_time ? a : b;
    1590:	fe843783          	ld	a5,-24(s0)
    1594:	0b47a703          	lw	a4,180(a5)
    1598:	fe043783          	ld	a5,-32(s0)
    159c:	0b47a783          	lw	a5,180(a5)
    15a0:	00f75563          	bge	a4,a5,15aa <min_exec_time+0x5c>
    15a4:	fe843783          	ld	a5,-24(s0)
    15a8:	a019                	j	15ae <min_exec_time+0x60>
    15aa:	fe043783          	ld	a5,-32(s0)
}
    15ae:	853e                	mv	a0,a5
    15b0:	6462                	ld	s0,24(sp)
    15b2:	6105                	addi	sp,sp,32
    15b4:	8082                	ret

00000000000015b6 <schedule>:
void schedule(void){
    15b6:	1141                	addi	sp,sp,-16
    15b8:	e422                	sd	s0,8(sp)
    15ba:	0800                	addi	s0,sp,16

    #endif

    #ifdef THREAD_SCHEDULER_RR
    // ... implement RR here.
    if(is_thread_start == 0) return;
    15bc:	00000797          	auipc	a5,0x0
    15c0:	32478793          	addi	a5,a5,804 # 18e0 <is_thread_start>
    15c4:	439c                	lw	a5,0(a5)
    15c6:	cfbd                	beqz	a5,1644 <schedule+0x8e>
    current_thread -> quantum += 1;
    15c8:	00000797          	auipc	a5,0x0
    15cc:	31078793          	addi	a5,a5,784 # 18d8 <current_thread>
    15d0:	639c                	ld	a5,0(a5)
    15d2:	0c47a703          	lw	a4,196(a5)
    15d6:	00000797          	auipc	a5,0x0
    15da:	30278793          	addi	a5,a5,770 # 18d8 <current_thread>
    15de:	639c                	ld	a5,0(a5)
    15e0:	2705                	addiw	a4,a4,1
    15e2:	2701                	sext.w	a4,a4
    15e4:	0ce7a223          	sw	a4,196(a5)
    if(current_thread -> is_exited || current_thread -> is_yield || current_thread -> quantum == 3) {
    15e8:	00000797          	auipc	a5,0x0
    15ec:	2f078793          	addi	a5,a5,752 # 18d8 <current_thread>
    15f0:	639c                	ld	a5,0(a5)
    15f2:	0c07a783          	lw	a5,192(a5)
    15f6:	e785                	bnez	a5,161e <schedule+0x68>
    15f8:	00000797          	auipc	a5,0x0
    15fc:	2e078793          	addi	a5,a5,736 # 18d8 <current_thread>
    1600:	639c                	ld	a5,0(a5)
    1602:	0bc7a783          	lw	a5,188(a5)
    1606:	ef81                	bnez	a5,161e <schedule+0x68>
    1608:	00000797          	auipc	a5,0x0
    160c:	2d078793          	addi	a5,a5,720 # 18d8 <current_thread>
    1610:	639c                	ld	a5,0(a5)
    1612:	0c47a783          	lw	a5,196(a5)
    1616:	873e                	mv	a4,a5
    1618:	478d                	li	a5,3
    161a:	02f71663          	bne	a4,a5,1646 <schedule+0x90>
        current_thread -> quantum = 0;
    161e:	00000797          	auipc	a5,0x0
    1622:	2ba78793          	addi	a5,a5,698 # 18d8 <current_thread>
    1626:	639c                	ld	a5,0(a5)
    1628:	0c07a223          	sw	zero,196(a5)
        current_thread = current_thread -> next;
    162c:	00000797          	auipc	a5,0x0
    1630:	2ac78793          	addi	a5,a5,684 # 18d8 <current_thread>
    1634:	639c                	ld	a5,0(a5)
    1636:	77d8                	ld	a4,168(a5)
    1638:	00000797          	auipc	a5,0x0
    163c:	2a078793          	addi	a5,a5,672 # 18d8 <current_thread>
    1640:	e398                	sd	a4,0(a5)
    1642:	a011                	j	1646 <schedule+0x90>
    if(is_thread_start == 0) return;
    1644:	0001                	nop
        next = min_exec_time(next, tmp_thread);
    }
    current_thread = next;
    #endif

}
    1646:	6422                	ld	s0,8(sp)
    1648:	0141                	addi	sp,sp,16
    164a:	8082                	ret

000000000000164c <thread_exit>:
void thread_exit(void){
    164c:	7179                	addi	sp,sp,-48
    164e:	f406                	sd	ra,40(sp)
    1650:	f022                	sd	s0,32(sp)
    1652:	1800                	addi	s0,sp,48
    // remove the thread immediately, and cancel previous thrdstop.
    int consume_ticks = cancelthrdstop(current_thread->thrdstop_context_id, 1);
    1654:	00000797          	auipc	a5,0x0
    1658:	28478793          	addi	a5,a5,644 # 18d8 <current_thread>
    165c:	639c                	ld	a5,0(a5)
    165e:	0b07a783          	lw	a5,176(a5)
    1662:	4585                	li	a1,1
    1664:	853e                	mv	a0,a5
    1666:	fffff097          	auipc	ra,0xfffff
    166a:	fe6080e7          	jalr	-26(ra) # 64c <cancelthrdstop>
    166e:	87aa                	mv	a5,a0
    1670:	fef42623          	sw	a5,-20(s0)
    // printf("consume_ticks %d\n", consume_ticks);
    threading_system_time += consume_ticks ;
    1674:	00000797          	auipc	a5,0x0
    1678:	2e478793          	addi	a5,a5,740 # 1958 <threading_system_time>
    167c:	439c                	lw	a5,0(a5)
    167e:	fec42703          	lw	a4,-20(s0)
    1682:	9fb9                	addw	a5,a5,a4
    1684:	0007871b          	sext.w	a4,a5
    1688:	00000797          	auipc	a5,0x0
    168c:	2d078793          	addi	a5,a5,720 # 1958 <threading_system_time>
    1690:	c398                	sw	a4,0(a5)
    // printf("thread_exit threading_system_time %d\n", threading_system_time);

    add_from_adding_queue() ;
    1692:	00000097          	auipc	ra,0x0
    1696:	9ec080e7          	jalr	-1556(ra) # 107e <add_from_adding_queue>

    struct thread* to_remove = current_thread;
    169a:	00000797          	auipc	a5,0x0
    169e:	23e78793          	addi	a5,a5,574 # 18d8 <current_thread>
    16a2:	639c                	ld	a5,0(a5)
    16a4:	fef43023          	sd	a5,-32(s0)
    // int nowTime = uptime();
    printf("thrd%d exec %d ticks\n", to_remove->ID, threading_system_time - to_remove->start_time);
    16a8:	fe043783          	ld	a5,-32(s0)
    16ac:	0907a683          	lw	a3,144(a5)
    16b0:	00000797          	auipc	a5,0x0
    16b4:	2a878793          	addi	a5,a5,680 # 1958 <threading_system_time>
    16b8:	4398                	lw	a4,0(a5)
    16ba:	fe043783          	ld	a5,-32(s0)
    16be:	0b87a783          	lw	a5,184(a5)
    16c2:	40f707bb          	subw	a5,a4,a5
    16c6:	2781                	sext.w	a5,a5
    16c8:	863e                	mv	a2,a5
    16ca:	85b6                	mv	a1,a3
    16cc:	00000517          	auipc	a0,0x0
    16d0:	1c450513          	addi	a0,a0,452 # 1890 <thread_start_threading+0x108>
    16d4:	fffff097          	auipc	ra,0xfffff
    16d8:	40e080e7          	jalr	1038(ra) # ae2 <printf>

    to_remove->is_exited = 1;
    16dc:	fe043783          	ld	a5,-32(s0)
    16e0:	4705                	li	a4,1
    16e2:	0ce7a023          	sw	a4,192(a5)

    if(to_remove->next != to_remove){
    16e6:	fe043783          	ld	a5,-32(s0)
    16ea:	77dc                	ld	a5,168(a5)
    16ec:	fe043703          	ld	a4,-32(s0)
    16f0:	04f70a63          	beq	a4,a5,1744 <thread_exit+0xf8>
        //Still more thread to execute
        schedule() ;
    16f4:	00000097          	auipc	ra,0x0
    16f8:	ec2080e7          	jalr	-318(ra) # 15b6 <schedule>
        //Connect the remaining threads
        struct thread* to_remove_next = to_remove->next;
    16fc:	fe043783          	ld	a5,-32(s0)
    1700:	77dc                	ld	a5,168(a5)
    1702:	fcf43c23          	sd	a5,-40(s0)
        to_remove_next->previous = to_remove->previous;
    1706:	fe043783          	ld	a5,-32(s0)
    170a:	73d8                	ld	a4,160(a5)
    170c:	fd843783          	ld	a5,-40(s0)
    1710:	f3d8                	sd	a4,160(a5)
        to_remove->previous->next = to_remove_next;
    1712:	fe043783          	ld	a5,-32(s0)
    1716:	73dc                	ld	a5,160(a5)
    1718:	fd843703          	ld	a4,-40(s0)
    171c:	f7d8                	sd	a4,168(a5)


        //free pointers
        free(to_remove->stack);
    171e:	fe043783          	ld	a5,-32(s0)
    1722:	6b9c                	ld	a5,16(a5)
    1724:	853e                	mv	a0,a5
    1726:	fffff097          	auipc	ra,0xfffff
    172a:	40c080e7          	jalr	1036(ra) # b32 <free>
        free(to_remove);
    172e:	fe043503          	ld	a0,-32(s0)
    1732:	fffff097          	auipc	ra,0xfffff
    1736:	400080e7          	jalr	1024(ra) # b32 <free>
        dispatch();
    173a:	00000097          	auipc	ra,0x0
    173e:	cea080e7          	jalr	-790(ra) # 1424 <dispatch>
        free(to_remove->stack);
        free(to_remove);
        current_thread = NULL;
        longjmp(env_st, -1);
    }
}
    1742:	a835                	j	177e <thread_exit+0x132>
        free(to_remove->stack);
    1744:	fe043783          	ld	a5,-32(s0)
    1748:	6b9c                	ld	a5,16(a5)
    174a:	853e                	mv	a0,a5
    174c:	fffff097          	auipc	ra,0xfffff
    1750:	3e6080e7          	jalr	998(ra) # b32 <free>
        free(to_remove);
    1754:	fe043503          	ld	a0,-32(s0)
    1758:	fffff097          	auipc	ra,0xfffff
    175c:	3da080e7          	jalr	986(ra) # b32 <free>
        current_thread = NULL;
    1760:	00000797          	auipc	a5,0x0
    1764:	17878793          	addi	a5,a5,376 # 18d8 <current_thread>
    1768:	0007b023          	sd	zero,0(a5)
        longjmp(env_st, -1);
    176c:	55fd                	li	a1,-1
    176e:	00000517          	auipc	a0,0x0
    1772:	17a50513          	addi	a0,a0,378 # 18e8 <env_st>
    1776:	fffff097          	auipc	ra,0xfffff
    177a:	6d4080e7          	jalr	1748(ra) # e4a <longjmp>
}
    177e:	0001                	nop
    1780:	70a2                	ld	ra,40(sp)
    1782:	7402                	ld	s0,32(sp)
    1784:	6145                	addi	sp,sp,48
    1786:	8082                	ret

0000000000001788 <thread_start_threading>:
void thread_start_threading(){
    1788:	1101                	addi	sp,sp,-32
    178a:	ec06                	sd	ra,24(sp)
    178c:	e822                	sd	s0,16(sp)
    178e:	1000                	addi	s0,sp,32
    int r;
    r = setjmp(env_st);
    1790:	00000517          	auipc	a0,0x0
    1794:	15850513          	addi	a0,a0,344 # 18e8 <env_st>
    1798:	fffff097          	auipc	ra,0xfffff
    179c:	67a080e7          	jalr	1658(ra) # e12 <setjmp>
    17a0:	87aa                	mv	a5,a0
    17a2:	fef42623          	sw	a5,-20(s0)
    
    if(current_thread != NULL && r==0){
    17a6:	00000797          	auipc	a5,0x0
    17aa:	13278793          	addi	a5,a5,306 # 18d8 <current_thread>
    17ae:	639c                	ld	a5,0(a5)
    17b0:	c39d                	beqz	a5,17d6 <thread_start_threading+0x4e>
    17b2:	fec42783          	lw	a5,-20(s0)
    17b6:	2781                	sext.w	a5,a5
    17b8:	ef99                	bnez	a5,17d6 <thread_start_threading+0x4e>
        schedule() ;
    17ba:	00000097          	auipc	ra,0x0
    17be:	dfc080e7          	jalr	-516(ra) # 15b6 <schedule>
        is_thread_start = 1;
    17c2:	00000797          	auipc	a5,0x0
    17c6:	11e78793          	addi	a5,a5,286 # 18e0 <is_thread_start>
    17ca:	4705                	li	a4,1
    17cc:	c398                	sw	a4,0(a5)
        dispatch();
    17ce:	00000097          	auipc	ra,0x0
    17d2:	c56080e7          	jalr	-938(ra) # 1424 <dispatch>
    }
}
    17d6:	0001                	nop
    17d8:	60e2                	ld	ra,24(sp)
    17da:	6442                	ld	s0,16(sp)
    17dc:	6105                	addi	sp,sp,32
    17de:	8082                	ret
