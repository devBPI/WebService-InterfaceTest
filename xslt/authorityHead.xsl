<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/authority">
		<xsl:choose>
			<xsl:when test="formeRetenue">
				<xsl:for-each select="formeRetenue">
					<title><xsl:value-of select="."/></title>
				</xsl:for-each>
			</xsl:when>
			<xsl:otherwise>
				<title>Autorité sans nom</title>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

</xsl:stylesheet>
