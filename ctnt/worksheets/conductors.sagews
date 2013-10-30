︠b62c71a8-a80f-4c02-bc10-60ebddfb3e19︠
E = EllipticCurve('11a')
︡2c8773b6-0a3c-4bcb-98f5-62207c2f7242︡
︠556e5a00-bce2-43fe-a885-230001d14912︠
E.ap(11)
︡ee5cbdcc-d3d5-4f24-8b16-5746977bd94d︡{"stdout":"1\n"}︡
︠adc376f0-2527-49d1-adcb-447df29d2bd6︠
E11 = E.change_ring(GF(11))
︡b8b485d1-17e5-46f6-9fe6-0b56658b9ec1︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/mnt/home/uHNlUmEE/.sagemathcloud/sage_server.py\", line 633, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\n  File \"/mnt/home/uHNlUmEE/sage-5.12.rc0/local/lib/python2.7/site-packages/sage/schemes/elliptic_curves/ell_generic.py\", line 1254, in base_extend\n    return constructor.EllipticCurve([R(a) for a in self.a_invariants()])\n  File \"/mnt/home/uHNlUmEE/sage-5.12.rc0/local/lib/python2.7/site-packages/sage/schemes/elliptic_curves/constructor.py\", line 349, in EllipticCurve\n    return ell_finite_field.EllipticCurve_finite_field(x, y)\n  File \"/mnt/home/uHNlUmEE/sage-5.12.rc0/local/lib/python2.7/site-packages/sage/schemes/elliptic_curves/ell_finite_field.py\", line 103, in __init__\n    EllipticCurve_field.__init__(self, ainvs)\n  File \"/mnt/home/uHNlUmEE/sage-5.12.rc0/local/lib/python2.7/site-packages/sage/schemes/elliptic_curves/ell_generic.py\", line 156, in __init__\n    \"Invariants %s define a singular curve.\"%ainvs\nArithmeticError: Invariants [0, 10, 1, 1, 2] define a singular curve.\n"}︡
︠e23ccff5-2277-4801-a049-c7aa16ead39f︠
E.short_weierstrass_model()
︡0d8b0213-c101-4c08-ad4e-0b3ce470b934︡{"stdout":"Elliptic Curve defined by y^2 = x^3 - 13392*x - 1080432 over Rational Field\n"}︡
︠751d06bf-1642-43eb-bddc-2aec6abaf21c︠
R.<x> = GF(11)[]
f = x^3 - 13392*x - 1080432
factor(f)
factor(f(x=x-8))
︡0904a01d-f9ee-4859-8d7c-956212923088︡{"stdout":"(x + 6) * (x + 8)^2\n"}︡{"stdout":"(x + 9) * x^2\n"}︡
︠a69943b5-1367-4eb3-8db4-fd19aae05a28︠
factor(x^3 - 13392*x - 1080432)
︡798c6fac-5cbd-4928-bbbe-1291b4ed55b8︡{"stdout":"(x + 6) * (x + 8)^2\n"}︡
︠e0efae60-0d9a-49b8-9b3a-5bf5d6a21d2c︠
E = EllipticCurve('37a')
E.ap(37)
︡b4a17087-2fc0-4029-aa60-0f684d407ea9︡{"stdout":"-1\n"}︡
︠5fb88b37-6e61-438a-b99a-eeb60cc107e4︠
E.short_weierstrass_model()
︡f8a6db68-8bf4-42fa-8c01-905269dc8e63︡{"stdout":"Elliptic Curve defined by y^2 = x^3 - 16*x + 16 over Rational Field\n"}︡
︠f8db9198-626d-4d2d-b001-39a1b3408efa︠
R.<x> = GF(37)[]
f = x^3 - 16*x + 16
factor(f)
factor(f(x=x-17))
︡d41b53e3-1f22-4b5e-ab83-850b5607bcf9︡{"stdout":"(x + 3) * (x + 17)^2\n"}︡{"stdout":"(x + 23) * x^2\n"}︡
︠f61eaa21-44c9-4b89-8b1b-e3854f10a543︠
kronecker_symbol(-23,37)
︡35ac1a30-d817-4bba-9d51-01e3aa1b6d30︡{"stdout":"-1\n"}︡
︠af488b7c-6fd5-4c3b-ae84-4ebe971eb7e5︠
kronecker_symbol(9,11)
︡1aec0754-7833-43e1-ba49-0fab805c1771︡{"stdout":"1\n"}︡
︠faaf0de9-be32-4216-8419-af6433bc4d20︠









