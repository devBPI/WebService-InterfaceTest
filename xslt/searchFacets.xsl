<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<div>
			aaa
			<div>
				<xsl:for-each select="notices/noticesList/notice">
					<div class="notice" style="overflow:hidden;">
						<div class="pageButton" style="float:left; margin-right: 4px;"><xsl:value-of select="./row"/></div>
						<div class="" style="display: inline-block; float:right; margin-right: 4px; text-align: right;">
							<xsl:value-of select="./type"/><br />
							<xsl:if test="./resumes">
								<span title="Résumé: {./resumes}"><img src="/img/Gnome-dialog-question.svg" style="width: 24px; height: 24px; cursor: help;" /></span>
							</xsl:if>
							<xsl:if test="(./type='Musique' or ./type='Docelec') and ./contenus">
								<span title="Contenu: {./contenus}"><img src="/img/Gnome-dialog-question.svg" style="width: 24px; height: 24px; cursor: help;" /></span>
							</xsl:if>
						</div>
						<div class="titres">
							<xsl:for-each select="./titres/titre">
								<div><xsl:value-of select="."/></div>
							</xsl:for-each>
						</div>
						<div class="auteurs">
							<xsl:for-each select="./auteurs/auteur">
								<div>par <xsl:value-of select="."/></div>
							</xsl:for-each>
						</div>
						<div class="editeurs">
							<xsl:for-each select="./editeurs/editeur">
								<div><xsl:value-of select="."/></div>
							</xsl:for-each>
						</div>
						<div class="dates">
							<xsl:for-each select="./dates/date">
								<div><xsl:value-of select="."/></div>
							</xsl:for-each>
						</div>
						<xsl:if test="(./exemplaires)">
							<div class="exemplaires">
								<xsl:for-each select="./exemplaires/exemplaire">
									<div class="exemplaire">
										<div class="exemplaire-name">Exemplaire <xsl:value-of select="position()"/>:</div>
										<div class="exemplaire-desc">
											<div><xsl:value-of select="./availability"/>, <xsl:value-of select="./call_num"/>
												<xsl:if test="(./material_support)">
													, <xsl:value-of select="./material_support"/>
												</xsl:if>
											</div>
											<div><xsl:value-of select="./location"/>
												<xsl:if test="(./category)">
													 - <xsl:value-of select="./category"/>
												</xsl:if>
											</div>
										</div>
									</div>
								</xsl:for-each>
							</div>
						</xsl:if>
						<div class="permalinks">
							<xsl:for-each select="./permalink">
								<div><a href="./notice/{.}"><xsl:value-of select="."/></a></div>
							</xsl:for-each>
						</div>
						<div style="clear:both"></div>
					</div>
				</xsl:for-each>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
