#!/bin/bash

set -e

# Zapret version
sed -i 's/^SRC_VER.*/SRC_VER = 72.13/' \
  padavan-ng/trunk/user/nfqws/Makefile

# Install custom firmware-specific.patch
mkdir -p padavan-ng/trunk/user/nfqws/patches

cp firmware-specific.patch \
  padavan-ng/trunk/user/nfqws/patches/firmware-specific.patch

# Remove previously downloaded Zapret sources
cd padavan-ng/trunk/user/nfqws

find . -maxdepth 1 \
  -not -name Makefile \
  -not -name patches \
  -print0 | xargs -0 rm -rf --
