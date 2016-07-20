#! /bin/bash

echo "begin create cscope database"
if [ -e "$MYWORKSPACE" ]; then
    rm -f $MYWORKSPACE/cscope*
    find $MYWORKSPACE -type f | egrep -v ".*\.a.*" | egrep -v ".*\.so.*" > $MYWORKSPACE/cscope.files
    cd $MYWORKSPACE
    cscope -bq
fi
echo "end create cscope database"

