︠1e4227f5-62ee-4731-8040-be3855752383︠
for d in [2..100]:
    if d.is_squarefree():
        print d, NumberField(x^2-d,'a').discriminant()
︡5e585fa5-1a51-4c97-b302-7c135afde466︡{"stdout":"2 8\n3 12\n5 5\n6 24\n7 28\n10 40\n11 44\n13 13\n14 56\n15 60\n17 17\n19 76\n21 21\n22 88\n23 92\n26 104\n29 29\n30 "}︡{"stdout":"120\n31 124\n33 33\n34 136\n35 140\n37 37\n38 152\n39 156\n41 41\n42 168\n43 172\n46 184\n47 188\n51 204\n53 53\n55 220\n57 57\n58 232\n59 236\n61 61\n62 248\n65 65\n66 264\n67 268\n69 69\n70 280\n71 284\n73 73\n74 296\n77 77\n78 312\n79 316\n82 328\n83 332\n85 85\n86 344\n87 348\n89 89\n91 364\n93 93\n94 376\n95 380\n97 97\n"}︡
︠f5f8424c-fadd-4a3e-922a-86a26704ee28︠
for d in [2..10]:
    if d.is_squarefree():
        print d, NumberField(x^3-d,'a').discriminant()
︡893349d2-5c08-4ad6-80b2-227cf86ad378︡{"stdout":"2 -108\n3 -243\n5 -675\n6 -972\n7 -1323\n10 -300\n"}︡
︠b55d51d5-d3ae-48a6-9330-8fc4557e7cf3︠
NumberField(x^3 - x^2 - 2*x + 1, 'a').discriminant()
︡16045a0f-5135-4d0b-9519-19643a74eb3b︡{"stdout":"49\n"}︡
︠997b362c-ccf0-47a5-9639-295789115c69︠
latex(x^3 - x^2 - 2*x + 1)
︡c3cb8f02-99e5-46a2-86ee-168ba37fd9b2︡{"stdout":"x^{3} - x^{2} - 2 \\, x + 1\n"}︡
︠4d009523-c43c-4b9a-bf72-1f040e7d610b︠
K.<a> = NumberField(x^2-x-1)
E = EllipticCurve([1,-a-1,a,0,0])
K.disc()
︡19be0d21-efaf-4978-8f93-a4fcb518970b︡{"stdout":"5\n"}︡
︠433367ad-bb57-4dd4-a76a-eebc0231f9e6︠
E
︡c8ca0ca9-756a-4b52-91e4-fb7d01351dc0︡{"stdout":"Elliptic Curve defined by y^2 + x*y + a*y = x^3 + (-a-1)*x^2 over Number Field in a with defining polynomial x^2 - x - 1\n"}︡
︠6955a047-ec7c-4078-9e54-0f91ac84bbf3︠
E.conductor().norm()
︡a4a9f85d-5400-4557-8efe-eb7952491b93︡{"stdout":"31\n"}︡
︠9f6eb343-526e-4644-887c-8f0bc4397b65︠
latex(E)
︡b095ec3c-969d-461a-9b57-06063dd3626f︡{"stdout":"y^2 + x y + a y = x^{3} + \\left(-a - 1\\right) x^{2} \n"}︡
︠5d3a9e8f-3c3b-4bb4-b7ec-730fe294bef3︠
E.conductor()
︡07498fb3-6091-43a2-9869-e83f7b999ce4︡{"stdout":"Fractional ideal (5*a - 3)\n"}︡
︠3b6d8444-bcdd-428c-8a57-2a99d8429715︠
EllipticCurve([0,-a,1,-a-1,2*a+1]).rank()
︡4a87834b-c3fe-4e9c-adf9-0f76dd46ded1︡{"stdout":"2"}︡{"stdout":"\n"}︡
︠b92a5b6b-3372-4446-9b2d-2d40dd2c0062︠









