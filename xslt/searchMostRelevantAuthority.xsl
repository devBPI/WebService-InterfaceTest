<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<div class="authority">
			<div>Notice d'Autorité la plus relevante trouvée:</div>
			<div style="margin-left:2px;"><span style="margin-right: 4px; text-decoration: underline;">Type:</span><xsl:value-of select="authority/type"/></div>
			<div style="margin-left:2px;"><span style="margin-right: 4px; text-decoration: underline;">Nom:</span><xsl:value-of select="authority/label"/></div>
			<div><a href="authority/{authority/permalink}">LINK UNAVAILABLE<xsl:value-of select="authority/permalink"/></a></div>
		</div>
	</xsl:template>
</xsl:stylesheet>
