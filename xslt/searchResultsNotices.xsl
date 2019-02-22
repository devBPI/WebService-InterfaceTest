<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<div>
			<div>
				<div style="overflow:hidden;">
					<div style="float:right;">
						<span onclick="changeNoticesPage(1)" class="pageButton clickablePageButton">≪</span>
						<span onclick="changeNoticesPage({(notices/page)-1})" class="pageButton clickablePageButton">&lt;</span>
						<xsl:if test="notices/page&gt;3">
							<span class="pageButton">...</span>
						</xsl:if>
						<xsl:if test="notices/page&gt;2">
							<span onclick="changeNoticesPage({(notices/page)-2})" class="pageButton clickablePageButton"><xsl:value-of select="(notices/page)-2"/></span>
						</xsl:if>
						<xsl:if test="notices/page&gt;1">
							<span onclick="changeNoticesPage({(notices/page)-1})" class="pageButton clickablePageButton"><xsl:value-of select="(notices/page)-1"/></span>
						</xsl:if>
						<span class="pageButton" style="font-size: 115%; font-weight: bold;"><xsl:value-of select="notices/page"/></span>
						<xsl:if test="notices/page&lt;=(notices/num-pages)-1">
							<span onclick="changeNoticesPage({(notices/page)+1})" class="pageButton clickablePageButton"><xsl:value-of select="(notices/page)+1"/></span>
						</xsl:if>
						<xsl:if test="notices/page&lt;=(notices/num-pages)-2">
							<span onclick="changeNoticesPage({(notices/page)+2})" class="pageButton clickablePageButton"><xsl:value-of select="(notices/page)+2"/></span>
						</xsl:if>
						<xsl:if test="notices/page&lt;=(notices/num-pages)-3">
							<span class="pageButton">...</span>
						</xsl:if>
						<xsl:choose>
							<xsl:when test="notices/page&lt;=(notices/num-pages)-1"><span onclick="changeNoticesPage({(notices/page)+1})" class="pageButton clickablePageButton">&gt;</span></xsl:when>
							<xsl:otherwise><span onclick="changeNoticesPage({notices/page})" class="pageButton clickablePageButton">&gt;</span></xsl:otherwise>
						</xsl:choose>
						<span onclick="changeNoticesPage({notices/num-pages})" class="pageButton clickablePageButton">≫</span>
					</div>
					<div style="clear:both"></div>
				</div>
				<div style="border-bottom : 2px solid black; overflow:hidden;">
					<span><xsl:value-of select="notices/results"/> notices found</span>
					<span style="float:right;">
						<span style="margin-left:2px;">Page <xsl:value-of select="notices/page"/> on <xsl:value-of select="notices/num-pages"/> - </span>
						<!--<span style="margin-left:2px;"><xsl:value-of select="notices/rows"/> rows</span>-->
						<span style="margin-left:2px;">
							<select id="notices-rows" name="rows" onchange="changeNoticesRows({notices/page}, {notices/rows});">
								<xsl:choose>
									<xsl:when test="notices/rows=20">
										<option value="20" selected="true">20</option>
									</xsl:when>
									<xsl:otherwise>
										<option value="20">20</option>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="notices/rows=40">
										<option value="40" selected="true">40</option>
									</xsl:when>
									<xsl:otherwise>
										<option value="40">40</option>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="notices/rows=100">
										<option value="100" selected="true">100</option>
									</xsl:when>
									<xsl:otherwise>
										<option value="100">100</option>
									</xsl:otherwise>
								</xsl:choose>
							</select> rows
						</span>
					</span>
					<div style="clear:both"></div>
				</div>
			</div>
			<div>
				<xsl:for-each select="notices/noticesList/notice">
<!--					<a class="notice-link" href="./notice/{./permalink}">-->
						<div class="notice" style="overflow:hidden;">
							<xsl:if test="./isbn">
								<div style="float:left; margin-left: 4px; margin-right: 4px;" >
									<img class="couverture" src="{$imgUrl}{./isbn}"/>
								</div>
							</xsl:if>
							<div>
								<div class="pageButton" style="float:left; margin-right: 4px;"><xsl:value-of select="./row"/></div>
								<div class="" style="display: inline-block; float:right; margin-right: 4px; text-align: right;">
									<xsl:value-of select="./type"/><br />
									<xsl:if test="(./type='Vidéo') and ./formats/format">
										<xsl:for-each select="./formats/format">
											<div class="format"><xsl:value-of select="."/></div>
										</xsl:for-each>
									</xsl:if>

									<xsl:if test="(./type!='Musique' and ./type!='Docelec') and ./resumes">
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
									<div class="analytiques">
										<xsl:for-each select="./titresAnalytiques/titreAnalytique">
											<div>Dans <xsl:value-of select="."/></div>
										</xsl:for-each>
									</div>
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
<!--					</a>-->
				</xsl:for-each>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
