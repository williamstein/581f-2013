︠459d9d6f-62d7-4143-a4b5-6c1652a1d813︠
#Define the fermat cubic
E = EllipticCurve('27a1').short_weierstrass_model(); E
E.plot()
︡03e68419-e38e-490d-8a63-b33e795c05ed︡{"stdout":"Elliptic Curve defined by y^2 = x^3 - 432 over Rational Field\n"}︡{"once":false,"file":{"show":true,"uuid":"915899f1-b1d7-4c53-ada0-9eb0f435d8c9","filename":"/mnt/home/uHNlUmEE/.sage/temp/compute1a/3701/tmp_1AexwS.png"}}︡
︠29d0c338-ba4b-4123-90fc-dfbb0e481c15︠
#a point P=(x,y) on E is 2-torsion iff y=0, easy to see from the graph
#(also from the equations for point addition)
#in this case E[l] is going to be points (x,0), i.e. roots of
#the equation E when y=0. So K = Q(E[l]) may be defined as
#Q(cbrt(432)) = Q(cbrt(2)) can see by factoring 432
K = QQ[2^(1/3)].galois_closure(names = 'a'); K
︡120d720d-0276-47dd-b2ed-9d74e3f9d46a︡{"stdout":"Number Field in a with defining polynomial x^6 + 40*x^3 + 1372\n"}︡
︠47d2e72f-8582-404f-a373-b59d24899992︠
#find 2-torsion points in E
#these are just affine point (cbrt(2),0),(zeta*cbrt(2),0),(zeta^2*cbrt(2),0)
#where zeta is primitive 3rd root unity
#also with point at infinity. Hence all points lie in E/K,
#so we can simply iterate through torsion points and find them
V = E.change_ring(K)(0).division_points(2)
len(V) #should be p^2 - 1
︡e717d3ff-0579-43fb-98d2-857923d3b4af︡{"stdout":"4\n"}︡
︠b118e2fb-1f6d-47ae-a97e-af6e50774d2f︠
#Find 3-torsion points on E/bar{Q}
#turns out all 3-torsion points appear in
#the following
K = QQ[10+9*sqrt(-3)]; K
︡1b9e4f4a-340c-4aa8-9f2e-851b284408c8︡{"stdout":"Number Field in a with defining polynomial x^2 - 20*x + 343\n"}︡
︠98e2fb67-e198-49cb-9d17-24b183adfc70︠
#like before we make sure we have all 3-torsion points
V = E.change_ring(K)(0).division_points(3)
len(V) #should be p^2 - 1
︡cbb46f52-918c-44e1-9a51-4ad810f06600︡{"stdout":"9\n"}︡
︠6f4af1f7-6cd8-4bd6-a80a-db8e776187c4︠
#finding 5-torsion?
V = E.change_ring(QQ.algebraic_closure())(0).division_points(5)
len(V) #should be p^2 - 1
︡c4ce8290-e3fd-4b9f-8d18-f1fd2083c7fe︡{"stderr":"Error in lines 2-2\n"}︡{"stderr":"Traceback (most recent call last):\n  File \"/mnt/home/uHNlUmEE/.sagemathcloud/sage_server.py\", line 668, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\n  File \"/mnt/home/uHNlUmEE/sage-5.12.rc0/local/lib/python2.7/site-packages/sage/schemes/elliptic_curves/ell_point.py\", line 1081, in division_points\n    ans.sort()\n  File \"element.pyx\", line 914, in sage.structure.element.Element.__richcmp__ (sage/structure/element.c:8874)\n  File \"element.pyx\", line 886, in sage.structure.element.Element._richcmp (sage/structure/element.c:8739)\n  File \"/mnt/home/uHNlUmEE/sage-5.12.rc0/local/lib/python2.7/site-packages/sage/schemes/elliptic_curves/ell_point.py\", line 400, in __cmp__\n    return cmp(self._coords, other._coords)\n  File \"element.pyx\", line 914, in sage.structure.element.Element.__richcmp__ (sage/structure/element.c:8874)\n  File \"element.pyx\", line 886, in sage.structure.element.Element._richcmp (sage/structure/element.c:8739)\n  File \"/mnt/home/uHNlUmEE/sage-5.12.rc0/local/lib/python2.7/site-packages/sage/rings/qqbar.py\", line 3753, in __cmp__\n    rcmp = cmp(self.real(), other.real())\n  File \"/mnt/home/uHNlUmEE/sage-5.12.rc0/local/lib/python2.7/site-packages/sage/rings/qqbar.py\", line 4393, in __cmp__\n    return self._sub_(other).sign()\n  File \"/mnt/home/uHNlUmEE/sage-5.12.rc0/local/lib/python2.7/site-packages/sage/rings/qqbar.py\", line 4623, in sign\n    return self.sign()\n  File \"/mnt/home/uHNlUmEE/sage-5.12.rc0/local/lib/python2.7/site-packages/sage/rings/qqbar.py\", line 4626, in sign\n    self.exactify()\n  File \"/mnt/home/uHNlUmEE/sage-5.12.rc0/local/lib/python2.7/site-packages/sage/rings/qqbar.py\", line 3464, in exactify\n    self._set_descr(self._descr.exactify())\n  File \"/mnt/home/uHNlUmEE/sage-5.12.rc0/local/lib/python2.7/site-packages/sage/rings/qqbar.py\", line 7603, in exactify\n    left.exactify()\n  File \"/mnt/home/uHNlUmEE/sage-5.12.rc0/local/lib/python2.7/site-packages/sage/rings/qqbar.py\", line 3464, in exactify\n    self._set_descr(self._descr.exactify())\n  File \"/mnt/home/uHNlUmEE/sage-5.12.rc0/local/lib/python2.7/site-packages/sage/rings/qqbar.py\", line 7348, in exactify\n    rv.exactify()\n  File \"/mnt/home/uHNlUmEE/sage-5.12.rc0/local/lib/python2.7/site-packages/sage/rings/qqbar.py\", line 3464, in exactify\n    self._set_descr(self._descr.exactify())\n  File \"/mnt/home/uHNlUmEE/sage-5.12.rc0/local/lib/python2.7/site-packages/sage/rings/qqbar.py\", line 7603, in exactify\n    left.exactify()\n  File \"/mnt/home/uHNlUmEE/sage-5.12.rc0/local/lib/python2.7/site-packages/sage/rings/qqbar.py\", line 3464, in exactify\n    self._set_descr(self._descr.exactify())\n  File \"/mnt/home/uHNlUmEE/sage-5.12.rc0/local/lib/python2.7/site-packages/sage/rings/qqbar.py\", line 7605, in exactify\n    gen = left._exact_field().union(right._exact_field())\n  File \"/mnt/home/uHNlUmEE/sage-5.12.rc0/local/lib/python2.7/site-packages/sage/rings/qqbar.py\", line 2273, in union\n    newpol, self_pol, k = pari_nf.rnfequation(my_factor, 1)\n  File \"gen.pyx\", line 10595, in sage.libs.pari.gen._pari_trap (sage/libs/pari/gen.c:56518)\n  File \"gen.pyx\", line 9909, in sage.libs.pari.gen.PariInstance.allocatemem (sage/libs/pari/gen.c:52488)\n  File \"gen.pyx\", line 10439, in sage.libs.pari.gen.init_stack (sage/libs/pari/gen.c:55699)\nMemoryError: Unable to allocate 16384000000 bytes memory for PARI.\n"}︡
︠9a9f7198-9640-46d2-bd8c-21ad9bf3036e︠
#finds the Serre level for the Galois representation
#over F_l that isattached to the elliptic curve E
#K needs to be the minimal number field (Galois?)
#such that in which all l-torsion points
#of E/bar{Q} (there should be l^2 of them)
#exist in E/K
def Serre_level(E,l,K):
    print('Finding Serre-level of:')
    print E
    print('over l = '+str(l))
    print('assuming the right field is ')
    print K
    print ''
    #output variable
    N = 1
    #find galois group
    G = K.galois_group()
    #build our representation space
    V = E.change_ring(K)(0).division_points(l)
    #find primes that ramify in K, these are only ones thay may have non-trivial n(p)
    primes = [p[0] for p in list(factor(K.discriminant())) if p[0]!=l] #all primes that ramify except l
    for p in primes:
        P = list(K.factor(p))[0][0]; #find a factor of p, since it is ramified and K is galois all have exponent > 1 so we may choose any such factor
        print('starting with p = '+str(p))
        n = 0 #exponent n(p)
        i = 0 #index on ramification groups
        H0 = G.ramification_group(P,0)
        while len(G.ramification_group(P,i)) > 1:
            H = G.ramification_group(P,i)
            Vi = [v for v in V if all(E.change_ring(K).point([h(v[0]),h(v[1]),h(v[2])]) == v for h in H)]
            print 'dim V/V^{H_i} = ' + str(len(V)-len(Vi))
            print '[H_0 : H_i] = ' + str(len(H0)/len(H))
            n += (len(V)-len(Vi)) / (len(H0)/len(H))
            i = i+1
        print('Exponent is '+str(n))
        N = N*(p^n)
    return N
︡57b24b99-b881-4a1d-b8b0-6ea8420546e1︡
︠72191545-2a56-4919-a8d5-30d5484cc84c︠
Serre_level(E,3,QQ[10+9*sqrt(-3)])
︡bff72e98-9427-4f19-a2a3-1db0be332e5a︡{"stdout":"Finding Serre-level of:\nElliptic Curve defined by y^2 = x^3 - 432 over Rational Field\nover l = 3\nassuming the right field is \nNumber Field in a with defining polynomial x^2 - 20*x + 343\n\n1\n"}︡
︠2b623b1b-1585-4182-864f-ef72d2c8df74︠
Serre_level(E,2,K = QQ[2^(1/3)].galois_closure(names = 'a'))
︡08e77a27-f4a0-4a74-9bf3-9e7ccbbdbbaf︡{"stdout":"Finding Serre-level of:\nElliptic Curve defined by y^2 = x^3 - 432 over Rational Field\nover l = 2\nassuming the right field is \nNumber Field in a with defining polynomial x^6 + 40*x^3 + 1372\n\nstarting with p = 3\ndim V/V^{H_i} = 3"}︡{"stdout":"\n[H_0 : H_i] = 1\ndim V/V^{H_i} = 3"}︡{"stdout":"\n[H_0 : H_i] = 2\nExponent is 4\n81\n"}︡
︠f87866ed-4687-4c48-aed5-6d6edd612f17︠
E.conductor()
︡c259c93c-ea0a-4470-8042-963594a22933︡{"stdout":"27\n"}︡
︠24abd0d6-0753-4488-abaf-bbe2d84c0dd7︠









