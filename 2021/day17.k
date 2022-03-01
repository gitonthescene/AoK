/ ngn/k
/ parse
(xr;yr):0 1+/:.''".."\'r@&1<#'r:1_'(l:0,&~</45 58>\:x+0)_x:*0:"day17.txt"

/ experimented with ranges by hand.  min y velocity is clearly *yr
xh:+</xr>\:r:+\+0|(!250)-\:!250
yh:+</yr>\:r:+\+((*yr)+!250)-\:!250
ix:,/(!#xh),\:/:!#yh
#ix@&{|/r:xh[x]&yh[y]}.'ix
mxy:(*yr)+|/*|+ix@&{|/r:xh[x]&yh[y]}.'ix
_mxy+(mxy*mxy-1)%2
