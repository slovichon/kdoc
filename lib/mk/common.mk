# $Id$

# Output types and their suffixes
OUTPUTS = xhtml
XHTML_SUF = .html
.SUFFIXES: .xml ${XHTML_SUF}

all: ${OUTPUTS}

${OUTPUTS}:
	@make ${SRC:S/.xml$/${${.TARGET:U}_SUF}/g}

.xml.html:
	${M4} ${MFLAGS} ${XHTML_XSL} | ${XSLTP} ${XFLAGS} -o ${.TARGET} - ${.IMPSRC}

depend:
	@rm -f .depend
.for _FILE in ${SRC}
.	for _OUTPUT in ${OUTPUTS:U}
		@deps=$$(env M4="${M4}" MFLAGS="${MFLAGS}" DEP_XSL="${DEP_XSL}"	\
		    XSLTP="${XSLTP}" XFLAGS="${XFLAGS}" 			\
		    ${SYSROOT}/lib/tools/xsldep ${_FILE} ${${_OUTPUT}_XSL});	\
		echo -n "${_FILE:R}${${_OUTPUT}_SUF}:" >> .depend;		\
		for i in $$deps; do						\
			echo " \\" >> .depend;					\
			echo -n "    $$i" >> .depend;				\
		done;								\
		echo >> .depend
.	endfor
.endfor

clean:
	rm -f .depend
.for _SUF in ${OUTPUTS:U:S/$/_SUF/g}
	rm -f *${${_SUF}}
.endfor
