<?xml version="1.0" ?>
<!-- $Id$ -->

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xi="http://www.w3.org/2001/XInclude"
	xmlns:util="http://projects.closeedge.net/kobsd/xsl/util">

	<xsl:import href="util.xsl" />
	<xsl:output method="xml" />
	<xsl:strip-space elements="*" />

	<xsl:template match="xi:include">
		<xsl:variable name="href">
			<xsl:call-template name="util:string-replace">
				<xsl:with-param name="string" select="@href" />
				<xsl:with-param name="search" select="'__URLROOT__'" />
				<xsl:with-param name="replacement" select="$URLROOT" />
			</xsl:call-template>
		</xsl:variable>
		<!-- Apply its processing instructions. -->

<xsl:text>
hi
</xsl:text>
<xsl:value-of select="$href" />

		<!-- -->
	</xsl:template>

</xsl:stylesheet>
