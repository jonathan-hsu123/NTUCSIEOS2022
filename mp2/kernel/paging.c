#include "param.h"
#include "types.h"
#include "memlayout.h"
#include "riscv.h"
#include "spinlock.h"
#include "defs.h"
#include "proc.h"

/* NTU OS 2022 */
/* Page fault handler */
int handle_pgfault(struct proc *p) {
  /* Find the address that caused the fault */
  uint64 va = r_stval();
  uint64 ka = (uint64) kalloc();
  if (ka == 0) return -1;
  memset((void*)ka, 0, PGSIZE);
  va = PGROUNDDOWN(va);
  pte_t* pte = walk(p -> pagetable, va, 0);
  if(*pte & PTE_S) {
    uint block_num = PTE2BLOCKNO(*pte);
    begin_op();
    read_page_from_disk(ROOTDEV, (char*) ka, block_num);
    bfree_page(ROOTDEV, block_num);
    end_op();
  }
  if(mappages(p -> pagetable, va, PGSIZE, ka, PTE_R | PTE_W | PTE_X | PTE_U) != 0) {
    kfree((void*)ka);
    return -1;
  }
  return 0;
  /* TODO */
  // panic("not implemented yet\n");
}
