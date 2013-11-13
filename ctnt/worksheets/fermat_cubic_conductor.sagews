︠01e44a59-ba7a-48cf-b0c5-7c94a100dc48︠
#Define the fermat cubic
E = EllipticCurve('27a1').short_weierstrass_model(); E
E.plot()
︡fbd02aa7-44ba-4ab6-8548-04fae3fdb1c9︡{"stdout":"Elliptic Curve defined by y^2 = x^3 - 432 over Rational Field\n"}︡{"once":false,"file":{"show":true,"uuid":"0d011092-513d-41ed-a44e-77c5ba6398b0","filename":"/mnt/home/uHNlUmEE/.sage/temp/compute1a/3443/tmp_tVyqQm.png"}}︡
︠f598729e-ec30-48b1-b6c0-44273da9dc16︠
#a point P=(x,y) on E is 2-torsion iff y=0, easy to see from the graph
#(also from the equation for point addition)
#in this case E[l] is going to be points (x,0), i.e. roots of
#the equation E when y=0. So K = Q(E[l]) may be defined as
L = QQ[(432)^(1/3)]; L

︡dc91b7d1-23a3-4474-addb-ec3dd357fbb3︡{"stdout":"Number Field in a with defining polynomial x^3 - 432\n"}︡
︠ad88acc9-6aea-44d1-bef9-10cc3f47e68a︠
factor(432) #shows this extension is the same as Q(sqrt(3))
︡c23e864d-d9f4-46f9-af05-147fb920df41︡{"stdout":"2^4 * 3^3\n"}︡
︠b118e2fb-1f6d-47ae-a97e-af6e50774d2f︠
factor(L.discriminant())
︡073efc0f-5036-470b-a05c-460a5af21b1d︡{"stdout":"-1 * 2^2 * 3^3\n"}︡
︠705150d6-48e9-4447-86dd-5df73eb107de︠
#only primes that ramify are 2 and 3
#so n(p) = 0 for all p except 2,3 see pg 44

#First compute n(2)
︡9181d8c4-af00-4c99-806c-adf51c9c2048︡
︠1ca28885-574e-4fd6-bf66-d6d71b98389b︠
p = 2
︡2fe2cdc2-d4e3-46f2-b413-34a1637d35f4︡
︠d026ae0b-95c8-4949-91ef-37ffcc83e02e︠
#First factor the prime in O_K
︡fd79cb37-9276-4f92-9363-241b6e3982fd︡
︠d275b8f2-f2a9-4676-b921-024d733717d6︠
L.factor(p)
︡d5016447-7e57-450d-bb99-6b6b06e03b46︡{"stdout":"(Fractional ideal (2, 1/6*a))^3\n"}︡
︠b6af6df1-d119-4819-afdd-1c0d4904e49e︠
K.<a> = L.galois_closure()
G = K.galois_group()
G.order() #K:Q] = 6
︡d1bb586e-341b-4775-aceb-a6d5b8b4af7f︡{"stdout":"6"}︡{"stdout":"\n"}︡
︠f5151052-0fc3-432d-b9fb-67c6de8c5003︠
K.discriminant()
︡0cb93c37-c0e7-44b2-85f7-d31e099d1657︡{"stdout":"-34992\n"}︡
︠1f58cd31-87a1-47ec-9463-318558e772bb︠
factor(K.discriminant())
︡0486681b-b02c-4df3-9c55-0f74701149ea︡{"stdout":"-1 * 2^4 * 3^7\n"}︡
︠930f105f-a92c-4ec4-a9d3-f73af012ac02︠
K.factor(p)
P = K.factor(p).radical(); P
︡7ca53624-2d7c-4f36-9da9-f02e9c65d820︡{"stdout":"(Fractional ideal (2, -1/20575296*a^5 + 1/244944*a^4 - 1/11664*a^3 - 59/23814*a^2 + 47/1134*a + 17/27))^3\n"}︡{"stdout":"Fractional ideal (2, -1/20575296*a^5 + 1/244944*a^4 - 1/11664*a^3 - 59/23814*a^2 + 47/1134*a + 17/27)\n"}︡
︠a673497e-a021-4d4f-8301-660cce723618︠
G.complex_conjugation()
︡f425c7f6-773a-425d-b0f4-d3bc781a6cdc︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/mnt/home/PL1G99Ky/.sagemathcloud/sage_server.py\", line 633, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\n  File \"/usr/local/sage/sage-5.12/local/lib/python2.7/site-packages/sage/rings/number_field/galois_group.py\", line 423, in complex_conjugation\n    raise ValueError, \"No default complex embedding specified\"\nValueError: No default complex embedding specified\n"}︡
︠d6ca241f-2006-4276-be87-92f6a4969344︠
G.decomposition_group(P)









