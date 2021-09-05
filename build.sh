#!/bin/sh

export TRAVIS_OS_NAME=osx
export TRAVIS_BUILD_DIR=.
export QTC_VER=4.15
export QTC_PATCH=2
export QTC_DL=mac_x64

scripts/install.sh
scripts/before_script.sh
scripts/script.sh

if [[ $TRAVIS_OS_NAME == 'osx' ]]; then "$TRAVIS_BUILD_DIR/scripts/osx-fix.sh" $(find $TRAVIS_BUILD_DIR/output/ -name '*.dylib') ; fi
7z a $TRAVIS_BUILD_DIR/qtc-sourcetrail-$TRAVIS_OS_NAME-x64-qtc$QTC_VER.zip $TRAVIS_BUILD_DIR/output/*
ls $TRAVIS_BUILD_DIR/output
