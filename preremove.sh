#!/bin/sh
# This file has been automatically generated
# by cygbuild 2011.0408.1346

PATH=/bin:/sbin:/usr/bin:/usr/sbin
LC_ALL=C

dest=$1
echo "$0: Removing unmodified configuration files."

for file in  etc/bash_completion.d/quilt etc/quilt.quiltrc
do
    [ -e "$dest$file" ] || continue

    if cmp --quiet "$dest/$file" "/etc/defaults/$file" ; then
	echo "$0: $file hasn't been modified, will update"
        rm -f "/home/jaalto/cygwin/my/quilt/quilt-0.48/.inst/etc/defaults/$file"
    fi
done

# End of file

