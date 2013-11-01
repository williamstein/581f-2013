︠c032c630-4454-4589-bfc7-30a715622940︠
v = SteinWatkinsPrimeData(1)
c = v.next(); c
︡bea53122-0f2d-4117-a5d9-d9f486683d7c︡{"stdout":"Stein-Watkins isogeny class of conductor 100000937\n"}︡
︠abeaf407-2e63-499b-aee0-79e70a96192c︠
v
︡685d0590-3dad-4635-96d0-875a5ac38859︡{"stdout":"Stein-Watkins Prime Conductor Database p.1 Iterator\n"}︡
︠764e5aba-e89c-4d32-a14f-b2a8ea9ae93d︠
E = elliptic_curves.rank(4)[0]; E
︡67f21d31-912b-48b1-aa32-4f3dd9fee027︡{"stdout":"Elliptic Curve defined by y^2 + x*y = x^3 - x^2 - 79*x + 289 over Rational Field\n"}︡
︠9468984d-d5b6-495d-aa9f-d2ca30d927f8︠
L = E.lseries(); L
︡c60f64ed-4ffc-4297-a54c-d90c34ef52d5︡{"stdout":"Complex L-series of the Elliptic Curve defined by y^2 + x*y = x^3 - x^2 - 79*x + 289 over Rational Field\n"}︡
︠8b8b578a-0416-42ac-8756-db4341ce02a8︠
L.taylor_series(1, 5)
︡24f962c3-dae9-4d75-833a-73cc7f7debd8︡{"stdout":"1.0e-6 + (-3.8e-6)*z + (6.7e-6)*z^2 + (-7.2e-6)*z^3 + 9.0*z^4 - 34.*z^5 + O(z^6)"}︡{"stdout":"\n"}︡
︠b56fa68e-9ebf-4ccd-9dda-9d5684bdc53e︠
list(c)
︡2aa64ff8-426e-414a-bcfb-f3113ddcab4b︡{"stdout":"[[[1, 0, 1, -472, -3951], '[1]', '1', '1']]\n"}︡
︠acbd7445-8bec-44f6-ae6a-0c94ef4fe49f︠
E = EllipticCurve([1, 0, 1, -472, -3951]); E
︡cecd9577-542c-4db0-a388-f2971f10b60b︡{"stdout":"Elliptic Curve defined by y^2 + x*y + y = x^3 - 472*x - 3951 over Rational Field\n"}︡
︠6e1b9475-069d-49ba-8008-9702e1653812︠
E.conductor().factor()
︡233a4e14-963c-4a6c-ad3e-0ab35d3596e3︡{"stdout":"100000937\n"}︡
︠6c34f601-d9fd-4ba0-b0ac-9470d9599da3︠
E.rank()
︡33db54ed-bf57-47ef-a9e8-67c4b3f18d35︡{"stdout":"0\n"}︡
︠fced4b5f-67d4-4e5f-8522-1937f5216e13i︠
%md
# The Format

A group as follows for each isogeny class.

    conductor [ordered_prime_divisors_of_conductor]   rank  L^(rank)(1)/rank!  isogeny_number  ??modular_degree
    a_invariants    ord(Delta)     analytic_sha     torsion_subgroup
    ....
    a_invariants    ord(Delta)     analytic_sha    torsion_subgroup


    COMMENTS:

      isogeny_number - This number is the longest degree of a chain of isogenies
                       between non-isomorphic curves.   For example, a 12 means
                       the isogeny class contains a curve which possesses
                       a 12-isogeny.

      modular_degree - The modular degree of the optimal quotient of J_0(N).
                       The star means that the curve of minimal Faltings height is not
                       J0-optimal. The plus indicates that the minimal Faltings height curve
                       is a minimal quadratic twist.

      torsion_subgroup - n or nx, where n means Z/nZ and nx means Z/nZ x Z/2Z (only used when n even).

      ord(Delta) - Surrounded in square or round brackets:
                       * square means that Delta is positive and
                       * round brackets mean that Delta is negative.
                   The numbers listed are the valuations of Delta at each prime
                   dividing the level, in order.

      analytic_sha -  analytic order of Sha





︡4dcd2101-632a-4ff3-a1c8-ffe5ca946dd4︡{"html":"<h1>The Format</h1>\n\n<p>A group as follows for each isogeny class.</p>\n\n<pre><code>conductor [ordered_prime_divisors_of_conductor]   rank  L^(rank)(1)/rank!  isogeny_number  ??modular_degree\na_invariants    ord(Delta)     analytic_sha     torsion_subgroup\n....\na_invariants    ord(Delta)     analytic_sha    torsion_subgroup\n\n\nCOMMENTS:\n\n  isogeny_number - This number is the longest degree of a chain of isogenies\n                   between non-isomorphic curves.   For example, a 12 means\n                   the isogeny class contains a curve which possesses \n                   a 12-isogeny.\n\n  modular_degree - The modular degree of the optimal quotient of J_0(N).\n                   The star means that the curve of minimal Faltings height is not\n                   J0-optimal. The plus indicates that the minimal Faltings height curve\n                   is a minimal quadratic twist.\n\n  torsion_subgroup - n or nx, where n means Z/nZ and nx means Z/nZ x Z/2Z (only used when n even).\n\n  ord(Delta) - Surrounded in square or round brackets:\n                   * square means that Delta is positive and \n                   * round brackets mean that Delta is negative.\n               The numbers listed are the valuations of Delta at each prime \n               dividing the level, in order.\n\n  analytic_sha -  analytic order of Sha\n</code></pre>\n"}︡
︠14ee75e1-4bb3-48a7-aada-8595129fbaee︠
v = SteinWatkinsPrimeData(1)
c = v.next(); c
︡91589d3f-089c-4d3a-a359-913f9eff087c︡{"stdout":"Stein-Watkins isogeny class of conductor 100000937\n"}︡
︠89ddf8dd-0395-4695-b70b-703b366a4622︠
list(c)
︡1e07d0be-a054-4dfb-9ad8-0147fe5eb040︡{"stdout":"[[[1, 0, 1, -472, -3951], '[1]', '1', '1']]\n"}︡
︠83940ba8-2ed6-4bc8-85dc-e60ceecc334d︠
v = SteinWatkinsAllData(0)
c = v.next(); c
︡7db438a6-290a-4d81-9ef5-340a17f02444︡{"stdout":"Stein-Watkins isogeny class of conductor 11\n"}︡
︠2acd8a4b-4233-497a-abe6-d921d972d981︠
list(c)
︡cd723080-e68e-42b8-a104-fd5ed4c668f5︡{"stdout":"[[[0, -1, 1, 0, 0], '(1)', '1', '5'], [[0, -1, 1, -10, -20], '(5)', '1', '5'], [[0, -1, 1, -7820, -263580], '(1)', '1', '1']]\n"}︡
︠984a97e5-ce81-4424-9b79-c0e5accffb2b︠
c = v.next(); c
︡080e907c-c5ad-4c17-92aa-1a69c56c82f3︡{"stdout":"Stein-Watkins isogeny class of conductor 14\n"}︡
︠37ff0899-6de7-44ba-92f5-e0ca78e06fd5︠
list(c)
︡8b740ead-e9e5-4f25-bb35-8219d5c80844︡{"stdout":"[[[1, 0, 1, -1, 0], '(2,1)', '1', '6'], [[1, 0, 1, -11, 12], '[1,2]', '1', '6'], [[1, 0, 1, 4, -6], '(6,3)', '1', '6'], [[1, 0, 1, -36, -70], '[3,6]', '1', '6'], [[1, 0, 1, -171, -874], '(18,1)', '1', '2'], [[1, 0, 1, -2731, -55146], '[9,2]', '1', '2']]\n"}︡
︠486db4b3-3bc6-4709-ae2a-e0657739b6ba︠
v = SteinWatkinsAllData(10)
c = v.next(); c
︡9cd6325b-8d65-4741-9bed-98424ef8d28a︡{"stdout":"Stein-Watkins isogeny class of conductor 1000002\n"}︡
︠1fca895a-abf1-46f1-af26-9a0acc3b0087︠
list(c)
︡9ec33f7d-b164-4d13-a633-67e0d288e307︡{"stdout":"[[[1, 1, 0, -63, -1539], '(3,6,1)', 'X', '1']]\n"}︡
︠0b0a33d9-da9e-45c4-9051-f0e999032286i︠

%md
# Generators?

From Mark Watkins a few days ago:

    The generators for prime conductor in SW and r>=2 are in

    http://magma.maths.usyd.edu.au/~watkins/PTS.r2.bz2
    http://magma.maths.usyd.edu.au/~watkins/PTS.r3.bz2
    http://magma.maths.usyd.edu.au/~watkins/PTS.r4.bz2
    http://magma.maths.usyd.edu.au/~watkins/PTS.r5.bz2
    http://magma.maths.usyd.edu.au/~watkins/PTS.r6.bz2
︡e9109489-63e5-470a-8e65-d87f4cc797d7︡{"html":"<h1>Generators?</h1>\n\n<p>From Mark Watkins a few days ago:</p>\n\n<pre><code>The generators for prime conductor in SW and r&gt;=2 are in\n\nhttp://magma.maths.usyd.edu.au/~watkins/PTS.r2.bz2\nhttp://magma.maths.usyd.edu.au/~watkins/PTS.r3.bz2\nhttp://magma.maths.usyd.edu.au/~watkins/PTS.r4.bz2\nhttp://magma.maths.usyd.edu.au/~watkins/PTS.r5.bz2\nhttp://magma.maths.usyd.edu.au/~watkins/PTS.r6.bz2\n</code></pre>\n"}︡
︠88a610c6-50bd-455e-b5bc-132ec0be8263︠









