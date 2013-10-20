︠0ead47f1-8f89-495d-a065-219b80c19771i︠
%md
# The Bitcoin Elliptic Curve

Definition: <https://en.bitcoin.it/wiki/Secp256k1>

Discussion: <https://bitcointalk.org/?topic=2699.0> -- "ECDSA verification is the primary CPU bottleneck for running a network node. So if Koblitz curves do indeed perform better we might end up grateful for that in future ..."
︡f758f0ae-f6f8-48e1-ad38-05d08b927da9︡{"html":"<h1>The Bitcoin Elliptic Curve</h1>\n\n<p>Definition: <a href=\"https://en.bitcoin.it/wiki/Secp256k1\">https://en.bitcoin.it/wiki/Secp256k1</a></p>\n\n<p>Discussion: <a href=\"https://bitcointalk.org/?topic=2699.0\">https://bitcointalk.org/?topic=2699.0</a> &#8211; &#8220;ECDSA verification is the primary CPU bottleneck for running a network node. So if Koblitz curves do indeed perform better we might end up grateful for that in future &#8230;&#8221;</p>\n"}︡
︠54a0b794-3a5f-4f57-b4e0-6a2daa94bf63i︠
%html
<img src="http://static.guim.co.uk/sys-images/Guardian/Pix/pictures/2013/10/7/1381140058873/2247810e-7625-43d0-b66b-d5c535d6460b-300x180.jpeg">
︡a27460dc-e39b-412a-acc5-1b8a7c61e4d3︡{"html":"<img src=\"http://static.guim.co.uk/sys-images/Guardian/Pix/pictures/2013/10/7/1381140058873/2247810e-7625-43d0-b66b-d5c535d6460b-300x180.jpeg\">"}︡
︠a2252709-7079-4a59-899c-01b3a91d6a72︠
p =  2^256 - 2^32 - 2^9 - 2^8 - 2^7 - 2^6 - 2^4 - 1
is_prime(p)
︡45af1004-e89f-45a8-b995-23518a8d89a7︡{"stdout":"True\n"}︡
︠fd8b72d7-4fef-4472-a784-468045e34173︠
E = EllipticCurve(GF(p),[0,7]); E
︡d42576d8-fd0a-468f-b01a-b39c392cbf77︡{"stdout":"Elliptic Curve defined by y^2 = x^3 + 7 over Finite Field of size 115792089237316195423570985008687907853269984665640564039457584007908834671663"}︡{"stdout":"\n"}︡
︠516f9b69-ca6e-4e2e-b300-d87b20bf45cbi︠
%md
*Remark* The Bitcoin curve is the reduction mod $p$ of a curve that has CM by $\mathbb{Q}(\sqrt{-3})$, i.e., it is a twist of the Fermat cubic.
︡fd74d2dd-8202-4a5f-b9fd-a0c5e7815e22︡{"html":"<p><em>Remark</em> The Bitcoin curve is the reduction mod $p$ of a curve that has CM by $\\mathbb{Q}(\\sqrt{-3})$, i.e., it is a twist of the Fermat cubic.</p>\n"}︡
︠cdc4944c-1168-4457-be8d-9bb142e5c14b︠
F = EllipticCurve([0,7]); F.conductor().factor()
︡bade2323-77ca-470e-9a4f-d17a57ffaf00︡{"stdout":"2^4 * 3^3 * 7^2\n"}︡
︠2e7e8372-c871-4f11-9e32-b6ff86cdf97d︠
F.j_invariant()
︡dc60dc39-58b0-4ac5-8efd-048db01be283︡{"stdout":"0\n"}︡
︠06641062-e0e9-4194-b79e-b0a4ea9e695d︠
%time n = E.cardinality(); n
︡c3e3c412-244c-468b-8747-fb64341cd991︡{"stdout":"115792089237316195423570985008687907852837564279074904382605163141518161494337"}︡{"stdout":"\n"}︡{"stdout":"CPU time: 0.23 s, Wall time: 0.04 s\n"}︡
︠b07476b7-9b19-46e5-a777-b3614d2a90db︠
is_prime(n)
︡6c10df9d-b729-4510-85eb-a72e422eef1e︡{"stdout":"True\n"}︡
︠dcee6887-b5f4-446b-ad87-ecaf0b876c61︠
len(n.str(2))
︡aea417fe-2345-47f4-ba24-e6f9809fde66︡{"stdout":"256\n"}︡
︠b9c79180-ea54-4632-bfc2-f8f7ec54c8f8︠
s = '79BE667E F9DCBBAC 55A06295 CE870B07 029BFCDB 2DCE28D9 59F2815B 16F81798'.replace(' ','').lower(); s
︡c15ff3a4-1a88-4627-800e-3d4b94ec9b1b︡{"stdout":"'79be667ef9dcbbac55a06295ce870b07029bfcdb2dce28d959f2815b16f81798'\n"}︡
︠f4ebe00a-064f-4ea1-9036-ff854ae46c44︠
x = E.base_field()(ZZ(s,base=16)); x
︡68391252-f07f-411d-ad1e-8ceb712f7517︡{"stdout":"55066263022277343669578718895168534326250603453777594175500187360389116729240\n"}︡
︠f49f8cbe-8312-4edd-bd2e-a35661682780︠
G = E.lift_x(x)
G
-G
︡28ffbd3c-70be-41d2-aaf5-71ddb48071e4︡{"stdout":"(55066263022277343669578718895168534326250603453777594175500187360389116729240 : 32670510020758816978083085130507043184471273380659243275938904335757337482424 : 1)\n"}︡{"stdout":"(55066263022277343669578718895168534326250603453777594175500187360389116729240 : 83121579216557378445487899878180864668798711284981320763518679672151497189239 : 1)\n"}︡
︠34628408-62cb-44f5-81ec-325e70bc2b52︠
ZZ(G[1]).str(base=16)  # this is the one
ZZ(-G[1]).str(base=16)
︡82675250-73eb-459b-96f1-086547b89e91︡{"stdout":"'483ada7726a3c4655da4fbfc0e1108a8fd17b448a68554199c47d08ffb10d4b8'\n"}︡{"stdout":"'b7c52588d95c3b9aa25b0403f1eef75702e84bb7597aabe663b82f6f04ef2777'\n"}︡
︠a0b28b69-8604-47b9-8e7c-8e78d13a8029︠
G
︡ba1fdce4-03a1-406d-ba74-2e08cc3d5445︡{"stdout":"(55066263022277343669578718895168534326250603453777594175500187360389116729240 : 32670510020758816978083085130507043184471273380659243275938904335757337482424 : 1)\n"}︡
︠72268210-7b6d-47f1-943d-952b69c20edb︠
G.order()
︡6764b557-4e5e-4572-9251-b80e0355c29b︡{"stdout":"115792089237316195423570985008687907852837564279074904382605163141518161494337"}︡{"stdout":"\n"}︡
︠ca4f1a37-e48b-478f-b661-a69f032c6e6a︠









