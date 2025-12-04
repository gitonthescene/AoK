I:0:"day4-tst.txt"
I:0:"day4.txt"
I:0,/:"@"=I

sh:-1_#'*:\
d:sh I
D:d/+(,/,/:\:/2#,-1 0 1)_4
I:,/I
N:D+/:!#I

f:{x&4>+/0^+x@N}
+/f I
g:{x>f x}
+/I>g/I
