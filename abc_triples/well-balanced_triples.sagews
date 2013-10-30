︠c36d7db7-8240-41c7-896a-01ec3af5672d︠
def quality(a,b,c):
    if a+b != c:
        raise ValueError("a+b != c")
    if a<0 or b<0 or c<0:
        raise ValueError("Inputs must all be non-negative")
    if gcd([a,b,c])>1:
        raise ValueError("gcd(a,b,c) must be 1")
    if a==0 or b==0 or c==0:
        return 0
    r = radical(a*b*c)
    return log(RR(c))/log(RR(r))

def size(a,b,c):
    if a+b != c:
        raise ValueError("a+b != c")
    if a<0 or b<0 or c<0:
        raise ValueError("Inputs must all be non-negative")
    return log(RR(c))/log(RR(10))

def merit(a,b,c):
    if a+b != c:
        raise ValueError("a+b != c")
    if a<0 or b<0 or c<0:
        raise ValueError("Inputs must all be non-negative")
    if a==0 or b==0 or c==0:
        return 0
    r = radical(a*b*c)
    return (quality(a,b,c)-1)^2*log(RR(r))*log(log(RR(r)))

def write(*args):
    s = "\t".join([str(c) for c in args])+"\n"
    write_file.write(s)
︡63e85c54-a4c9-4d54-ae26-5b36ed68eff9︡
︠9d2601f1-e208-4f00-b2cf-b7dd37e4bfa4︠
read_filename = "triples_below_1018_revised"
write_filename = "well_balanced_triples.txt"
︡2e4239db-7cbb-4d7d-8f91-36256fe3ae9e︡
︠961b33b5-64c5-4646-8e90-6da860fd3560︠
#%time
#
#lines = read_file.readlines()
#read_file.close()
#print(len(lines))
︡c40c3441-2882-43d8-bcc5-0491ffb2a517︡{"stdout":"14482065\n"}︡{"stdout":"CPU time: 4.89 s, Wall time: 3.66 s\n"}︡
︠4a5f39d1-756b-4626-8523-989f2bb71cce︠
%time
alpha_bound = RR(2)/3

read_file = open(read_filename,'r')
write_file = open(write_filename,'w')
#for j in range(1000):
#    s = read_file.readline().split()
for line in read_file:
    s = line.split()
    c,a = ZZ(s[0]),ZZ(s[1])
    b = c-a
    q,alpha = quality(a,b,c),log(RR(b-a))/log(RR(c))

    if alpha<=alpha_bound:
        print(q,a,b,c,alpha)

        A,B,C = (b-a)^2,4*a*b,c^2
        g = gcd([A,B,C])
        if g > 1:
            A,B,C = ZZ(A/g),ZZ(B/g),ZZ(C/g)

        write(alpha,g)
        write(a,factor(a))
        write(b,factor(b))
        write(c,factor(c))
        #write(a,b,c)
        #write((factor(a),factor(b),factor(c)))
        write(quality(a,b,c),size(a,b,c),merit(a,b,c))
        write()

        write(A,factor(A))
        write(B,factor(B))
        write(C,factor(C))
        #write(A,B,C)
        #write((factor(A),factor(B),factor(C)))
        write(quality(A,B,C),size(A,B,C),merit(A,B,C))
        write()
        write("-----")
        write()

        write_file.flush()
read_file.close()
write_file.close()
︡ce107ddd-7aa9-4f89-b1b5-c97d2635a07c︡{"stdout":"(1.17571899163488, 32, 49, 81, 0.644725480790641)\n(1.02990831185453, 640, 729, 1369, 0.621536750256000)\n(1.07826153443032, 2048, 2187, 4235, 0.590874390342853)\n(1.14671986714255, 8192, 8575, 16767, 0.611486819289642)\n(1.11827590328644, 38759, 39366, 78125, 0.568834688145192)\n(1.05877974862194, 58600, 59049, 117649, 0.523064823137479)\n(1.00390352634148, 65219, 65853, 131072, 0.547549354714083)\n(1.07322291779539, 130321, 131072, 261393, 0.530825899769139)"}︡{"stdout":"\n(1.14072494745227, 158949, 161051, 320000, 0.603549898690725)\n(1.03011965726816, 388127, 390625, 778752, 0.576703824184769)\n(1.00132522549718, 4113504, 4140625, 8254129, 0.640959435138185)"}︡{"stdout":"\n(1.04022017492506, 9765625, 9779616, 19545241, 0.568622332481592)"}︡{"stdout":"\n(1.02781950383174, 12059037, 12075008, 24134045, 0.569354287347070)\n(1.11915235894827, 17210368, 17305257, 34515625, 0.660281968122372)"}︡{"stdout":"\n(1.02057949252663, 21520321, 21526400, 43046721, 0.495659136167554)"}︡{"stdout":"\n(1.06377585918188, 85525504, 85766121, 171291625, 0.653570411188994)"}︡{"stdout":"\n(1.09261778876463, 142374963, 142578125, 284953088, 0.627792401838788)"}︡{"stdout":"\n(1.00128103322477, 268136537, 268734375, 536870912, 0.661703278464928)"}︡{"stdout":"\n(1.05292755792591, 409600000, 410338673, 819938673, 0.658357209012225)"}︡{"stdout":"\n(1.02198870340689, 581101339, 581160128, 1162261467, 0.526104381856116)"}︡{"stdout":"\n(1.01658250173315, 724568449, 725594112, 1450162561, 0.656121743307342)"}︡{"stdout":"\n(1.01096859750763, 791015625, 791424823, 1582440448, 0.610037372680096)"}︡
︠a991f725-7e64-4ce9-9db2-ba5f0c8a7bba︠
2+2
︡2baa521c-e598-47e4-9e9c-ec419fe59555︡{"stdout":"4\n"}︡
︠a75c0f09-f41c-478f-b7c0-97a46432ab47︠









