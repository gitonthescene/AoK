/ ngn/k
data:0:"day18.txt"
rot:{1_x,1#x}

/ process
P:{l:,/((,/0,1 0+&'"[]"=\:)'s)_'s:","\x;w:&~^n:`I$l
   l:@[l;w;:;n@w];w:&`C=@'l;@[l;w;:;(,/l@w)-94]}

/ leftmost explode
ex:{$[0N=p:*&(lv>4)&(rot@m)&m:=':lv:+\-/-3 -1=\:x;:x;]
    wn:&~^c:*'c@'&'-1<x@c:(|:;2_)@'(0,p)_!#x
    ?[@[x;c@wn;+;x@(p+0 1)@wn];-1 3+p;0]}

/ leftmost split
sp:{$[0N=p:*&x>9;:x;]
    ?[x;0 1+p;-3,(h,v-h:-2!v:x@p),-1]}

/ magnitude
mg:{*{$[y=-1;:x;y=-3;:(-3),x]
    {~0>x@1}{(+/2 3*x@!2),3_x}/y,x}/[!0;x]}

run:mg@((sp@ex/)/rot@-1,-3,,)/

run@a:P'data
|/run@'p:,/l,\:/:l:(,'a)
