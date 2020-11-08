# NASM Assembly
  
## Introduction
How to link GCC library with NASM assembler without GCC compiler ?   
Basically, it only needs both libc.a and libgcc.a wth ld(binutils) linker.  
In the below example code, it shows how to convert string to long(atol) and then print result(printf).  

## Assembly
```
  global _start
  extern atol
  extern printf
  extern __uClibc_main

  section .data
num db "100", 0
fmt db "0x%08x", 10, 0

  section .text
_start:
  xor ebp, ebp
  pop esi
  mov ecx, esp
  and esp, 0fffffff0h
  push eax
  push esp
  push edx
  push 0
  push 0
  push ecx
  push esi
  push main
  call __uClibc_main
  xor eax, eax
  leave
  ret

main:
  push ebp
  mov ebp, esp

  push num
  call atol

  push eax
  push fmt
  call printf

  xor eax, eax
  leave
  ret
```
  
## How to build example
-  nasm -f elf32 main.s -o main.o
-  ld -m elf_i386 main.o -o main -static libc.a libgcc.a
  
### https://steward-fu.github.io/website/index.htm
