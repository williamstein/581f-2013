︠b7b23b28-97ad-4700-8c79-3a4dee127579︠
E = EllipticCurve('593b'); show(E)
︡640d1038-0101-4115-b31a-c3445f2ab3b6︡{"tex":{"tex":"y^2 + x y = x^{3} - 7 x - 30 ","display":true}}︡
︠bf0fe207-550a-43ee-92c6-56864519785c︠
L = E.lseries(); L
︡968bdaa7-6430-480c-9c29-ed2580c45f0e︡{"stdout":"Complex L-series of the Elliptic Curve defined by y^2 + x*y = x^3 - 7*x - 30 over Rational Field\n"}︡
︠8a0083ed-2748-40ea-a9d4-4cb724d2dffa︠
L.zeros(3)
︡57350609-7b09-4443-a632-31146c974768︡{"stdout":"[0.840290252, 2.40435444, 4.53874874]"}︡{"stdout":"\n"}︡
︠ecaab75b-6ec2-4a3b-9797-2902370c5a10︠
E.rank()
︡0d238a64-ec2e-4df1-87ed-6ab8e2a6ebde︡{"stdout":"0\n"}︡
︠4a57295e-cd0b-4bab-82d4-2b5e90f27d46︠
L(1)
︡4c94b5c5-da5e-4578-a876-d36f0617bc77︡{"stdout":"0.641115852160870"}︡{"stdout":"\n"}︡
︠41e9ea36-870c-484b-8f4d-a5f596102c4f︠
L.deriv_at1()
︡ef34c17f-7f2a-432f-88f9-894168c1a524︡{"stdout":"0\n"}︡
︠6d879322-95fc-4564-bfca-43a3ff678ea4︠
EllipticCurve('37a').lseries().deriv_at1()
︡62142fdc-dcd0-4456-b8cc-0b093776fcb0︡{"stdout":"(0.305986660898516, 0.000800351433106958)\n"}︡
︠2f8d0a89-98cf-48d4-b894-2441e49322c2︠
EllipticCurve('37a').lseries().dokchitser().derivative(1)
︡ac21c211-b8c9-434e-a4ea-5466fdb8c9d3︡{"stdout":"0.305999773834052"}︡{"stdout":"\n"}︡
︠1338f16c-e51c-4567-87de-fdd9c9feae3d︠
L.taylor_series(1, 5)
︡324dc640-0bb0-439a-bdea-2155a6636923︡{"stdout":"0.66 - 0.50*z + 0.88*z^2 - 0.33*z^3 - 0.44*z^4 + 0.78*z^5 + O(z^6)"}︡{"stdout":"\n"}︡
︠0ffcc8e3-3e9d-41c5-8c00-96443695e7aa︠
L.dokchitser().derivative(1)
︡2e788426-8127-4d32-a198-4051f5e48a3f︡{"stdout":"-0.498470439681224\n"}︡
︠d2f1c418-d227-4c3b-9a81-9fd5f7569032︠
L.deriv_at1?
︡9b362efa-f092-4958-bb57-1af61a85a068︡{"stdout":"   File: /mnt/home/uHNlUmEE/sage-5.12.rc0/local/lib/python2.7/site-packages/sage/schemes/elliptic_curves/lseries_ell.py\n   Docstring:\n      Compute L'(E,1) using` k` terms of the series for L'(E,1).\n\n   The algorithm used is from page 406 of Henri Cohen's book >>``<<A\n   Course in Computational Algebraic Number Theory.''\n\n   The real precision of the computation is the precision of Python\n   floats.\n\n   INPUT:\n      k -- int; number of terms of the series\n\n   OUTPUT:\n      real number -- an approximation for L'(E,1) real number -- a\n      bound on the error in the approximation\n\n   ALGORITHM:\n\n      * Compute the root number eps.  If it is 1, return 0.\n\n      * Compute the Fourier coefficients $a_n$, for $n$ up to and\n           including $k$.\n\n      * Compute the sum $$\n\n           2 * sum_{n=1}^{k} (a_n / n) * E_1(2 pi n/sqrt{N}),\n\n        $$ where $N$ is the conductor of $E$, and $E_1$ is the\n        exponential integral function.\n\n      * Compute a bound on the tail end of the series, which is $$\n\n           2 * e^{-2 pi (k+1) / sqrt{N}} / (1 - e^{-2 pi/sqrt{N}}).\n\n        $$ For a proof see [Grigorov-Jorza-Patrascu-Patrikis-Stein .\n        This is exactly the same as the bound for the approximation to\n        $L(E,1)$ produced by E.lseries().at1.\n\n\n   EXAMPLES:\n\n      sage: E = EllipticCurve('37a')\n      sage: E.lseries().deriv_at1()\n      (0.305986660898516, 0.000800351433106958)\n      sage: E.lseries().deriv_at1(100)\n      (0.305999773834052, 1.52437502288740e-45)\n      sage: E.lseries().deriv_at1(1000)\n      (0.305999773834052, 0.000000000000000)\n"}︡{"stdout":"\n"}︡
︠272ad0d3-14c2-4e42-aae5-dac03f756950︠
EllipticCurve('27a').quadratic_twist(2).rank()
︡2a4154e2-5833-4788-beb4-1d1ab070f529︡{"stdout":"1"}︡{"stdout":"\n"}︡
︠19136a62-2814-4fef-8024-793166ce81f5︠









