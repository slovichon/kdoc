<?xml version="1.0" ?>
<!--  $Id$ -->

<xsl:stylesheet version="1.0"
	xmlns="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="xml" />

	<xsl:template match="name">
		<!-- Linkable anchor -->
		<xsl:element name="link">
			<xsl:attribute name="name">
				<xsl:value-of select="translate(node(), ' ', '.')" />
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
				</xsl:element>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

</xsl:stylesheet>
