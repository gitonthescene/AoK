I:0:"day23.txt"

I:+"-"\'I

S:1+|/m:+(c:@/1<:\(?,/I))?I
adj:|/1+:\S#@[&*/S;S/+m;:;1]
adj0:adj|=#adj

rot:{,/|_[0,(#y)!x;y]}
mm:(+/*)\:

/ Find groups of mutuals of at least three long
mut3:(rot[1]@&\:/1*:\(2<+/'&\:/1(*:)\)#)/

gps0:c@&'?,/mut3'(!#adj0)rot'adj0&\:adj0
szs:=#'gps0

/ cheap combos calc
cmb:{+d\&&/-1>':!d:(&x)+y}

/ all groups
gps:?2,//(gps0@szs)@\:'(cmb[3]'!szs)
+/|/'"t"=*''gps

","/@/1<:\*gps0@szs@|/!szs
