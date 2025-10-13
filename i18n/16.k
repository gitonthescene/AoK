imp.ort[`l;"l.k"]

(C;U;D):+"\t"\'-1_("#"=*:')_0:"CP437.TXT" / https://www.unicode.org/Public/MAPPINGS/VENDORS/MICSFT/PC/CP437.TXT
BOX:(::;256/+:)@'256!.''(C;U)@\:&"#BOX"~/:4#/:D
SHAPES:2/'0 2_+2\119723251096 166699989604 1045669174478 134217725 1097527382845 545383366414
BITS:|'-4_/:`B$'`c$SHAPES[1]
BITS,:,0000b

ROT:2/(*|r):':r:2\SHAPES 1
FLIP:2/|2\SHAPES[0]
ROT:?/16/'(SHAPES;(FLIP;ROT))
ROTATE:3(ROT@)\!#ROT
ROTATE0:?'+ROTATE@4!2+!4

I:I0:0:"16.txt"
I:I0:-7_/:7_/:4_-4_I0
I:BOX[0]?256!I0

D:-1_#'*:\J :4(+|0N,)/I
J:,/J

R:@[0N 0@^J;*'|:\&~^J;:;0]

dir:(*|dir):':dir:D/+,/-:\|=2 / ESWN
N:dir+\:!#R

f:{{w:&^[y 0]&1<+/n:~^y[0]@N
    ww:&1=#'d:&'(&/|/''&/:'/)'+((1000B;0100B;0010B;0001B)4!2+d
      =\:/:/'BITS({ROTATE0[x]};::)@'/:#[SHAPES 1]^+y[1]@(w;w+dir d:&'(+n)@w))
    (R;(R:@[y 0;w@ww;:;*+d@ww]){ROTATE[0^x;y]}'x)}[x]/(y;z)}

r:f[J;R;J]

shw:`0:,/'l.u8''D#32^BOX[1]@

shw J
shw r 1
+//r 0
