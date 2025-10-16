."\\l ",`env[]`KINIT
imp.ort[`l;"l.k"]

I:.'"0x",/:0:"17.txt"

/`0:I
sh:-1_#'*:\

/ parts
P:1_/:_/|1(&~#:')\(,""),I
b:@/1<:\256!0x80c0e0f000
border:"-|═║╔╗╚╝"
X:"╳"

hist:{`0:+@[;!0|/x]'"# "@&'x}

/ how much of incomplete utf8 encoding needed
l:B.[;]/:'+'w:&'(1+|!16)</:/:B:b''256!P

N:(4/'0N 8#{0^*-/(x;i)@\:&x>i:1+|!16}')'B
H:4/''0N 8#/:(+/&\)''1=B

/ shave bogus stuff
S:l.u8d''P{:[;y]_x}''|\''(1+|!16)</:/:b'256!P

top:&/'~^(l.u8d border)?*'S
bottom:&/'~^(l.u8d border)?(*|:)'S
right:&/'~^(l.u8d border)?(*|:)''S

start:@[;0 2 1]@,/1((&right)^)\,/&'(top;bottom)&\:right

r:31{n@<w@n:&~^w:*'(,/H x)?N}\start

shw:" "/'$/|1(|/#',/)\+$@\:/1(!|/#:')\@'/1(&'#'[P]@)\
shw@|r

*//&(l.u8d','/,/'P@|r)=*l.u8d X
