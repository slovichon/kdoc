# $Id$

XHTML_XSL	= ${SYSROOT}/lib/outputs/xhtml/core.xsl
TERMS_XSL	= ${SYSROOT}/lib/xsl/terms.xsl
SECTIONS_XSL	= ${SYSROOT}/lib/xsl/sections.xsl
DEP_XSL		= ${SYSROOT}/lib/xsl/dep.xsl
URLROOT		= ${SYSROOT}
MAKE		= make
XSLTP		= xsltproc
XFLAGS		= --stringparam URLROOT ${URLROOT}
M4		= m4
MFLAGS		= -D__URLROOT__=${URLROOT}
