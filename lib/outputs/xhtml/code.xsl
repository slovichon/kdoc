<?xml version="1.0" ?>
<!-- $Id$ -->

<xsl:stylesheet	version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:code="http://projects.closeedge.net/kobsd/xsl/code">

	<!-- Data type -->
	<xsl:template match="code:dt">
		<xsl:element name="tt">
			<xsl:apply-templates />
		</xsl:element>
	</xsl:template>

</xsl:stylesheet>
