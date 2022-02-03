data:0:`day12.txt
data:d,|:'d:(`$')'"-"\'data
data:data@&~|/{x=data[;y]}.'+(`end`start;!2)

lg:.+(`end,l;1,97>_ic'*:'$:'l:?data[;0])
mp:.+(`end,?data[;0];(,()),data[;1]@=:data[;0])

p1:{,/{:[`end=*x;:(,x)];n:mp[*x];(n@&lg[n]|(#x)=x?/:n),\:x}'?x}
p2:{,/{:[`end=*x;:(,x)];s:`=*|x;n:mp[*x];l:lg[n];i:(#x)=x?/:n;w:&(l|i|s);
   +((+((n@w),\:(?-1_ x))),,({(-2#x)@*x}@'+(s&~l|i;(#n)#*|x;n)) w)}@'x}

/ Lots of working around bugs..
#p2/,`start`
#p1/,,`start