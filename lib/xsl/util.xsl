<?xml version="1.0" ?>
<!-- $Id$ -->

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:util="http://projects.closeedge.net/kobsd/xsl/util">

	<xsl:template name="util:string-replace">
		<xsl:param name="string" />
		<xsl:param name="search" />
		<xsl:param name="replacement" />
		<xsl:choose>
			<xsl:when test="contains($string, $search)">
				<xsl:value-of select="concat(substring-before($string, $search), $replacement)" />
				<xsl:call-template name="util:string-replace">
					<xsl:with-param name="string" select="substring-after($string, $search)" />
					<xsl:with-param name="search" select="$search" />
					<xsl:with-param name="replacement" select="$replacement" />
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$string" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="util:substring-after-last">
		<xsl:param name="string" />
		<xsl:param name="substring" />

		<xsl:variable name="remaining">
			<xsl:value-of select="substring-after($string, $substring)" />
		</xsl:variable>

		<xsl:choose>
			<xsl:when test="contains($remaining, $substring)">
				<xsl:call-template name="util:substring-after-last">
					<xsl:with-param name="string" select="$remaining" />
					<xsl:with-param name="substring" select="$substring" />
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$remaining" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

</xsl:stylesheet>
