M:0N 3#"JanFebMarAprMayJunJulAugSepOctNovDec"
D:0 31 29 31 30 31 30 31 31 30 31 30 31
S:0 24 60 60
DS:+\D
ef:DS 2 / end of February

ly:{2!+/~4 100 400!/:\:x} / leap year [[https://nsl.com/k/training/idioms_K3.pdf]]
lds:{(--)/--[4 100 400]!\:-x-1972} / leapdays since 1970 (excluding current year)

ZD:"/usr/share/zoneinfo/"

p:{s:1 -1"-"=x 19;@[;1 2;-;1]@[.'*+0N 2#(0,-1_+\,/(4,2+&7),\:1)_x,":";6;*;s]} / parse
shw:{x:@[x;1 2;+;1];t:-1_"0"^,//+((-:4,2+&5)$'$6#x;"--T:::");t,:"+-"m:0>x[6];t,":"/"0"^-2$$(1 -1m;1)*x 6 7}

R:2/+(0;11000000b;11100000b;11110000b)
bits:63(2*)\1
u8:{`c$(0x00c0e0f0[c],c#128)+(0,64+&c:1+128 2048 65536'x)\x} /utf8 encode
u8d:{$[~#x;:!0;];@'/(/'0 64 64 64s;!''/-1 1*256!*\(bits(0 2 3 4s),'2+&'s:-1+-1_1_-':s;_[-2_s:@[+/1(!#:)\1+R'x;]\0;x:256!x]))} /utf8 decode

u160:{$[bits[16]>x;:,`c$256 256\x;];+`c$256 256\55296 56320+l.bits[10]\x-l.bits[16]} /utf16 encode
u16:{,/u160 x}     /utf16 encode (big endian)
u16l:{,/|'u160 x}  /utf16 encode (little endian)

u16d0:{(!0),,/{$[1=#x;x;l.bits[16]+l.bits[10]/l.bits[10]!x]}'256/''256!_[-2_@[+/1(!#:)\1+~^0xdfd8?*'h;]\0;h:x]} /utf16 decode
u16d:{u16d0 0N 2#x}     /utf16 decode (big endian)
u16dl:{u16d0@|'0N 2#x}  /utf16 decode (little endian)

/ parse zone info
zi:{$[~"TZif"~4#x;`err"not timezone";!2=x[4];`err"vs 2 only"];i:20;
    h:,/`I$`B$|'0N 4#x[i+!j:24];i+:j
    r:,h:`us`st`lp`ti`ty`ch!h
    i:20+24+(+/5 6 8*h`ti`ty`lp)+/h`st`us`ch / skip version 1
    i+:20
    h:,/`I$`B$|'0N 4#x[i+!j:24];i+:j
    r:,h:`us`st`lp`ti`ty`ch!h
    r,:,,/'`I$`B$'|''(h`ti;0N)#/:(0,8*h`ti)_x[i+!j:9*h`ti];i+:j
    ty:+,/'`I$`B$|''0 4 5_/:(h`ty;0N)#x[i+!j:6*h`ty]
    r,:,+@[ty;0 2;(-/1(bits[32]*bits[31]<)\;(@/1<:\?ty[2])?)];i+:j
    r,:,"\0"\-1_x[i+!j:h`ch];i+:j
    r,:,`I$`B$|''0N 8#/:0N 16#x[i+!j:16*h`lp];i+:j
    r,:,0+x[i+!j:h`st];i+:j
    r,:,0+x[i+!j:h`us];i+j
    r}

/ unix time
ut:{s:S/2_x
 s+:DS[x 1]*/1_S
 s-:((x[1]>1)&~[ly x 0])*/1_S
 s+:lds[x 0]*/1_S
 s+:(x[0]-1970)*/365,1_S
 s}
