<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/indice">
		<xsl:choose>
			<xsl:when test="libelle">
				<title><xsl:value-of select="libelle"/></title>
			</xsl:when>
			<xsl:otherwise>
				<title><xsl:value-of select="cote"/></title>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

</xsl:stylesheet>
