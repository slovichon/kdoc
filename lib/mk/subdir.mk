# $Id$

all clean depend:
.for _SUBDIR in ${SUBDIRS}
	@echo -n "===> " 
.	if defined(DIRPRFX)
		@echo -n ${DIRPRFX}
.	endif
	@echo ${_SUBDIR}
	@(cd ${_SUBDIR} && make DIRPRFX=${DIRPRFX}${_SUBDIR}/ ${.TARGET})
.	if defined(DIRPRFX)
		@echo -n "<=== " 
		@echo -n ${DIRPRFX}
		@echo
.	endif
.endfor
