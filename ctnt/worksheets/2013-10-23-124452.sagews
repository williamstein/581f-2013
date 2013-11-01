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
︡a957ef22-df6d-41a6-9021-eec9ad8fd30a︡
︠2146a79c-5b7a-4b65-86a5-3b06bd7c5272︠
#Fix to iterate over elliptic curves with bounded discriminant!
num_curves = 10**5 #number of isogeny classes to go through in each SW-db
M = 100 #discriminant bound
qbound = 0.9
qualities = []
C4 = []
for j in range(1):
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
list_plot(qualities)
︡03404818-b1c2-4bb3-b4df-9db8b53bb43b︡{"stdout":"415 had quality > 0.900000000000000\n"}︡{"once":false,"file":{"show":true,"uuid":"c98a92b2-9146-430c-9f35-eab6c83eb8a8","filename":"/mnt/home/uHNlUmEE/.sage/temp/compute1a/16578/tmp_aefQlI.png"}}︡
︠e958d638-1646-4620-ae3a-275c2ae17ccb︠
P = []
for i in range(len(qualities)):
    P.append([C4[i],qualities[i]])
point(P)
︡cc9236e4-0b64-474b-b74c-b9ad1e47c93b︡{"once":false,"file":{"show":true,"uuid":"c7bdb16c-109f-4619-8257-82e54af0ec78","filename":"/mnt/home/uHNlUmEE/.sage/temp/compute1a/16578/tmp_aP1JEs.png"}}︡
︠51373062-b707-499c-8a52-e65d438f5738︠
var('x')
plot(3*log(x)/(log(6*(M))+(5/2)*log(x)),(x,1,10**9))
︡259c983c-ae9f-4ca3-a50a-fafcac2bbaf0︡{"stdout":"x\n"}︡{"once":false,"file":{"show":true,"uuid":"2602edbc-9403-4513-a4a5-84f941d8acb3","filename":"/mnt/home/uHNlUmEE/.sage/temp/compute1a/16578/tmp_JlK75s.png"}}︡
︠d9b0d1da-377a-4e00-a668-8b1d32c42469︠









