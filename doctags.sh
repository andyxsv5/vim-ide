#! /bin/bash

echo "begin create ctags"
if [ ! -e ~/.vim/systags ]; then
    ctags -I __THROW -I __attribute_pure__ -I __nonnull -I __attribute__ --file-scope=yes --langmap=c:+.h --languages=c,c++ --links=yes --c-kinds=+p --c++-kinds=+px --fields=+iaS --extra=+q -R -f ~/.vim/systags /usr/include /usr/local/include
fi

if [ -e "$MYWORKSPACE" ]; then
    rm -f $MYWORKSPACE/tags
    ctags -I __THROW -I __attribute_pure__ -I __nonnull -I __attribute__ --file-scope=yes --exclude="*.so*" --exclude="*.a*" --languages=c,c++ --links=yes --c-kinds=+p --c++-kinds=+px --fields=+iaS --extra=+q -R -f $MYWORKSPACE/tags $MYWORKSPACE
fi
echo "end create ctags"
