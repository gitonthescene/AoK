I:`I$0:"day20.txt"
mv:{?[x_i;(-1+#x)!z+i:x?y;y]}

M:I@mv/[!#I;!#I;I]
+/M(#M)!(M?0)+1000*1+!3

I2:I*811589153
M:I2@mv/[!#I2;,/10#,!#I2;,/10#,I2]
+/M(#M)!(M?0)+1000*1+!3

/ double linked lists (slower)
rm:{(xp;xn):(y;z)@\:x;(@[y;xn;:;xp];@[z;xp;:;xn])}
in:{(@[y;r;:;x];@[z;x;:;r:z[x@1],x@0])}

sh:{l@(-1+#l){x@y}[x]\0}

mx0:{i:i*-1 1d:0<i:x@z;y:rm[z].y;in[(z;((-1+#x)!i){x@y}[y@d]/y[0]@z)].y}
mx:{mx0[x]/[(y;z);!#x]}
run:{+/x@{z{x@y}[y]/x}[x?0;y]'(#x)!1000 2000 3000}

(p;n):((-1+#I),-1_!#I;(1_!#I),0)
run[I][*|mx[I;p;n]]
run[I2][*|10(mx[I2].)/(p;n)]
