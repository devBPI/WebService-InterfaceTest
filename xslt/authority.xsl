<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/authority">
		<div class="authority">
			<div>Notice d'Autorité la plus relevante trouvée:</div>
			<div style="margin-left:2px;"><span style="margin-right: 4px; text-decoration: underline;">Type:</span><xsl:value-of select="type"/></div>
			<div style="margin-left:2px;"><span style="margin-right: 4px; text-decoration: underline;">Nom:</span><xsl:value-of select="formeRetenue"/></div>
			<br />
			<xsl:for-each select="linkingTypesWithNotices/entry">
				<div class="noticeMappee">
					<a href="{$mappedNoticesUrl}{../../id}/notices/{key}?page=1">
						<xsl:value-of select="value"/> notices liées de type <xsl:value-of select="key"/>
					</a>
				</div>
			</xsl:for-each>
		</div>
	</xsl:template>
</xsl:stylesheet>
