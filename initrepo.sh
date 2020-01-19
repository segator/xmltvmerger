#!/bin/bash
set -e
git clone $1 -b master repository$2
cd repository$2
cp *.xml /data/
cd ..
rm -rf repository$2

