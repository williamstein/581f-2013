︠6998d182-8d6f-412b-9654-79882c0f2d25︠
#Computation in Quadratic field Q(d)
d = 5
#Starting point on Fermat cubic:
p = [-1,1,0]
︡c1e772ad-5de9-4968-9adc-83db5b7e441f︡
︠49bcb51c-87d4-46bc-b566-0a6e62c76f90︠
#List points on fermat cubic
R.<x,y,z> = QQ[sqrt(d)][] #set up field
f = EllipticCurve_from_cubic(x^3+y^3-z^3,p).inverse(); #map from elliptic curve to fermat cubic
for i in range(1,6):
        r = f(i*f.domain().gens()[0]); r.clear_denominators(); r #move point to Fermat Cubic
        #r[0]**3+r[1]**3 == r[2]**3 #double check it is correct
︡db9aee3f-8d09-465e-b9d4-29aa64df691d︡{"stdout":"(-sqrt5 + 9 : sqrt5 + 9 : 12)"}︡{"stdout":"\n(2761*sqrt5 + 225 : -2761*sqrt5 + 225 : 3720)\n(-3105301*sqrt5 + 6666948 : 3105301*sqrt5 + 6666948 : 13610574)\n(7206070204127*sqrt5 + 4735673343225 : -7206070204127*sqrt5 + 4735673343225 : 19652111284080)\n(-45203693464083879145*sqrt5 + 25364447357048949231 : 45203693464083879145*sqrt5 + 25364447357048949231 : 116655528338821919868)\n"}︡
︠502be468-b3a1-4fe7-8282-84b2489840a1︠













