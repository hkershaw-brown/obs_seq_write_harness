#!/usr/bin/env bash

# DART software - Copyright UCAR. This open source software is provided
# by UCAR, "as is", without charge, subject to all terms of use at
# http://www.image.ucar.edu/DAReS/DART/DART_download

main() {


export DART=/Users/hkershaw/DART/Projects/Harnesses/DART.harnesses
source "$DART"/build_templates/buildfunctions.sh

MODEL=none
LOCATION=threed_sphere
EXTRA="$DART/models/cam-common-code $DART/models/cam-fv/model_mod.f90"

model_programs=(
test_write_obs_seq
)

# quickbuild arguments
arguments "$@"

# clean the directory
\rm -f -- *.o *.mod Makefile .cppdefs

# build and run preprocess before making any other DART executables
buildpreprocess

# build 
buildit

# clean up
\rm -f -- *.o *.mod

}

main "$@"
