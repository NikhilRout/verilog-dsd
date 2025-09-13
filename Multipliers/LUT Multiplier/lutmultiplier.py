def dec_to_bin(decimal):
    binary = bin(decimal)[2:]
    binary = binary.zfill(4)
    return str(binary)

for i in range(16):
    for j in range(16):
        print(f"      8'b{dec_to_bin(i)+dec_to_bin(j)}: y <= 8'b{dec_to_bin(i*j).zfill(8)};")