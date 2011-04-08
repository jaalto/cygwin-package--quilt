#!/bin/sh
#
# build.sh -- Custom build steps
#
# Parameters send to this script
#
#       build.sh <PACKAGE> <VERSION> <RELEASE>

# See http://www.mail-archive.com/quilt-dev@nongnu.org/msg01314.html

echo ":" > ./git-desc
chmod u+x ./git-desc

make all

# End of file
