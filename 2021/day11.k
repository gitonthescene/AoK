data:(0$')'0:`day11.txt
ix:{x,/:\:y}.(!:'^data)
n:-1+^data
lm:10
f9:{,/{y,/:&lm=x}.'+(x;!#x)}
nb:{{x+!(1+y-x)}.'0|(n&(-1 1;-1 1)+x)}
sd:{x@&:(#y)=y?/:x}
nxt:{(,/.[ix;y])@&,/lm=.[1+x;y]}
fl:{{pts:nb[*z];
     (.[x;pts;+;1];(y,,*z);1_ z,sd[nxt[x;pts];y,z])}.(x)}
st:{{r:{#*|x}(fl)/(1+x;!0;f9@1+x);
     ((*r)*lm>*r;y+#r@1;1+z)}.(x)}

100(st)/(data;0;0)
{|/,/*x}(st)/(data;0;0)
