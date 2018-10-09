<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<div id="result-lists" style="width: 100%;">
			<div id="notices" style="margin: 3px; grid-column: 1;">
				<div><xsl:value-of select="results/notices/numFound"/> notices found</div>
				<xsl:for-each select="results/notices/noticesList/notice">
					<div class='notice'>
						<div class='titres'>
							<xsl:for-each select="./titres/titre">
								<div><xsl:value-of select="."/></div>
							</xsl:for-each>
						</div>
						<div class='auteurs'>
							<xsl:for-each select="./auteurs/auteur">
								<div><xsl:value-of select="."/></div>
							</xsl:for-each>
						</div>
						<div class='permalinks'>
							<xsl:for-each select="./permalink">
								<div><a href="./notice/{.}"><xsl:value-of select="."/></a></div>
							</xsl:for-each>
						</div>
					</div>
				</xsl:for-each>
			</div>
			<div id="notices-online" style="margin: 3px; grid-column: 2;">
				<div><xsl:value-of select="results/notices-online/numFound"/> notices online found</div>
				<xsl:for-each select="results/notices-online/noticesOnlineList/notice-online">
					<div class='notice-online'>
						<div class='titres'>
							<xsl:for-each select="./titres/titre">
								<div><xsl:value-of select="."/></div>
							</xsl:for-each>
						</div>
						<div class='auteurs'>
							<xsl:for-each select="./auteurs/auteur">
								<div><xsl:value-of select="."/></div>
							</xsl:for-each>
						</div>
						<div class='permalinks'>
							<xsl:for-each select="./permalink">
								<div><a href="./notice/{.}"><xsl:value-of select="."/></a></div>
							</xsl:for-each>
						</div>
					</div>
				</xsl:for-each>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
