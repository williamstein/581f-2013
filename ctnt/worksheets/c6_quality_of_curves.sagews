︠31d4068f-3384-43d0-aa07-aa01bd3475f2︠
def quality(E):
    d = E.discriminant() #won't be zero because we are looking at non-singular curves
    #NOTE: there is one other case to consider, but it has a bound on the quality in c4, this one
    #is in c6 and seems to happen more often.
    if d < 0 and E.c4() > 0:#this case should give quality ---> 1.2
        A = E.c4()**3
        B = -1728*d
        C = A + B
        if A > 0 and B > 0 and gcd([A,B,C]) == 1: #only consider coprime triples
            r = prod(set(prime_divisors(A) + prime_divisors(B) + prime_divisors(C)))
            q = log(C)/log(r)
            return q
    return -1
︡9e431cb8-05d6-476c-bc84-998f06b53e75︡
︠da927c12-0129-4757-9002-694aecb5f81f︠
#Example curve caught by above
E = EllipticCurve('14a4'); E
quality(EllipticCurve('14a4')).n()
A = E.c4()**3; A
B = -1728*E.discriminant(); B
C = A + B; C
︡f3411bb9-531b-4715-8238-d30d47253181︡{"stdout":"Elliptic Curve defined by y^2 + x*y + y = x^3 - x over Rational Field\n"}︡{"stdout":"1.01712072138590\n"}︡{"stdout":"15625\n"}︡{"stdout":"48384\n"}︡{"stdout":"64009\n"}︡
︠f041367f-4b11-4852-9983-102992c9528b︠
M = 10^10 #discriminant bound
︡e36b3cbe-1123-44f5-9fcd-b85a14e94c90︡
︠2146a79c-5b7a-4b65-86a5-3b06bd7c5272︠
#Generate all the points - using negative disc. and positive c4
P = []
for j in range(0,10):
    db = SteinWatkinsAllData(j)
    for c in db:
        for l in list(c):
            E = EllipticCurve(l[0])
            if abs(E.discriminant()) < M:
                q = quality(E)
                if q > 0:
                    P.append([abs(E.c6()),q.n(digits = 5)])
print(str(len(P)) + ' had quality > '+str(qbound))
save(P, 'points_c6_quality.sobj')
︡afcb4cc3-1549-4fc0-8cd0-58d125a80cda︡{"stdout":"104399 had quality > 0\n"}︡
︠2f03386d-5fbe-4b33-b6ee-31526c027f0d︠
#
#
#
#START HERE
#
#
#
P = load('points_c6_quality.sobj')
︡d0b36994-eabb-4922-ba8c-0df3fe0c7f29︡
︠141f3af6-ec69-4c42-bfaa-4b632a00b751︠
plot1 = point(P, color='blue', size=1, legend_label='Curves')
var('x')
plot2 = plot(2*log(x)/(log(6*M)+(5/3)*log(x)),(x,1,max(P)[0]), legend_label='Bound', color='red')
g = plot1 + plot2
︡424018fc-a3fd-4c1f-9143-679ec68b5f8f︡{"stdout":"x\n"}︡
︠28975930-427d-4d22-97c7-abd95e48d473︠
g.show(scale = 'semilogx',axes_labels=['$c_6$','Quality'])
︡4a5aa766-a5aa-4a17-aa40-79245280fb52︡{"once":false,"file":{"show":true,"uuid":"1ba0e20c-77f6-476d-94e6-212d65b65e64","filename":"/mnt/home/uHNlUmEE/.sage/temp/compute1a/5705/tmp_7E5SRg.png"}}︡
︠9fabd06a-9079-41a5-a377-1472f1bbc92d︠
g.save('c6_quality_plot.pdf', scale = 'semilogx',axes_labels=['$c_6$','Quality'])
︡63cf38b3-a064-41ac-8ebe-e76c983e0fbe︡
︠181ff9d7-1ad2-4c53-af1f-e36e8e233292︠









