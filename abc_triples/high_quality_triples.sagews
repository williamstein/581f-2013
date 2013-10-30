︠8fd594f8-e546-4664-8866-bce4ad3e2260︠
read_file = open("data_sorted",'r')
︡e21abf04-47b7-4ea2-a852-c5d78e780de7︡
︠80cc8da3-b10e-453e-b33a-c65050782066︠
%time
lines = read_file.readlines()
︡bd741bce-bd7d-4d7b-bd32-d61777adbafb︡{"stdout":"CPU time: 4.32 s, Wall time: 3.95 s"}︡{"stdout":"\n"}︡
︠7d532feb-4fc6-43ee-a8ac-bdf121f8d33f︠
%time
lines = lines[::-1]
︡a3785f85-ea53-46b3-8403-8f995abee798︡{"stdout":"CPU time: 0.83 s, Wall time: 0.83 s"}︡{"stdout":"\n"}︡
︠9edca907-bb48-4e31-aa9e-882ac3c879db︠
write_file = open("hiqh_quality_triples_1.2.txt",'w')
︡0285647e-c077-4dcd-a214-e27a10ff86c1︡
︠9eafccb3-f9cd-44f6-a252-abf63b5fb71f︠
%time
k = 0

s = lines[k]
s = s.split()
q = RR(s[-1])

while q>=1.2:
    s = [s[-1]]+s[:-1]
    s = '\t'.join(s)+'\n'
    write_file.write(s)
    write_file.flush()

    k += 1
    s = lines[k]
    s = s.split()
    q = RR(s[-1])
︡56b79c56-e146-40b3-a974-24018e3a6920︡{"stdout":"CPU time: 1.62 s, Wall time: 1.61 s"}︡{"stdout":"\n"}︡
︠e76873d2-bc0f-4dec-8f3f-882e2c978089︠
read_file.close()
write_file.close()
︡34c0460b-93f8-41ff-8f35-e4f5fb7535e6︡
︠78d4ccc3-b330-464e-a7db-fb0c26767f36︠
len(lines)
︡48139193-402a-4058-a7c7-ba2a6ce2e48a︡
︠7cf71d26-4808-4dbd-b783-d9c7679f6662︠









