/ ngn/k
data:0:"day18.txt"
rot:{1_x,1#x}

/ process
P:{l:,/((,/0,1 0+&'"[]"=\:)'s)_'s:","\x;w:&~^n:`I$l
   l:@[l;w;:;n@w];w:&`C=@'l;@[l;w;:;(,/l@w)-94]}

/ leftmost explode
ex:{$[0N=p:*&(lv>4)&(rot@m)&m:=':lv:+\-/-3 -1=\:x;:0N;]
    wn:&1&#'(l;r):&'(x>-1)&/:((>;<)@'(p+0 1))@\:!#x
    ((p-1)#r),0,(p+3)_r:@[x;(*|l;*r)@wn;+;x@(p+0 1)@wn]}

/ leftmost split
sp:{$[0N=p:*&x>9;:0N;]
    (p#x),-3,(h,v-h:-2!v:x@p),-1,(1+p)_x}

/ reduce
rd:{$[~0N=r:ex x;r;~0N=r:sp x;r;x]}

/ magnitude
mg:{*{$[y=-1;:x;y=-3;:(-3),x]
    {~0>x@1}{(+/2 3*x@!2),3_x}/y,x}/[!0;x]}

add:{-3,x,y,-1}
run:{rd/add[x;y]}

a:P'data

mg@run/a
p:,/l,\:/:l:(,'a)
|/mg@'run@/'p
