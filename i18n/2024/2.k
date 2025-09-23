I:0:"2.txt"
D:0 31 29 31 30 31 30 31 31 30 31 30 31
S:0 24 60 60
DS:+\D
ef:DS 2 / end of February

ly:{2!+/~4 100 400!/:\:x} / leap year [[https://nsl.com/k/training/idioms_K3.pdf]]
p:{.'*+0N 2#(0,-1_+\,/(4,2+&7),\:1)_x,":"} / parse
shw:{t:-1_"0"^,//+((-:4,2+&5)$'$6#x;"--T:::");t,:"+-"m:0>x[6];t,":"/"0"^-2$$(1 -1m;1)*x 6 7}

nrm:{t:@[+p'x;1 2;-;1] / 0-based months and days
  tzo:60*0 60/-2#t
  tzo*:-1 1"-"=x[;19]
  to:0 60 60/t[3 4 5]

  a:S\to+tzo
  a:@[a;0;+;t[2]]
  d:a[0]+DS t[1]
  d:(0 12\m),,d-DS@m:DS'd:d+~[l]&d=ef-~l:ly[t 0]
  +@[d,1_a;0 1 2;+;(t 0;1;1)]}

r:*&=/1|/\#'=nrm I
shw[r,-4 0]
