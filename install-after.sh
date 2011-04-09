#!/bin/sh
#
# install-after.sh -- Custom installation
#
# The script will receive one argument: relative path to
# installation root directory. Script is called like:
#
#    $ install-after.sh .inst
#
# This script is run after [install] command.

Cmd()
{
    echo "$@"
    [ "$test" ] && return
    "$@"
}

Main()
{
    root=${1:-".inst"}

    if [ "$root"  ] && [ -d $root ]; then

        root=$(echo $root | sed 's,/$,,')  # Delete trailing slash

        dir=$(cd $root/usr/share/doc/*-*/ && pwd)
        Cmd install -m 755 -d $dir/manual
        Cmd install -m 755 CYGWIN-PATCHES/quilt.txt $dir/manual/

    fi
}

Main "$@"

# End of file
