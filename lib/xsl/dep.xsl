<?xml version="1.0" ?>
<!-- $Id$ -->

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:util="http://projects.closeedge.net/kobsd/xsl/util"
	xmlns:xi="http://www.w3.org/2001/XInclude"
	extension-element-prefixes="util">

	<xsl:import href="__URLROOT__/lib/xsl/util.xsl" />
	<xsl:output method="text" />

	<xsl:template match="processing-instruction('xml-stylesheet')">
		<xsl:variable name="href">
			<xsl:value-of select="substring-before(substring-after(., 'href=&quot;'), '&quot;')" />
		</xsl:variable>
		<xsl:call-template name="procdep">
			<xsl:with-param name="href" select="$href" />
		</xsl:call-template>
	</xsl:template>

	<xsl:template match="xsl:import|xsl:include|xi:include">
		<xsl:call-template name="procdep">
			<xsl:with-param name="href" select="@href" />
		</xsl:call-template>
	</xsl:template>

	<!-- No output, just a list of dependencies. -->
	<xsl:template match="text()" />

	<xsl:template name="procdep">
		<xsl:param name="href" />

		<xsl:variable name="prochref">
			<xsl:call-template name="util:string-replace">
				<xsl:with-param name="string" select="$href" />
				<!-- The constant below must be split up so m4 doesn't expand it. -->
				<xsl:with-param name="search" select="concat('__URL', 'ROOT__')" />
				<xsl:with-param name="replacement" select="$URLROOT" />
			</xsl:call-template>
		</xsl:variable>
		<xsl:value-of select="$prochref" />
		<xsl:text>
</xsl:text>
	</xsl:template>

</xsl:stylesheet>
