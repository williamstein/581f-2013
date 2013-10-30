︠9fe84bc7-aef3-4ab6-b89a-7d0b5dd92b57︠

n = 4;
for a0 in range(-n, n+1):
    for a1 in range(-n,n+1):
        for a2 in range (-n,n+1):
            f = x^3 + a2*x^2 + a1*x + a0;
            if (len(f.factor()) == 1):
                K.<alpha> = NumberField(x^3 + a2*x^2 + a1*x + a0);
                print K.disc()
︡82ae6374-63a2-4ec3-87bd-f0f711c68580︡
︠2ea1af82-837a-4aa3-9588-b0de9cfd736f︠

x^3+1.factor()
︡4d7f7739-756a-42e6-af1a-14f59a2bcde7︡{"stdout":"x^3 + 1\n"}︡
︠6f69f538-21c2-4e00-a1f1-292af95db6d4︠

︠dbf93446-ee56-40a3-b352-d78ee06d6698︠









