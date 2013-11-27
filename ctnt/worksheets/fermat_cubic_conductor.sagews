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
︡7b991285-1634-44c8-844a-19c163b9baed︡{"stdout":"Number Field in a with defining polynomial x^6 + 6*x^4 + 4*x^3 + 12*x^2 - 24*x + 12"}︡{"stdout":"\n"}︡{"stdout":"Number Field in b with defining polynomial x^12 + 12*x^10 - 80*x^9 + 60*x^8 + 4504*x^6 + 1920*x^5 - 72480*x^4 - 104640*x^3 + 184032*x^2 + 662400*x + 1873296"}︡{"stdout":"\n"}︡
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
    K.<a> = K.galois_closure() #THIS MAY NOT BE ENOUGH!!!! may need quadratic extension to get the y-coordinates???? see below and also
    #https://groups.google.com/forum/#!topic/sage-support/jBVQVl0Ji2E
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
︡19edbecf-5a84-4ae8-ba55-b9ba9de8be59︡
︠ca865d7b-8dd8-40bf-a19d-e5ce0d146b2d︠
#Define the fermat cubic
E = EllipticCurve('27a1').short_weierstrass_model(); E
︡20bccc91-2bb1-42ab-a406-1e1c04762779︡{"stdout":"Elliptic Curve defined by y^2 = x^3 - 432 over Rational Field"}︡{"stdout":"\n"}︡
︠4654175c-6bcd-47d7-839b-23fb2f3aad1d︠
Serre_level(E,2)
︡83744970-b9ca-40be-bc6a-7b2bb4ca42d9︡{"stdout":"Finding Serre-level of:\nElliptic Curve defined by y^2 = x^3 - 432 over Rational Field\nover l = 2\nThe field is where all 2 torsion points appear is: \nNumber Field in a with defining polynomial x^6 + 8640*x^3 + 64012032"}︡{"stdout":"\nK has degree = 6\ndim V = 2"}︡{"stdout":"\n\nstarting with p = 3\ndim V_0 = 0"}︡{"stdout":"\ndim V/V^{H_0} = 2\n# G_0= 6\n[G_0 : G_0] = 1\ndim V_1 = 0"}︡{"stdout":"\ndim V/V^{H_1} = 2\n# G_1= 3\n[G_0 : G_1] = 2\nExponent is 3\n\nfinal answer: 27\n27\n"}︡
︠0e96dab5-8957-450d-b77e-0c6697202976︠
Serre_level(E,3)
︡7411daf2-a038-4416-9ddd-24fc21bc50f9︡{"stdout":"Finding Serre-level of:\nElliptic Curve defined by y^2 = x^3 - 432 over Rational Field\nover l = 3\nThe field is where all 3 torsion points appear is: \nNumber Field in a with defining polynomial x^2 - 12*x + 144\nK has degree = 2\ndim V = 3"}︡{"stdout":"\n\n\nfinal answer: 1\n1\n"}︡
︠e0c93f1c-e200-4e5a-93bb-69217b53186d︠
Serre_level(E,5)
︡dffed701-8467-4e1c-bdb3-a9f17764f382︡{"stdout":"Finding Serre-level of:\nElliptic Curve defined by y^2 = x^3 - 432 over Rational Field\nover l = 5\nThe field is where all 5 torsion points appear is: \nverbose 0 (1765: permgroup_named.py, cardinality) Warning: TransitiveGroups requires the GAP database package. Please install it with ``sage -i database_gap``."}︡{"stdout":"\n"}︡{"stderr":"Error in lines 1-1\n"}︡{"stderr":"Traceback (most recent call last):\n  File \"/mnt/home/uHNlUmEE/.sagemathcloud/sage_server.py\", line 668, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\n  File \"\", line 9, in Serre_level\n  File \"/mnt/home/uHNlUmEE/sage-5.12.rc0/local/lib/python2.7/site-packages/sage/rings/number_field/number_field.py\", line 6643, in galois_closure\n    L, self_into_L = self._galois_closure_and_embedding(names)\n  File \"/mnt/home/uHNlUmEE/sage-5.12.rc0/local/lib/python2.7/site-packages/sage/rings/number_field/number_field.py\", line 6570, in _galois_closure_and_embedding\n    G = self.galois_group(type='pari')\n  File \"cachefunc.pyx\", line 1500, in sage.misc.cachefunc.CachedMethodCaller.__call__ (sage/misc/cachefunc.c:8006)\n  File \"cachefunc.pyx\", line 2084, in sage.misc.cachefunc.CachedMethod._instance_call (sage/misc/cachefunc.c:10528)\n  File \"/mnt/home/uHNlUmEE/sage-5.12.rc0/local/lib/python2.7/site-packages/sage/rings/number_field/number_field.py\", line 4405, in galois_group\n    return GaloisGroup_v1(self.absolute_polynomial().galois_group(pari_group=True, algorithm=algorithm), self)\n  File \"polynomial_rational_flint.pyx\", line 1489, in sage.rings.polynomial.polynomial_rational_flint.Polynomial_rational_flint.galois_group (sage/rings/polynomial/polynomial_rational_flint.cpp:12681)\n  File \"classcall_metaclass.pyx\", line 330, in sage.misc.classcall_metaclass.ClasscallMetaclass.__call__ (sage/misc/classcall_metaclass.c:1224)\n  File \"cachefunc.pyx\", line 1029, in sage.misc.cachefunc.WeakCachedFunction.__call__ (sage/misc/cachefunc.c:5673)\n  File \"/mnt/home/uHNlUmEE/sage-5.12.rc0/local/lib/python2.7/site-packages/sage/groups/perm_gps/permgroup_named.py\", line 135, in __classcall__\n    return super(PermutationGroup_unique, cls).__classcall__(cls, *args, **kwds)\n  File \"cachefunc.pyx\", line 1029, in sage.misc.cachefunc.WeakCachedFunction.__call__ (sage/misc/cachefunc.c:5673)\n  File \"/mnt/home/uHNlUmEE/sage-5.12.rc0/local/lib/python2.7/site-packages/sage/structure/unique_representation.py\", line 447, in __classcall__\n    instance = typecall(cls, *args, **options)\n  File \"classcall_metaclass.pyx\", line 518, in sage.misc.classcall_metaclass.typecall (sage/misc/classcall_metaclass.c:1586)\n  File \"/mnt/home/uHNlUmEE/sage-5.12.rc0/local/lib/python2.7/site-packages/sage/groups/perm_gps/permgroup_named.py\", line 1550, in __init__\n    raise ValueError(\"Index n must be in {1,..,%s}\" % max_n)\nValueError: Index n must be in {1,..,None}\n"}︡
︠da025e1d-2fed-45ad-913f-96870329b0cb︠
#####################
#########
#Commands for the book
#####
###########
︠24478c4c-5573-4386-94a9-f115318a2472︠
E = EllipticCurve('27a1').short_weierstrass_model(); E
K.<a> = QQ[432^(1/3)].galois_closure()
V = E.change_ring(K)(0).division_points(2); V
︡7a7c49a2-9faf-435d-94cb-c948041e6b6c︡{"stdout":"Elliptic Curve defined by y^2 = x^3 - 432 over Rational Field\n"}︡{"stdout":"[(0 : 1 : 0), (1/18144*a^4 + 13/42*a : 0 : 1), (-1/54432*a^4 - 55/126*a : 0 : 1), (-1/27216*a^4 + 8/63*a : 0 : 1)]\n"}︡
︠aa771329-547e-41d7-b9c3-0432e1125f3f︠
p = 3
G = K.galois_group()
P = K.factor(p)[0][0]
G_0 = G.ramification_group(P,0); G_0.cardinality()
G_1 = G.ramification_group(P,1); G_1.cardinality()
G_2 = G.ramification_group(P,2); G_2.cardinality()
︡3da74da4-3191-4eef-b624-a54b68574ed6︡{"stdout":"6\n"}︡{"stdout":"3\n"}︡{"stdout":"1\n"}︡
︠62adf31a-20d5-4dcb-85cb-3acbf369d79c︠
V_0 = [v for v in V if all(E.change_ring(K).point([h(v[0]),h(v[1]),h(v[2])]) == v for h in G_0)]; V_0
V_1 = [v for v in V if all(E.change_ring(K).point([h(v[0]),h(v[1]),h(v[2])]) == v for h in G_1)]; V_1
︡27cbf9bd-e959-4423-bdef-f75d137b0886︡{"stdout":"[(0 : 1 : 0)]"}︡{"stdout":"\n"}︡{"stdout":"[(0 : 1 : 0)]\n"}︡
︠4c3de824-8de2-4bd2-8447-24d6b6470c10︠
############
######
#random
###########
###################
︠174f92c5-6731-418a-ab1c-416cea5e03f2︠
g = G[1]
O = K.ring_of_integers()
gens = O.ring_generators()
︡9df8f9eb-54e2-4703-8232-795eb7a98c95︡
︠7c022149-9b33-452a-802d-6a0bb6f7f374︠

︠6b869625-2735-4e7b-b32f-b8ff617389f2︠
###############
###################
###########################
#What is the minimal field containing all the l-torsion points???
#########
###########
##################
E = EllipticCurve('147a')
f = E.division_polynomial(5)
#add all the x-coordinates
K.<a> = number_field(f)
K.<b> = K.galois_closure()
#see if K contains the y coordinates
R.<x> = PolynomialRing(QQ)
g = prod([x^2 - (r[0]^3 + E.c4()*r[0] + E.c6()) for r in f.change_ring(K).roots()])
max([g[0].degree() for g in f.change_ring(K).factor()]) #1 iff g factors into linear terms iff all y-coordinates are in K
︠3352c8e5-3ea8-4c2b-95e3-a32f2c040cdd︠
#find an example of a curve which needs a quadratic extension to contain
#all the p-torsion points
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
E = EllipticCurve([0,1,1,1,-1]); E
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
︡d1e49973-6f4f-48ff-ae86-369239cfd521︡{"stdout":"Elliptic Curve defined by y^2 + y = x^3 + x^2 + x - 1 over Rational Field\n"}︡{"stderr":"Error in lines 4-4\nTraceback (most recent call last):\n  File \"/mnt/home/uHNlUmEE/.sagemathcloud/sage_server.py\", line 668, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\n  File \"\", line 7, in number_field\n  File \"/mnt/home/uHNlUmEE/sage-5.12.rc0/local/lib/python2.7/site-packages/sage/rings/number_field/number_field.py\", line 429, in NumberField\n    return NumberFieldTower(polynomial, name, embeddings=embedding)\n  File \"/mnt/home/uHNlUmEE/sage-5.12.rc0/local/lib/python2.7/site-packages/sage/rings/number_field/number_field.py\", line 592, in NumberFieldTower\n    w = NumberFieldTower(v[1:], names=names[1:], embeddings=embeddings[1:])\n  File \"/mnt/home/uHNlUmEE/sage-5.12.rc0/local/lib/python2.7/site-packages/sage/rings/number_field/number_field.py\", line 592, in NumberFieldTower\n    w = NumberFieldTower(v[1:], names=names[1:], embeddings=embeddings[1:])\n  File \"/mnt/home/uHNlUmEE/sage-5.12.rc0/local/lib/python2.7/site-packages/sage/rings/number_field/number_field.py\", line 592, in NumberFieldTower\n    w = NumberFieldTower(v[1:], names=names[1:], embeddings=embeddings[1:])\n  File \"/mnt/home/uHNlUmEE/sage-5.12.rc0/local/lib/python2.7/site-packages/sage/rings/number_field/number_field.py\", line 616, in NumberFieldTower\n    return w.extension(f, name, check=check, embedding=embeddings[0])\n  File \"/mnt/home/uHNlUmEE/sage-5.12.rc0/local/lib/python2.7/site-packages/sage/rings/number_field/number_field.py\", line 4165, in extension\n    return NumberField_relative(self, poly, str(name), check=check, embedding=embedding)\n  File \"/mnt/home/uHNlUmEE/sage-5.12.rc0/local/lib/python2.7/site-packages/sage/rings/number_field/number_field_rel.py\", line 284, in __init__\n    raise ValueError, \"defining polynomial (%s) must be irreducible\"%polynomial\nValueError: defining polynomial (x^3 + 7*x^2 + 39*x + 36) must be irreducible\n"}︡
︠04d587c8-9cdf-4114-9852-35159ec30c04︠









