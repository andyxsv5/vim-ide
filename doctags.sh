#! /bin/bash

rm -f ./tags
if [ -e index.files ]; then
    if [ $# -ge 1 ] && ([ $1 = "--force" ] || [ $1 = "-f" ]); then
        echo "index files exit, replace it..."
        find $PWD -type f -name '*.h' -o -name '*.hpp' -o -name '*.c' -o -name '*.cpp' > index.files
    fi
else
    echo "index files not exit, create it..."
    find $PWD -type f -name '*.h' -o -name '*.hpp' -o -name '*.c' -o -name '*.cpp' > index.files
fi

echo "create tags begin!"
ctags -R --c++-kinds=+px --fields=+iaS --extra=+q -L index.files
# ctags -I __THROW -I __attribute_pure__ -I __nonnull -I __attribute__ --file-scope=yes --langmap=c:+.h --languages=c,c++ --links=yes --c-kinds=+p --c++-kinds=+p --fields=+iaS --extra=+q -R -f ~/.vim/systags /usr/include /usr/local/include
echo "create tags end!"

