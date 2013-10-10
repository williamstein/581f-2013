︠49bcb51c-87d4-46bc-b566-0a6e62c76f90︠
#Set up our number field and define our variables
#Define our variables
R.<x,y,z> = QQ[sqrt(5)][]
#Find morphism from Fermat cubic to a elliptic curve in Weirstrass form
f = EllipticCurve_from_cubic(x^3+y^3-z^3,[1,-1,0]); f
︡7b92d40a-0fb1-4a04-bc42-464ec5b3e0bd︡{"stdout":"Scheme morphism:\n  From: Closed subscheme of Projective Space of dimension 2 over Number Field in sqrt5 with defining polynomial x^2 - 5 defined by:\n  x^3 + y^3 - z^3\n  To:   Elliptic Curve defined by y^2 + 2*x*y + (-1/3)*y = x^3 + (-1)*x^2 + 1/3*x + (-1/27) over Number Field in sqrt5 with defining polynomial x^2 - 5\n  Defn: Defined on coordinates by sending (x : y : z) to\n        (-z : -y + z : -3*x - 3*y)\n"}︡
︠7005aa10-9533-4f91-9136-6fb26bf4578e︠
#Curve sage is says is equivalent to Fermat cubic
E1 = f.codomain(); E1
︡9d722541-c1b6-424a-bd04-014789ba1720︡{"stdout":"Elliptic Curve defined by y^2 + 2*x*y + (-1/3)*y = x^3 + (-1)*x^2 + 1/3*x + (-1/27) over Number Field in sqrt5 with defining polynomial x^2 - 5\n"}︡
︠2bad6993-613b-408e-a967-b52489730501︠
#Curve we want
E2 = EllipticCurve([0,0,1,0,-7]).change_ring(QQ[sqrt(5)]); E2
︡ad324cff-93a1-4fe1-a0b2-1767b0f7565c︡{"stdout":"Elliptic Curve defined by y^2 + y = x^3 + (-7) over Number Field in sqrt5 with defining polynomial x^2 - 5\n"}︡
︠69a817b0-88ff-4529-8e21-97e2e4a4d4ad︠
P2 = ProjectiveSpace(R)
H = P2.Hom(P2)
#f_inv = H([(-1/3)*z+y+x,-x-y,-x]); f_inv
︡455ad8cd-976c-4099-95f2-1f77313d49c8︡{"stdout":"Scheme endomorphism of Projective Space of dimension 2 over Number Field in sqrt5 with defining polynomial x^2 - 5\n  Defn: Defined on coordinates by sending (x : y : z) to\n        (x + y - 1/3*z : -x - y : -x)\n"}︡
︠7afb7bed-eafb-4b34-a43f-8fed42a53be5︠
#Define inverse of f: E1 --> fermat cubic
def f_inv(p):
    return ((-1/3)*p[2]+p[1]+p[0],-p[0]-p[1],-p[0])
︡f2378a66-8fc8-4311-8eaf-b6f8da7fd9e2︡
︠417a79ed-fc33-4dbb-adf4-2e85a712fa09︠
q
︡ab882d60-0d8b-40c9-a619-01f00c7dd67f︡{"stdout":"(2 : -1/2*sqrt5 - 1/2 : 1)\n"}︡
︠f2f22c54-2cb9-44f9-95b0-d78b42ab439d︠
######################List points on fermat cubic####################
#Generator of E2 in ring Q(sqrt(5))
print("Picking a generator on E2")
q = E2.gens()[0]
for i in range(1,4):
    print(str(i)+"q = ")
    q = i*q; q
    print("corresponds to point r on fermat cubic:")
    r = f_inv(g(q)).clear_denominators(); r
    print("double check it is a fermat cubic:")
    r[0]**3+r[1]**3 == r[2]**3
︡85001c0c-c4c0-499c-b694-1670f6866193︡{"stdout":"Picking a generator on E2\n"}︡{"stdout":"1q = \n(2 : -1/2*sqrt5 - 1/2 : 1)\ncorresponds to point r on fermat cubic:\n"}︡{"stderr":"Error in lines 5-11\nTraceback (most recent call last):\n  File \"/mnt/home/uHNlUmEE/.sagemathcloud/sage_server.py\", line 633, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"\", line 5, in <module>\nAttributeError: 'tuple' object has no attribute 'clear_denominators'\n"}︡
︠901a74ac-f079-4ac4-a7b8-99f85a62ac65︠
##############################################################################
#######unnecessary############################################################
##################induced transformation on planar curves#####################
#Define our variables
R.<x,y,z> = QQ[]
#Define the curves in play
C0(x,y) = x^3+y^3-z^3;
C1(x,y) = y^2+2*x*y-1/3*y-x^3+x^2-1/3*x+1/27
C2(x,y) = y^2+y-x^3+7
F(x,y) = x^3+y^3-1
︡7a4b2f47-106d-4057-8a6c-0f596bc19a22︡
︠68197ae9-947b-4957-982f-5a216ed7db49︠
#transformation defined by f_inv
show(729*C1(x = 1/9*x, y = 1/27*y-1/9*x+5/27).expand())
︡d6e836e4-a7e2-4ac2-8cef-3b456322cbf2︡{"tex":{"tex":"-x^{3} + y^{2} + y + 7","display":true}}︡
︠a31f0dc3-bfc8-422d-aac3-905ce45f1683︠
#EXAMPLE point
#(a,b) is a point on E2
(a,b) = (2,-1/2*sqrt(5)-1/2)
︡82c870a0-2804-4e89-bc31-ee70a81fbc07︡
︠0cdae456-6a68-409d-847d-9fbe36de9478︠
C2(a,b).is_zero()
︡cfa0353b-1438-497f-81b6-4eae03bb8eb8︡{"stdout":"True\n"}︡
︠da5644bc-0cc5-42cd-a8ec-178666d375ea︠
#(c,d) is on E1
(c,d) = (1/9*a, 1/27*b-1/9*a+5/27)
︡3d90780b-a73e-4fb6-a77f-a64864b4be85︡
︠11b6b972-ab7b-47dc-bd22-ec525b99dfef︠
C1(c,d).is_zero()
︡1b573866-93f1-4bd5-9247-dc7d5f009a0d︡{"stdout":"True\n"}︡
︠c97f1b86-4928-4138-b7d6-32b99f67bf2a︠
#(u,v) is on the Fermat cubic
(u,v) = (1/(3*c)-d/c-1,1+d/c)
︡f5e28e7d-7431-455f-b67f-401850d4f222︡
︠f66c240f-f094-4933-8d57-cf15848dabfe︠
F(u,v).is_zero()
︡e060a2d7-47c1-442a-83b3-6b4a95bc6aef︡{"stdout":"True\n"}︡
︠e049730b-aa7f-42fc-b359-4d496a22967b︠
show((x^3*F(x = 1/(3*x)-y/x-1,y = 1+y/x)).expand())
︡d4ba040f-fbcd-4d24-a355-c4176093f760︡{"tex":{"tex":"-x^{3} + x^{2} + 2 \\, x y + y^{2} - \\frac{1}{3} \\, x - \\frac{1}{3} \\, y + \\frac{1}{27}","display":true}}︡
︠d38d8483-a296-4eda-bd64-2f1dd9fbb873︠
show(C1)
︡4453c920-ebf0-46f0-acf7-ac76b2344809︡{"tex":{"tex":"\\left( x, y \\right) \\ {\\mapsto} \\ -x^{3} + x^{2} + 2 \\, x y + y^{2} - \\frac{1}{3} \\, x - \\frac{1}{3} \\, y + \\frac{1}{27}","display":true}}︡
︠a944090e-ad0f-482d-b209-6778d9e20a2d︠
def h(x,y) : return (-(y+5)/(3*x)+3/x,(y+5)/(3*x))
h_sym(x,y) = (-(y+5)/(3*x)+3/x,(y+5)/(3*x))
def H(p): return (h(x=p[0],y=p[1])[0],h(x=p[0],y=p[1])[1])
︡ba47ffbb-41d1-4752-ae30-1042794a54de︡
︠22602a7f-cc67-49f1-988d-9b69dbf5a71b︠
show(h_sym)
︡63c420ea-ca7e-4b86-accf-c82e9d628836︡{"tex":{"tex":"\\left( x, y \\right) \\ {\\mapsto} \\ \\left(-\\frac{y + 5}{3 \\, x} + \\frac{3}{x},\\,\\frac{y + 5}{3 \\, x}\\right)","display":true}}︡
︠eadd1e0c-3d3f-4608-a0e0-c16ef973ecee︠
show((F(x = h(x,y)[0],y = h(x,y)[1])).expand())
︡346d8162-72dc-4190-bc90-bf6e174cf952︡{"tex":{"tex":"\\frac{y^{2}}{x^{3}} + \\frac{y}{x^{3}} + \\frac{7}{x^{3}} - 1","display":true}}︡
︠6008a8fc-28e2-49c3-b8a2-9d9136bc8586︠


show((1/729)*C2(x = 9*x,y = y*27-x*27-5).expand())
︡85ca8c87-242a-4965-a6a0-38136df710ae︡{"tex":{"tex":"-x^{3} + x^{2} - 2 \\, x y + y^{2} + \\frac{1}{3} \\, x - \\frac{1}{3} \\, y + \\frac{1}{27}","display":true}}︡
︠2791edde-28ea-422e-be9d-051045b08b35i︠
show(C1)
#Finding points on Fermat's Cubic
p = E2.change_ring(QQ[sqrt(5)]).gens()[0]; p
︡67c00410-7b21-4d5c-ad33-2c14ce8aad69︡{"tex":{"tex":"\\left( x, y \\right) \\ {\\mapsto} \\ -x^{3} + x^{2} + 2 \\, x y + y^{2} - \\frac{1}{3} \\, x - \\frac{1}{3} \\, y + \\frac{1}{27}","display":true}}︡{"stdout":"(2 : -1/2*sqrt5 - 1/2 : 1)"}︡{"stdout":"\n"}︡
︠9e730eb7-7148-4a8d-b42a-06afbc8fdd4d︠
H(p.dehomogenize(2))
︡3df2e528-5c4e-425b-b10c-af5d4d8daa2b︡{"stdout":"(1/12*sqrt5 + 3/4, -1/12*sqrt5 + 3/4)\n"}︡
︠6915b800-93d5-445a-ac61-c24db2fd70a2︠
p = E2.change_ring(QQ[sqrt(5)]).gens()[0];
for i in range(1,4):
    print("Generator * "+str(i))
    print(p.dehomogenize(2))
    print("Converted to Fermat cubic:")
    print(H(p.dehomogenize(2)))
    print("testing fermat solu:")
    print((H(p.dehomogenize(2))[0]**3 + H(p.dehomogenize(2))[1]**3 - 1) == 0)
    p = p+p
︡72b2d19d-37ca-463f-8b66-b8c232a13e35︡{"stdout":"Generator * 1\n(2, -1/2*sqrt5 - 1/2)\nConverted to Fermat cubic:\n(1/12*sqrt5 + 3/4, -1/12*sqrt5 + 3/4)\ntesting fermat solu:\nTrue\nGenerator * 2\n(124/5, 2761/50*sqrt5 - 1/2)\nConverted to Fermat cubic:\n(-2761/3720*sqrt5 + 15/248, 2761/3720*sqrt5 + 15/248)\ntesting fermat solu:\nTrue\nGenerator * 3\n(237258376/38115605, 7206070204127/1052371854050*sqrt5 - 1/2)\nConverted to Fermat cubic:\n(-7206070204127/19652111284080*sqrt5 + 114346815/474516752, 7206070204127/19652111284080*sqrt5 + 114346815/474516752)\ntesting fermat solu:\nTrue\n"}︡
︠f21288f7-b550-4eca-ac22-64e04538e50b︠









