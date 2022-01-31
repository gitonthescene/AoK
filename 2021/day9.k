off:+o,1!'o:o,-o:,1 0

data:(0$')'0:`day9.txt
data:1!((2;2+#*data)#9),{9,x,9}'data

n:{.[data;]'+x+off}

w:&:'&/data</:(,/((!);{x!'y})@/:\:1 -1)@\:data
b:,/{x,/:y}.'+(!#data;w)
+/1+.[data;]'b

/ nxt:{,/{+x++y}@/'+(x;(+off)@&:'{~9=n@x}'x)}
nxt:{,/{+x++y}.'+(x;(+off)@&:'{~9=n@x}'x)}
sd:{x@&:(#y)=y?/:x}
a:{{(x,y;?sd[nxt@y;x])}.(x)}
r:{*{0<#*|x}(a)/(!0;,x)}@'b

{*/3#x@>x:#:'x}r
\\