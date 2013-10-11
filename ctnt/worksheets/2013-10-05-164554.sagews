︠49bcb51c-87d4-46bc-b566-0a6e62c76f90︠
#Set up our number field and define our variables
#Define our variables
R.<x,y,z> = QQ[sqrt(5)][]
#Find morphism from elliptic curve in Weirstrass form to Fermat cubic
f = EllipticCurve_from_cubic(x^3+y^3-z^3,[1,-1,0]).inverse();  f
︡f384fb88-baae-4025-9c86-3cf233b0edaf︡{"stdout":"Scheme morphism:\n  From: Elliptic Curve defined by y^2 + 2*x*y + (-1/3)*y = x^3 + (-1)*x^2 + 1/3*x + (-1/27) over Number Field in sqrt5 with defining polynomial x^2 - 5\n  To:   Closed subscheme of Projective Space of dimension 2 over Number Field in sqrt5 with defining polynomial x^2 - 5 defined by:\n  x^3 + y^3 - z^3\n  Defn: Defined on coordinates by sending (x : y : z) to\n        (x + y - 1/3*z : -x - y : -x)\n"}︡
︠3df59038-877c-49d7-8f18-0a27e066b34e︠
#Curve we want
E2 = EllipticCurve([0,0,1,0,-7]).change_ring(QQ[sqrt(5)]); E2
︡ee83b7f3-d6e1-4e62-b491-6cd39140b40a︡{"stdout":"Elliptic Curve defined by y^2 + y = x^3 + (-7) over Number Field in sqrt5 with defining polynomial x^2 - 5\n"}︡
︠3d04acc0-0023-4b7b-9393-d9465a1056a6︠
g = E2.isomorphism_to(f.domain());
︡6e38cf7f-f7b1-4ae4-a68f-f3fc948648ce︡
︠69a817b0-88ff-4529-8e21-97e2e4a4d4ad︠
######################List points on fermat cubic####################
for i in range(1,5):
    q = i*E2.gens()[0] #Generator of E2 in ring Q(sqrt(5))
    print("generator * "+str(i)+" corresponds to point r on fermat cubic:")
    r = f(g(q)); r.clear_denominators(); r #move point to Fermat Cubic
    print("double check it is a fermat cubic:")
    r[0]**3+r[1]**3 == r[2]**3
︡c59f5d23-b303-4fc6-94cb-af8870d1a5c1︡{"stdout":"generator * 1 corresponds to point r on fermat cubic:"}︡{"stdout":"\n(sqrt5 + 9 : -sqrt5 + 9 : 12)\ndouble check it is a fermat cubic:\nTrue\ngenerator * 2 corresponds to point r on fermat cubic:\n(-2761*sqrt5 + 225 : 2761*sqrt5 + 225 : 3720)\ndouble check it is a fermat cubic:\nTrue\ngenerator * 3 corresponds to point r on fermat cubic:\n(3105301*sqrt5 + 6666948 : -3105301*sqrt5 + 6666948 : 13610574)\ndouble check it is a fermat cubic:\nTrue\ngenerator * 4 corresponds to point r on fermat cubic:\n(-7206070204127*sqrt5 + 4735673343225 : 7206070204127*sqrt5 + 4735673343225 : 19652111284080)\ndouble check it is a fermat cubic:\nTrue\n"}︡
︠502be468-b3a1-4fe7-8282-84b2489840a1︠
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
︡efd66424-5507-4caa-b369-5f6e4b340d75︡
︠68197ae9-947b-4957-982f-5a216ed7db49︠
#transformation defined by f_inv
show(729*C1(x = 1/9*x, y = 1/27*y-1/9*x+5/27).expand())
︡460e9c68-6b6a-49ed-b91e-bc5ed1bf563a︡{"tex":{"tex":"-x^{3} + y^{2} + y + 7","display":true}}︡
︠a31f0dc3-bfc8-422d-aac3-905ce45f1683︠
#EXAMPLE point
#(a,b) is a point on E2
(a,b) = (2,-1/2*sqrt(5)-1/2)
︡0d611d66-b468-453e-bbc9-de819efffb14︡
︠0cdae456-6a68-409d-847d-9fbe36de9478︠
C2(a,b).is_zero()
︡cd07a2f6-45f3-45a2-8c38-8616fffa575b︡{"stdout":"True\n"}︡
︠da5644bc-0cc5-42cd-a8ec-178666d375ea︠
#(c,d) is on E1
(c,d) = (1/9*a, 1/27*b-1/9*a+5/27)
︡18f4ce27-8a5f-4ac2-b2c5-8a9ab0889bee︡
︠11b6b972-ab7b-47dc-bd22-ec525b99dfef︠
C1(c,d).is_zero()
︡896ed197-203b-4c9f-863e-6774b6769e4e︡{"stdout":"True\n"}︡
︠c97f1b86-4928-4138-b7d6-32b99f67bf2a︠
#(u,v) is on the Fermat cubic
(u,v) = (1/(3*c)-d/c-1,1+d/c)
︡884038f2-143b-458b-ae02-481a75fb1770︡
︠f66c240f-f094-4933-8d57-cf15848dabfe︠
F(u,v).is_zero()
︡0bf7a1b8-4c11-467e-9f0e-96d15ac997d3︡{"stdout":"True\n"}︡
︠e049730b-aa7f-42fc-b359-4d496a22967b︠
show((x^3*F(x = 1/(3*x)-y/x-1,y = 1+y/x)).expand())
︡b4118e94-0bfc-4b35-a55a-ba171a4a7fbd︡{"tex":{"tex":"-x^{3} + x^{2} + 2 \\, x y + y^{2} - \\frac{1}{3} \\, x - \\frac{1}{3} \\, y + \\frac{1}{27}","display":true}}︡
︠d38d8483-a296-4eda-bd64-2f1dd9fbb873︠
show(C1)
︡ac8cddaa-7439-4bdd-beee-6a04f3e5d81b︡{"tex":{"tex":"\\left( x, y \\right) \\ {\\mapsto} \\ -x^{3} + x^{2} + 2 \\, x y + y^{2} - \\frac{1}{3} \\, x - \\frac{1}{3} \\, y + \\frac{1}{27}","display":true}}︡
︠a944090e-ad0f-482d-b209-6778d9e20a2d︠
def h(x,y) : return (-(y+5)/(3*x)+3/x,(y+5)/(3*x))
h_sym(x,y) = (-(y+5)/(3*x)+3/x,(y+5)/(3*x))
def H(p): return (h(x=p[0],y=p[1])[0],h(x=p[0],y=p[1])[1])
︡2fb7e724-7155-4dc6-a0fb-1cddd2ecaf91︡
︠22602a7f-cc67-49f1-988d-9b69dbf5a71b︠
show(h_sym)
︡44fca86c-21cf-469c-b0e8-204fdf448fab︡{"tex":{"tex":"\\left( x, y \\right) \\ {\\mapsto} \\ \\left(-\\frac{y + 5}{3 \\, x} + \\frac{3}{x},\\,\\frac{y + 5}{3 \\, x}\\right)","display":true}}︡
︠eadd1e0c-3d3f-4608-a0e0-c16ef973ecee︠
show((F(x = h(x,y)[0],y = h(x,y)[1])).expand())
︡f629faad-f8ae-486d-816a-b2dd74b9f68e︡{"tex":{"tex":"\\frac{y^{2}}{x^{3}} + \\frac{y}{x^{3}} + \\frac{7}{x^{3}} - 1","display":true}}︡
︠6008a8fc-28e2-49c3-b8a2-9d9136bc8586︠


show((1/729)*C2(x = 9*x,y = y*27-x*27-5).expand())
︡6ebab44b-8f98-4132-9fd9-838257d9f2bb︡{"tex":{"tex":"-x^{3} + x^{2} - 2 \\, x y + y^{2} + \\frac{1}{3} \\, x - \\frac{1}{3} \\, y + \\frac{1}{27}","display":true}}︡
︠2791edde-28ea-422e-be9d-051045b08b35i︠
show(C1)
#Finding points on Fermat's Cubic
p = E2.change_ring(QQ[sqrt(5)]).gens()[0]; p
︡169c84b2-6bea-4854-b777-72aa6f46eb96︡{"tex":{"tex":"\\left( x, y \\right) \\ {\\mapsto} \\ -x^{3} + x^{2} + 2 \\, x y + y^{2} - \\frac{1}{3} \\, x - \\frac{1}{3} \\, y + \\frac{1}{27}","display":true}}︡{"stdout":"(2 : -1/2*sqrt5 - 1/2 : 1)"}︡{"stdout":"\n"}︡
︠9e730eb7-7148-4a8d-b42a-06afbc8fdd4d︠
H(p.dehomogenize(2))
︡7f3558c1-cb7c-4db7-8cdb-776ed854b3fd︡{"stdout":"(1/12*sqrt5 + 3/4, -1/12*sqrt5 + 3/4)\n"}︡
︠6915b800-93d5-445a-ac61-c24db2fd70a2︠
p = E2.change_ring(QQ[sqrt(5)]).gens()[0];
for i in range(1,4):
    print("Generator * "+str(i)+" Converted to Fermat cubic:")
    print(H(p.dehomogenize(2)))
    print("testing fermat solu:")
    print((H(p.dehomogenize(2))[0]**3 + H(p.dehomogenize(2))[1]**3 - 1) == 0)
    p = p+p
︡fa252fee-5215-45a1-8f0d-de496cd3f4d9︡{"stdout":"Generator * 1 Converted to Fermat cubic:\n(1/12*sqrt5 + 3/4, -1/12*sqrt5 + 3/4)\ntesting fermat solu:\nTrue\nGenerator * 2 Converted to Fermat cubic:\n(-2761/3720*sqrt5 + 15/248, 2761/3720*sqrt5 + 15/248)\ntesting fermat solu:\nTrue\nGenerator * 3 Converted to Fermat cubic:\n(-7206070204127/19652111284080*sqrt5 + 114346815/474516752, 7206070204127/19652111284080*sqrt5 + 114346815/474516752)\ntesting fermat solu:\nTrue\n"}︡
︠f21288f7-b550-4eca-ac22-64e04538e50b︠









