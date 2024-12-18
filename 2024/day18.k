I:0:"day18.txt"
S:70 70
SZ:1024

S:3+S0:S
I:S/1+|+.'I
C:S/+,/-:\=2
N:C+\:!*/S
E:~@[&*/S;S/1+!S-2;:;1] / border


dj:{}
/S#@[&*/S;12#S/I;:;1]
MX:(*/S)
st:1 1
ed:S/1+S0

dj:{x|y&/1+MX^y[N]|x[N]}

i:0
run:{ B:@[E;x#I;:;1]
      X:@[MX+&*/S;S/1 1;:;0] /cost
      BX:MX*B
      (dj[BX]/X)ed}

run[SZ]
`0:","/$|-1+S\I@*&MX=run'1+!#I

