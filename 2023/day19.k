IN:1:"day19.txt"
(F;B):"\n"\'"\n\n"\IN
W:.''(~#:')_/:" "\'d(d:,/$!10)?B
(N;P):+"{"\'-1_'F
N,:,'"AR"
A:N?,"A"
R:N?,"R"

call:{$[^(A;R)?x;disp[T[x]][y];x]}

tcall:{[n;i;f;t;v]$[~f/(v[i];t);0N;call[n][v]]}
disp:{*|{(#*x)&^(A;R)?*|x}{(1_*y;(**y)[x])}[y]/(x;0N)}

mkfn:{$[1=#x;call[*N?x];tcall[*N?x 1].(*"xmas"?p 0;.p 1;.(p:0 1 2_*x)2)]}
T:mkfn''":"\''","\'P

+//(A=call[*N?"in"]')#W

/ Different tack for part 2

(T;G):++'-1_'P:":"\''","\'P     / Split tests from results
G:N?G,','(**|)'P                / Use ids instead of strings
T:T,\:,"x>0"                    / Add dummy test for default

/ Paths to acceptance
VV:.[T;]'''|'{x,/:!1+y}.''{(,'+p),',/'o'*p:&~^(,x)?G}A

/ Can only pass a given test if you fail the preceding ones in a workflow
V:,/'{(v;c;t):+0 1 2_/:x
 +("xmas"?,/v;2/1(|1&!#:)\"<>"?,/c;.'t)}''VV

cut:{x:2 2\x;$[~y;z;~z'y;@[z;=/x;:;y+*x];2#*z]}

+/*/'--/''r{@[x;*y;cut.1_y]}//:V
