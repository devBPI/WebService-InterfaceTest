<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<xsl:copy-of select="/merged/notices/facets/facetsList"/>
		<xsl:copy-of select="/merged/notices-online/facets/facetsList"/>
	</xsl:template>
</xsl:stylesheet>
