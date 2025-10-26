."\\l ",`env[]`KINIT
imp.ort[`l;"l.k"]

`"libicu.dylib"2:(`loadicu;1);
trans:{(e;r):icutrans[x;y];$[e;`err"icutrans";r]}

I:0:"8.txt"
strp:trans["NFD; [:Nonspacing Mark:] Remove; NFC"]

l:</4 13>\:#'c:l.u8d'I / length
d:|/'</"0:">\:c    / digit
cv:2=#'?'^"aeiou"?(</"a{">\:)#/:s:_strp'I / vowel or consonant
r:~|/'1<#''='s

+/&/(l;d;cv;r)
