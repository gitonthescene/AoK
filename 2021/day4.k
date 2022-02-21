/ works in tio, but seems to be an issue in the current kona; [[https://github.com/kevinlawler/kona/issues/622]]
/ This is the part that's not working: {|/(&/)+x,+x}'10 5 5#(10*5*5) _draw 2

data:0:`day4.txt
call:0$'","\data 0
nc:#call
bds:{x@&~0N=x}''(0$" "\'1_)'(&0=#:'d)_ d:1_ data
st:((#bds;5;5)#0;call;&#bds)
pl:{{w:&~z;n:@[x;w;:;{x[z]|((*y)=)'bds[z]}[x;y]'w];(n;1_ y;@[z;w;:;(nc-#y)* {|/(&/)+x,+x}'n@w])}@/x}

r:{~&/x@2}pl/st
sc:bds*~r[0]
c:{*(call@r[2][x])*+//sc[x]}
i:{&(x/r@2)=r@2}
c'i'(&;|)
\\