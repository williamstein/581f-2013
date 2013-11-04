︠31d4068f-3384-43d0-aa07-aa01bd3475f2︠
def quality(E):
    d = E.discriminant() #won't be zero because we are looking at non-singular curves
    if d > 0: #this case should give quality ---> 1.2
        A = 1728*E.discriminant()
        B = E.c6()**2
    elif d < 0 and E.c4() > 0: #this case should give quality ---> 1.2
        A = E.c4()**3
        B = -1728*d
    else: #won't happen often
        A = 0
        B = 0
    if A > 0 and B > 0:
        d = gcd(A,B)
        A = A/d
        B = B/d
        C = A + B
        v = prod(set(prime_divisors(A) + prime_divisors(B) + prime_divisors(C)))
        q = log(C)/log(v)
        return n(q,digits = 5)
    else: #no natural triple to look at?
        return -1
︡8212439d-555f-45ea-a524-f8f680fca095︡
︠2146a79c-5b7a-4b65-86a5-3b06bd7c5272︠
#Fix to iterate over elliptic curves with bounded discriminant!
M = 100 #discriminant bound
qbound = 0.8
qualities = []
C4 = []
for j in range(1,5):
    db = SteinWatkinsPrimeData(j)
    for c in db:
        c = db.next()
        for l in list(c):
            E = EllipticCurve(l[0])
            if E.discriminant() < M:
                q = quality(E)
                if q > qbound:
                    qualities.append(q)
                    C4.append(E.c4())
print(str(len(qualities)) + ' had quality > '+str(qbound))
P = []
for i in range(len(qualities)):
    P.append([C4[i],qualities[i]])
point(P)
︡e1998a53-be99-4630-9848-8895e7ea1261︡{"stdout":"8520 had quality > 0.800000000000000\n"}︡{"once":false,"file":{"show":true,"uuid":"a8cd6e1f-5aa2-4c9a-aa9b-bfe38be1f501","filename":"/mnt/home/uHNlUmEE/.sage/temp/compute1a/23178/tmp_RyF7x4.png"}}︡
︠91bc431d-eccd-4847-9709-e91a80254d13︠
#compare with 5031 found in 1,3
︠51373062-b707-499c-8a52-e65d438f5738︠
var('x')
plot(3*log(x)/(log(6*(M))+(5/2)*log(x)),(x,1,2*(10**11)))
︡6cff340c-1f54-4866-8aa4-5bc21d589a32︡{"stdout":"x\n"}︡{"once":false,"file":{"show":true,"uuid":"a4f38b68-c46e-47e3-8c14-d886ba9b7dd2","filename":"/mnt/home/uHNlUmEE/.sage/temp/compute1a/23178/tmp_M23eXK.png"}}︡
︠d9b0d1da-377a-4e00-a668-8b1d32c42469︠









