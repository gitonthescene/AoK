I:".O#"?0:"day14.txt"

run:{s-|\(~x)*s:+\x}
roll0:{r:-':|\(2=t)*+\&/1(~2=)\t:+x,\:2;(2*2=x)++1_(|run@|~r)<|{y+x*~y}\|r}

roll:{(4!-y)(+|:)/roll0@y(+|:)/x} / 0 right, 1 up, 2 left, 3 down

ld:+//*/1(1+|!#:)\1=

ld@roll[I]1

/ Pick a big number to try to enter a cycle
r:2000{(roll.(x);4!1+*|x)}\(I;1);
d:=r?r
ld@*r@w@(#w)!(4000000000-&/w:&~1=#'d)
