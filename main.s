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

