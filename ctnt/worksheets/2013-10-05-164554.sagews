︠2df3b8ed-51a3-4103-b3a4-edaf5960b9f5︠
#########################
#Declare our number field
QQ[sqrt(5)]
︡4ffb883d-832a-4f98-b32f-9587326b148f︡{"stdout":"Number Field in sqrt5 with defining polynomial x^2 - 5\n"}︡
︠132f6d5c-2b39-4a1d-80c9-0c5cd043b500︠
#Define our variables
R.<x,y,z> = QQ[]
︡9c4285fe-99d3-41b9-8720-a4eb8c2d3dda︡
︠67924b62-4b9d-4990-8a08-4b7d18139364︠
#Define the Fermat Cubic
C0 = x^3+y^3-z^3;
︡66d72e53-1324-4258-9613-33284fa03fdd︡
︠49bcb51c-87d4-46bc-b566-0a6e62c76f90︠
#Find a point on C0
p = [1,-1,0];
︡bdd373c1-bac6-4c6d-930a-f63b9b5487e4︡
︠44935f92-6ebb-43dc-b9af-dfde5c0c8bab︠
#Find morphism from Fermat cubic to a elliptic curve in Weirstrass form
f = EllipticCurve_from_cubic(C0, p); f
︡f50f696d-cc41-4336-883c-ff2d10f03553︡{"stdout":"Scheme morphism:\n  From: Closed subscheme of Projective Space of dimension 2 over Rational Field defined by:\n  x^3 + y^3 - z^3\n  To:   Elliptic Curve defined by y^2 + 2*x*y - 1/3*y = x^3 - x^2 + 1/3*x - 1/27 over Rational Field\n  Defn: Defined on coordinates by sending (x : y : z) to\n        (-z : -y + z : -3*x - 3*y)\n"}︡
︠7c269563-0a4a-44d1-a77e-d64bb73b2613︠
#Curve sage is says is equivalent to Fermat cubic
E1 = f.codomain(); E1
︡d410ab5f-445d-4aff-9253-f8417b7bbff5︡{"stdout":"Elliptic Curve defined by y^2 + 2*x*y - 1/3*y = x^3 - x^2 + 1/3*x - 1/27 over Rational Field\n"}︡
︠2bad6993-613b-408e-a967-b52489730501︠
#Curve we want
E2 = EllipticCurve([0,0,1,0,-7]); E2
︡3dc054c9-0d40-42b2-83c6-c507520f5c5c︡{"stdout":"Elliptic Curve defined by y^2 + y = x^3 - 7 over Rational Field\n"}︡
︠efc83020-50e3-414f-996b-978b12887bf7︠
#Isomorphism from E1 --> E2
g = E1.isomorphism_to(E2); g
︡4ae3f633-5db8-4f76-800f-0030188b1cd8︡{"stdout":"Generic morphism:\n  From: Abelian group of points on Elliptic Curve defined by y^2 + 2*x*y - 1/3*y = x^3 - x^2 + 1/3*x - 1/27 over Rational Field\n  To:   Abelian group of points on Elliptic Curve defined by y^2 + y = x^3 - 7 over Rational Field\n  Via:  (u,r,s,t) = (1/3, 0, -1, 5/27)\n"}︡
︠50e9807b-9890-4f30-8b5d-d2bed18aefe4︠
#Inverse from E2 --> E1
g_inv = g^(-1); g_inv
︡9f22fc59-a550-407d-a969-584457f74e7a︡{"stdout":"Generic morphism:\n  From: Abelian group of points on Elliptic Curve defined by y^2 + y = x^3 - 7 over Rational Field\n  To:   Abelian group of points on Elliptic Curve defined by y^2 + 2*x*y - 1/3*y = x^3 - x^2 + 1/3*x - 1/27 over Rational Field\n  Via:  (u,r,s,t) = (3, 0, 3, -5)\n"}︡
︠cb9600ed-94d7-45fb-aba1-453501285c6b︠
#Define inverse of f, E1 --> fermat cubic
def f_inv(p):
    return ((-1/3)*p[2]+p[1]+p[0],-p[0]-p[1],-p[0])
︡f8bf3b4a-b1ef-4d47-9466-c0419d757a29︡
︠0c85adf3-0e17-4019-acc3-47ed23edd82f︠
#Generator of E2 in ring Q(sqrt(5))
q = E2.change_ring(QQ[sqrt(5)]).gens()[0]; q
︡6b002a45-0a17-406e-840b-a9e3d8439a3a︡{"stdout":"(2 : -1/2*sqrt5 - 1/2 : 1)"}︡{"stdout":"\n"}︡
︠93bbc94b-4d58-44e3-8044-09983c1fb806︠
#Pull point q back to fermat cubic
r = g_inv(q); r
︡eae3cf54-dbe7-4d87-8987-ed3f3ed6887d︡{"stdout":"(2/9 : -1/54*sqrt5 - 1/18 : 1)\n"}︡
︠57a42e8a-d19d-411e-94f5-30990f4e9b55︠
r = [2/9,-1/54*sqrt(5)-1/18,1]
︡57d5fa06-5fa1-48ee-a3ea-990d73c283b0︡
︠a448b7b2-a27f-47eb-8bd5-6e45b4b9886e︠
r = f_inv(r); r
︡f337e0b5-f832-48a4-bc83-4a30b8bd7983︡{"stdout":"(-1/54*sqrt(5) - 1/6, 1/54*sqrt(5) - 1/6, -2/9)\n"}︡
︠cad46e78-2c3c-442b-b27e-9d952ead5ca9︠
#Double check r is on fermat cubic
(r[0]**3+r[1]**3-r[2]**3).is_zero()
︡7bcc118e-6dd8-4014-8347-ceec5ebf0712︡{"stdout":"True\n"}︡
︠20c6040a-c8aa-4cfe-a91c-3911eaa05602︠
C1(x,y) = y^2+2*x*y-1/3*y-x^3+x^2-1/3*x+1/27
C2(x,y) = y^2+y-x^3+7
F(x,y) = x^3+y^3-1
︡cd573b02-729b-4369-bc38-3e05b1c75458︡
︠68197ae9-947b-4957-982f-5a216ed7db49︠
#transformation defined by f_inv
show(729*C1(x = 1/9*x, y = 1/27*y-1/9*x+5/27).expand())
︡c31c1940-f28e-42aa-9073-58391af6b7da︡{"tex":{"tex":"-x^{3} + y^{2} + y + 7","display":true}}︡
︠a31f0dc3-bfc8-422d-aac3-905ce45f1683︠
#EXAMPLE point
#(a,b) is a point on E2
(a,b) = (2,-1/2*sqrt(5)-1/2)
︡7dfce424-dbd5-4f62-baf6-efaf46655671︡
︠0cdae456-6a68-409d-847d-9fbe36de9478︠
C2(a,b).is_zero()
︡53c84288-cf9e-4c11-b271-bd2254a32e8a︡{"stdout":"True\n"}︡
︠da5644bc-0cc5-42cd-a8ec-178666d375ea︠
#(c,d) is on E1
(c,d) = (1/9*a, 1/27*b-1/9*a+5/27)
︡1b3304ef-ffc8-4896-9fb2-d9a5b287a3df︡
︠11b6b972-ab7b-47dc-bd22-ec525b99dfef︠
C1(c,d).is_zero()
︡42514798-9d33-46ca-83b2-5990b2320d76︡{"stdout":"True\n"}︡
︠c97f1b86-4928-4138-b7d6-32b99f67bf2a︠
#(u,v) is on the Fermat cubic
(u,v) = (1/(3*c)-d/c-1,1+d/c)
︡78d2a66a-5301-46b1-98a0-e3d90c89d998︡
︠f66c240f-f094-4933-8d57-cf15848dabfe︠
F(u,v).is_zero()
︡8ae50bec-a385-4b0a-b308-827147d32f6c︡{"stdout":"True\n"}︡
︠e049730b-aa7f-42fc-b359-4d496a22967b︠
show((x^3*F(x = 1/(3*x)-y/x-1,y = 1+y/x)).expand())
︡1ca2fb1c-388d-4534-90dc-d0c88633f1be︡{"tex":{"tex":"-x^{3} + x^{2} + 2 \\, x y + y^{2} - \\frac{1}{3} \\, x - \\frac{1}{3} \\, y + \\frac{1}{27}","display":true}}︡
︠d38d8483-a296-4eda-bd64-2f1dd9fbb873︠
show(C1)
︡1a15f2ef-6653-4319-a0a6-5deeda2d5861︡{"tex":{"tex":"\\left( x, y \\right) \\ {\\mapsto} \\ -x^{3} + x^{2} + 2 \\, x y + y^{2} - \\frac{1}{3} \\, x - \\frac{1}{3} \\, y + \\frac{1}{27}","display":true}}︡
︠a944090e-ad0f-482d-b209-6778d9e20a2d︠
def h(x,y) : return (-(y+5)/(3*x)+3/x,(y+5)/(3*x))
h_sym(x,y) = (-(y+5)/(3*x)+3/x,(y+5)/(3*x))
def H(p): return (h(x=p[0],y=p[1])[0],h(x=p[0],y=p[1])[1])
︡1f8232e5-5d3b-4287-b135-d26e5da1a7cc︡
︠22602a7f-cc67-49f1-988d-9b69dbf5a71b︠
show(h_sym)
︡27a525fc-89d3-4a39-91db-685e56743237︡{"tex":{"tex":"\\left( x, y \\right) \\ {\\mapsto} \\ \\left(-\\frac{y + 5}{3 \\, x} + \\frac{3}{x},\\,\\frac{y + 5}{3 \\, x}\\right)","display":true}}︡
︠eadd1e0c-3d3f-4608-a0e0-c16ef973ecee︠
show((F(x = h(x,y)[0],y = h(x,y)[1])).expand())
︡583c4b66-72ae-46dd-9da4-f1780bb4a636︡{"tex":{"tex":"\\frac{y^{2}}{x^{3}} + \\frac{y}{x^{3}} + \\frac{7}{x^{3}} - 1","display":true}}︡
︠6008a8fc-28e2-49c3-b8a2-9d9136bc8586︠


show((1/729)*C2(x = 9*x,y = y*27-x*27-5).expand())
︡d46f45cb-b693-4f96-a60e-7206b8adb266︡{"tex":{"tex":"-x^{3} + x^{2} - 2 \\, x y + y^{2} + \\frac{1}{3} \\, x - \\frac{1}{3} \\, y + \\frac{1}{27}","display":true}}︡
︠2791edde-28ea-422e-be9d-051045b08b35i︠
show(C1)
︡2c6e8fb2-308c-4e0a-8e04-ba7f6f5c2261︡{"tex":{"tex":"\\left( x, y \\right) \\ {\\mapsto} \\ -x^{3} + x^{2} + 2 \\, x y + y^{2} - \\frac{1}{3} \\, x - \\frac{1}{3} \\, y + \\frac{1}{27}","display":true}}︡
︠0153b012-f000-40d7-b3c6-639b84592f41︠
#Finding points on Fermat's Cubic
p = E2.change_ring(QQ[sqrt(5)]).gens()[0]; p
︡afae2b81-4516-4c13-8998-e52d969500c4︡{"stdout":"(2 : -1/2*sqrt5 - 1/2 : 1)"}︡{"stdout":"\n"}︡
︠9e730eb7-7148-4a8d-b42a-06afbc8fdd4d︠
H(p.dehomogenize(2))
︡cbe17f77-2e9b-4cc7-b9b6-d7b7aef959cb︡{"stdout":"(1/12*sqrt5 + 3/4, -1/12*sqrt5 + 3/4)\n"}︡
︠6915b800-93d5-445a-ac61-c24db2fd70a2︠
p = E2.change_ring(QQ[sqrt(5)]).gens()[0];
for i in range(1,4):
    print("Generator * "+str(i))
    print(p.dehomogenize(2))
    print("Converted to Fermat cubic:")
    print(H(p.dehomogenize(2)))
    print("testing fermat solu:")
    print((H(p.dehomogenize(2))[0]**3 + H(p.dehomogenize(2))[1]**3 - 1).is_zero())
    p = p+p
︡dbc0e9c7-4626-4958-b541-d3a9a0928655︡{"stdout":"Generator * 1\n(2, -1/2*sqrt5 - 1/2)\nConverted to Fermat cubic:\n(1/12*sqrt5 + 3/4, -1/12*sqrt5 + 3/4)\ntesting fermat solu:\nTrue\nGenerator * 2\n(124/5, 2761/50*sqrt5 - 1/2)\nConverted to Fermat cubic:\n(-2761/3720*sqrt5 + 15/248, 2761/3720*sqrt5 + 15/248)\ntesting fermat solu:\nTrue\nGenerator * 3\n(237258376/38115605, 7206070204127/1052371854050*sqrt5 - 1/2)\nConverted to Fermat cubic:\n(-7206070204127/19652111284080*sqrt5 + 114346815/474516752, 7206070204127/19652111284080*sqrt5 + 114346815/474516752)\ntesting fermat solu:\nTrue\n"}︡
︠f21288f7-b550-4eca-ac22-64e04538e50b︠









