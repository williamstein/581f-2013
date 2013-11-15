# Friday, Nov 13, 2013

 - Andrew:
 - Yannick:
 - Hao:
 - Bharath:
 - Travis: continuing from last time; discriminant comps and reading.
 - Igor: ppp -- in particular, 2^i+3^j...
 - Simon: c<470,000; triples with a+b+c, coprimes.  quality histogram.

## Lecture

 - modular symbols, part 2


# Wednesday, Nov 13, 2013

 - Andrew: trying to catch up from trip...
 - Yannick: reading Number theory as Gadfly; really funny; pre-Wiles; "geometric interpretation of modularity"
 - Hao: playing with X0(43) -- get defining equation.
 - Bharath: converse theorems.
 - Travis: continuing from last time; discriminant comps and reading.
 - Igor: ppp -- in particular, 2^i+3^j...
 - Simon: c<470,000; triples with a+b+c, coprimes.  quality histogram.

## Lecture

 - modular symbols, part 1

# Friday Nov 8, 2013
 - Andrew: (at conference)
 - Yannick: conductors of curves over K; which gives maximal power of 3.
 - Hao: at a Sage Days in Florida
 - Bharath: preparing yet another talk on... Selmer groups attached to big repn; giving Tuesday.
 - Travis: plot confusion.  working on understanding curve enumeration by disc and abc -- see  <https://cloud.sagemath.com/projects/c88745bc-89ac-42c8-967e-0578ef27d929/files/ctnt/worksheets/2013-10-23-124452.sagews>
 - Igor: investigating ABC and primes of the form 2^i+3^j: <https://cloud.sagemath.com/projects/c88745bc-89ac-42c8-967e-0578ef27d929/files/ctnt/worksheets/abc_primes.sagews>
 - Simon: exponential decay can't possibly model the ABC quality distribution, unfortunately; it undershoots in the limit.  William no longer convinced that ABC is true :-(.

## Lecture

 - L-series, hilbert modular forms
 - modular symbols, part 1

# Wed Nov 6, 2013

 - Andrew: (at conference)
 - Yannick: added brumer-kramer
 - Hao: at a Sage Days in Florida
 - Bharath: investigating moduli theoretic intepretation of the cusps (Deligne-Rapaport)
 - Travis: reading ANT book about decomposition and inertia; pictures of limit
 - Igor: interviews! (hire me)
 - Simon: very interesting abc update -- now we toward strong ABC... :-)

## Lecture

 - modularity, part 2: modular curves, L-series, hilbert modular forms

# Mon Nov 4, 2013

 - Andrew: at sage days in Davis, CA
 - Yannick: info about conductor bounds over number fields.
 - Hao: preparing for a talk on "atkin-lehner fixed points" tomorrow
 - Bharath: galois cohomology.
 - Travis: other classes (complex); graph abc triple, bounded disc; going up slowly... toward 1.2
 - Igor: did algebra
 - Simon: plotted pictures --

## Lecture

- what it means for an elliptic curve to be modular over QQ
- modularity of elliptic curves over real quadratic fields

# Fri, Nov 1, 2013

## Status Reports

 - Simon: Moving house, so absent
 - Andrew: traveling to a Sage Days, so absent
 - Yannick: conductors for number fields; do it locally at each prime.
            - so for char(p) >= 5, the exponent is <= 2.
 - Hao: debug computation of Chow-Heegner points on E/Q. DEBUG.
 - Bharath: mathoverflow on defn of conductor.
 - Travis: stein-watkins tables E/Q...; making explicit the proof that ABC==>finitely many curves of bounded disc.
 - Igor: absent-- one demerit

## Lecture

- finish talking about Serre's conjecture & conductor


# Wed, Oct 30, 2013

## Status Reports

 - Simon: drew histogram of balance of abc triples for larger and larger triples
 - Andrew: nsf app, talk for sage days about sage+git
 - Hao: absent or tardy. one demerit
 - Yannick: fix typo in notes (nodal/cuspidal) and more typos.
 - Bharath: read about neron models... ugh.
 - Travis: iwasawa confusion....
 - Igor: read about neron models...
 - Keith: got a bad ass network cable. ooohhhh, ahhh

## Conductors

-

# Monday, Oct 28, 2013

## Status Reports

 - Simon: plots of "balance" of ABC triples
 - Andrew: tardy; assume up late
 - Hao: absent
 - Yannick: went hiking at Discovery Park
 - Bharath: will talk about Iwasawa theory... tomorrow!? at 11am
 - Travis: no curve of disc 1 write up.
 - Igor: wrote up extended fermat to number fields

## Conductors

- ...



# Friday, Oct 25, 2013
## Status Reports
   - Simon: defined balance of ABC triple; makes us even more dubious about strong abc :-(
   - Andrew: Simon on Tuesday --> explicit formula stuff for ABC?  wild and crazy ideas.
   - Hao: referee trac #6666 -- pass doctests. "modular symbols stuff"
   - Yannick: other cases for bounded discrimant curves (assuming ABC).
   - Bharath: NTS about main conjectures.
   - Travis: no elliptic curves of disc 1 over QQ -- will add section to the book...

## Class
   - conductors of elliptic curves (part 1)

# Wednesday, Oct 23, 2013
## Status Reports
   -  ?

## Class
   - Prove that ABC implies finitely many curves of bounded discriminant



# Monday, Oct 21, 2013

## Status reports

   - ?

## Class

  - intro to elliptic curve enumeration and the motivating problem
  - discussion of enumeration by discriminant



# Friday, Oct 18, 2013

## Status reports
  - simon's talk prep
  - andrew: abc paper
  - yannick: changed an = to <=.


## Class

  - Quick review of ECDSA
  - PS3 use of ECDSA
  - Bitcoin's use of ECDSA

  - NEXT: monday -- surprise!

# Wednesday, Oct 16, 2013
## Status Reports

- abc?  Felipe Voloch "I believe in ABC because of the function field case. I don't believe in Vojta's conjectures for the same reason. [...] Why do you see 1 as the same as 3? 1 is 1. The function field ABC is stronger than the number field case (which says 1+epsilon for all epsilon>0 but doesn't allow epsilon=0)."

## Lecture topic:
- ElGamal
- ECDSA (at least start)



# Monday, Oct 14, 2013

## Status reports
   - projector on to support status reports
   - status reports:
        - Another ABC idea: do the exact same computation for specific q<=1.  Do the pictures look exactly the same?
          Perhaps "1" as the *arbitrary magic number* in ABC is just wrong and there is no compelling "bifurcation"
          in behavior until around q=2?   Is there any argument at all for a cutoff of 1 in the original ABC
          conjecture?  If the numerical data fits the same a*x^b model for q<=1 as for 1<q<2-ish, then that's even
          more evidence that 1 is the wrong cutoff.  If there is a huge behavior change at q=1, it would also be
          interesting to see that.      Unfortunately, this might be a hard experiment to perform, since the ABC@HOME
          project I think threw away all triples with q<=1!

## Upcoming Lecture Topics:
   - RSA... on an elliptic curve?
   - ElGamal on elliptic curve
   - ECDSA: designed by nsa, used in bitcoin and cracked in PS3 and Android Bitcoin wallet...


# Friday, Oct 11, 2013

Plan:

   - come in with projector on to support status reports
   - status reports: lasted all by 6 minutes of class
       - a lot of time on not-ABC
       -
   - RSA (decided to skip)
   - start elliptic curve crypto: talked about diffie-hellman on an elliptic curve, and schoof story.

## Notes from Today's status reports

