/ ngn/k
s:(`I$","\)''(1+1&l)_'(l:0,&0=#'x)_x:0:"day19.txt"
/ orientation preserving transforms
rot:(0 1 0;-1 0 0;0 0 1)
mm:{+/'x*\:y}
tr:,/mm[rot]\'(=3;(-1 0 0;0 1 0;0 0 -1))
tr,:,/((0 0 1;0 1 0;-1 0 0);(1 0 0;0 0 1;0 -1 0))mm\:/:tr

/ square of the distances between each point per scanner
ds:s {+/m*m:y-x}/:\:'s

/ overlaps of not less than 12
ot:&|/'|/''ov:{~12>+/'~^ds[x]?/:\:ds[y]}.'ix:,/i,/:'1+||',\|i:!-1+#s

/ basis vectors
bv:{{x-y}.'(x)}'(2#''pts:{s.(x)}'''(+'+''(,'mp:ix[ot]),/:',''pts:(+&)'ov@ot))

/ which transformation applies in the forwards and backwards directions
tf:+{{&{&/x='y}[y]'mm[;x]'tr}.(x)}''(bv;|'bv)

/ which conversions between scanners are possible
cm:(*|cv)@=*cv:+mp,|'mp

/ conversion
cv:{(i;d):$[^i:mp?x;(mp?|x;1);(i;0)];(*pts[i;~d])+/:mm[tr[*tf[i;d]]]'y-\:*pts[i;d]}

/ path of transformations back to zero
tp:1_'(*'x)!x:|'{,/{$[~*x;:,x;](n@&^x?n:cm[*x]),\:x}'x}/x:,'!#s

/ part 1
#?,/,/1_'{(x;s[x]){(f;p):x;(y;cv[(f;y);p])}/tp[x]}'!#s

/ part 2
|/{+/v*(~m)+-1*m:0>v:x-y}.',/s,/:\:s:,/1_'{(x;,0 0 0){(f;p):x;(y;cv[(f;y);p])}/tp[x]}'!#s
