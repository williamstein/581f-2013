︠cf6ccb80-bba4-43eb-b7e3-07e286b5c39e︠
E = EllipticCurve('11a')
E
︡86856b2b-4b90-44a5-9f76-86979bc53793︡{"stdout":"Elliptic Curve defined by y^2 + y = x^3 - x^2 - 10*x - 20 over Rational Field\n"}︡
︠79a43fab-b8ba-4f46-859d-353c5f19a793︠
show(E)
︡e8dbddd4-adfb-4319-9fe4-36d1019124d9︡{"tex":{"tex":"y^2 + y = x^{3} -  x^{2} - 10 x - 20 ","display":true}}︡
︠ba727f76-7995-40b8-8bde-79c779818dba︠
E.change_ring(GF(2)).points()
︡cf99a5a0-3d4f-4f7c-b49f-b50037e2d26d︡{"stdout":"[(0 : 0 : 1), (0 : 1 : 0), (0 : 1 : 1), (1 : 0 : 1), (1 : 1 : 1)]"}︡{"stdout":"\n"}︡
︠cb547049-0617-46ea-9a23-b6d0b3496472︠
points([(P[0],P[1]) for P in E.change_ring(GF(97)).points() if P[2]], size=100)

︡065b6751-4919-469c-8403-4912e4b0b21a︡{"once":false,"file":{"show":true,"uuid":"77eb8fab-f264-4b73-bf74-7f3b7110309f","filename":"/mnt/home/uHNlUmEE/.sage/temp/compute1a/4143/tmp_Mw1YY6.png"}}︡
︠20a0a82b-2e4f-44f7-af3b-dfe54af8c232︠
97 + 1 - E.change_ring(GF(97)).cardinality()
︡7edb80c6-3e6e-447c-ad34-224ed3e9c2be︡{"stdout":"-7\n"}︡
︠02dc50ba-92cc-456b-a9b6-7ff414eeaae0︠
E.aplist(100)
︡5878ba81-d29b-4fe3-b604-2d37c8fdc969︡{"stdout":"[-2, -1, 1, -2, 1, 4, -2, 0, -1, 0, 7, 3, -8, -6, 8, -6, 5, 12, -7, -3, 4, -10, -6, 15, -7]\n"}︡
︠ed4f7cc3-bf0c-432b-adb7-68c20ccb6899i︠
%md
# Modular symbols
︡204e0aa7-1a3f-440e-b19a-65fdf351c532︡{"html":"<h1>Modular symbols</h1>\n"}︡
︠3e35a541-80c4-4bca-b3ce-b065e8cdcc60︠
M = ModularSymbols(11); M
︡4c951ff8-2d71-4836-b3d5-1c9e785a5043︡{"stdout":"Modular Symbols space of dimension 3 for Gamma_0(11) of weight 2 with sign 0 over Rational Field\n"}︡
︠438becc2-88bb-4c0a-b294-d947ee9248b0︠
M.basis()
︡258fc64d-7e4c-4a6a-a2cd-3ad3101c5866︡{"stdout":"((1,0), (1,8), (1,9))\n"}︡
︠b1d6e14c-abab-4a5f-ac28-05f2624bce94︠
for x in M.basis():
    print x.modular_symbol_rep()
︡9be6f753-fc76-47ef-8b4b-adf5e5b10e6c︡{"stdout":"{Infinity, 0}\n{-1/8, 0}\n{-1/9, 0}\n"}︡
︠9676daf9-1d84-4563-9157-c0c0783d3f53︠
T2 = M.hecke_operator(2); T2
︡fa8994b7-38cd-4fbd-bbfb-dc3558ff1ddb︡{"stdout":"Hecke operator T_2 on Modular Symbols space of dimension 3 for Gamma_0(11) of weight 2 with sign 0 over Rational Field\n"}︡
︠ba70b1fe-3e3f-475d-b449-c55a8babdc1a︠
T2.matrix()
︡797e7e7a-f2f7-4660-9a4a-79d1d117b3d1︡{"stdout":"[ 3  0 -1]\n[ 0 -2  0]\n[ 0  0 -2]\n"}︡
︠7f1208a0-47fb-4c75-b6c7-9799ddd92e2b︠
S = M.cuspidal_submodule(); S
︡e41df223-c383-43fc-a31b-7144b2d1ac4f︡{"stdout":"Modular Symbols subspace of dimension 2 of Modular Symbols space of dimension 3 for Gamma_0(11) of weight 2 with sign 0 over Rational Field\n"}︡
︠d9ec9367-c960-4a4a-9b68-62b0e51655a9︠
S.module()
︡59926fc9-c28f-4f6e-a595-a30da1422dac︡{"stdout":"Vector space of degree 3 and dimension 2 over Rational Field\nBasis matrix:\n[0 1 0]\n[0 0 1]\n"}︡
︠a6821632-ae08-41a1-bc40-12e239662c7c︠
[S.hecke_matrix(p)[0,0] for p in primes(100)]
︡99355ba2-c8c2-40af-aff3-ebc6d41eede8︡{"stdout":"[-2, -1, 1, -2, 1, 4, -2, 0, -1, 0, 7, 3, -8, -6, 8, -6, 5, 12, -7, -3, 4, -10, -6, 15, -7]\n"}︡
︠b3aaac7e-767e-428a-b5cd-7321d7724239︠
E.aplist(100)
︡c0544f9f-8d70-41ba-8037-d3faddef34ff︡{"stdout":"[-2, -1, 1, -2, 1, 4, -2, 0, -1, 0, 7, 3, -8, -6, 8, -6, 5, 12, -7, -3, 4, -10, -6, 15, -7]\n"}︡
︠bb952742-3384-42fa-9375-9257981257a4︠

X = SupersingularModule(11); X
︡08e1bba7-aba0-43e7-b866-7cfd4509b890︡{"stdout":"Module of supersingular points on X_0(1)/F_11 over Integer Ring"}︡{"stdout":"\n"}︡
︠b29533d1-9cbb-4591-9100-b295a7475709︠
X.supersingular_points()
︡4bac4cb5-7d21-4954-95b1-fd70e6ed3975︡{"stdout":"([1, 0], {0: 1, 1: 0})"}︡{"stdout":"\n"}︡
︠879850ba-f2a5-41b9-b4eb-fe6d9f00b43b︠
X.hecke_matrix(2).charpoly().factor()
︡0b331b10-0469-4b7a-af33-f11ea60c61ee︡{"stdout":"(x - 3) * (x + 2)\n"}︡
︠8fdd89b6-99e2-408a-85d1-278fe81096c6︠
X.hecke_matrix(3).charpoly().factor()
︡04e9c4c4-1ccf-44a2-8568-422d316fac64︡{"stdout":"(x - 4) * (x + 1)\n"}︡
︠0f4a302f-2339-40e2-8948-89f49e433afb︠
E.ap(3)
︡eada5676-4f46-47b9-8efa-a91387ff79a2︡{"stdout":"-1\n"}︡
︠2803345b-c8d5-4b0b-a4b8-ea495a8ca4ee︠
for N in primes(100):
    X = SupersingularModule(N)
    print N, X.supersingular_points()[0]
︡812e6c28-3841-4484-b05b-7645caf2f0d9︡{"stdout":"2 [0]\n3 [0]\n5 [0]\n7 [6]\n11 [1, 0]\n13 [5]\n17 [0, 8]\n19 "}︡{"stdout":"[18, 7]\n23 [3, 19, 0]\n29 [25, 2, 0]\n31 [23, 2, 4]\n37 [8, 27*a + 23, 10*a + 20]\n41 [0, 3, 32, 28]\n43 "}︡{"stdout":"[8, 41, 39*a + 14, 4*a + 10]\n47 [36, 44, 0, 10, 9]\n53 [50, 44*a + 46, 9*a + 10, 46, 0]\n59 [17, 48, 28, 15, 0, 47]\n61 "}︡{"stdout":"[9, 41*a + 52, 20*a + 32, 50, 41]\n67"}︡{"stdout":" [53, 66, 37*a + 38, 30*a + 52, 35*a + 60, 32*a + 66]\n71 [24, 17, 41, 40, 66, 0, 48]\n73 [9, 56, 72*a + 4, a + 1, 22*a + 48, 51*a + 41]\n79 "}︡{"stdout":"[69, 15, 64, 21, 56*a + 44, 23*a + 21, 17]\n83 [68, 67, 54*a + 11, 29*a + 65, 17, 50, 0, 28]\n89 [0, 66, 70*a + 9, 19*a + 54, 13, 6, 52, 7]\n97 "}︡{"stdout":"[1, 20, 81*a + 84, 16*a + 68, 20*a + 35, 77*a + 55, 12*a + 75, 85*a + 87]\n"}︡
︠25d158fe-0b1e-467f-84f8-65f439124dd6︠



sigma = matrix(2,[0,-1,1,0])
tau = matrix(2,[1,-1,1,0])
sigma^4
tau^6
︡bfb7c6f0-20b9-4a31-9cd8-15f7bf951a3c︡{"stdout":"[1 0]\n[0 1]\n"}︡{"stdout":"[1 0]\n[0 1]\n"}︡
︠cba24e19-2373-4925-be91-b146ce2c2e75︠









