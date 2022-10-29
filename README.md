# windows64bit-shellcode
### Here you can find shellcode written in x64 assembly for windows

## compile and link 
```bash
  nasm -f win64 {filename.asm}
  ld {filename.obj} -o {filename.exe}
```
## Installation
```bash
  npm install my-project
  cd my-project
```
    
### Note

- reverseshell-w64.asm
    - change code for ip and port, by changing the instruction(for help read the comments in the code)

