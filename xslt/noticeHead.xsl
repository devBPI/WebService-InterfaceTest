<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="notice">
		<xsl:choose>
			<xsl:when test="titres/titre">
				<xsl:for-each select="titres/titre">
					<title><xsl:value-of select="."/></title>
				</xsl:for-each>
			</xsl:when>
			<xsl:otherwise>
				<title>Notice sans titre</title>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="text()"/>
</xsl:stylesheet>
