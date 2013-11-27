︠c8d1c6df-7d3b-4bb4-88a4-3886641720e3︠
list(cremona_curves([43]))
︡114276dd-a000-42a9-a5b1-f35a04b229b6︡{"stdout":"[Elliptic Curve defined by y^2 + y = x^3 + x^2 over Rational Field]"}︡{"stdout":"\n"}︡
︠18d56c98-5fa0-4a18-bdb9-1ba0749f7f38︠
%var u,v
sigma = matrix(2,[0,-1,1,0])
tau   = matrix(2,[1,-1,1,0])
x = vector([u,v])
print "x*sigma = ", x*sigma
print "x*tau = ", x*tau
print "x*tau^2 = ", x*tau^2
︡3ef4ea64-e358-4aa3-bfb9-c2c26f9aa895︡{"stdout":"x*sigma =  (v, -u)\n"}︡{"stdout":"x*tau =  (u + v, -u)\n"}︡{"stdout":"x*tau^2 =  (v, -u - v)\n"}︡
︠f4015a3c-b242-4256-8511-d2d7fd953e72︠
M = ModularSymbols(43); M.basis()
︡54311dd7-fa64-43dc-bdda-8ce8b0068feb︡{"stdout":"((1,0), (1,31), (1,32), (1,38), (1,39), (1,40), (1,41))\n"}︡
︠3881505b-5ddd-40e5-a512-d60071862c11︠
M( (1,0) )
︡854f2164-0e42-4f37-b6d9-456893fec5d6︡{"stdout":"(1,0)\n"}︡
︠434789dd-ae06-4fb6-8d4d-1a8879e2c575︠
M( (2,3) )
︡ac86c286-cadc-4e05-8b05-2f5f10ba1487︡{"stdout":"(1,40) - (1,41)\n"}︡
︠2234fade-a769-40ac-bed6-695d927223d3︠
T2 = M.hecke_operator(2); T2.matrix()
︡e33858f1-d13d-4f9f-8472-0efec92a0585︡{"stdout":"[ 3  0  0  0  0  0 -1]\n[ 0 -2  1  0  0  0  0]\n[ 0 -1  1  1  0 -1  0]\n[ 0 -1  0 -1  2 -1  1]\n[ 0 -1  0  1  1 -1  1]\n[ 0  0 -2  0  2 -2  1]\n[ 0  0 -1  0  1  0 -1]\n"}︡
︠d864e03d-2695-4ed7-857c-9fd4038660cc︠
latex(T2.matrix())
︡b2cb9cea-b62f-4294-b592-cab697ed611d︡{"stdout":"\\left(\\begin{array}{rrrrrrr}\n3 & 0 & 0 & 0 & 0 & 0 & -1 \\\\\n0 & -2 & 1 & 0 & 0 & 0 & 0 \\\\\n0 & -1 & 1 & 1 & 0 & -1 & 0 \\\\\n0 & -1 & 0 & -1 & 2 & -1 & 1 \\\\\n0 & -1 & 0 & 1 & 1 & -1 & 1 \\\\\n0 & 0 & -2 & 0 & 2 & -2 & 1 \\\\\n0 & 0 & -1 & 0 & 1 & 0 & -1\n\\end{array}\\right)\n"}︡
︠883d23c3-a41d-41e9-81ae-f21f7360e19f︠
T2.charpoly().factor()
︡c97db5df-2cb8-4173-b417-2f27f693d202︡{"stdout":"(x - 3) * (x + 2)^2 * (x^2 - 2)^2"}︡{"stdout":"\n"}︡
︠0b614570-3a24-4df3-8704-8b43e05535b5︠
latex(_)
︡5a983dac-3f63-44f2-9efc-246d38a9b79e︡{"stdout":"(x - 3) \\cdot (x + 2)^{2} \\cdot (x^{2} - 2)^{2}\n"}︡
︠ecc3fe39-70f3-4068-8bec-41632106d859︠
EisensteinForms(43,2).basis()[0].q_expansion(prec=10)*(7/4)
︡d21b587f-48b6-4fef-bc62-f06cd105f3b6︡{"stdout":"7/4 + q + 3*q^2 + 4*q^3 + 7*q^4 + 6*q^5 + 12*q^6 + 8*q^7 + 15*q^8 + 13*q^9 + O(q^10)\n"}︡
︠af7f8f2c-70ec-4c3e-9f18-303249d4d991︠
latex(_)
︡d19ad2ea-ff7a-4392-a152-aa3903d1ee96︡{"stdout":"\\frac{7}{4} + q + 3q^{2} + 4q^{3} + 7q^{4} + 6q^{5} + 12q^{6} + 8q^{7} + 15q^{8} + 13q^{9} + O(q^{10})\n"}︡
︠41e122e8-076f-453c-97e1-f503671e9ea7︠
S = CuspForms(43,2); D = S.newforms(names='a')
for f in D:
    print latex(f)
︡855c5409-ea16-4833-b931-f2e4e5ce3380︡{"stdout":"q - 2q^{2} - 2q^{3} + 2q^{4} - 4q^{5} + O(q^{6})\nq + a_{1}q^{2} - a_{1}q^{3} + \\left(-a_{1} + 2\\right)q^{5} + O(q^{6})\n"}︡
︠4254bb89-4899-4f9c-a0fb-4b45174a815a︠
D[1].base_ring()
︡9fc3e64e-c6a3-4874-89d7-6e222e3b8815︡{"stdout":"Number Field in a1 with defining polynomial x^2 - 2\n"}︡
︠a1f3ef52-bac5-4f2a-9ee5-b9d9fea0c8f0︠
V = (T2+2).kernel()
[V.hecke_matrix(n)[0,0] for n in [1..6]]
︡e63f97d6-9834-4f94-8f35-8a3c5bbc80e9︡{"stdout":"[1, -2, -2, 2, -4, 4]\n"}︡
︠165a1f89-d301-451f-8e92-8440b189d1df︠
xgcd(43,2)
︡f7935840-74dd-445d-81a0-6be9f1c05a1f︡{"stdout":"(1, 1, -21)\n"}︡
︠4256e337-deba-46e2-a5df-233ec441c694︠
gamma = matrix(2,[-21,-1,43,2]); gamma
︡544a37d1-37bc-48ff-9716-f43d9338ca92︡{"stdout":"[-21  -1]\n[ 43   2]\n"}︡
︠e7b7b764-21bf-4b69-a3b5-00f915f0b648︠
latex(gamma)
︡98452d9e-eb0a-421a-b115-0c5324b236b5︡{"stdout":"\\left(\\begin{array}{rr}\n-21 & -1 \\\\\n43 & 2\n\\end{array}\\right)\n"}︡
︠a967ce90-6ff0-46d7-b86c-070b723acc72︠
V = (T2+2).kernel()
an = [0] + [V.hecke_matrix(n)[0,0] for n in [1..100]]  # [0] so an[n] = a_n
︡5d016d97-f975-4f7e-96de-a7a0ebe8fe97︡
︠1f92109c-1abe-4bae-82c1-6852d6a84319︠
an
︡fbc0343e-0ed3-4106-9a10-f0ad97f703a6︡{"stdout":"[0, 1, -2, -2, 2, -4, 4, 0, 0, 1, 8, 3, -4, -5, 0, 8, -4, -3, -2, -2, -8, 0, -6, -1, 0, 11, 10, 4, 0, -6, -16, -1, 8, -6, 6, 0, 2, 0, 4, 10, 0, 5, 0, -1, 6, -4, 2, 4, 8, -7, -22, 6, -10, -5, -8, -12, 0, 4, 12, -12, 16, 2, 2, 0, -8, 20, 12, -3, -6, 2, 0, 2, 0, 2, 0, -22, -4, 0, -20, -8, 16, -11, -10, 15, 0, 12, 2, 12, 0, -4, 8, 0, -2, 2, -8, 8, -16, 7, 14, 3, 22]\n"}︡
︠8991a362-7435-465b-9b12-b10301bdd8be︠
alpha = I
gamma_alpha = (-21*I - 1)/(43*I + 2); gamma_alpha
︡9281d8b4-8d50-42bf-b411-081c7db010b1︡{"stdout":"1/1853*I - 905/1853\n"}︡
︠9bfae767-e887-43b9-b2a3-546187274a9c︠
latex(gamma_alpha)
︡e759f107-d7fe-451e-81c6-b1a1eae3718c︡{"stdout":"\\frac{1}{1853} i - \\frac{905}{1853}\n"}︡
︠6f0d83ca-8c29-4527-b625-7ac22ddd6d12︠
sum(float(an[n]/n * exp(-2*pi*n)) for n in [1..100])
︡eb740c85-ccc9-421c-82ac-bdf460deb13c︡{"stdout":"0.0018639510538063274\n"}︡
︠a824f225-bd8f-47a5-b43c-43ae6b69b5c3︠

︠2866ce8c-8795-41b8-8c03-90320f03a2bc︠
sum(float(an[n]/n * exp(-2*pi*n)) for n in [1..98])
︡eb13a09d-5509-41c0-bfa5-f51272867901︡{"stdout":"0.0018639510538063274\n"}︡
︠50830408-5424-4ffb-9264-cef3797784f2︠
N(exp(-2*pi*100))
︡bebecb14-32e2-40e4-b3d3-6894f558e014︡{"stdout":"1.33269028440223e-273\n"}︡
︠a04798ab-0111-43eb-a317-d83db7126b20︠

latex(I*gamma_alpha)
︡3dcb5ab8-3bb1-4d72-b8ea-d31ce46c822e︡{"stdout":"-\\frac{905}{1853} i - \\frac{1}{1853}\n"}︡
︠3478f172-d04b-48bc-82a5-b5baf490be67︠
sum(N(an[n]/n * exp(2*pi*I*n*gamma_alpha)) for n in [1..98])
︡02cb114b-000c-4c55-880e-70f9912a6136︡{"stdout":"0.0310143243639948 - 0.456549138695170*I"}︡{"stdout":"\n"}︡
︠8a231e04-eb2f-47ed-a837-f5f3a911490c︠
sum(N(an[n]/n * exp(2*pi*I*n*gamma_alpha)) for n in [1..100])
︡68afcb46-3a5b-4db8-a649-f253d22d6b15︡{"stdout":"0.101885056683999 - 0.341485442894801*I"}︡{"stdout":"\n"}︡
︠96517c15-35a4-4020-b52d-9cc2f3f8bd40︠
V = (T2+2).kernel()
an = [0] + [V.hecke_matrix(n)[0,0] for n in [1..500]]  # [0] so an[n] = a_n
︡beb2c258-db15-47ed-aa35-d5c051d38c9d︡
︠2dd3807d-2cf8-4389-8a6d-36359daf3b91︠
sum(N(an[n]/n * exp(2*pi*I*n*gamma_alpha)) for n in [1..490])
︡69ee8875-b3e4-449d-83d0-074fdd0685cc︡{"stdout":"0.00143420390231671 - 0.0184167015015928*I"}︡{"stdout":"\n"}︡
︠0a216c6e-07c7-42bb-a8ac-e20bb496f855︠
sum(N(an[n]/n * exp(2*pi*I*n*gamma_alpha)) for n in [1..500])
︡ceb9e281-52cf-4e5f-a1a6-cf4222ae153f︡{"stdout":"0.00371581049862526 - 0.0130067020614214*I"}︡{"stdout":"\n"}︡
︠cac749e4-218d-4031-968e-ef37b038ede0︠
N(exp(2*pi*I*gamma_alpha*2000))
︡67e9e080-27b0-4c55-a326-64348e4a60ec︡{"stdout":"0.000312297661686191 + 0.00109058443661966*I\n"}︡
︠01800e04-2cf1-456d-ba0c-0886534dad43︠
latex(_)
︡623f4091-385d-4970-91c5-7f846b38a8bb︡{"stdout":"0.000312297661686191 + 0.00109058443661966i\n"}︡
︠6ee20748-2067-4076-a682-caa0303329d4︠
V = (T2+2).kernel()
an = [0] + [V.hecke_matrix(n)[0,0] for n in [1..2000]]  # [0] so an[n] = a_n
︡e8324ce7-d865-4dc4-ad7f-b82143d2f091︡
︠2b015a30-45ed-44b9-bd10-794acc375d6d︠
sum(N(an[n]/n * exp(2*pi*I*n*gamma_alpha)) for n in [1..2000])
︡8b120679-0949-4e09-9b87-215f8d4ed853︡{"stdout":"0.00213843650496767 - 0.000422376254514594*I"}︡{"stdout":"\n"}︡
︠fb72d44f-8ecd-464c-af55-e6b90d124382︠
sum(N(an[n]/n * exp(2*pi*I*n*gamma_alpha)) for n in [1..1999])
︡e8e15d3a-64ae-4e88-903e-eeb3b6463b7e︡{"stdout":"0.00212344621720673 - 0.000474724307472338*I"}︡{"stdout":"\n"}︡
︠35a3d6c1-f4b5-4f5b-a38e-0f4880ed5b0e︠
0.00213843650496767 - 0.000422376254514594*I - 0.0018639510538063274
︡986ccb5d-f642-46cb-acd6-4797686dd851︡{"stdout":"0.000274485451161343 - 0.000422376254514594*I\n"}︡
︠534ab002-f0ea-41fb-a84e-bd34c813c7ed︠
EllipticCurve('43a').period_lattice().basis()
︡253de36c-2aff-4893-ac4e-b12264efd297︡{"stdout":"(5.46868952996758, 2.73434476498379 + 1.36318241817043*I)"}︡{"stdout":"\n"}︡
︠d24840cb-a6be-4ee9-b06a-ec6ae6f23fef︠
an[2]
︡288cf85c-78df-4259-ae7b-375e42206426︡{"stdout":"-2\n"}︡
︠a7f9e0b0-37c4-4cec-abf0-aee210922149︠
M([0,-1/2])
︡d064e06d-a0b3-43fe-ad70-abc48e57e8c6︡{"stdout":"-(1,41)\n"}︡
︠112201b1-f589-47ca-a326-43c3cca53995︠
phi = M.cuspidal_submodule().decomposition()[0].rational_period_mapping()
︡f4f2c6aa-ab22-4400-82d6-b9644f61fde0︡
︠80697c7a-0ee3-4d28-9186-f95e5de0cd38︠
phi(M([0,-1/2]))
︡26c522c1-b8bd-4b62-8062-488acd09562e︡{"stdout":"(0, 0)\n"}︡
︠cf47c6bb-c30a-40ac-80c9-2f307f070da0︠









