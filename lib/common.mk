# $Id$

.SUFFIXES: .xml .html

all: $(HTML)

.xml.html:
	xsltproc --stringparam URLROOT `pwd`/../.. -o $@ ../../lib/html.xsl $<

depend:
	@for i in $(HTML); do						\
		echo "$$i: "`pwd`/../../lib/html.xsl >> .depend;	\
	done

clean:
	rm -f $(HTML) .depend
