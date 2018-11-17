#!/bin/bash

set_-x

SOURE_DIR=`pwd`
BUILD_DIR=${BUILD_DIR:-build}

mkdir -p $BUILD_DIR \
    && cd $BUILD_DIR \
    && cmake $SOURE_DIR \
    && make $*