<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:variable name="notices-label">notices</xsl:variable>
	<xsl:variable name="notices-java-pagination">changeNoticesPage</xsl:variable>
	<xsl:variable name="notices-java-changerows">changeNoticesRows</xsl:variable>
	<xsl:variable name="notices-rows-id">notices-rows</xsl:variable>
	<xsl:include href="searchResultsNotices.xsl"/>
	<xsl:include href="searchResultsNoticesPagination.xsl"/>
	<xsl:template match="notices|/results/notices">
		<div>
			<xsl:call-template name="pagination"/>
			<xsl:if test="noticesList/notice">
				<div class="noticesContainer">
					<xsl:for-each select="noticesList/notice">
						<div class="notice" style="overflow:hidden;">
							<xsl:call-template name="noticesShortTop"/>
	
							<xsl:if test="(./exemplaires)">
								<div class="exemplaires">
									<xsl:for-each select="./exemplaires/exemplaire">
										<xsl:sort select="./call_num"/>
										<div class="exemplaire">
											<div class="exemplaire-desc">
												<div>
													<xsl:choose>
														<xsl:when test="./availability-label='DISPONIBLE'">
															<span class="availability"><xsl:value-of select="./availability-label"/></span> - <xsl:value-of select="./call_num"/>
														</xsl:when>
														<xsl:otherwise>
															<span class="availability help-cursor unavailable" title="{./availability}"><xsl:value-of select="./availability-label"/></span> - <xsl:value-of select="./call_num"/>
														</xsl:otherwise>
													</xsl:choose>
													<xsl:if test="(./material_support) and not((./material_support) = 'Papier')">
														- <xsl:value-of select="./material_support"/>
													</xsl:if>
												</div>
												<xsl:if test="(./note)">
													<div>
														<xsl:value-of select="./note"/>
													</div>
												</xsl:if>
												<div>
													<xsl:value-of select="./location"/>
													<xsl:if test="(./category)">
														 - <xsl:value-of select="./category"/>
													</xsl:if>
												</div>
												<xsl:if test="(./last_received)">
													<div>
														Dernier numéro reçu : <xsl:value-of select="./last_received"/>
													</div>
												</xsl:if>
											</div>
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
