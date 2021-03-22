#!/bin/sh

# [dmn]: convert markdown to html using textproc/discount
#        port and md2htm_dmn.rb ruby script

src="${1}"
out="${2}"

if [ $# -ne 2 ]
then
    echo "usage: `basename $0` input.md output.html"
    exit 1
fi

# markdown -T -o $out $src
# mkd2html $src
ruby /home/dmn/lepton/gg.gh.io.git/old/md2htm/md2htm_dmn.rb \
    $src $out

