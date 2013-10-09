︠0c7a820b-4dc5-4d31-8f4e-38543eea1a3e︠
@interact
def f(a=3, b=4):
    c = a + b
    print "%s + %s = %s"%(a,b,c)
    v = prod(set(prime_divisors(a) + prime_divisors(b) + prime_divisors(c)))
    q = log(c)/log(v)
    print "quality = ", float(q)
︡254f73fe-9b00-45b2-99b4-76be4b450c93︡{"interact":{"style":"None","flicker":false,"layout":[[["a",12,null]],[["b",12,null]],[["",12,null]]],"id":"cc9aebd6-31ce-48b4-b0f8-6670fb486aea","controls":[{"control_type":"input-box","default":3,"label":"a","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"a","type":null},{"control_type":"input-box","default":4,"label":"b","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"b","type":null}]}}︡
︠89d357a0-377c-4e69-a0de-8a7efb0fe39d︠
@interact
def f(p=3, n=1):
    if not is_prime(p) or p<=2:
        print "p must be an odd prime!"
    if n < 1:
        print "n must be >= 1"
    a = 1
    b = 2^(p*(p-1)*n) - 1
    c = 2^(p*(p-1)*n)
    print "%s + %s = %s"%(a,b,c)
    print "(now computing quality...)"
    sys.stdout.flush()
    v = prod(set(prime_divisors(a) + prime_divisors(b) + prime_divisors(c)))
    q = log(c)/log(v)
    print "quality = ", float(q)
︡e86913cb-4054-4eeb-bf07-353eddce2552︡{"interact":{"style":"None","flicker":false,"layout":[[["p",12,null]],[["n",12,null]],[["",12,null]]],"id":"55abe9eb-8bc6-4cfb-89cb-0f48665e2da7","controls":[{"control_type":"input-box","default":3,"label":"p","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"p","type":null},{"control_type":"input-box","default":1,"label":"n","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"n","type":null}]}}︡
︠c62dbad8-352d-4e08-9a80-a92ce8c568d0︠
tbl = """c < 102	6	4	4	2	0	0
c < 103	31	17	14	8	3	1
c < 104	120	74	50	22	8	3
c < 105	418	240	152	51	13	6
c < 106	1,268	667	379	102	29	11
c < 107	3,499	1,669	856	210	60	17
c < 108	8,987	3,869	1,801	384	98	25
c < 109	22,316	8,742	3,693	706	144	34
c < 1010	51,677	18,233	7,035	1,159	218	51
c < 1011	116,978	37,612	13,266	1,947	327	64
c < 1012	252,856	73,714	23,773	3,028	455	74
c < 1013	528,275	139,762	41,438	4,519	599	84
c < 1014	1,075,319	258,168	70,047	6,665	769	98
c < 1015	2,131,671	463,446	115,041	9,497	998	112
c < 1016	4,119,410	812,499	184,727	13,118	1,232	126
c < 1017	7,801,334	1,396,909	290,965	17,890	1,530	143
c < 1018	14,482,065	2,352,105	449,194	24,013	1,843	160"""
data = []
for v in tbl.splitlines():
    z = v.split()
    e = int(z[2][2:])
    n = int(z[-2].replace(',',''))   # <---- change this [-n] to a different value
    data.append((e,n))

︡16d4fc91-65f8-4529-9004-940391f7265c︡
︠6ab36537-46b2-4a4d-abd4-22e443b0f842︠
show(line(data), frame=True, gridlines=True)
︡30356d4d-bba9-4adc-8194-de2a625bef94︡{"once":false,"file":{"show":true,"uuid":"ac25a7f9-327d-4087-a2da-8f6a0fda683c","filename":"/mnt/home/uHNlUmEE/.sage/temp/compute1a/31512/tmp_4Ta5yo.png"}}︡
︠2cb2d46d-bdf2-463f-9168-104fd2bab12d︠
line(data).save('../pics/abcplot.pdf', frame=True, gridlines=True)
︡bcffda79-e9ec-47fb-98cd-7fa3920e8358︡
︠4729067a-bed7-4145-8f62-b72769c4cf97︠
# From "effective abc" -- see pdf in ~/references
v = [6.8, 7.7, 15.7, 9.9, 3.6, 4.8, 20.8, 13, 9.8, 17.1, 19.5, 9.3]
v.sort()
v
︡f03c9dee-6b12-4f26-ae96-ad1bb670cc3a︡{"stdout":"[3.60000000000000, 4.80000000000000, 6.80000000000000, 7.70000000000000, 9.30000000000000, 9.80000000000000, 9.90000000000000, 13, 15.7000000000000, 17.1000000000000, 19.5000000000000, 20.8000000000000]\n"}︡
︠96558f51-38c5-4347-b4e3-06c739dd9187︠
w = [(b,a+1) for a,b in enumerate(v)]; w
︡9d727de0-6005-487e-ac07-f44301c54eb6︡{"stdout":"[(3.60000000000000, 1), (4.80000000000000, 2), (6.80000000000000, 3), (7.70000000000000, 4), (9.30000000000000, 5), (9.80000000000000, 6), (9.90000000000000, 7), (13, 8), (15.7000000000000, 9), (17.1000000000000, 10), (19.5000000000000, 11), (20.8000000000000, 12)]\n"}︡
︠29d52bac-d2b6-4b1d-b94e-2c8edc1db56b︠
plot_step_function(w)
︡eab371f8-71fb-4eed-b580-7e36391bfb41︡{"once":false,"file":{"show":true,"uuid":"5f30d447-0d35-423b-8c5b-a2d63986dc63","filename":"/mnt/home/uHNlUmEE/.sage/temp/compute1a/7110/tmp_yXbjDj.png"}}︡
︠8e61a0e2-5636-40aa-8962-971b042e5321︠









