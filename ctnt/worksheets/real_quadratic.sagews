︠6f917a6a-0595-4e2f-b745-568a05f0aab5︠
proof.number_field(False)
︡bbcff853-ee24-4b70-aa68-f418e4d17261︡
︠c78cbf9a-3c25-4914-b7ec-c278375dba9e︠
QuadraticField(5*13*17).class_number()
︡9da7f557-3005-4649-9d7d-dfd6cba29aa7︡{"stdout":"4\n"}︡
︠a3762433-0e60-4670-9f20-10b0cf949fbe︠
# Sage can compute the following class numbers in a few seconds or less
d = prod(list(primes(2,30)));
print 'class number =', QuadraticField(d).class_number(), '; d =', d
d = prod(list(primes(3,32)));
print 'class number =', QuadraticField(d).class_number(), '; d =', d
d = prod(list(primes(11,38)));
print 'class number =', QuadraticField(d).class_number(), '; d =', d
d = prod(list(primes(13,38)))*2;
print 'class number =', QuadraticField(d).class_number(), '; d =', d
︡e69a4946-6e5e-485e-9169-e29223594d68︡{"stdout":"class number = "}︡{"stdout":"256 ; d = 6469693230\n"}︡{"stdout":"class number = "}︡{"stdout":"256 ; d = 100280245065\n"}︡{"stdout":"class number = "}︡{"stdout":"64 ; d = 35336848261\n"}︡{"stdout":"class number = "}︡{"stdout":"64 ; d = 6424881502\n"}︡
︠cc0b3f25-1aed-4887-9143-ec39464cc38b︠
prod(list(primes(2,32)))
︡2ea5e707-2736-4409-b861-2f0cf4ee4394︡{"stdout":"200560490130\n"}︡
︠4773aace-afd1-4953-b0fa-3ff33676884b︠
# The following class number takes longer than several minutes to compute (I don't know the exact time as I've never let it run longer than that)
d = prod(list(primes(2,32)));
QuadraticField(d).class_number()
︡b78b6e61-fa7d-4579-8b49-09015ec0b12c︡{"stdout":"1536\n"}︡
︠2daee15e-2f7f-4f65-8eb0-498ad1d056a5︠
d = prod(list(primes(2,42)));
QuadraticField(d).class_number()
︡e503ec76-dd3c-4f37-92af-8a019652ff3a︡{"stdout":"4096"}︡{"stdout":"\n"}︡
︠38ce6cf2-362e-436a-8ece-6ab634140b7e︠
d = prod(list(primes(1,30)));
print QuadraticField(d).class_number(), timeit('QuadraticField(d).class_number()', seconds = true)
︡7cf64437-f6f9-48f3-b1af-fcd44d3ef6bb︡{"stdout":"256"}︡{"stdout":" "}︡{"stdout":"625 loops, best of 3: 313 µs per loop\nNone\n"}︡
︠dccf991a-49ff-4440-a04d-38823b1c6eda︠
# the timeit below is useless due to caching -william
# Good to know.  Thanks - Yannick
︠311beec7-bc5e-42cb-b31e-73c0cc718f59︠
# Want to check the lower bound of 2^(t-2) for the class number of K = Q(sqrt(d)) where t is the number of primes dividing disc(K)
# For d = the product of primes up to p are listed: 2^(t-2); the class number of K; p; d;
d = 1;
for p in list(primes(1,42)):
    d = d*p;
    K = QuadraticField(d);
    D = K.disc();
    t = len(D.prime_divisors())
    print 'lower bound =', 2^(t-2),';' ,K.class_number(), '= class number ;', 'largest prime divisor =', p, '; d =',d;
︡231567ca-589c-4a25-bf51-7b1903d9dc92︡{"stdout":"lower bound = 1/2 ; 1 = class number ; largest prime divisor = 2 ; d = 2\nlower bound = 1 ; 1 = class number ; largest prime divisor = 3 ; d = 6\nlower bound = 2 ; 2 = class number ; largest prime divisor = 5 ; d = 30\nlower bound = 4 ; 4 = class number ; largest prime divisor = 7 ; d = 210\nlower bound = 8 ; 8 = class number ; largest prime divisor = 11 ; d = 2310\nlower bound = 16 ; 16 = class number ; largest prime divisor = 13 ; d = 30030\nlower bound = 32 ; 96 = class number ; largest prime divisor = 17 ; d = 510510\nlower bound = 64 ; 64 = class number ; largest prime divisor = 19 ; d = 9699690\nlower bound = 128 ; 256 = class number ; largest prime divisor = 23 ; d = 223092870\nlower bound = 256 ; 256 = class number ; largest prime divisor = 29 ; d = 6469693230\nlower bound = 512 ; "}︡{"stdout":"1536 = class number ; largest prime divisor = 31 ; d = 200560490130\nlower bound = 1024 ; "}︡{"stdout":"1024 = class number ; largest prime divisor = 37 ; d = 7420738134810\nlower bound = 2048 ; 4096 = class number ; largest prime divisor = 41 ; d = 304250263527210\n"}︡
︠cff1d0be-82a9-47ab-93ee-84288c2b6fdc︠
︠11305cad-49ef-4c8f-8668-0f78d3a40a7a︠
# Want to check the lower bound of 2^(t-2) for the class number of K = Q(sqrt(d)) where t is the number of primes dividing disc(K)
# For d = the product of primes from 11 up to p are listed: t^(t-2); the class number of K; p; d;
d = 1;
for p in list(primes(3,42)):
    d = d*p;
    K = QuadraticField(d);
    D = K.disc();
    t = len(D.prime_divisors())
    print 'lower bound =', 2^(t-2),';' ,K.class_number(), '= class number ;', 'largest prime divisor =', p, '; d =',d;

︡0c462c38-4941-49fd-866e-f84cb2a09419︡{"stdout":"lower bound = 1 ; 1 = class number ; largest prime divisor = 3 ; d = 3\nlower bound = 2 ; 2 = class number ; largest prime divisor = 5 ; d = 15\nlower bound = 2 ; 2 = class number ; largest prime divisor = 7 ; d = 105\nlower bound = 8 ; 8 = class number ; largest prime divisor = 11 ; d = 1155\nlower bound = 16 ; 16 = class number ; largest prime divisor = 13 ; d = 15015\nlower bound = 32 ; 32 = class number ; largest prime divisor = 17 ; d = 255255\nlower bound = 32 ; 64 = class number ; largest prime divisor = 19 ; d = 4849845\nlower bound = 128 ; "}︡{"stdout":"128 = class number ; largest prime divisor = 23 ; d = 111546435\nlower bound = 256 ; "}︡{"stdout":"512 = class number ; largest prime divisor = 29 ; d = 3234846615\nlower bound = 256 ; "}︡{"stdout":"256 = class number ; largest prime divisor = 31 ; d = 100280245065\nlower bound = 512 ; "}︡{"stdout":"8704 = class number ; largest prime divisor = 37 ; d = 3710369067405\nlower bound = 1024 ; "}︡{"stdout":"1024 = class number ; largest prime divisor = 41 ; d = 152125131763605\n"}︡
︠76e1e0de-d1d7-4ce0-a8fb-41b45c40c4be︠
︠398996b6-a671-445a-9347-6abcbc31543a︠
︡7c8d4a46-e6aa-40ac-bcfa-d07b1fe94784︡
︠7cd133fe-49c6-4636-9764-c34bd669dc6b︠
8704/512
︡21a7e913-e7fa-4fa1-beb9-39f86545ec4c︡{"stdout":"17\n"}︡
︠fc24b86e-f01f-444a-9d32-0b5933a4edb8︠









