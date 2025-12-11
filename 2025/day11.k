I:0:"day11.txt"

D:#[I]^?/E:(::;" "\')@'+": "\'I
D,:,,#[I]

S:4#,&#D / (reaches neither;reaches fft;reaches dac;reaches both)
S[0;#I]:1
w:E[0]?" "\"fft dac"

dp:{n:+/''y@\:x
    n:.[n;(0;w);:;0]
    n:.[n;(1+0;w 1);:;0]
    n:.[n;(1+1;w 0);:;0]
    n:.[n;(1+0;w 0);:;+/y[0;x w 0]]
    n:.[n;(1+1;w 1);:;+/y[0;x w 1]]
    n:.[n;(3;w 0);:;+/.[y;(1+1;x w 0)]]
    n:.[n;(3;w 1);:;+/.[y;(1+0;x w 1)]];n}

a:dp[D]/S
(+/;*|:)@'+a[;E[0]?("you";"svr")]
