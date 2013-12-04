︠3575a64c-6cc2-4a33-bddf-2f2d71df60d0i︠
%md
# Examples of the BSD conjecture

$$
r_{\rm an} = r_{\rm alg}
$$

$$
L^*(E,1) = \frac{\Omega_E \cdot \prod_{p\mid N} c_p \cdot {\rm Reg}_E \cdot |{\rm Sha}(E)| }{ |E(\mathbf{Q})_{\rm tor}|^2}.
$$

News flash: BSD is false!

            From: Jennifer S Balakrishnan <jennifer.balakrishnan@maths.ox.ac.uk>
            Date: Wed, Dec 4, 2013 at 12:01 PM
            Subject: Magma elliptic curve rank bug
            To: Mark Watkins <watkins@maths.usyd.edu.au>

            Hi Mark,

            Magma seems to think that this elliptic curve has algebraic rank 1
            (and analytic rank 2!):

            > E:=EllipticCurve([0, 1, 0, -39, -83]);
            > Rank(E);
            1
            > P := Generators(E)[1];
            > P;
            (-3 : 4 : 1)
            > AnalyticRank(E);
            2 8.0466




(just kidding -- in fact this is a bug in Magma).

︡6b9fcea4-03de-4645-bad0-9fe306179001︡{"html":"<h1>Examples of the BSD conjecture</h1>\n\n<p>$$\nr_{\\rm an} = r_{\\rm alg}\n$$</p>\n\n<p>$$\nL^*(E,1) = \\frac{\\Omega_E \\cdot \\prod_{p\\mid N} c_p \\cdot {\\rm Reg}_E \\cdot |{\\rm Sha}(E)| }{ |E(\\mathbf{Q})_{\\rm tor}|^2}.\n$$</p>\n\n<p>News flash: BSD is false!</p>\n\n<pre><code>        From: Jennifer S Balakrishnan &lt;jennifer.balakrishnan@maths.ox.ac.uk&gt;\n        Date: Wed, Dec 4, 2013 at 12:01 PM\n        Subject: Magma elliptic curve rank bug\n        To: Mark Watkins &lt;watkins@maths.usyd.edu.au&gt;\n\n        Hi Mark,\n\n        Magma seems to think that this elliptic curve has algebraic rank 1\n        (and analytic rank 2!):\n\n        &gt; E:=EllipticCurve([0, 1, 0, -39, -83]);\n        &gt; Rank(E);\n        1\n        &gt; P := Generators(E)[1];\n        &gt; P;\n        (-3 : 4 : 1)\n        &gt; AnalyticRank(E);\n        2 8.0466\n</code></pre>\n\n<p>(just kidding &#8211; in fact this is a bug in Magma).</p>\n"}︡
︠0e1cfca6-3eb8-4798-b3bf-cdfd49cd49c6︠
E = EllipticCurve([0, 1, 0, -39, -83])
E.rank()
E.conductor().factor()
︡e901c143-5c13-4c53-99b3-e4879bbfb5d2︡{"tex":{"tex":"2","display":true}}︡{"tex":{"tex":"2^{8} \\cdot 59^{2}","display":true}}︡
︠0506e9e6-a0f7-4f7e-925e-dd3e932d805c︠
E.conductor()
︡a313e627-22b7-438b-b010-f628e73c5b6a︡{"tex":{"tex":"891136","display":true}}︡
︠5722fd26-d66d-4db1-a557-42947fb5e8b0a︠
%auto
typeset_mode(True)
︡89e28942-9bd2-49b5-a590-9513b3f53562︡{"auto":true}︡
︠b3fc0ad1-041a-4c43-9cb2-aeec32f46784i︠
%md
## The curve 11a of rank 0
︡d4dfa386-f63c-4e21-9106-6e4692db4390︡{"html":"<h2>The curve 11a of rank 0</h2>\n"}︡
︠6c14cd9c-44ff-44f3-9886-d16c875c2c18︠
E = EllipticCurve('11a'); E
︡498b2a4d-82b4-43d2-be28-38331176ae98︡{"tex":{"tex":"y^2 + y = x^{3} -  x^{2} - 10 x - 20 ","display":true}}︡
︠5b6a097b-cf8b-44f8-a96f-1e150c3c26b9︠
L = E.lseries(); print(L)
︡5f424895-e234-479f-bcaf-3b22acb0ece6︡{"stdout":"Complex L-series of the Elliptic Curve defined by y^2 + y = x^3 - x^2 - 10*x - 20 over Rational Field\n"}︡
︠3fb47d60-e99e-49bd-80f3-91eae7bf99a8︠
L(2+5*I)
︡ae5491df-1ca9-4e58-9e02-a24a8b61c6cc︡{"stdout":"verbose -1 (368: dokchitser.py, __call__) Warning: Loss of 2 decimal digits due to cancellation"}︡{"stdout":"\n"}︡{"tex":{"tex":"1.49538417460974 - 0.434431555743826i","display":true}}︡
︠75878181-4105-4b1a-b6ef-535b11b423da︠
L(1)
︡34ed1870-ea7a-4619-875c-e8f50ffbb40b︡{"tex":{"tex":"0.253841860855911","display":true}}︡
︠b5fbbcd3-18c8-4e1d-bfc8-2e7bde872744︠
L.at1
︡961d76cb-9819-436d-88e4-f3ebb86ea7ce︡{"tex":{"tex":"\\text{\\texttt{<bound{ }method{ }Lseries{\\char`\\_}ell.at1{ }of{ }Complex{ }L{-}series{ }of{ }the{ }Elliptic{ }Curve{ }defined{ }by{ }y{\\char`\\^}2{ }+{ }y{ }={ }x{\\char`\\^}3{ }{-}{ }x{\\char`\\^}2{ }{-}{ }10*x{ }{-}{ }20{ }over{ }Rational{ }Field>}}","display":true}}︡
︠990956f3-fc2e-46d1-bf4c-f46ac1a18c32︠
L.taylor_series(1, 5)     # about 1 so z=(s-1)
︡767f2e37-7521-406f-885a-0b07eb96d374︡{"tex":{"tex":"0.25 + 0.31z + 0.011z^{2} - 0.037z^{3} + 0.0088z^{4} + 0.00076z^{5} + O(z^{6})","display":true}}︡
︠003629af-84df-4b6e-8901-5a28fe1afd30︠
E.rank()
︡21f87f72-000f-45d7-9b0b-03503d522348︡{"tex":{"tex":"0","display":true}}︡
︠34bf8b3a-238f-491b-81e0-f40afe822197︠
lstar = L(1); lstar
︡1a1eface-08d7-4385-a801-e7b5b38be8cb︡{"tex":{"tex":"0.253841860855911","display":true}}︡
︠f67a6f8f-b859-4edf-a981-016a8884a3a0︠
L(1+I)
︡965e9731-e6ed-415b-a385-c955246f8ca2︡{"tex":{"tex":"0.252329844312245 + 0.345912342362107i","display":true}}︡
︠9cd9d975-93a3-420c-9ac9-0214c6d1667d︠
E.period_lattice().basis()
︡09671281-1c7e-46d5-a00b-8b00a90cce2d︡{"tex":{"tex":"\\left(1.26920930427955, 0.634604652139777 + 1.45881661693850i\\right)","display":true}}︡
︠2f40b297-e888-46a5-aca4-76f7c50716e2︠
omega = E.period_lattice().omega(); omega
︡5a0d8cfe-60be-42ee-965d-511511661e9d︡{"tex":{"tex":"1.26920930427955","display":true}}︡
︠a853dc9a-b9a8-4004-9ac4-1162f71537d4︠
c11 = E.tamagawa_number(11); c11
︡390f335b-235f-4a35-98bd-823b4f0f5a27︡{"tex":{"tex":"5","display":true}}︡
︠c38c8dc8-9ef5-40ca-976b-9283633c20f8︠
Reg = E.regulator();  Reg   # exactly one, since rank = 0
︡d54f1c02-8ab5-4267-afdf-603b7a515e5c︡{"tex":{"tex":"1.00000000000000","display":true}}︡
︠6d60132c-8e8f-4543-af8f-d57275f13073︠
T = E.torsion_order(); T
︡c3b8dcd0-6355-4231-b7d5-350f491663b0︡{"tex":{"tex":"5","display":true}}︡
︠b2184e50-8a74-4155-8b3a-da67e7bcb4ff︠
sha = E.sha(); print(sha)
︡8ccfa35a-d037-4abc-9f6b-30daaba74a6e︡{"stdout":"Tate-Shafarevich group for the Elliptic Curve defined by y^2 + y = x^3 - x^2 - 10*x - 20 over Rational Field\n"}︡
︠c5ace3b8-01a9-4204-a8b0-591b5ad30238︠
sha.bound()   # means only 2,3,5 can divide order
︡956746dd-307b-434a-851c-b3742410fab1︡{"tex":{"tex":"\\left[2, 3, 5\\right]","display":true}}︡
︠96eeb750-fb7f-4ef8-b645-ec69eb9b742f︠
sha.an()     # conjectural order if you solve for it in BSD.
︡6ff77f7a-0492-414c-8dbd-44c8a2e26003︡{"tex":{"tex":"1","display":true}}︡
︠690de56a-7916-4205-8770-bd1ddfa8f2a9︠
S = 1
︡0efa0450-534b-4289-8c89-f2b3ba067347︡
︠f87274e0-670d-482e-bc8f-4a3327bdb668︠
lstar
︡35ffc7b1-bf12-4ccf-9927-7b29bd1519df︡{"tex":{"tex":"0.253841860855911","display":true}}︡
︠43d20df2-a2f9-496c-acdf-1c8e4221f276︠
(omega * c11 * Reg * S) / T^2
︡c3527a2b-5942-4da1-9ebe-1cb98db6eabd︡{"tex":{"tex":"0.253841860855911","display":true}}︡
︠8623e3a4-6e94-4ebd-b70b-014002e97dec︠

︠b2781eec-a02c-44c8-80df-cfef0d8a8fe0︠

︠4fb09adb-1f94-4cec-8cda-05f3e2f3c5b5i︠
%md
## The curve 37a of rank 1
︡94dc1350-5ede-498c-804e-04b04b803244︡{"html":"<h2>The curve 37a of rank 1</h2>\n"}︡
︠b89bad70-67d3-43e6-8ff7-128fe2165cb5︠
E = EllipticCurve('37a'); E
︡3eaa5010-fdaa-4e31-9387-7d2942ea44f1︡{"tex":{"tex":"y^2 + y = x^{3} -  x ","display":true}}︡
︠ee016958-2fc1-4780-be25-4e07bd6007e4︠
E.rank()
︡56b31c1c-670b-4777-bb82-495996cd2862︡{"tex":{"tex":"1","display":true}}︡
︠dc264811-81d4-4412-9cf1-80e045626cd3︠
L = E.lseries(); print(L)
︡4fc8a5b3-514b-4207-9b45-8fc2f76e4972︡{"stdout":"Complex L-series of the Elliptic Curve defined by y^2 + y = x^3 - x over Rational Field\n"}︡
︠912a165b-dc24-4167-abcc-227b5fc93de1︠
L.taylor_series(1,100,10)  # r_an = 1
︡cf31716a-dc31-417f-9ef2-7fa8dc9345bd︡{"tex":{"tex":"0.00000000000000000000000000000 + 0.30599977383405230182048368332z + 0.18654779726816196417381736878z^{2} - 0.13679146309718766630258221643z^{3} + 0.016106646849640053505097729457z^{4} + 0.018595517539880219615300779472z^{5} - 0.011815619832614466303556313944z^{6} + 0.0032632569120762634561786706023z^{7} - 0.00018033754779936743478345006461z^{8} - 0.00024611138597486162556659985584z^{9} + O(z^{10})","display":true}}︡
︠42f61a89-367d-484c-be6d-7f58057940b3︠
E.analytic_rank()
︡acdedbc5-28d1-480b-9472-4ef28a793de6︡{"tex":{"tex":"1","display":true}}︡
︠3514e7d4-93c8-4bf1-bf23-1ff3f7781d00︠
E.period_lattice().basis()   # rectangular period lattice
︡e1c767b2-0de4-4356-b4df-5c3e682b2293︡{"tex":{"tex":"\\left(2.99345864623196, 2.45138938198679i\\right)","display":true}}︡
︠b1d0cb1f-1f51-46bc-808d-7ddb4fb2a803︠
plot(E)    # 2 real components, of the same *size* in terms of measure.
︡cc59e5a1-4c6f-47a7-9cf6-e3d024642607︡{"once":false,"file":{"show":true,"uuid":"28f1cea2-eaeb-4426-97d4-783513c52c4f","filename":"/mnt/home/uHNlUmEE/.sage/temp/compute1a/23475/tmp_ECGRsO.png"}}︡
︠fbb6fc0c-4aa8-4cc5-8902-3eddf638c44a︠
omega = E.period_lattice().omega(); omega
︡8ab1e1e9-c47f-4d3b-afd6-cf1789ad072b︡{"tex":{"tex":"5.98691729246392","display":true}}︡
︠19defd49-9ef9-40f7-af0b-e8b808daeb44︠
c37 = E.tamagawa_number(37); c37
︡0ef10604-9011-4004-96e2-6429cbb5ea6f︡{"tex":{"tex":"1","display":true}}︡
︠b4433914-a6a0-4fa5-bcbd-021925023f68︠
E.gens()  # rank 1 mw group
︡a7657075-95c4-4faf-b345-28ffd779ec88︡{"tex":{"tex":"\\left[\\left(0 : 0 : 1\\right)\\right]","display":true}}︡
︠bd85b17c-3395-487e-a5cc-5e138efdb472︠
Reg = E.regulator(); Reg
︡e223763d-38d4-4d60-9f44-26f5dcc70aff︡{"tex":{"tex":"0.0511114082399688","display":true}}︡
︠0dc7e0ce-6b27-4bae-bb45-d9961bd3db4a︠
E.gens()[0].height()
︡9398b997-9892-47eb-9ec0-8afed343a3ea︡{"tex":{"tex":"0.0511114082399688","display":true}}︡
︠e43e369a-5e71-40a2-9567-8a311f815ff6︠
sha = E.sha().an(); sha   # trivial sha
︡737c9f83-6508-49f7-bc91-22e9bc0924d2︡{"tex":{"tex":"1","display":true}}︡
︠5d9fea18-b3c1-48a9-b2d8-85bbd0e57771︠
S = 1
︡96a5d296-0f62-40e6-bc18-9ce19f3b4a55︡
︠980c03ab-7499-43a5-bc97-ecd6cf6f38b9︠
T = E.torsion_order(); T
︡b78d49c1-fccf-4c3f-a927-ff63de8888f2︡{"tex":{"tex":"1","display":true}}︡
︠18200824-35d8-4b9a-8e5e-64d8350bd46e︠
lstar = L.dokchitser().derivative(1,1); lstar   # first derivative at 1
︡4e0c0537-4825-44df-a81b-a23cbdf9ec5b︡{"tex":{"tex":"0.305999773834052","display":true}}︡
︠a002c578-39b3-48fe-8f3a-360058dedd5f︠
(omega * c37 * Reg * S) / T^2
︡6361f559-131a-4ffe-8dfb-47f9e54385ef︡{"tex":{"tex":"0.305999773834052","display":true}}︡
︠d577ada9-3fc8-4150-8ad2-ad7e83fe7489︠

︠650bed81-72f8-4147-8b00-907cc02f204di︠


%md
## The curve 389a of rank 2
︡49c0a700-dfc6-4b76-9e34-e451ba8c5b90︡{"html":"<h2>The curve 389a of rank 2</h2>\n"}︡
︠adf7cbe4-9d73-40ad-9d6d-1689cd202631︠

︠01e225eb-376d-441e-82b0-20be46270513︠
E = EllipticCurve('389a'); E
︡e7e06929-2740-4840-b375-bd909b3500ad︡{"tex":{"tex":"y^2 + y = x^{3} + x^{2} - 2 x ","display":true}}︡
︠97d51fe9-dbb3-46f3-9959-a5533cb2abd7︠
E.rank()
︡677fd05d-cd49-475e-9981-33e969e57f26︡{"tex":{"tex":"2","display":true}}︡
︠d6d629c6-f722-4c32-93a1-7693286ee13c︠
L = E.lseries(); print(L)
︡c2a0b5dc-42b6-46f8-825d-71e57793d55d︡{"stdout":"Complex L-series of the Elliptic Curve defined by y^2 + y = x^3 + x^2 - 2*x over Rational Field\n"}︡
︠dc4a90bf-23ac-4633-815e-a5c535e3c16e︠
L.taylor_series(1,53)  # r_an = 2,  z=(s-1)
︡dd3e199e-147e-4057-85db-fc648fa0477b︡{"tex":{"tex":"-2.69129566562797 \\times 10^{-23} + \\left(1.52514901968783 \\times 10^{-23}\\right)z + 0.759316500288427z^{2} - 0.430302337583362z^{3} - 0.193509313829981z^{4} + 0.459971558373642z^{5} + O(z^{6})","display":true}}︡
︠52ce3379-9d88-4c56-a4bb-d28df9cb5a32︠
E.analytic_rank()
︡ea3194a6-76f9-407e-9f60-b9c87f707720︡{"tex":{"tex":"2","display":true}}︡
︠8361d284-7503-4fe3-a057-cbeab80ed6b5︠
E.period_lattice().basis()   # rectangular period lattice
︡bfca4918-0117-48d5-9dce-6b47c1603cd8︡{"tex":{"tex":"\\left(2.49021256085505, 1.97173770155165i\\right)","display":true}}︡
︠bc25cc1c-08b2-409f-820b-d741c3a053ac︠
omega = E.period_lattice().omega(); omega
︡1c580000-a60a-482b-9b4d-4859311dfc19︡{"tex":{"tex":"4.98042512171011","display":true}}︡
︠f693f4d1-4fec-49ef-9269-74a6177cb856︠
c = E.tamagawa_number(389); c
︡695a78a6-ac17-41a0-8b53-757008964be3︡{"tex":{"tex":"1","display":true}}︡
︠9c6134fe-5cc1-4b5c-94c0-3a283ff162c2︠
E.gens()  # rank 2 mw group
︡de0617fd-c13a-4b07-870b-b05ef8114d37︡{"tex":{"tex":"\\left[\\left(-1 : 1 : 1\\right), \\left(0 : 0 : 1\\right)\\right]","display":true}}︡
︠fc6e43c3-ec38-416e-b9f8-2a945273ca98︠
Reg = E.regulator(); Reg
︡a8f279d0-6ee3-4f45-b4c3-10c2608d256d︡{"tex":{"tex":"0.152460177943144","display":true}}︡
︠26c3fcb8-f2d4-4673-bc2b-013fcf60ef4d︠
sha = E.sha().an(); sha   # trivial sha (?) -- we don't know!  we don't know this is even finite!
︡5e78f094-b8f0-40e7-8015-f8e5ed3248aa︡{"tex":{"tex":"1.00000000000000","display":true}}︡
︠11a92b11-b765-4c01-a2af-e25a52fe05d2︠
S = 1
︡07c494d9-0c10-4003-8811-218de8ff5bf4︡
︠8281b044-7175-4221-b4fd-3907cb25a550︠
T = E.torsion_order(); T
︡aa13a753-3d22-4111-a8c2-5d9655a1825a︡{"tex":{"tex":"1","display":true}}︡
︠30e44a8c-ab36-4767-80a6-cea4238fa9ae︠
lstar = L.dokchitser().derivative(1,2)/2; lstar   # second derivative at 1, divided by 2
︡eda020b1-5310-49cc-9e26-8580d750a07d︡{"tex":{"tex":"0.759316500288427","display":true}}︡
︠b30af1a1-141a-4435-b646-793e5195cecd︠
(omega * c * Reg * S) / T^2
︡4beddac8-67eb-4322-b387-bb274cb7b3c2︡{"tex":{"tex":"0.759316500288426","display":true}}︡
︠8ba6fd86-bb91-4e9b-9ab6-9086b0506cc1︠

︠ad8430cf-9a04-4eb7-85a3-6c234c9dfd27︠


︠5b4db196-9087-43bb-b2e0-a95e16485b92i︠



%md
## The curve 5077a of rank 3


︡465093e0-fff9-460f-865b-0dec3d7bfdb7︡{"html":"<h2>The curve 5077a of rank 3</h2>\n"}︡
︠2121db4a-fd1e-40a9-809e-3efb6787ea2d︠
E = EllipticCurve('5077a'); E
︡da8bd549-df6a-4150-a91a-2ea2c0210e0c︡{"tex":{"tex":"y^2 + y = x^{3} - 7 x + 6 ","display":true}}︡
︠6731c42d-29c7-4391-bc58-c2ffb011be61︠
E.rank()
︡1226a51b-f0d9-403b-93f3-8941e82abca4︡{"tex":{"tex":"3","display":true}}︡
︠4a60939b-25ce-4fbd-9e52-748002fe2c3f︠
L = E.lseries(); print(L)
︡2af83195-8c5b-4881-92d2-a53f3cf64343︡{"stdout":"Complex L-series of the Elliptic Curve defined by y^2 + y = x^3 - 7*x + 6 over Rational Field\n"}︡
︠ee615efd-4484-411f-b350-84233133a12c︠
L.taylor_series(1,5)  # r_an = 3
︡4af314ef-bbb3-43ce-90d2-5f60009ea7dd︡{"tex":{"tex":"0.00 + \\left(2.2 \\times 10^{-7}\\right)z + \\left(-4.0 \\times 10^{-7}\\right)z^{2} + 1.8z^{3} - 3.2z^{4} + 2.8z^{5} + O(z^{6})","display":true}}︡
︠d3ee515a-0e68-4af1-b13c-c4adf3903cbe︠
E.analytic_rank()
︡a4b3ceca-1525-477a-bf8a-fb3c4d2c3ebb︡{"tex":{"tex":"3","display":true}}︡
︠7a546380-f744-462b-9ec6-db74c54ad1b0︠
E.period_lattice().basis()   # rectangular period lattice
︡4eeb29c9-598a-469f-85a0-a4318f2e166b︡{"tex":{"tex":"\\left(2.07584399154347, 1.48054826824141i\\right)","display":true}}︡
︠47dd47a9-6ac0-4459-9b5e-ee562ca29cfc︠
omega = E.period_lattice().omega(); omega
︡5184ecbe-d80a-46d3-ad45-a2ba063f4bdc︡{"tex":{"tex":"4.15168798308693","display":true}}︡
︠8958026a-0a4d-44e0-a8b1-6e0ba9598fff︠
c = E.tamagawa_number(5077); c
︡e349b516-68f5-46c1-a93c-2eb61abce25b︡{"tex":{"tex":"1","display":true}}︡
︠4264a145-5485-44c5-9828-f8a787aa6592︠
E.gens()  # rank 2 mw group
︡a383334c-cdc4-42fc-884a-1f8030871f34︡{"tex":{"tex":"\\left[\\left(-2 : 3 : 1\\right), \\left(-1 : 3 : 1\\right), \\left(0 : 2 : 1\\right)\\right]","display":true}}︡
︠5f8be6a9-70b6-4b72-a3bd-c5fa9a4e0892︠
Reg = E.regulator(); Reg
︡f4ef60e8-4a25-45e5-a39a-53829bbd171a︡{"tex":{"tex":"0.417143558758384","display":true}}︡
︠f1cfaa36-3ff2-4db0-a2b7-dcbdabe25b67︠
sha=1  # trivial sha (?) -- we don't know!  we don't know this is even finite!
︡23182d57-b167-40f0-acb5-a1cc62ccac77︡
︠998e2b41-1af7-479e-b03e-9dd47f482c77︠
T = E.torsion_order(); T
︡b5dd78df-086e-4aa7-8803-a7c53876c915︡{"tex":{"tex":"1","display":true}}︡
︠3ff6087d-c8de-4e96-b478-742ebc03fe55︠
lstar = L.dokchitser().derivative(1,3)/factorial(3); lstar   # second derivative at 1, divided by 3!
︡3823bbf1-8b04-47e8-b786-98a1a22c09d1︡{"tex":{"tex":"1.73184990011930","display":true}}︡
︠6264eda3-7e21-4de6-a21a-99a1d56f3625︠
(omega * c * Reg * S) / T^2
︡cf09290f-1375-4a42-a7c4-2c2117c53461︡{"tex":{"tex":"1.73184990011930","display":true}}︡
︠247f6834-bf1c-49f1-8e37-230d62d766ac︠





︠4d3cb623-62af-4ea2-9f2f-cb0bcf23d192i︠



%md
## The rank 0 curve 681b with Sha of order 9
︡e37c5ced-a3b4-48d4-abba-cd5f41158326︡{"html":"<h2>The rank 0 curve 681b with Sha of order 9</h2>\n"}︡
︠7a86b3a8-7056-4360-b082-ecd2be318732︠
factor(681)
︡dd7b4add-13dc-4b67-b2f0-c7e475303de9︡{"tex":{"tex":"3 \\cdot 227","display":true}}︡
︠c2135340-c5ec-4a01-a22f-953df2bd5013︠

E = EllipticCurve('681b'); E
︡03f168f4-e286-4f5c-9ec7-1cda47476780︡{"tex":{"tex":"y^2 + x y = x^{3} + x^{2} - 1154 x - 15345 ","display":true}}︡
︠a44c9ce7-934c-4071-83eb-a42d30b3d163︠
E.rank()
︡cb0edd4f-8550-4e21-a9a8-88f997ac7675︡{"tex":{"tex":"0","display":true}}︡
︠ff0c8cec-5af0-4c5d-b69d-71b34b3c2fe6︠
L = E.lseries(); print(L)
︡b4661dc5-c5a7-49fc-b6fd-53079aecdb32︡{"stdout":"Complex L-series of the Elliptic Curve defined by y^2 + x*y = x^3 + x^2 - 1154*x - 15345 over Rational Field\n"}︡
︠871c661f-4148-4cf7-b470-fc65a7b65c0d︠
L.taylor_series(1)  # r_an = 0
︡374a9567-5be1-40b6-a517-2909416e6262︡{"tex":{"tex":"1.84481520612682 - 1.56198367532152z + 1.27184630002575z^{2} + 0.0355857020468455z^{3} - 1.23910487517717z^{4} + 1.56171745903846z^{5} + O(z^{6})","display":true}}︡
︠c1994575-3262-4d98-8976-0a269ec2ae60︠
E.analytic_rank()
︡0af2dd29-a665-440a-85e8-99a830b88643︡{"tex":{"tex":"0","display":true}}︡
︠a8cc59ef-e4b3-45e2-9690-ae2e0e9f247b︠
E.period_lattice().basis()   # rectangular period lattice, yet again!
︡7327d662-9abc-483c-981c-2fcb010509ee︡{"tex":{"tex":"\\left(0.409958934694849, 0.712395770891159i\\right)","display":true}}︡
︠3ca244c4-7e8b-4643-b3cc-992ce7ac8b2f︠
omega = E.period_lattice().omega(); omega
︡f22bfed9-98c2-4fc2-996e-619d34dd24fe︡{"tex":{"tex":"0.819917869389698","display":true}}︡
︠dd6f02ce-c5dc-4a2a-8ead-4007e202d8d7︠
c3 = E.tamagawa_number(3); c3
c227 = E.tamagawa_number(227); c227
︡2e9d064e-18dd-4912-8ef7-6aad57805dc9︡{"tex":{"tex":"2","display":true}}︡{"tex":{"tex":"2","display":true}}︡
︠dc76c8fc-56c0-4181-8e5a-51015cc84917︠
Reg = 1
︡57ee5d5a-b174-4c9f-b5f2-478070e9d7fe︡
︠cd876175-38f3-4342-9cde-7f862017419f︠
sha = E.sha().an(); sha   # of order 9.
S = 9
︡efc921d1-d4a3-4e4c-a8c7-8c347f4b3dd3︡{"tex":{"tex":"9","display":true}}︡
︠63a8fc30-5699-4aaa-af7b-e8795b6390ca︠
T = E.torsion_order(); T
︡30de05e8-b780-4563-8b55-9c3e2c9c0550︡{"tex":{"tex":"4","display":true}}︡
︠66d10e04-94a5-4c8a-8523-0a4c64c7718c︠
lstar = L(1); lstar
︡1be14c0d-6ce5-471b-979c-17e08bd9b0c1︡{"tex":{"tex":"1.84481520612682","display":true}}︡
︠de0e116f-72ef-4b4b-a741-a8abd27a8e60︠
(omega * c3 * c227 * Reg * S) / T^2
︡f06e97ca-b09b-46a2-810d-fb80e5f49e39︡{"tex":{"tex":"1.84481520612682","display":true}}︡
︠638eff2e-0144-4552-a991-f1916b8ac9f2︠
E.sha().bound()
︡684cea50-ea45-4584-9bbf-de901e7e313f︡{"tex":{"tex":"\\left[2, 3\\right]","display":true}}︡
︠7425daa4-f22f-4071-b5d8-26b13f4af19a︠
EllipticCurve('681c').rank()
︡c46b0800-b8b4-4a08-bd5e-1d2b9d7d13ba︡{"tex":{"tex":"2","display":true}}︡
︠2e572319-d147-49ea-b3f9-246dfc96202d︠
Visibility of Sha.










