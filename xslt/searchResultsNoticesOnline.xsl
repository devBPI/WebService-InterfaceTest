<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:variable name="notices-label">notices online</xsl:variable>
	<xsl:variable name="notices-java-pagination">changeNoticesOnlinePage</xsl:variable>
	<xsl:variable name="notices-java-changerows">changeNoticesOnlineRows</xsl:variable>
	<xsl:variable name="notices-rows-id">notices-online-rows</xsl:variable>
	<xsl:include href="searchResultsNotices.xsl"/>
	<xsl:include href="searchResultsNoticesPagination.xsl"/>
	<xsl:template match="notices-online|/results/notices-online">
		<div>
			<xsl:call-template name="pagination"/>
			<div class="noticesContainer">
				<xsl:for-each select="noticesOnlineList/notice-online">
					<div class="notice-online" style="overflow:hidden;">
						<xsl:call-template name="noticesShortTop"/>

						<xsl:if test="(./liens)">
							<div class="liens">
								<xsl:for-each select="./liens/lien">
									<div class="lien">
										Lien <xsl:value-of select="position()"/>: 
										<a href="{./url}"><xsl:value-of select="./url"/></a>
										<xsl:if test="(./right)">
											 - <xsl:value-of select="./right"/>
										</xsl:if>
									</div>
								</xsl:for-each>
							</div>
						</xsl:if>















						<xsl:call-template name="noticesShortBottom"/>
						<div style="clear:both"></div>
					</div>
				</xsl:for-each>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="text()"/>
</xsl:stylesheet>
