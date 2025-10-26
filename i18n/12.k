."\\l ",`env[]`KINIT
imp.ort[`l;"l.k"]

`"libicu.dylib"2:(`loadicu;1);
trans:{(e;r):icutrans[x;y];$[e;`err"icutrans";r]}

low:trans["NFC; Any-Lower"]
up:trans["NFC; Any-Upper"]

strp:trans["NFD; [:Nonspacing Mark:] Remove; Any-Lower; NFC"]
latin:trans["NFD; Any-Lower; Latin-ASCII ; NFC"]

(N;P):+": "\'0:"12.txt"
(L;F):+", "\'N

US:<+((~^" -'"?)_/:latin'low')'(L;F)

C:(^" -'"?)#/:/:(l.u8d low@)''(L;F)

A:228 229 230; O:246 248
CS:@''['''^A?C;228;C]
CS:@''['''^O?C;246;CS]

SW:<+((0,256+2 1 2 3 3)@1+-1^(A,O)?(775=)_/:/:C)+(latin@,/l.u8')''CS

D:+/'&\'~=/(^" -'"?)#/:/:(l.u8d@)''(L;up'L)

DH:<latin'',/''l.u8'''+(D_'C[0];C[1],'D#'C[0])

*/.'P@(SW@m;DH@m;US@m:-2!#US)
