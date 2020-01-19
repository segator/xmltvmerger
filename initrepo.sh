#!/bin/bash
set -e
git clone $1 -b master repository$2
cd repository$2
for f in *.xml; do cp -- "$f" "/data/repository${2}_${f}"; done
cd ..
rm -rf repository$2

