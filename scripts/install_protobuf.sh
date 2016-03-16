#!/bin/bash
set -e
# https://github.com/google/protobuf/tree/master/src

apt-get install -y maven autoconf automake libtool build-essential
cd /opt/protobuf-2.5.0
 && ./autogen.sh \
 && ./configure \
 && make \
 && make check \
 && make install \
 && ldconfig # refresh shared library cache.
