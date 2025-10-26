."\\l ",`env[]`KINIT
imp.ort[`l;"l.k"]

I:0:"2.txt"

nrm:{t:@[+l.p'x;1 2;-;1] / 0-based months and days
  tzo:60*0 60/-2#t
  tzo*:sgn:-1 1"-"=x[;19]
  to:0 60 60/t[3 4 5]

  a:l.S\to+tzo
  a:@[a;0;+;t[2]]
  d:a[0]+l.DS t[1]
  d:(0 12\m),,d-l.DS@m:l.DS'd:d+sgn*l&d=l.ef-l:~l.ly[t 0]
  +@[d,1_a;0 1 2;+;(t 0;1;1)]}

r:*&=/1|/\#'=nrm I
`0:l.shw[r,0 0]
