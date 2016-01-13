#!/usr/bin/env bash
g++ -fPIC -o libcxcore.so -shared ./cxcore/cxcore/src/*.cpp -I./cxcore/cxcore/include/
cp libcxcore.so /usr/local/lib/
