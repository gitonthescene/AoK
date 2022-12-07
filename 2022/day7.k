pwd:`!,""

cd:{$[x~,"/";pwd::`$"";x~"..";pwd::`$"/"/-1_"/"\$pwd;pwd::`$($pwd),"/",x];@[y;pwd;:;$[^(!y)?pwd;();y[pwd]]]}
prs:{$["$ cd"~4#y;x:cd[*1_" "\2_y;x];"$"~*y;x;x[pwd]::x[pwd],,y];x}
szl:{(x;y);$["dir"~*y;sz[`$($x),"/",y@1];0^`I$*y]}
sz:{+/szl[x]'" "\'dirs[x]}
dirs:prs/[`!();0:"day7.txt"]

/+(!dirs;.dirs)

+/(~100000<)#szs:sz'!dirs
unused:70000000-sz@`""
req:30000000-unused
&/(~req>)#szs
