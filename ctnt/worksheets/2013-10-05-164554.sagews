︠90258073-8585-4635-bc56-f717eccd9b21︠
QQ[sqrt(5)]
︡431dc01d-c3cf-429d-885e-a5aac6ac12f7︡{"stdout":"Number Field in sqrt5 with defining polynomial x^2 - 5"}︡{"stdout":"\n"}︡
︠e1d30634-8c5f-47b2-a222-78d32b96d7f6a︠
%auto

R.<x,y,z> = QQ[]
︡980876f6-47d3-491b-bddc-e54767928daa︡{"auto":true}︡
︠b1e7f611-8c00-469b-96b8-b06fa7f8435c︠
f = EllipticCurve_from_cubic(x^3+y^3-z^3, [1,-1,0]); f
︡f374fabd-4b95-4582-bd69-c413da41e598︡{"stdout":"Scheme morphism:\n  From: Closed subscheme of Projective Space of dimension 2 over Rational Field defined by:\n  x^3 + y^3 - z^3\n  To:   Elliptic Curve defined by y^2 + 2*x*y - 1/3*y = x^3 - x^2 + 1/3*x - 1/27 over Rational Field\n  Defn: Defined on coordinates by sending (x : y : z) to\n        (-z : -y + z : -3*x - 3*y)"}︡{"stdout":"\n"}︡
︠0e26cdaf-f99d-499d-98ca-874370b94cb3︠
f.codomain()
︡1f1cfb6b-c2bc-44e5-9949-4f31bcc44cba︡{"stdout":"Elliptic Curve defined by y^2 + 2*x*y - 1/3*y = x^3 - x^2 + 1/3*x - 1/27 over Rational Field\n"}︡
︠70057c19-0a12-4d58-91a0-d7c168b402b2︠
f.domain()
︡04022006-394a-4d2a-bc7a-7b4e60343418︡{"stdout":"Closed subscheme of Projective Space of dimension 2 over Rational Field defined by:\n  x^3 + y^3 - z^3\n"}︡
︠81f99a75-5024-436a-b424-d2a332341df1︠
P = f([1,0,1]); P
︡b3f8a4cb-b2ca-481f-a773-6dba6e061f3b︡{"stdout":"(1/3 : -1/3 : 1)\n"}︡
︠1017d7d6-ea70-4d7c-89db-a87ebb15a246︠
E1 = EllipticCurve([2,-1,-1/3,1/3,-1/27]); show(E1)
︡ee28525a-4cbf-4d24-ab60-fb73e2f1a84c︡{"tex":{"tex":"y^2 + 2 x y - \\frac{1}{3} y = x^{3} -  x^{2} + \\frac{1}{3} x - \\frac{1}{27} ","display":true}}︡
︠5bf550c7-c88f-4d15-99bb-3f9b7b243607︠
E2 = EllipticCurve([0,0,1,0,-7]); E2
︡643e6caa-5029-4ee6-a478-f896dcc7ebb9︡{"stdout":"Elliptic Curve defined by y^2 + y = x^3 - 7 over Rational Field\n"}︡
︠060e7a62-b02c-4652-badd-0288fadc259d︠
g = E1.isomorphism_to(E2); g
︡7abec4d7-cc04-4732-859b-1eece41be11a︡{"stdout":"Generic morphism:\n  From: Abelian group of points on Elliptic Curve defined by y^2 + 2*x*y - 1/3*y = x^3 - x^2 + 1/3*x - 1/27 over Rational Field\n  To:   Abelian group of points on Elliptic Curve defined by y^2 + y = x^3 - 7 over Rational Field\n  Via:  (u,r,s,t) = (1/3, 0, -1, 5/27)\n"}︡
︠e9c755ce-2f5e-4282-bb66-e4b3797ddc58︠
Q = g(P); Q
︡d27e4eb2-5438-4faa-9c3b-7f1a2b6635db︡{"stdout":"(3 : -5 : 1)\n"}︡
︠1986b147-66e4-423a-bbe9-01220068455f︠
(g^(-1))(Q)
︡e5bcb60b-484c-444f-a9b2-3015b28eea98︡{"stdout":"(1/3 : -1/3 : 1)\n"}︡
︠7b282a21-1fb2-48ae-a672-d98616933135︠

︠51187170-29d7-41ab-a726-83dcf2d2528d︠
from sage.schemes.elliptic_curves.weierstrass_morphism import *;
︡234ada4e-60ec-4c3f-99e1-6a3f91d06ccb︡
︠36b23a42-27b8-4a30-8ac5-23141a87c215︠
isomorphisms(E2,E1)
︡5d763d65-e74a-4a1a-abeb-65f72c609018︡{"stdout":"[(-3, 0, -3, -5), (3, 0, 3, 4)]\n"}︡
︠95c50f04-e12e-4ab1-8263-c7b5f3df4ad3︠
var('X Y Z')
F(X,Y,Z) = X^3 + Y^3 - Z^3
C2(X,Y) = Y^2 + Y - X^3 + 7
C1(X,Y) = Y^2+2*X*Y+(1/3)*Y-X^3+X^2+(1/3)*X+(1/27)
︡bc9bf14d-1bcb-48ea-8a3f-734a8d437576︡{"stdout":"(X, Y, Z)\n"}︡
︠5a7e4927-f8c9-4558-b498-24bb84490536︠
show(E1)
︡4cc3c5a8-b97f-43d7-ab43-7d05323d542c︡{"tex":{"tex":"y^2 + 2 x y + \\frac{1}{3} y = x^{3} -  x^{2} - \\frac{1}{3} x - \\frac{1}{27} ","display":true}}︡
︠c716fa05-314c-4158-a14f-b49967b1b091︠
show(C1(x,y))
︡8258df8e-6996-4edd-800f-1ce06aa6161e︡{"tex":{"tex":"-x^{3} + x^{2} + 2 \\, x y + y^{2} + \\frac{1}{3} \\, x + \\frac{1}{3} \\, y + \\frac{1}{27}","display":true}}︡
︠65aec6ea-a4eb-45b6-9b6a-fcab516b7e58︠
show(E2)
︡6afe92f0-3f45-4554-adf6-a773ada1fda1︡{"tex":{"tex":"y^2 + y = x^{3} - 7 ","display":true}}︡
︠23963708-0e7c-4e11-8663-43aef108b47e︠
show(C2(x,y))
︡d7c7b7a4-9766-49da-b26a-06932660c355︡{"tex":{"tex":"-x^{3} + y^{2} + y + 7","display":true}}︡
︠c1a07d1e-ce31-4fd3-8f2a-35c7de1ab4bf︠
u,r,s,t = (3,0,3,4) #one of the isomorphisms E2 -> E1 found above
︡07eb035d-0a1c-408d-ba66-60ce58a916fc︡
︠01a38cbf-eb56-47a3-8dba-2225b5ce5c2b︠
show((1/729)*C2(X = (u**2)*x+r,Y = (u**3)*y+(s*u**2)*x+t).expand())
︡647d1443-709b-42c4-a16b-3a69b0594c45︡{"tex":{"tex":"-x^{3} + x^{2} + 2 \\, x y + y^{2} + \\frac{1}{3} \\, x + \\frac{1}{3} \\, y + \\frac{1}{27}","display":true}}︡
︠8eba4224-dce0-4ad8-bfa6-69f3e574e397︠
#How do I transform F above into C1?
︡9e4c256b-b118-4022-89ad-6d881668f393︡
︠5225a0c1-2339-4d83-b3d4-b3ee28b22e01︠
show(F(X = -z,Y = -y+z,Z = -3*x-3*z).expand())
︡f10dad53-bff6-4df4-8a57-180f56542f9c︡{"tex":{"tex":"27 \\, x^{3} - y^{3} + 81 \\, x^{2} z + 3 \\, y^{2} z + 81 \\, x z^{2} - 3 \\, y z^{2} + 27 \\, z^{3}","display":true}}︡
︠81f2fc99-d9ec-4e0d-8d3b-5c8fc29e90fd︠
h = F(X = -z,Y = -y+z,Z = -3*x-3*z); show(h)
︡0aee6941-49ee-4ac2-b08e-87ccfb7ba840︡{"tex":{"tex":"27 \\, {\\left(x + z\\right)}^{3} - {\\left(y - z\\right)}^{3} - z^{3}","display":true}}︡
︠53c0af97-75aa-4d57-9d67-f2d47bba9278︠
show((1/27)*h.expand())
︡aea19d9e-fbf5-4d08-b16e-fe6c7768eab6︡{"tex":{"tex":"x^{3} - \\frac{1}{27} \\, y^{3} + 3 \\, x^{2} z + \\frac{1}{9} \\, y^{2} z + 3 \\, x z^{2} - \\frac{1}{9} \\, y z^{2} + z^{3}","display":true}}︡
︠1a43c665-48ed-449f-91c1-0a110bed63f1︠









