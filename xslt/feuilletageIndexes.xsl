<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/around-indexes-list">
		<div>
			<xsl:for-each select="around-indexes/index">
				<div>
					<a href="{$rebondUrl}/?indicecote={.}"><xsl:value-of select="."/></a>
				</div>
			</xsl:for-each>
		</div>
	</xsl:template>
</xsl:stylesheet>
