<?xml version="1.0" ?>
<!-- $Id$ -->

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:code="http://projects.closeedge.net/kobsd/xsl/code"
	extension-element-prefixes="code">

	<xsl:import href="code.xsl" />
	<xsl:output method="xml" />
	<xsl:strip-space elements="*" />

	<xsl:template match="doc">
		<xsl:element name="html">
			<xsl:attribute name="lang">en-US</xsl:attribute>
			<xsl:attribute name="xml:lang">en-US</xsl:attribute>
			<xsl:attribute name="xmlns">http://www.w3.org/1999/XHTML</xsl:attribute>
			<xsl:element name="head">
				<xsl:element name="meta">
					<xsl:attribute name="http-equiv">Content-Type</xsl:attribute>
					<xsl:attribute name="content">text/html; charset=iso-8859-1</xsl:attribute>
				</xsl:element>

				<xsl:element name="link">
					<xsl:attribute name="rel">stylesheet</xsl:attribute>
					<xsl:attribute name="type">text/css</xsl:attribute>
					<xsl:attribute name="href">
						<xsl:value-of select="$URLROOT" />
						<xsl:text>/lib/css/common.css</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="media">all</xsl:attribute>
				</xsl:element>

				<xsl:element name="link">
					<xsl:attribute name="rel">stylesheet</xsl:attribute>
					<xsl:attribute name="type">text/css</xsl:attribute>
					<xsl:attribute name="href">
						<xsl:value-of select="$URLROOT" />
						<xsl:text>/lib/css/screen.css</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="media">screen</xsl:attribute>
				</xsl:element>

				<xsl:element name="link">
					<xsl:attribute name="rel">stylesheet</xsl:attribute>
					<xsl:attribute name="type">text/css</xsl:attribute>
					<xsl:attribute name="href">
						<xsl:value-of select="$URLROOT" />
						<xsl:text>/lib/css/print.css</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="media">print</xsl:attribute>
				</xsl:element>

			</xsl:element>
			<xsl:element name="body">
				<xsl:apply-templates />
			</xsl:element>
		</xsl:element>
	</xsl:template>

	<!-- Header -->
	<xsl:template match="h">
		<!-- Size is optional; default to 1 if unspecified. -->
		<xsl:variable name="size">
			<xsl:choose>
				<xsl:when test="@size">
					<xsl:value-of select="@size" />
				</xsl:when>
				<xsl:otherwise>1</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:element name="h{$size}">
			<xsl:apply-templates />
		</xsl:element>
	</xsl:template>

	<!-- Paragraph -->
	<xsl:template match="p">
		<xsl:element name="p">
			<xsl:apply-templates />
		</xsl:element>
	</xsl:template>

	<!-- Code -->
	<xsl:template match="code">
		<xsl:element name="pre">
			<xsl:apply-templates />
		</xsl:element>
	</xsl:template>

	<!-- Terminology -->
	<xsl:template match="term">
		<xsl:choose>
			<!-- Introducing terminology; no need for link. -->
			<xsl:when test="@intro = 'yes'">
				<xsl:element name="em">
					<xsl:apply-templates />
				</xsl:element>
			</xsl:when>

			<!-- Link to term for definition. -->
			<xsl:otherwise>
				<xsl:variable name="anchor">
					<!-- Optional 'real' attribute to specify actual term. -->
					<xsl:choose>
						<xsl:when test="@real">
							<xsl:value-of select="@real" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="node()" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:element name="a">
					<xsl:attribute name="href">
						<xsl:value-of select="$URLROOT" />
						<xsl:text>/doc/intro/terms.html#</xsl:text>
						<xsl:value-of select="translate($anchor, ' ', '.')" />
					</xsl:attribute>
					<xsl:element name="em">
						<xsl:apply-templates />
					</xsl:element>
				</xsl:element>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- Note -->
	<xsl:template match="note">
		<xsl:element name="table">
			<xsl:element name="tr">
				<xsl:element name="td">
					<xsl:attribute name="width">30</xsl:attribute>
					<xsl:attribute name="align">center</xsl:attribute>
					<xsl:attribute name="style">
						<xsl:text>background-color: #336699; </xsl:text>
						<xsl:text>border: 1px solid #003366; </xsl:text>
					</xsl:attribute>
					<xsl:element name="img">
						<xsl:attribute name="src">
							<xsl:value-of select="$URLROOT" />
							<xsl:text>/img/note.png</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="alt">Note:</xsl:attribute>
					</xsl:element>
				</xsl:element>
				<xsl:element name="td">
					<xsl:apply-templates />
				</xsl:element>
			</xsl:element>
		</xsl:element>
	</xsl:template>

<!--
	<xsl:template match="code/text()">
		<xsl:value-of select="regex:replace(string(.), '^\s+|\s+$', 'g', '')" />
	</xsl:template>
-->

</xsl:stylesheet>
