#!/bin/bash
# This file compiles debian patches from DIR (extracted there)

NAME=quilt

VER=_*[0-9]*-[0-9]*
EXT=.debian.tar.gz
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
