imp.ort[`l;"l.k"]

(O;C):+'0 1_'_/|1(0,&~#:')\"\t"\'0:"15.txt"
zi:$[`;zn]!l.zi'1:'l.ZD,/:zn:@/1<:\?O[1],C[1]

dp:{@[|(.:;l.M?3#;.:)@'" "\x;2;-;1]} / str
off:{f@(x[1;0][w]+f:*'x[2]@x[1;1;0]^x[1;1]@w:-1 0 1+x[1;0]'y)'y} / [zone;unix] -> seconds
day:7!3+-86400!

R:l.ut@+(2022+!2),\:&5

/ offsets in range
FF:*''.[(zi;::;2)]@'.[(zi;::;1;1)]@'+/(!'--)\0 1++(..[(zi;::;1;0)]){x'y}\:R
/ range for offsets (in range)
FR:.[(zi;::;1;0)]@'+/(!'--)\0 1++(..[(zi;::;1;0)]){x'y}\:R
/ offsets relative to the first offset

/ to local timezone
local:{R[1]&R[0]|-/1(#[x;FF]@'#[x;FR]{x'y}')\y}

mon:(+/1(86400*-7+7!-day@)\R[0])+(7*86400)*!53

/ office holidays
ohl:l.ut''(dp''";"\'O[2]),\:\:0 0 0
/ office hours in local time
oh:,/'(=/')_/:local[k](k:$[`;O 1])!(_3600*8.5 17)+/:/:(,/mon+\:86400*!5)^/:ohl

/ client holidays
chl:(@/1<:\)',/'(=/')_/:local[k](k:$[`;C 1])!(l.ut''(dp''";"\'C[2]),\:\:0 0 0)+\:\:0,86400

/ support hours
ch:,/'(=/')_/:local[k]@,/(k:$[`;C 1])!\:,cd:mon+\:0,86400*5

/ support ranges including holidays
sh:(@/1<:\)'ch,'chl

(g;h):2!(oh;sh){x'y}\:\:range:?@/1<:\,/,/'(oh;sh)

sort:@/1>:\-60!(+/*/1(2!!#:)\)'-':'range@&'~0=':'(&/g)>/:h
-/*'|:\sort
