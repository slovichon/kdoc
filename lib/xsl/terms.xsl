<?xml version="1.0" ?>
<!-- $Id$ -->

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:core="http://projects.closeedge.net/kobsd/xsl/core">

	<xsl:output method="xml" omit-xml-declaration="yes" />
	<xsl:strip-space elements="*" />

	<xsl:template match="name">
		<!-- Linkable anchor -->
		<xsl:element name="link">
			<xsl:attribute name="name">
				<xsl:value-of select="translate(text(), ' ', '.')" />
			</xsl:attribute>
		</xsl:element>
		<xsl:element name="h">
			<xsl:attribute name="size">4</xsl:attribute>
			<xsl:apply-templates />
		</xsl:element>
	</xsl:template>

	<!--
		Definitions may or may not have paragraphs,
		so add one if one was not specified.
	-->
	<xsl:template match="def">
		<xsl:choose>
			<xsl:when test="core:p">
				<xsl:apply-templates />
			</xsl:when>
			<xsl:otherwise>
				<xsl:element name="p">
					<xsl:apply-templates />
				</xsl:element>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- Strip core namespace. -->
	<xsl:template match="core:*">
		<xsl:element name="{local-name()}">
			<xsl:for-each select="@*">
				<xsl:attribute name="{name()}">
					<xsl:value-of select="." />
				</xsl:attribute>
			</xsl:for-each>
			<xsl:apply-templates />
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>
