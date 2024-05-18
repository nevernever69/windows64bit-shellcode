# It will encrypt the hex representation of the WINAPI and return the encrypted value
def rotate_right(num, D):
    D = D % 32 
    
    # Rotate the number to the right by D bits
    rotated_num = (num >> D) | (num << (32 - D)) & 0xFFFFFFFF
    
    
    return rotated_num 

# Example usage
num = [0x45, 0x78 ,0x69 ,0x74 ,0x50 ,0x72 ,0x6F, 0x63 ,0x65 ,0x73 ,0x73]# Your integer value
D = 13  # Number of bits to rotate
# print(rotate_right(num, D))
ans = 0
for i in num:
    ans =  ans + i
    ans = rotate_right(ans,D)
    print(" ",hex(ans))
