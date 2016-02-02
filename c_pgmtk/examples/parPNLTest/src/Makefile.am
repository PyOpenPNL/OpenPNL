bin_PROGRAMS = parPNLTest

include $(top_srcdir)/Makefile.incl

parPNLTest_CFLAGS = $(PNL_INCL) -I$(srcdir)/../include
parPNLTest_SOURCES = parPNLTest.cpp LoadBNet.cpp CreateBNets.cpp
parPNLTest_LDADD = $(PNL_LIBS)
