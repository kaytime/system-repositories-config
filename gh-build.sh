#! /bin/bash

set -x

### Basic Packages
apt -qq -yy install equivs git devscripts lintian --no-install-recommends

### Install Dependencies
mk-build-deps -i -t "apt-get --yes" -r

chmod -x "debian/install"

### Build Deb
debuild -b -uc -us

ls -a

### Move Deb to current directory because debuild decided
### that it was a GREAT IDEA TO PUT THE FILE ONE LEVEL ABOVE
mv ../*.deb .
