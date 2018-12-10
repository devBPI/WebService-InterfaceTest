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
			<div>
				<span onclick="displayHideFacet(facet{position()});" style="cursor: pointer;"><xsl:value-of select="name"/> <span style="font-weight: bold; color: #0055AA;">(<xsl:value-of select="count-offline"/>)</span> <span style="font-weight: bold; color: #007700;">(<xsl:value-of select="count-online"/>)</span></span>
				<div id="facet{position()}" style="display: none;">
					<xsl:for-each select="valuesCounts/value">
						<div>
							- <xsl:value-of select="name"/> <span style="font-weight: bold; color: #0055AA;">(<xsl:value-of select="count-offline"/>)</span> <span style="font-weight: bold; color:#007700;">(<xsl:value-of select="count-online"/>)</span>
						</div>
					</xsl:for-each>
				</div>
			</div>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
