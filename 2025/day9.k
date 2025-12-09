I:0:"day9.txt"

D:.''","\'I
|//{*/{x|-x}@-/x+0 1}''prs:,/:\:/2#,,'D

p:(@/1<:\)'+D
E:+p?'+D

jumps:#''='+(*|E)-':E / jumps
/ At this point I rendered the graph and saw the solution was in one half or the other...

adj:@/|1((+{|y}\+:;::)@</*|+:)\@/1<:\

P1:D[249 248]          / where it takes a turn
H1:D@&'~:\50000>D[;1]  / split graph in half
B0:adj'(,P1 0),/:,'H1 0
B1:adj'(,P1 1),/:,'H1 1

m0:*/'-/0 1++B0@&~{+/&/x{</x>\:y}'y}\:[(|\'+1 0+)'B0;+H1 0]
m1:*/'-/0 1++B1@w:&~{+/&/x{</x>\:y}'y}\:[(|\'+1 0+)'B1;+H1 1]

|/m0,m1

/
//  Render as pbm
d:1+|/E
m:d#@[&*/d;d/+E;:;1]

diag:+m|/(::;+:)@'~=\'~+:\m
drw:{dd: :[;2]# :[;2]#/:y;s:-1_#'*:\dd;x 0:("P2";" "/$|s;"10")," "/'$dd}
drw["/tmp/map1.pbm"] 10*diag

P:E[249 248]        / where it takes a turn
H:E@&'~:\245>E[;1]  / split graph in half
B1:adj'(,P 1),/:,'H 1

drw["/tmp/map1.pbm"] 10*diag
drw["/tmp/map2.pbm"]@ .[10*diag;|{x+!'y-x-1}/B1[w@25];:;4]
