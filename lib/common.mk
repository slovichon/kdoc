# $Id$

# Output types and their suffixes
OUTPUTS = xhtml
XHTML_SUF = .html
.SUFFIXES: .xml $(XHTML_SUF)

all: $(OUTPUTS)

$(OUTPUTS):
	@make ${SRC:S/.xml$/${${.TARGET:U}_SUF}/g}

.xml.html:
	xsltproc --stringparam URLROOT $(URLROOT) -o $@ $(XHTML_XSL) $<

depend:
.for suf in ${OUTPUTS}
.	for file in ${SRC:R}
		echo "${file}.${suf}: ${${suf:U}_XSL}" >> .depend
.	endfor
.endfor

clean:
	rm -f .depend
