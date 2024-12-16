I:0:"day16.txt"

S:-1_#'*:\I
C:S/+,/-:\=2

I:,/I
N:C+\:!#I
D:4,#I

(st;ed):I?"SE"
st:1,st        / start east

T:D/(&(#I)+&4;,/N)    / transition (i.e. move forward) any direction
TB:@[&*/D;T;:;!*/D]   / move back
(TL;TR):D/',\:/(,'4!1 3+\:*d;,*|d:!D) / turn left and right (only. no move.)

P:1 1000 1000    / cost of a step

TG:,/4#,I
TN:(TB;TL;TR)
TF:(T;TL;TR)
TW:(MX:10000*/D)*"#"=TG  / walls infinitely far away

X:@[MX+&*/D;D/st;:;0]
dj:{TW|x&/(P+x@TN)|TW@TN} / Djikstra
@[r:&/4 0N#rr:dj/X;ed]

stp:{?,/n@'&'~^1 1001?-/:/rr@(x;n:TB@((::);TL;TR)@\:x)} / step back as long as you hit a min cost

e:(=/1&/\rr@)#ed+/:(#I)*!4  / find the cheapest approach to the end

#?*|D\,//stp\e

/ display
sh:`0:" "/'$/|1(-:1+|/#',/)\$:
