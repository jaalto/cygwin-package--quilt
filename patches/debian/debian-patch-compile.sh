#!/bin/bash
# This file compiles debian patched from DIR (downloaded there)
# The debian version is announced in stamp file *.debian

NAME=quilt
VER=_*[0-9]*-[0-9]*
EXT=.debian
DIR=patches.tmp


Main ()
{
    file=$( ls $NAME$VER$ext | tail --lines=1 )

    [ "$file" ] || return 1

    ver=$( echo $file | sed -e "s,$NAME[_-],," -e s",$EXT,," )
    PATCH=$NAME-$ver-debian-patches.diff

    [ "$ver" ] || return 2

    rm -f $PATCH

    while read item
    do
	cat $DIR/$item >> $PATCH
	
    done < <(grep -vE '#' $DIR/series)

    lsdiff $PATCH
    echo "# Compiled: $PATCH"
}

Main "$@"

# End of file
