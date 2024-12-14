I:1:"day13.txt"

/ --- rationals.k ---
gcd:*(*|:)(|!\)/
add:{(+/*/(x;|y);*/*'|'(x;y))}
sub:{add[x;-1 1*y]}
mul:{*/(x;y)}
div:{mul[x;|y]}
red:{(-gcd x)!x}
/ -------------------

(L;V):++'":"\''"\n"\'"\n\n"\I
V:`I$3_/:/:/:","\''V
V:{(+x;*y)}/'0 2_/:V
(rms;rxs):+(\:/)[4;,][V;1]

rmm:{add/mul[x;y]}\:
rdet:{add[x;-1 1*y]}/{*/(x;y)}/{|y}\
rinv:{((a;b);(c;d)):x; div[;rdet x]''((d;mul[-1 1;b]);(mul[-1 1;c];a))}

(rms;rxs):+(\:/[4;,])[V;1]
+//3 1*+r[0]@&&/'1=*|r:++'red''(rinv'rms)rmm'rxs
+//3 1*+r[0]@&&/'1=*|r:++'red''(rinv'rms)rmm'add[10000000000000 1;]''rxs
