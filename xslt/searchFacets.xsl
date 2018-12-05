<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!--<xsl:template match="node()|@*">
		<xsl:copy>
			<xsl:apply-templates select="node()|@*"/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="/merged/notices">
		<TechBooks>
			<xsl:apply-templates/>
		</TechBooks>
	</xsl:template>
	<xsl:template match="/">
		<xsl:copy-of select="/merged/notices/facets/facetsList"/>
		<xsl:copy-of select="/merged/notices-online/facets/facetsList"/>
	</xsl:template>-->
	<xsl:template match="facets/facetsList">
		<xsl:for-each select="facet">
			<div id="facet{position()}">
				<xsl:value-of select="name"/> (<xsl:value-of select="count-offline"/>) (<xsl:value-of select="count-online"/>)
				<xsl:for-each select="valuesCounts/value">
					<div>
						- <xsl:value-of select="name"/> (<xsl:value-of select="count-offline"/>) (<xsl:value-of select="count-online"/>)
					</div>
				</xsl:for-each>
			</div>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
