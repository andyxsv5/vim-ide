#! /bin/bash

rm -f ./cscope*
if [ -e index.files ]; then
    if [ $# -ge 1 ] && ([ $1 == "--force" ] || [ $1 == "-f" ]); then
        echo "index files exit, replace it..."
        find . -type f -name '*.h' -o -name '*.hpp' -o -name '*.c' -o -name '*.cpp' > index.files
    fi
else
    echo "index files not exit, create it..."
    find . -type f -name '*.h' -o -name '*.hpp' -o -name '*.c' -o -name '*.cpp' > index.files
fi

echo "create cscope.out begin!"
cscope -bq -i index.files
echo "create cscope.out end!"

