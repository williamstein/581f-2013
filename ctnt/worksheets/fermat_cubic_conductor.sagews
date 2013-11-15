︠01e44a59-ba7a-48cf-b0c5-7c94a100dc48︠
#Define the fermat cubic
E = EllipticCurve('27a1').short_weierstrass_model(); E
E.plot()
︡6262f6f2-0de3-4e42-b697-c4b1819fdd2b︡{"stdout":"Elliptic Curve defined by y^2 = x^3 - 432 over Rational Field"}︡{"stdout":"\n"}︡{"once":false,"file":{"show":true,"uuid":"a40fe771-fd88-43d3-87db-9879c64553fb","filename":"/mnt/home/uHNlUmEE/.sage/temp/compute1a/21954/tmp_pcNepu.png"}}︡
︠f598729e-ec30-48b1-b6c0-44273da9dc16︠
#a point P=(x,y) on E is 2-torsion iff y=0, easy to see from the graph
#(also from the equation for point addition)
#in this case E[l] is going to be points (x,0), i.e. roots of
#the equation E when y=0. So K = Q(E[l]) may be defined as
L = QQ[(432)^(1/3)]; L

︡1e94f785-03b9-4194-9581-f39a7a8af9e6︡{"stdout":"Number Field in a with defining polynomial x^3 - 432"}︡{"stdout":"\n"}︡
︠ad88acc9-6aea-44d1-bef9-10cc3f47e68a︠
factor(432) #shows this extension is the same as Q(sqrt(3))
︡8aa60277-572a-4271-a7de-6942f9263cae︡{"stdout":"2^4 * 3^3\n"}︡
︠b118e2fb-1f6d-47ae-a97e-af6e50774d2f︠
factor(L.discriminant())
︡2cc84a4e-498c-4794-a782-e23f034b6dc8︡{"stdout":"-1 * 2^2 * 3^3\n"}︡
︠705150d6-48e9-4447-86dd-5df73eb107de︠
#only primes that ramify are 2 and 3
#so n(p) = 0 for all p except 2,3 see pg 44

#First compute n(2)
︡4eb87e24-90bc-49cc-a616-a30e3ed1d04f︡
︠1ca28885-574e-4fd6-bf66-d6d71b98389b︠
p = 2
︡4d5a3c3d-0d04-4fb8-961c-6d740cf0dcec︡
︠d026ae0b-95c8-4949-91ef-37ffcc83e02e︠
#First factor the prime in O_K
︡f964ba34-6851-4e03-98a3-18707aba7ffe︡
︠d275b8f2-f2a9-4676-b921-024d733717d6︠
L.factor(p)
︡0fb41015-0a45-4d8b-833e-872b8247355d︡{"stdout":"(Fractional ideal (2, 1/6*a))^3\n"}︡
︠b6af6df1-d119-4819-afdd-1c0d4904e49e︠
K.<a> = L.galois_closure()
G = K.galois_group(names = 'alpha')
G.order() #K:Q] = 6
︡92b99710-acef-4325-ac6a-837e1f71e4e2︡{"stdout":"6\n"}︡
︠52b3107e-f6c6-4376-aea6-2b591f7369b9︠
G[1](a)
︡f4168295-6e4a-4c7d-ad93-09d9c5f94969︡{"stdout":"-1/6804*a^4 - 31/63*a\n"}︡
︠f5151052-0fc3-432d-b9fb-67c6de8c5003︠
K.discriminant()
︡0cb93c37-c0e7-44b2-85f7-d31e099d1657︡{"stdout":"-34992\n"}︡
︠1f58cd31-87a1-47ec-9463-318558e772bb︠
factor(K.discriminant())
︡0486681b-b02c-4df3-9c55-0f74701149ea︡{"stdout":"-1 * 2^4 * 3^7\n"}︡
︠930f105f-a92c-4ec4-a9d3-f73af012ac02︠
K.factor(p)
P = K.factor(p).radical_value(); P
︡858f02b7-91dc-4063-816d-f39cfbca4988︡{"stdout":"(Fractional ideal (2, -1/20575296*a^5 + 1/244944*a^4 - 1/11664*a^3 - 59/23814*a^2 + 47/1134*a + 17/27))^3\n"}︡{"stdout":"Fractional ideal (2, -1/20575296*a^5 + 1/244944*a^4 - 1/11664*a^3 - 59/23814*a^2 + 47/1134*a + 17/27)\n"}︡
︠ed45060f-9a12-4003-a88e-24398219b189︠
P.gens()
︡6fb905ad-600c-4594-b4fb-c0821240a881︡{"stdout":"(2, -1/20575296*a^5 + 1/244944*a^4 - 1/11664*a^3 - 59/23814*a^2 + 47/1134*a + 17/27)\n"}︡
︠683724ea-bba1-49e0-9030-84069b3d68ba︠
G.complex_conjugation()
︡949d28c8-0dfa-4c05-9d13-cea8248f61c9︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/mnt/home/uHNlUmEE/.sagemathcloud/sage_server.py\", line 668, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\n  File \"/mnt/home/uHNlUmEE/sage-5.12.rc0/local/lib/python2.7/site-packages/sage/rings/number_field/galois_group.py\", line 423, in complex_conjugation\n    raise ValueError, \"No default complex embedding specified\"\nValueError: No default complex embedding specified\n"}︡
︠d6ca241f-2006-4276-be87-92f6a4969344︠
G.decomposition_group(P)
︡7b33d61c-a436-45f7-9c4d-66b0e16fa015︡{"stdout":"Galois group of Number Field in a with defining polynomial x^6 + 8640*x^3 + 64012032\n"}︡
︠46816a62-ac55-470d-b36f-f20885fb50be︠









