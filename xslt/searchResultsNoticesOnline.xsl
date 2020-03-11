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
			<xsl:if test="noticesOnlineList/notice-online">
				<div class="noticesContainer">
					<xsl:for-each select="noticesOnlineList/notice-online">
						<div class="notice-online" style="overflow:hidden;">
							<xsl:call-template name="noticesShortTop"/>

							<xsl:if test="(liens/lien)">
								<div class="liens">
									<xsl:for-each select="liens/lien">
										<div class="lien">
											<xsl:choose>
												<xsl:when test="url">
													Lien <xsl:value-of select="position()"/>:&#160;
													<a target="_blank" property="dc:direct_url" href="{url}">
														<xsl:choose>
															<xsl:when test="title">
																<xsl:value-of select="title"/>
															</xsl:when>
															<xsl:otherwise>
																<xsl:value-of select="url"/>
															</xsl:otherwise>
														</xsl:choose>
													</a>
												</xsl:when>
												<xsl:when test="media">
													Lien <xsl:value-of select="position()"/>:&#160;
													<a target="_blank" property="dc:direct_url" href="/media.php?media={media}">
														<xsl:choose>
															<xsl:when test="title">
																<xsl:value-of select="title"/>
															</xsl:when>
															<xsl:otherwise>
																LIEN MEDIA
															</xsl:otherwise>
														</xsl:choose>
													</a>
												</xsl:when>
												<xsl:otherwise></xsl:otherwise>
											</xsl:choose>
											<xsl:if test="disponibilite">
												<div class="disponibilite" style="font-weight: bold; color: #FF0000;">
													<xsl:if test="used-profil">PROFIL&#160;<xsl:value-of select="used-profil"/></xsl:if>&#160;&#61;&#62;&#160;<xsl:value-of select="disponibilite"/>
												</div>
											</xsl:if>
											<xsl:if test="(right)">
												 - <xsl:value-of select="right"/>
											</xsl:if>
										</div>
									</xsl:for-each>
								</div>
							</xsl:if>
							<xsl:call-template name="noticesShortBottom"/>
							<!--<div style="clear:both"></div>-->
						</div>
					</xsl:for-each>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<xsl:template match="text()"/>
</xsl:stylesheet>
