`"libbcrypt.dylib"2:(`loadbcrypt;1);
`"libicu.dylib"2:(`loadicu;1);
\d l
\l l.k
\d .

(DB;T):+(`$;::)@''++'" "\''"\n"\'"\n\n"\1:"10.txt"
DB:!/DB
/T:T[1]@=T[0]
T:+T
SALT:29#/:DB

nrmd:icutrans["NFC; NFD"]
nrmc:icutrans["NFD; NFC"]

opts:{?/|1(-#:)\(,/,/:\:)/?'+1 nrmd'\l.u8',/l.c nrmc x}

/ Not fast!
+/{ \(x 0;#T);~`nope~*|(~**:){#z;$[~#z[1];:(1;`nope);];(x~bcrypthash@`[1;(z[1;0];y)];1_z[1])}[DB[x[1;0]];SALT[x[1;0]]]/(0;opts[x[1;1]])}'+|1(!#:)\T
