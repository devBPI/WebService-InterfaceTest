<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="facets">
		<xsl:for-each select="facet">
			<div id="selectedFacets">
				Facettes <xsl:value-of select="name"/>:
				<xsl:variable name="facetName" select="name" />
				<xsl:variable name="slash">\</xsl:variable>
				<xsl:variable name="doubleSlash">\\</xsl:variable>
				<xsl:variable name="quote">'</xsl:variable>
				<xsl:variable name="slashQuote">\'</xsl:variable>
				<div>
					<xsl:for-each select="values/value">
						<xsl:variable name="replacedSlashString">
							<xsl:call-template name="replace_single_quote">
								<xsl:with-param name="string" select="." />
								<xsl:with-param name="find" select="$slash" />
								<xsl:with-param name="replace" select="$doubleSlash" />
							</xsl:call-template>
						</xsl:variable>
						<xsl:variable name="replacedQuoteString">
							<xsl:call-template name="replace_single_quote">
								<xsl:with-param name="string" select="$replacedSlashString" />
								<xsl:with-param name="find" select="$quote" />
								<xsl:with-param name="replace" select="$slashQuote" />
							</xsl:call-template>
						</xsl:variable>
						<span onclick="removeFacet('{$facetName}','{$replacedQuoteString}');" class="selectedFacet"><xsl:value-of select="."/></span>
					</xsl:for-each>
				</div>
			</div>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="replace_single_quote">
		<xsl:param name="string" select="''"/>
		<xsl:param name="find" select="''"/>
		<xsl:param name="replace" select="''"/>
		<xsl:choose>
			<xsl:when test="contains($string,$find)">
				<xsl:value-of select="concat(substring-before($string,$find),$replace)"/>
				<xsl:call-template name="replace_single_quote">
					<xsl:with-param name="string" select="substring-after($string,$find)"/>
					<xsl:with-param name="find" select="$find"/>
					<xsl:with-param name="replace" select="$replace"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$string"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
