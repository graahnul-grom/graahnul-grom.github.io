#!/bin/sh

out=sch-test-netlist-hier.tar.gz
# out=sch-test-netlist-hier_project-archive.tar.gz
exe=$lepton/bin.master/bin/lepton-archive

export GUILE_AUTO_COMPILE=0
$exe -v -o $out main.sch geda.conf

