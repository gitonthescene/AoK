I:1:"day17.txt"

(T;B):+'":"\''"\n"\'"\n\n"\I
R:.'T 1
P:.*B 1
I:0

op:{((x@-4+;(::))y<4)y}

adv:{(0N;z+2;@[x;0;:;![-:2/~!1+op[x;y];x[0]]])}
bxl:{(0N;z+2;@[x;1;:;2/~=/+2\(x 1;y)])}
bst:{(0N;z+2;@[x;1;:;8!op[x;y]])}
jnz:{(0N;(y;z+2)@~x[0];x)}
bxc:{(0N;z+2;@[x;1;:;2/~=/+2\1_x])}
out:{(8!op[x;y];z+2;x)}
bdv:{(0N;z+2;@[x;1;:;![-:2/~!1+op[x;y];x[0]]])}
cdv:{(0N;z+2;@[x;2;:;![-:2/~!1+op[x;y];x[0]]])}

ins:(adv;bxl;bst;jnz;bxc;out;bdv;cdv)

O:()
run:{$[|/^i:x@y[1]+!2;:y;]
    (o;p;r):ins[i 0][y 0;i 1;y 1]
    $[^o;;O,:o]
    (r;p)}

runt:{O::();r:run[y]/(x;0); r:(","/$O;r);O::();r}
`0:*runt[R;P]

/
/ test cases
T:((0N 0N 9;2 6)
   (10 0N 0N;5 0 5 1 5 4)
   (2024 0N 0N; 0 1 5 4 3 0)
   (0N 29 0N; 1 7)
   (0N 2024 43690;4 0))
\

cut:2/~1 1 0=2\!8
xor:{2/~=/+2\(x;y)}
xor0:2/~2\cut       / what we'll xor with
pat:"yx"@&3 7
pat:"01yx"?@/1(<#:')\(cut#\:pat),',/'$+2\!8

st:(,(0;(!0;!0)))
mf:{rsv:x[1;0];c:-(#rsv)&#'pat;{[i;x;y;z](i;_[y;x],z)}.'+(::;pat;c;t)@\:w:&1&/'(r>1)|(t>1)|(r:c#\:rsv)=t:c#'pat}  / match front
mb:{{x,3_y}.'+(f;y[1])@\:&1&/'+/1 2=(1;t)*~:\(t:3#/:y[1])='f:+(3#2)\xor[x;7] xor/: y[0]}                          / match back
mg:{_/:[-#y;x],\:y}                                                                                               / merge
nxt:{s:+_'/|1(0,/:-3+#:')\_\:[-#'r;y[1;0]],'r:mg[z;y[1]0];(1+y[0]),/:,'+(s[0];s[1],\:y[1]1)}
srch:{i:*y; $[^x i 0;1_y;~#m:mf i;1_y;~#m:mb[x i 0;+m];1_y;nxt[x;i;m],1_y]}                                       / search

win:","/$P                        / victory!
r:srch[P]\st                      / Look for all possible patterns
w:&16=*'*++'r                     / where we found the whole program
tbl:=+/'3=,/'rrs:(?*'r[w])[;1]    / sorted by how many bits are still "optional"

ttt:{{{$[win~*runt[x,0 0;P];`0:$x;];*x}'i:2/'@[t;&3=t:y;:;]'+2\!2/~!1+x}[x]'?,/'rrs@tbl x}9      / nope..
ttt:{{{$[win~*runt[x,0 0;P];`0:$x;];*x}'i:2/'@[t;&3=t:y;:;]'+2\!2/~!1+x}[x]'?,/'rrs@tbl x}10     / nope...
ttt:{{{$[win~*runt[x,0 0;P];`0:$x;];*x}'i:2/'@[t;&3=t:y;:;]'+2\!2/~!1+x}[x]'?,/'rrs@tbl x}11     / nope....
ttt:{{{$[win~*runt[x,0 0;P];`0:$x;];*x}'i:2/'@[t;&3=t:y;:;]'+2\!2/~!1+x}[x]'?,/'rrs@tbl x}12     / woo hoo!

/
My program
---------------------------------------------------------------------
bst | 2 4  |  A mod 8    -> B  bottom three bits
bxl | 1 6  |  B XOR 6    -> B  flip 2nd and 3rd least significant bits
cdv | 7 5  |  (-:2^B)!A  -> C  remove B bits from A
bxc | 4 4  |  B XOR C    -> B
bxl | 1 7  |  B XOR 7    -> B  flip the 3 least significant bits
adv | 0 3  |  (-:2^3)!A  -> A  remove 3 bits from A
out | 5 5  |  8!B -> OUT
jnz | 3 0  |  JUMP

