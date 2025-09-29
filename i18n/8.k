`"libicu.dylib"2:(`loadicu;1);

\d l
\l l.k
\d .
I:0:"8.txt"
strp:icutrans["NFD; [:Nonspacing Mark:] Remove; NFC"]

l:</4 13>\:#'c:l.c'I / length
d:,/|/'</"0:">\:c    / digit
cv:2=#'?'^"aeiou"?(</"a{">\:)#/:s:_strp'I / vowel or consonant
r:~|/'1<#''='s

+/&/(l;d;cv;r)
