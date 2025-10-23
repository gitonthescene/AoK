`"libbcrypt.dylib"2:(`loadbcrypt;1);
`"libicu.dylib"2:(`loadicu;1);
\d l
\l l.k
\d .

trans:{(e;r):icutrans[x;y];$[e;`err"icutrans";r]}
hash:{(e;r):bcrypthash@`[1;(x;y)];$[e;`err"bcrypthash:",$e;r]}

(DB;T):+(`$;::)@''++'" "\''"\n"\'"\n\n"\1:"10.txt"
DB:!/DB
T:+T
SALT:29#/:DB

nrmd:trans["NFC; NFD"]
nrmc:trans["NFD; NFC"]

opts:{?/|1(-#:)\(,/,/:\:)/?'+1 nrmd'\l.u8'l.u8d nrmc x}

/ Not fast!
+/{ \(x 0;#T);~`nope~*|(~**:){#z;$[~#z[1];:(1;`nope);];(x~hash[z[1;0];y];1_z[1])}[DB[x[1;0]];SALT[x[1;0]]]/(0;opts[x[1;1]])}'+|1(!#:)\T
