<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/suggestions-list">
		<div class="suggestions"> Suggestion orthographique: 
			<xsl:for-each select="suggestions/suggestion">
				<xsl:if test="position()>1">, </xsl:if>
				<a href="{$rebondUrl}/?general={.}"><xsl:value-of select="."/></a>
			</xsl:for-each>
		</div>
	</xsl:template>

</xsl:stylesheet>
