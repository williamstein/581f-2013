︠6462a23b-13a4-4f1e-ae67-5a57fdf37b10︠
%var x y
implicit_plot(x^3 + y^3 == 1, (x,-2,2), (y,-2,2), gridlines=True, axes=True)
︡ef5b33db-e79f-4562-b9c9-013806e457db︡{"once":false,"file":{"show":true,"uuid":"0c76c021-a5ae-45e1-8715-fe1ae6d076ef","filename":"/mnt/home/uHNlUmEE/.sage/temp/compute1a/6778/tmp_Py7Ggf.png"}}︡
︠14e2c002-7c09-4dda-ba06-f77a7b7fc950︠
g = implicit_plot(x^3 + y^3 == 1, (x,-2,2), (y,-2,2), gridlines=True, axes=True)
g.save('../pics/flt3.pdf')
︡cdcc6c5d-4a31-498f-879c-43dea85b6854︡
︠d1d334b5-53a9-456a-bf5b-3e6ce7fe550f︠
E = EllipticCurve('27a1')
E.a_invariants()
︡d19ebab3-a77b-466f-9cf3-9d38bb5f1560︡{"stdout":"(0, 0, 1, 0, -7)\n"}︡
︠3f3a6caa-890c-4a56-be02-87511656a6b7︠
for d in [-5..5]:
    if d.is_squarefree() and d != 1:
       print d, E.quadratic_twist(d).rank()
︡50bfe13a-7350-4f0d-b663-ad23faf94b2e︡{"stdout":"-5 1\n-3 0\n-2 "}︡{"stdout":"1\n-1 0\n2 1\n3 "}︡{"stdout":"0\n5 1\n"}︡
︠03f52fd0-def0-444c-9c8f-e01811f330d9︠









