#!/bin/bash
OBJS=../../prefix/lib/libpnl.so  ../../prefix/lib/libhigh.so ../../prefix/lib/cxcore.so -lpython2.7


all: openpnl.i
	swig -builtin -c++ -I../../prefix/include/ -I../../prefix/include/opencx/ -python openpnl.i
	g++ -Wno-vla -fPIC -c openpnl_wrap.cxx  -I/usr/include/python2.7/ -I../../prefix/include/  -I../../prefix/include/opencx/
	g++ -shared openpnl_wrap.o $(OBJS) -o _openpnl.so

test:
	python -c 'import openpnl'

clean:
	rm -f _openpnl.so openpnl_wrap.cxx openpnl.py openpnl.pyc openpnl_wrap.o
