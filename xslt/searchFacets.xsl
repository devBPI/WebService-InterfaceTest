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
	<xsl:template match="/">
		<xsl:for-each select="/merged/notices/facets/facetsList/facet">
			<div>
				<xsl:value-of select="name"/>
				notices
				<xsl:if test="contains(../../../merged/notices-online/facets/facetsList/facet/name, '{./name}')">
					and online
				</xsl:if>
			</div>
		</xsl:for-each>
		<xsl:for-each select="/merged/notices-online/facets/facetsList/facet">
			<div><xsl:value-of select="name"/></div>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
