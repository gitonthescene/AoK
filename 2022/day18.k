I:.'0:"day18.txt"
/part 1
/{(6*#I)-+/1=|/'{x|-x}''-/x@&2=+/''x=/:\:x}I

shared:{(x;y)@'&(2=+/''x=/:\:y)&1=|/''{x|-x}''x-/:\:y}
shell:{(,/(,/-:\=3)+/:\:x)^x}
match:{(*|s)@=*s:shared[x;x]}
grp:{*|(#*:){((*y)^n;(*|y),,n:*{(?(,/x@^/y),*y;*y)}[x]/(,**y;()))}[x]/(!x;())}
fltr:((|/(|/(|/I)<)')')

/ surface area (part 1)
:sa:(6*#I)-#*shared[I;I]

r:(?,/2 shell\I)^I
g:fltr_ grp[m:match[r]]
iso:#r^!m

gg:{*|(#*:) {{(m^y;?y,m:(?shell@x)^I)}.(x)}/2#,x}'g
sa-(6*iso)+#*shared[I;,/gg]

