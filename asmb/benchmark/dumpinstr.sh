#!/bin/sh

if [ $# -lt 2 ]; then
	echo "usage: $0 <executable> <method> <args>"
	echo "will produce <executable>.trace"
fi

EXECFILE=$1
EXECMETHOD=$2

shift 2

cat <<END > $EXECFILE.tmp

set step-mode on

file $EXECFILE
break $EXECMETHOD

run $*

while 1==1

if \$pc != \$pc
printf "==== ?\\n"
end

printf "\\n====BEGIN $EXECMETHOD\\n"

printf "==== "
x/i \$pc

up
set \$nfp = \$fp
down

while \$fp != \$nfp
stepi
printf "==== "
x/i \$pc
end

printf "\\n====END $EXECMETHOD\\n"

continue

end

quit

END

gdb < $EXECFILE.tmp > $EXECFILE.trace 2>/dev/null

mv $EXECFILE.trace $EXECFILE.output

awk -- '\
/^====BEGIN/ {ll = ("begin " $2);} \
/^==== / {print ll; ll = (" " substr($0, 5));} \
/^====END/ {print "end", $2;}
' $EXECFILE.output > $EXECFILE.trace

echo instructions: `grep "^  " $EXECFILE.trace | wc -l`
echo trace output: $EXECFILE.trace

rm $EXECFILE.tmp $EXECFILE.output
