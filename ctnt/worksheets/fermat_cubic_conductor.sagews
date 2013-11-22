︠9e8f01d0-2dc9-4da9-9fb6-14b6bb35cb3b︠
#Andrew's magical number field function
_R = PolynomialRing(QQ, 'x')
_S = PolynomialRing(ZZ, 'x')

def new_poly(P):
    P *= P.denominator()
    d = P.degree()-1
    l = P[d+1]
    return _S([c*l^(d-i) for i,c in enumerate(P)])

def number_field(P, names=[], *args, **kwds):
    polys = [new_poly(p) for p,_ in _R(P).factor()]
    absolute = len(names) == 1
    if absolute:
        name = names[0]
        names = [name+str(i) for i in range(len(polys))]
    K = NumberField(polys, names=names, *args, **kwds)
    if absolute:
        K = K.absolute_field(name)
    return K

#Test cases
K.<a> = number_field((x^3-2)*(x^2+1/2)); K
K.galois_closure('b')
︡fb49913c-6530-4750-913c-9cdd710abcb8︡{"stdout":"Number Field in a with defining polynomial x^6 + 6*x^4 + 4*x^3 + 12*x^2 - 24*x + 12\n"}︡{"stdout":"Number Field in b with defining polynomial x^12 + 12*x^10 - 80*x^9 + 60*x^8 + 4504*x^6 + 1920*x^5 - 72480*x^4 - 104640*x^3 + 184032*x^2 + 662400*x + 1873296"}︡{"stdout":"\n"}︡
︠2c2991a3-8a43-41ed-8198-5b4d6aaf7608︠
#finds the Serre level for the Galois representation
#over F_l that isattached to the elliptic curve E
#K needs to be the minimal number field (Galois?)
#such that in which all l-torsion points
#of E/bar{Q} (there should be l^2 of them)
#exist in E/K
def Serre_level(E,l):
    print('Finding Serre-level of:')
    print E
    print('over l = '+str(l))
    print('The field is where all '+str(l)+' torsion points appear is: ')
    #Wiki on the division_polynomial(2n+1) (i.e. \psi)
    #The roots of \psi_{2n+1} are the x-coordinates of the points of E[2n+1]\setminus \{O\}, where E[2n+1] is the (2n+1)^{\text{th}} torsion subgroup of E. Similarly, the roots of \psi_{2n}/y are the x-coordinates of the points of E[2n]\setminus E[2].
    K.<b> = number_field(E.division_polynomial(l))
    K.<a> = K.galois_closure() #THIS MAY NOT BE ENOUGH!!!! may need quadratic extension to get the y-coordinates????
    print K
    print 'K has degree = '+str(K.degree())
    #output variable
    N = 1
    #find galois group
    G = K.galois_group()
    #build our representation space
    V = E.change_ring(K)(0).division_points(l)
    #TO-DO: FIX! Find out if a quadratic extension is necessary and figure out which one to use (not hard)
    if len(V) != l^2:
        raise(Exception('Not big enough field K!'))
    dimV = int(len(V)/l)
    print 'dim V = '+str(dimV)
    print ''
    #find primes that ramify in K, these are only ones thay may have non-trivial n(p)
    primes = [p[0] for p in list(factor(K.discriminant())) if p[0]!=l] #all primes that ramify except l
    for p in primes:
        P = list(K.factor(p))[0][0]; #find a factor of p, since it is ramified and K is galois all have exponent > 1 so we may choose any such factor
        print('starting with p = '+str(p))
        n = 0 #exponent n(p)
        i = 0 #index on ramification groups
        G_0 = G.ramification_group(P,0)
        while len(G.ramification_group(P,i)) > 1:
            G_i = G.ramification_group(P,i)
            V_i = [v for v in V if all(E.change_ring(K).point([h(v[0]),h(v[1]),h(v[2])]) == v for h in G_i)]
            dimV_i = int(len(V_i)/l)
            print 'dim V_'+str(i)+' = '+str(dimV_i)
            print 'dim V/V^{H_'+str(i)+'} = ' + str(dimV-dimV_i)
            print '# G_'+str(i)+'= '+str(len(G_i))
            print '[G_0 : G_'+str(i)+'] = ' + str(len(G_0)/len(G_i))
            n += (dimV-dimV_i) / (len(G_0)/len(G_i))
            i = i+1
        print('Exponent is '+str(n))
        N = N*(p^n)
    print '\nfinal answer: '+str(N)
    return N
︡438a7f7b-f15f-4eea-8d93-09a743189990︡
︠ca865d7b-8dd8-40bf-a19d-e5ce0d146b2d︠
#Define the fermat cubic
E = EllipticCurve('27a1').short_weierstrass_model(); E
︡a22b3c2a-d7c6-4f0d-8e23-85c3ffc5ce0f︡{"stdout":"Elliptic Curve defined by y^2 = x^3 - 432 over Rational Field\n"}︡
︠4654175c-6bcd-47d7-839b-23fb2f3aad1d︠
Serre_level(E,2)
︡7773fa8d-6615-48c2-a970-99c8cbd3c98d︡{"stdout":"Finding Serre-level of:\nElliptic Curve defined by y^2 = x^3 - 432 over Rational Field\nover l = 2\nThe field is where all 2 torsion points appear is: \nNumber Field in a with defining polynomial x^6 + 8640*x^3 + 64012032\nK has degree = 6\n[(0 : 1 : 0), (1/18144*a^4 + 13/42*a : 0 : 1), (-1/54432*a^4 - 55/126*a : 0 : 1), (-1/27216*a^4 + 8/63*a : 0 : 1)]\ndim V = 2\n\nstarting with p = 3\ndim V_0 = 0"}︡{"stdout":"\ndim V/V^{H_0} = 2\n# G_0= 6\n[G_0 : G_0] = 1\ndim V_1 = 0"}︡{"stdout":"\ndim V/V^{H_1} = 2\n# G_1= 3\n[G_0 : G_1] = 2\nExponent is 3\n\nfinal answer: 27\n27\n"}︡
︠0e96dab5-8957-450d-b77e-0c6697202976︠
Serre_level(E,3)
︡b36fa259-730d-4f8a-a4a0-22cfa2d4f4b8︡{"stdout":"Finding Serre-level of:\nElliptic Curve defined by y^2 = x^3 - 432 over Rational Field\nover l = 3\nThe field is where all 3torsion points appear is: \nNumber Field in a with defining polynomial x^2 - 12*x + 144\nK has degree = 2\ndim V = 3\n\n\nfinal answer: 1\n1\n"}︡
︠e0c93f1c-e200-4e5a-93bb-69217b53186d︠
Serre_level(E,5)
︡f051ad08-35d9-4a3d-bb67-c6a7c276235b︡{"stdout":"Finding Serre-level of:\nElliptic Curve defined by y^2 = x^3 - 432 over Rational Field\nover l = 5\nThe field is where all 5torsion points appear is: \n"}︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/mnt/home/uHNlUmEE/.sagemathcloud/sage_server.py\", line 668, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\n  File \"\", line 9, in Serre_level\n  File \"/mnt/home/uHNlUmEE/sage-5.12.rc0/local/lib/python2.7/site-packages/sage/rings/number_field/number_field.py\", line 6643, in galois_closure\n    L, self_into_L = self._galois_closure_and_embedding(names)\n  File \"/mnt/home/uHNlUmEE/sage-5.12.rc0/local/lib/python2.7/site-packages/sage/rings/number_field/number_field.py\", line 6570, in _galois_closure_and_embedding\n    G = self.galois_group(type='pari')\n  File \"cachefunc.pyx\", line 1500, in sage.misc.cachefunc.CachedMethodCaller.__call__ (sage/misc/cachefunc.c:8006)\n  File \"cachefunc.pyx\", line 2084, in sage.misc.cachefunc.CachedMethod._instance_call (sage/misc/cachefunc.c:10528)\n  File \"/mnt/home/uHNlUmEE/sage-5.12.rc0/local/lib/python2.7/site-packages/sage/rings/number_field/number_field.py\", line 4405, in galois_group\n    return GaloisGroup_v1(self.absolute_polynomial().galois_group(pari_group=True, algorithm=algorithm), self)\n  File \"polynomial_rational_flint.pyx\", line 1491, in sage.rings.polynomial.polynomial_rational_flint.Polynomial_rational_flint.galois_group (sage/rings/polynomial/polynomial_rational_flint.cpp:12755)\nNotImplementedError: You must install the optional Kash package to use Kash from Sage.\nSorry, computation of Galois groups of fields of degree bigger than 11 is not yet implemented.  Try installing the optional free (closed source) KASH package, which supports degrees up to 23, or use algorithm='magma' if you have magma.\n"}︡
︠24478c4c-5573-4386-94a9-f115318a2472︠
E = EllipticCurve('27a1').short_weierstrass_model(); E
K.<a> = QQ[432^(1/3)].galois_closure()
V = E.change_ring(K)(0).division_points(2); V
︡ade949a6-425c-42a0-b2e9-5c4fbd426a08︡{"stdout":"Elliptic Curve defined by y^2 = x^3 - 432 over Rational Field\n"}︡{"stdout":"[(0 : 1 : 0), (1/18144*a^4 + 13/42*a : 0 : 1), (-1/54432*a^4 - 55/126*a : 0 : 1), (-1/27216*a^4 + 8/63*a : 0 : 1)]\n"}︡
︠aa771329-547e-41d7-b9c3-0432e1125f3f︠
p = 3
G = K.galois_group()
P = K.factor(p)[0][0]
G_0 = G.ramification_group(P,0); G_0.cardinality()
G_1 = G.ramification_group(P,1); G_1.cardinality()
G_2 = G.ramification_group(P,2); G_2.cardinality()
︡bc4c6699-5a6b-4b59-97c7-35f19e05143e︡{"stdout":"6\n"}︡{"stdout":"3\n"}︡{"stdout":"1\n"}︡
︠aa7f8b82-f75b-422b-9bbd-5e89daa7aa4f︠
V_0 = [v for v in V if all(E.change_ring(K).point([h(v[0]),h(v[1]),h(v[2])]) == v for h in G_0)]; V_0
V_1 = [v for v in V if all(E.change_ring(K).point([h(v[0]),h(v[1]),h(v[2])]) == v for h in G_1)]; V_1
︡a2b02013-9392-46fc-a829-6e549c61b185︡{"stdout":"[(0 : 1 : 0)]"}︡{"stdout":"\n"}︡{"stdout":"[(0 : 1 : 0)]"}︡{"stdout":"\n"}︡
︠4b1d5b06-c9cf-4072-aeb3-f71db83a634e︠
###############
###################
###########################
E = EllipticCurve([2,3]).short_weierstrass_model(); E; E.conductor()
︡862a8303-58ef-431e-b607-600b6f76411e︡{"stdout":"Elliptic Curve defined by y^2 = x^3 + 2*x + 3 over Rational Field\n880\n"}︡
︠5f0181f6-a30c-43fe-be0c-a149d0eec1cb︠
Serre_level(E,2)
︡10ee5533-549e-4f1d-9151-e246b51e60c1︡{"stdout":"Finding Serre-level of:\nElliptic Curve defined by y^2 = x^3 + 2*x + 3 over Rational Field\nover l = 2\nThe field is where all 2torsion points appear is: \nNumber Field in a with defining polynomial x^2 + 3*x + 5\nK has degree = 2\ndim V = 2\n\nstarting with p = 11\ndim V_0 = 1"}︡{"stdout":"\ndim V/V^{H_0} = 1\n# G_0= 2\n[G_0 : G_0] = 1\nExponent is 1\n\nfinal answer: 11\n11\n"}︡
︠8f206520-a3ac-4339-9c76-1657a8f9ad68︠
Serre_level(E,3)
︡59de3a9e-6663-4a4a-a45d-5ca74a1b9fd2︡{"stdout":"Finding Serre-level of:\nElliptic Curve defined by y^2 = x^3 + 2*x + 3 over Rational Field\nover l = 3\nThe field is where all 3torsion points appear is: \nNumber Field in a with defining polynomial x^24 + 5400*x^22 + 68040*x^21 + 12242664*x^20 + 306180000*x^19 + 20775042000*x^18 + 556378048800*x^17 + 30821130134640*x^16 + 718687740960000*x^15 + 31236277287168000*x^14 + 785020885394054400*x^13 + 26054464615672481280*x^12 + 544338433980311040000*x^11 + 18191537437565580480000*x^10 + 282488145296337367833600*x^9 + 7153009674269695522871040*x^8 + 116045527842142856133120000*x^7 + 1733916571313995180751616000*x^6 + 19517162692486831293380659200*x^5 + 374610481971154674037734610944*x^4 - 645707950499312818259788800000*x^3 + 146827601080096910389250108313600*x^2 + 1284469876244841330446627102760960*x + 63639460280720915410168829455405056"}︡{"stdout":"\nK has degree = 24\n"}︡{"stderr":"Error in lines 1-1\n"}︡{"stderr":"Traceback (most recent call last):\n  File \"/mnt/home/uHNlUmEE/.sagemathcloud/sage_server.py\", line 668, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\n  File \"\", line 15, in Serre_level\n  File \"cachefunc.pyx\", line 1500, in sage.misc.cachefunc.CachedMethodCaller.__call__ (sage/misc/cachefunc.c:8006)\n  File \"cachefunc.pyx\", line 2084, in sage.misc.cachefunc.CachedMethod._instance_call (sage/misc/cachefunc.c:10528)\n  File \"/mnt/home/uHNlUmEE/sage-5.12.rc0/local/lib/python2.7/site-packages/sage/rings/number_field/number_field.py\", line 4402, in galois_group\n    return GaloisGroup_v2(self, names)\n  File \"/mnt/home/uHNlUmEE/sage-5.12.rc0/local/lib/python2.7/site-packages/sage/rings/number_field/galois_group.py\", line 183, in __init__\n    if not number_field.is_galois():\n  File \"/mnt/home/uHNlUmEE/sage-5.12.rc0/local/lib/python2.7/site-packages/sage/rings/number_field/number_field.py\", line 4302, in is_galois\n    return self.galois_group(type=\"pari\").order() == self.degree()\n  File \"cachefunc.pyx\", line 1500, in sage.misc.cachefunc.CachedMethodCaller.__call__ (sage/misc/cachefunc.c:8006)\n  File \"cachefunc.pyx\", line 2084, in sage.misc.cachefunc.CachedMethod._instance_call (sage/misc/cachefunc.c:10528)\n  File \"/mnt/home/uHNlUmEE/sage-5.12.rc0/local/lib/python2.7/site-packages/sage/rings/number_field/number_field.py\", line 4405, in galois_group\n    return GaloisGroup_v1(self.absolute_polynomial().galois_group(pari_group=True, algorithm=algorithm), self)\n  File \"polynomial_rational_flint.pyx\", line 1468, in sage.rings.polynomial.polynomial_rational_flint.Polynomial_rational_flint.galois_group (sage/rings/polynomial/polynomial_rational_flint.cpp:12371)\nNotImplementedError: Galois group computation is supported for degrees up to 11 using Pari, or up to 23 if the optional package KASH is installed.  Try algorithm='magma' if you have magma.\n"}︡
︠9ff73cbe-f8a2-449c-b209-77fe3c28574e︠

︡270f4f96-38b3-4d83-ab7a-d4e943fd783b︡
︠f6c7ad11-eefe-46fc-a2f2-841762013dc3︠

E = EllipticCurve('147a')
f = E.division_polynomial(5)
#add all the x-coordinates
K.<a> = number_field(f)
K.<b> = K.galois_closure()
#see if K contains the y coordinates
R.<x> = PolynomialRing(QQ)
g = prod([x^2 - (r[0]^3 + E.c4()*r[0] + E.c6()) for r in f.change_ring(K).roots()])
max([g[0].degree() for g in f.change_ring(K).factor()]) #1 iff g factors into linear terms iff all y-coordinates are in K
︡e6ca850b-cc9d-452d-a477-17e53d96a4da︡{"stderr":"Error in lines 5-5\nTraceback (most recent call last):\n  File \"/mnt/home/uHNlUmEE/.sagemathcloud/sage_server.py\", line 668, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\n  File \"/mnt/home/uHNlUmEE/sage-5.12.rc0/local/lib/python2.7/site-packages/sage/rings/number_field/number_field.py\", line 6643, in galois_closure\n    L, self_into_L = self._galois_closure_and_embedding(names)\n  File \"/mnt/home/uHNlUmEE/sage-5.12.rc0/local/lib/python2.7/site-packages/sage/rings/number_field/number_field.py\", line 6570, in _galois_closure_and_embedding\n    G = self.galois_group(type='pari')\n  File \"cachefunc.pyx\", line 1500, in sage.misc.cachefunc.CachedMethodCaller.__call__ (sage/misc/cachefunc.c:8006)\n  File \"cachefunc.pyx\", line 2084, in sage.misc.cachefunc.CachedMethod._instance_call (sage/misc/cachefunc.c:10528)\n  File \"/mnt/home/uHNlUmEE/sage-5.12.rc0/local/lib/python2.7/site-packages/sage/rings/number_field/number_field.py\", line 4405, in galois_group\n    return GaloisGroup_v1(self.absolute_polynomial().galois_group(pari_group=True, algorithm=algorithm), self)\n  File \"polynomial_rational_flint.pyx\", line 1491, in sage.rings.polynomial.polynomial_rational_flint.Polynomial_rational_flint.galois_group (sage/rings/polynomial/polynomial_rational_flint.cpp:12755)\nNotImplementedError: You must install the optional Kash package to use Kash from Sage.\nSorry, computation of Galois groups of fields of degree bigger than 11 is not yet implemented.  Try installing the optional free (closed source) KASH package, which supports degrees up to 23, or use algorithm='magma' if you have magma.\n"}︡
︠3352c8e5-3ea8-4c2b-95e3-a32f2c040cdd︠
#returns the maximal degree of f factored in the field K
#which defaults to Q
def maximal_degree(f,K = QQ):
    return max([g[0].degree() for g in f.change_ring(K).factor()])

R.<x> = PolynomialRing(QQ)
maximal_degree(x^2+1)
maximal_degree(x^2-1)
maximal_degree(x^2+2,QQ[sqrt(-1)])
maximal_degree(x^2-2,QQ[sqrt(-1)])
︡eb899f84-0588-4e42-b6b6-c3e578ecae9f︡{"stdout":"2\n"}︡{"stdout":"1\n"}︡{"stdout":"2\n"}︡{"stdout":"2\n"}︡
︠bf857010-2c38-4eda-adad-718da7040c2e︠
for E in CremonaDatabase():
    if E.conductor() > 50: break
    for p in primes(5):
        f = E.division_polynomial(p)
        #add all the x-coordinates
        K.<a> = number_field(f)
        K.<b> = K.galois_closure()
        #see if K contains the y coordinates
        R.<x> = PolynomialRing(QQ)
        #make a polynomial with roots = y coordinates
        g = prod([x^2 - (r[0]^3 + E.c4()*r[0] + E.c6()) for r in f.change_ring(K).roots()])
        #this = 1 iff g factors into linear terms iff all y-coordinates are in K
        if max([g[0].degree() for g in f.change_ring(K).factor()]) != 1:
            print E
            print p
︡e70cacda-b554-40c7-902f-8253f68cc87f︡
︠e4859feb-9735-484e-ba67-a1983045ea52︠
E
f = E.division_polynomial(6)
#add all the x-coordinates
K.<a> = number_field(f)
K.<b> = K.galois_closure()
#see if K contains the y coordinates
R.<x> = PolynomialRing(QQ)
#make a polynomial with roots = y coordinates
g = prod([x^2 - (r[0]^3 + E.c4()*r[0] + E.c6()) for r in f.change_ring(K).roots()])
#this = 1 iff g factors into linear terms iff all y-coordinates are in K
max([g[0].degree() for g in f.change_ring(K).factor()]) == 1
︡a7681de6-910f-425f-ad96-854007fda9d0︡{"stdout":"Elliptic Curve defined by y^2 + y = x^3 + x^2 + x - 1 over Rational Field\n"}︡{"stderr":"Error in lines 4-4\nTraceback (most recent call last):\n  File \"/mnt/home/uHNlUmEE/.sagemathcloud/sage_server.py\", line 668, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\n  File \"\", line 7, in number_field\n  File \"/mnt/home/uHNlUmEE/sage-5.12.rc0/local/lib/python2.7/site-packages/sage/rings/number_field/number_field.py\", line 429, in NumberField\n    return NumberFieldTower(polynomial, name, embeddings=embedding)\n  File \"/mnt/home/uHNlUmEE/sage-5.12.rc0/local/lib/python2.7/site-packages/sage/rings/number_field/number_field.py\", line 592, in NumberFieldTower\n    w = NumberFieldTower(v[1:], names=names[1:], embeddings=embeddings[1:])\n  File \"/mnt/home/uHNlUmEE/sage-5.12.rc0/local/lib/python2.7/site-packages/sage/rings/number_field/number_field.py\", line 592, in NumberFieldTower\n    w = NumberFieldTower(v[1:], names=names[1:], embeddings=embeddings[1:])\n  File \"/mnt/home/uHNlUmEE/sage-5.12.rc0/local/lib/python2.7/site-packages/sage/rings/number_field/number_field.py\", line 592, in NumberFieldTower\n    w = NumberFieldTower(v[1:], names=names[1:], embeddings=embeddings[1:])\n  File \"/mnt/home/uHNlUmEE/sage-5.12.rc0/local/lib/python2.7/site-packages/sage/rings/number_field/number_field.py\", line 616, in NumberFieldTower\n    return w.extension(f, name, check=check, embedding=embeddings[0])\n  File \"/mnt/home/uHNlUmEE/sage-5.12.rc0/local/lib/python2.7/site-packages/sage/rings/number_field/number_field.py\", line 4165, in extension\n    return NumberField_relative(self, poly, str(name), check=check, embedding=embedding)\n  File \"/mnt/home/uHNlUmEE/sage-5.12.rc0/local/lib/python2.7/site-packages/sage/rings/number_field/number_field_rel.py\", line 284, in __init__\n    raise ValueError, \"defining polynomial (%s) must be irreducible\"%polynomial\nValueError: defining polynomial (x^3 + 7*x^2 + 39*x + 36) must be irreducible\n"}︡
︠04d587c8-9cdf-4114-9852-35159ec30c04︠









