#!/usr/bin/tcsh
set pair = '\([a-z]\)[^a-z]*'
set l = $pair:q 
set r
cat $1 | grep -n ^ | tr "~\n" "\n~" > inf    
foreach c ( `seq 9` )
  set r = "[^a-z]*\"$c$r:q
  cat inf |grep -oi "[^~]*$l$r""[^~]*"|grep -i --color=always "$l$r" >out0
  set l = $l:q$pair:q
  cat inf |grep -oi "[^~]*$l$r""[^~]*"|grep -i --color=always "$l$r" >out1
  if ( ( -z out1 ) && ( -z out0 ) ) then
    echo "Best palindrome is `expr $c \* 2 + $best - 2` letters long:"
    cat out | tr \~ \\n
    exit
  else if ( -z out1 ) then
    @ best = 0
  else
    @ best = 1
  endif
  cp -f out$best out
end
echo "Best palindrome is at least 18 letters long:"
cat out0 out1 | tr \~ \\n | sort -n

