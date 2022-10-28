# windows64bit-shellcode
here you can find shellcode written in x64 assembly
-compile
  nasm -f win64 {filename.asm}
  ld {filename.obj} -o {filename.exe}
 
-instruction for reverseshell-x64.asm
      1. It is undetectable on windows 10
      2. change code for ip and port, by changing the instruction(for help read the comments in the code)
      
