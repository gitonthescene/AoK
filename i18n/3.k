`"libicu.dylib"2:(`loadicu;1);
trans:{(e;r):icutrans[x;y];$[e;`err"icutrans";r]}

low:trans["NFC; Any-Lower"]
up:trans["NFC; Any-Upper"]

\d l
\l l.k
\d .
I:0:"3.txt"
l:</4 13>\:#'c:l.u8d'I / length
a:,/~&/'128>c        / non-ascii
d:,/|/'</"0:">\:c    / digit
c:~+{u:up[x];l:low[x]; (>/l~/:(x;u);>/u~/:(x;l))}'I
+/&/(l;a;d),c
