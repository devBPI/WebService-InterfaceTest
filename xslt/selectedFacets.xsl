<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="facets">
		<xsl:for-each select="facet">
			<div id="selectedFacets">
				Facettes <xsl:value-of select="name"/>:
				<xsl:variable name="facetName" select="name" />
				<div>
					<xsl:for-each select="values/value">
						<span class="selectedFacet"><xsl:value-of select="."/></span><span onclick="removeFacet('{$facetName}','{.}');" class="facetCross">x</span>
					</xsl:for-each>
				</div>
				<!--<div class="facet" onclick="displayHideFacet(facet{position()});"><xsl:value-of select="name"/> <span style="font-weight: bold; color: #0055AA;">[<xsl:value-of select="count-offline"/>]</span> <span style="font-weight: bold; color: #007700;">[<xsl:value-of select="count-online"/>]</span></div>
				<xsl:variable name="facetName" select="name" />
				<div id="facet{position()}" style="display: none;">
					<xsl:for-each select="valuesCounts/value">
						<div class="facet" onclick='addFacet("{$facetName}", "{name}");'>- <xsl:value-of select="name"/> <span style="font-weight: bold; color: #0055AA;">(<xsl:value-of select="count-offline"/>)</span> <span style="font-weight: bold; color:#007700;">(<xsl:value-of select="count-online"/>)</span></div>
					</xsl:for-each>
				</div>-->
			</div>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
