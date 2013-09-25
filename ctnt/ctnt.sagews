︠9a098ce6-ffe9-44aa-a1e5-f3a23ac388df︠
prime_range(100)
︡8589cf9e-4157-4431-a501-16b28d2f305c︡{"stdout":"[2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]\n"}︡
︠0ff70e33-62f1-48eb-b626-75cbc524b7f8︠
g = plot(prime_pi, 2,100, gridlines=True, frame=True)
g
g.save('pics/prime_pi-2-100.pdf')
︡8924a77c-6786-4d81-a774-6ae46b2a7dd1︡{"once":false,"file":{"show":true,"uuid":"d334f349-bb17-4d53-b050-68e5bf97980d","filename":"/mnt/home/Edb0OwOT/.sage/temp/compute3a/31275/tmp_wgUexD.png"}}︡
︠15dfe70c-cc3e-4080-a811-cd2adfeea0fa︠
x = 10^9
prime_pi(x)
round(x/log(x))
︡72d48eea-3939-48ed-a026-f574bb6b7838︡{"stdout":"50847534\n"}︡{"stdout":"48254942\n"}︡
︠102844f3-2c7c-4169-879c-86b25023d43c︠
@interact
def f(B=[10^n for n in [2..9]]):
    show(plot(lambda x: prime_pi(x)/(x/log(x)), (x,2,B))
       + line([(0,1),(B,1)],color='red'))
︡36bad2c0-5082-45dc-9f5a-a1dc9d4fc6c3︡{"interact":{"style":"None","flicker":false,"layout":[[["B",12,null]],[["",12,null]]],"id":"30c6d10b-05d0-43b0-a655-12c6e447d873","controls":[{"buttons":false,"control_type":"selector","ncols":null,"button_classes":null,"default":0,"lbls":["100","1000","10000","100000","1000000","10000000","100000000","1000000000"],"label":"B","nrows":null,"width":null,"var":"B"}]}}︡
︠84768019-2908-4fb3-9554-8235c34a7644︠
@interact
def f(B=100):
    g = plot(lambda x: prime_pi(x)/(x/log(x)), (x,2,B)) + line([(0,1),(B,1)],color='red')
    show(g)
    g.save('pics/pnt%s.pdf'%B)

︡da3aa72a-b6fe-4b72-8b0c-20d1c58f65dd︡{"interact":{"style":"None","flicker":false,"layout":[[["B",12,null]],[["",12,null]]],"id":"e14d3718-9659-4ff7-860b-6d53c036d057","controls":[{"control_type":"input-box","default":100,"label":"B","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"B","type":null}]}}︡
︠ba950d69-d92e-4ab3-b839-ebc129e23942︠









