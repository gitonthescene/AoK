
data:(" "\')'"|"\'0:`day8.txt
data:+(-1_'(+data)@0;1_'(+data)@1)
digs:("abcefg"
"cf"
"acdeg"
"acdfg"
"bcdf"
"abdfg"
"abdefg"
"acf"
"abcdefg"
"abcdfg")

mks:{x{+/~(#x)=x?/:y}\:/:y}
sig:mks[digs[1 7 4 8];digs]

+/~4=2 3 4 7?/:#:',/data[;1]
cts:#:'data[;1]
data:,/'data

nm:{sig?/:mks[x@y;x]}.'+(data;((#:')'data)?/:\:2 3 4 7)
/ workaround.  the above should work
nm:{sig?/:mks@/(x@y;x)}.'+(data;((#:')'data)?/:\:2 3 4 7)

+/{_sv[10;y#x]}.'+(nm;-cts)
\\