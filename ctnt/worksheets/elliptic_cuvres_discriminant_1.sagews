︠462c7d01-2086-4c8a-adba-c9aecbf07cef︠
#Error?
︠48c09dbf-8252-4b4d-9873-39cbbe357df5︠
R.<x,y,z> = QQ[]
cubic = y^2 - 4*x^3 - (1)*x^2 - 2*(-11/24)*x - (-35/432)
show(cubic)
cubic(x = 5/12,y = 0)
︡54df69bd-ee3e-455e-a9fb-815a445bd4c2︡{"tex":{"tex":"-4 x^{3} -  x^{2} + y^{2} + \\frac{11}{12} x + \\frac{35}{432}","display":true}}︡{"stdout":"0\n"}︡
︠48b43440-9f67-4392-b86c-06f45d2d9850︠
EllipticCurve_from_cubic(cubic.homogenize(z),[5/12,0,1])
︡ee7761e7-0bcc-49c3-be36-bd9aa334e941︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/mnt/home/uHNlUmEE/.sagemathcloud/sage_server.py\", line 633, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\n  File \"/mnt/home/uHNlUmEE/sage-5.12.rc0/local/lib/python2.7/site-packages/sage/schemes/elliptic_curves/constructor.py\", line 786, in EllipticCurve_from_cubic\n    F4 = F3/a\n  File \"element.pyx\", line 1813, in sage.structure.element.RingElement.__div__ (sage/structure/element.c:15216)\n  File \"coerce.pyx\", line 799, in sage.structure.coerce.CoercionModel_cache_maps.bin_op (sage/structure/coerce.c:7287)\n  File \"action.pyx\", line 259, in sage.categories.action.InverseAction._call_ (sage/categories/action.c:4557)\n  File \"rational.pyx\", line 2256, in sage.rings.rational.Rational.__invert__ (sage/rings/rational.c:17897)\nZeroDivisionError: rational division by zero\n"}︡
︠66373baa-ea07-455c-915c-b64ff800fab6︠










︠04462e20-8151-4d56-ae2b-2aedb4a39313︠
#If we allow rational a's, discriminant 1 can happen!
E = EllipticCurve([1,0,-11/24,0,-503/6912]); E;
︡af7b963f-ddfb-446f-9aa2-4da374991069︡{"stdout":"Elliptic Curve defined by y^2 + x*y - 11/24*y = x^3 - 503/6912 over Rational Field\n"}︡
︠a5389cc6-aad8-49bd-9ee9-9539e6d2aa19︠
E.discriminant()
︡1b96b2e1-200d-431d-a03f-4704e120d381︡{"stdout":"1\n"}︡
︠7dc7aa80-d13f-4cfa-b1e7-97c2f3b99cc6︠
E.is_singular()
︡160126ec-db89-4e6d-8d70-8d3b97641b8d︡{"stdout":"False\n"}︡
︠0756df65-360a-4496-b693-91c80ebe5e79︠
#Isomorphic view
E.minimal_model()
︡ff3b43f2-7e04-48ea-ab99-6fd7b3dea3c5︡{"stdout":"Elliptic Curve defined by y^2 = x^3 - 4*x over Rational Field\n"}︡
︠c115ef4f-f204-4dad-b4c5-54050d9d2faa︠
E.minimal_model().discriminant()
︡d2b3c1bc-a09e-4ce3-8135-ba0459ebc570︡{"stdout":"4096\n"}︡
︠b01d5f27-4d86-4a82-a897-5eb4fe5d676f︠
#Proof this can't happen with integer a's:
#Suppose Delta = 1, then
#1728 = c4^3 - c6^2... looks like an elliptic curve...
E = EllipticCurve([0,0,0,0,-1728]); E
E.integral_points()
︡332c8d88-db76-4774-9204-b40d9ba6785c︡{"stdout":"Elliptic Curve defined by y^2 = x^3 - 1728 over Rational Field\n"}︡{"stdout":"[(12 : 0 : 1)]"}︡{"stdout":"\n"}︡
︠814e8be8-2a2e-4a6d-80e5-be7462b715f0︠
#So c4 = 12, c6 = 0 is ONLY possibility
#Next apply equations:
var('b2,b4,b6,c4,c6,b8')

#From silverman's book. Note all b's must be integers since they come from integer
#combinations of a's
c4_eq = c4 == b2^2 - 24*b4
c6_eq = c6 == -b2^3 + 36*b2*b4 - 216*b6
b8_eq = 4*b8 == b2*b6 - b4^2

b4_in_b2 = c4_eq.substitute(c4=12).solve(b4)[0]
show(b4_in_b2*24)
b6_in_b2 = c6_eq.substitute(c6=0,b4 = b4_in_b2.rhs()).solve(b6)[0]
show(b6_in_b2*432)
b8_in_b = b8_eq.substitute(b4 = b4_in_b2.rhs(),b6 = b6_in_b2.rhs()).solve(b8)[0]
show(b8_in_b*6912)
︡b2bde2c6-ab90-48ed-9c09-f1985547dd60︡{"stdout":"(b2, b4, b6, c4, c6, b8)\n"}︡{"tex":{"tex":"24 \\, b_{4} = b_{2}^{2} - 12","display":true}}︡{"tex":{"tex":"432 \\, b_{6} = b_{2}^{3} - 36 \\, b_{2}","display":true}}︡{"tex":{"tex":"6912 \\, b_{8} = b_{2}^{4} - 72 \\, b_{2}^{2} - 432","display":true}}︡
︠e4a383a2-eab7-4fdc-8d0b-59c6e4f0d4d2︠
#Could there be a b2 that makes the first work mod 24?
for i in range(24):
    if (i^2 - 12)%24 == 0:
        print(i)
        break
︡c6840df2-ec24-44b8-a7a1-4ad48d7cb069︡{"stdout":"6\n"}︡
︠827daa5c-3e48-49bd-be8f-5b41ded8ce7f︠
#Could there be a b2 that makes the second work mod 432?
for i in range(432):
    if mod(i^3 - 36*i,432) == 0:
        print(i)
        break
︡e77c3110-7996-4fb4-9c2b-d5bdd96c4fd8︡{"stdout":"0\n"}︡
︠5052dcf5-cc11-4923-b6f4-a26dd7c32afa︠
#Could there be a b2 that makes the third work mod 6912?
for x in range(6912):
    if mod(x^4 - 72*x - 432,6912) == 0:
        print(x)
︡a8a291ae-b8e5-48bf-9a02-0f46f079f6f4︡
︠103ced44-b2a0-4758-bca0-ca20b52dce95︠
#Nope! QED?
︡52f9fa46-dd04-47e2-a8b2-13dd865e5765︡
︠cfa5f3c0-1553-4312-bcb3-6f6aa7478538︠









