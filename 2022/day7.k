p:,0
s:,0
c:,0
f:,0
d:0
prs:{$["$ cd .."~x;d::p@d
     "$ cd"~4#x;[c[d]-:1;d::f[d]-c[d]]
     "dir"~3#x;[f[d]::#p;p,:d;s,:0;c,:0;f,:0;c[d]+:1]
     ~"0:"'*x;s[d]+:`I$*" "\x
     ]}
prs'1_0:"day7.txt";

szs:@[;;+;]/[&#s;@[p;]\'!#p;s]
+/(~100000<)#szs
unused:70000000-*szs
req:30000000-unused
&/(~req>)#szs
