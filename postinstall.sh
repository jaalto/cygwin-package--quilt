#!/bin/sh
# This is automatically generated file
# Please do not remove section comments '#:<name>'

PATH=/bin:/sbin:/usr/bin:/usr/sbin
LC_ALL=C
dest=$1

set -e

#:etc
fromdir=/etc/defaults
for i in  etc/ etc/bash_completion.d/ etc/bash_completion.d/quilt etc/defaults/ etc/defaults/quilt.quiltrc
do
    from=$fromdir/$i
    to=$dest/$i

    case "$i" in
	*/) # Directory
	    [ -d $to ] && continue
	    install -d -m 755 $to
	    continue
	    ;;
	*)  # File
	    install -m 644 $from $to
	    ;;
    esac
done


