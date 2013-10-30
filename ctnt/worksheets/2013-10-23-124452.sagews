︠31d4068f-3384-43d0-aa07-aa01bd3475f2︠
def quality(E):
    d = E.discriminant() #won't be zero because we are looking at non-singular curves
    if d > 0: #this case should give quality ---> 1.2
        A = 1728*E.discriminant()
        B = E.c6()**2
    elif d < 0 and E.c4() > 0: #this case should give quality ---> 1.2
        A = E.c4()**3
        B = -1728*d
    elif d < 0 and E.c4() <= 0: #won't happen often
        A = 0
        B = 0
    if A > 0 and B > 0:
        d = gcd(A,B)
        A = A/d
        B = B/d
        C = A + B
        v = prod(set(prime_divisors(A) + prime_divisors(B) + prime_divisors(C)))
        q = log(C)/log(v)
        return [n(q,digits = 5),A,B,C]
    else: #no natural triple to look at
        return [-1,0,0,0]
︡e8d45a36-9de3-4585-aa78-b8ec84a736c3︡
︠2146a79c-5b7a-4b65-86a5-3b06bd7c5272︠
#Fix to iterate over elliptic curves with bounded discriminant!
M = 1000
qbound = 1.1
curves = []
qualities = []
count = 0
for E in CremonaDatabase():
    count += 1
    if E.conductor() > M: break #Fix! iterate over bounded discriminant
    [q,A,B,C] = quality(E)
    if q > qbound:
        curves.append(E)
        qualities.append(q)
print('went through '+str(count)+' curves until hit bound of '+str(M))
print(str(len(curves)) + ' had quality > '+str(qbound))
max(qualities)
i = qualities.index(max(qualities))
curves[i]
︡4ea19d1d-8a79-4c0f-8aab-9e3e7a9165b5︡{"stdout":"went through 5114 curves until hit bound of 1000\n"}︡{"stdout":"400 had quality > 1.10000000000000\n"}︡{"stdout":"1.4889\n"}︡{"stdout":"Elliptic Curve defined by y^2 = x^3 + x^2 - 13*x - 4 over Rational Field\n"}︡
︠6d54cd75-4c68-471d-a57e-8c6d56a2226d︠









