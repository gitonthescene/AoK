/ ngn/k
/ parse
((mnx;mxx);(mny;mxy)):.''".."\'r@&0<#'r:1_'(l:0,&(x<45)|57<x)_x:1:"day17.txt"

/ experimented with ranges by hand.  min y velocity is clearly mny
xh:+(~r<mnx)&~mxx<r:+\0,'+0|(!250)-\:!250
yh:+(~r<mny)&~mxy<r:+\0,'+(mny+!250)-\:!250
ix:,/(!#xh),\:/:!#yh
#ix@&{|/r:xh[x]&yh[y]}.'ix
mxy:(mny-1)+|/*|+ix@&{|/r:xh[x]&yh[y]}.'ix
_mxy+(mxy*mxy-1)%2
