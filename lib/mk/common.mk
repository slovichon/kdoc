# $Id$

# Output types and their suffixes
OUTPUTS = xhtml
XHTML_SUF = .html
.SUFFIXES: .xml ${XHTML_SUF}

all: ${OUTPUTS}

${OUTPUTS}:
	@make ${SRC:S/.xml$/${${.TARGET:U}_SUF}/g}

.xml.html:
	@inputfile=${.IMPSRC};										\
	cmd=;												\
	for i in $$(xsltproc --stringparam URLROOT ${URLROOT} ${DEP_XSL} ${.IMPSRC}); do		\
		tube="xsltproc --stringparam URLROOT ${URLROOT} $$i $$inputfile";			\
		cmd="$$cmd $$tube | ";									\
		echo "     $$tube | \\";								\
		inputfile=-;										\
	done;												\
	tube="xsltproc --stringparam URLROOT ${URLROOT} -o ${.TARGET} ${XHTML_XSL} $$inputfile";	\
	cmd="$$cmd $$tube";										\
	echo "     $$tube";										\
	echo $$a cmd

depend:
	@rm -f .depend
.for _FILE in ${SRC}
.	for _OUTPUT in ${OUTPUTS:U}
		@cmd="xsltproc --stringparam URLROOT ${URLROOT} ${DEP_XSL} ${_FILE}";			\
		echo "$$cmd";										\
		echo "    ${${_OUTPUT}_XSL}";								\
		echo -n "${_FILE:R}${${_OUTPUT}_SUF}: ${${_OUTPUT}_XSL}" >> .depend;			\
		for i in $$($$cmd); do									\
			echo "    $$i";									\
			echo " \\" >> .depend;								\
			echo -n "    $$i" >> .depend;							\
		done;											\
		echo >> .depend
.	endfor
.endfor

clean:
	rm -f .depend
.for _SUF in ${OUTPUTS:U:S/$/_SUF/g}
	rm -f *${${_SUF}}
.endfor
