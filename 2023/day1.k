I:0:"day1.txt"

ds:"/"\"zero/one/two/three/four/five/six/seven/eight/nine"
fln:{ds{+|&x{x~/:(#x)':y}\:y}/:x}
fld:{+&(!10)=/:x-"0"}'
+/(10/*|+*'1|:\@/1<:\)'',\'+(fld@I;fln@I)
