#! /bin/bash

echo "begin create cscope database"
if [ -e "$MYWORKSPACE" ]; then
    rm -f $MYWORKSPACE/cscope*
    find $MYWORKSPACE -type f -name '*.h' -o -name '*.hpp' -o -name '*.c' -o -name '*.cpp' > $MYWORKSPACE/cscope.files
    cd $MYWORKSPACE
    cscope -bq
fi
echo "end create cscope database"

