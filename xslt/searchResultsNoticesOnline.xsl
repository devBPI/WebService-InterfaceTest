<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<div>
			<div>
				<div style="overflow:hidden;">
					<div style="float:right;">
						<span onclick="changeNoticesOnlinePage(1)" class="pageButton clickablePageButton">≪</span>
						<span onclick="changeNoticesOnlinePage({(notices-online/page)-1})" class="pageButton clickablePageButton">&lt;</span>
						<xsl:if test="notices-online/page&gt;3">
							<span class="pageButton">...</span>
						</xsl:if>
						<xsl:if test="notices-online/page&gt;2">
							<span onclick="changeNoticesOnlinePage({(notices-online/page)-2})" class="pageButton clickablePageButton"><xsl:value-of select="(notices-online/page)-2"/></span>
						</xsl:if>
						<xsl:if test="notices-online/page&gt;1">
							<span onclick="changeNoticesOnlinePage({(notices-online/page)-1})" class="pageButton clickablePageButton"><xsl:value-of select="(notices-online/page)-1"/></span>
						</xsl:if>
						<span class="pageButton" style="font-size: 115%; font-weight: bold;"><xsl:value-of select="notices-online/page"/></span>
						<xsl:if test="notices-online/page&lt;=(notices-online/num-pages)-1">
							<span onclick="changeNoticesOnlinePage({(notices-online/page)+1})" class="pageButton clickablePageButton"><xsl:value-of select="(notices-online/page)+1"/></span>
						</xsl:if>
						<xsl:if test="notices-online/page&lt;=(notices-online/num-pages)-2">
							<span onclick="changeNoticesOnlinePage({(notices-online/page)+2})" class="pageButton clickablePageButton"><xsl:value-of select="(notices-online/page)+2"/></span>
						</xsl:if>
						<xsl:if test="notices-online/page&lt;=(notices-online/num-pages)-3">
							<span class="pageButton">...</span>
						</xsl:if>
						<xsl:choose>
							<xsl:when test="notices-online/page&lt;=(notices-online/num-pages)-1"><span onclick="changeNoticesOnlinePage({(notices-online/page)+1})" class="pageButton clickablePageButton">&gt;</span></xsl:when>
							<xsl:otherwise><span onclick="changeNoticesOnlinePage({notices-online/page})" class="pageButton clickablePageButton">&gt;</span></xsl:otherwise>
						</xsl:choose>
						<span onclick="changeNoticesOnlinePage({notices-online/num-pages})" class="pageButton clickablePageButton">≫</span>
					</div>
					<div style="clear:both"></div>
				</div>
				<div style="border-bottom : 2px solid black; overflow:hidden;">
					<span><xsl:value-of select="notices-online/results"/> notices online found</span>
					<span style="float:right;">
						<span style="margin-left:2px;">Page <xsl:value-of select="notices-online/page"/> on <xsl:value-of select="notices-online/num-pages"/> - </span>
						<!--<span style="margin-left:2px;"><xsl:value-of select="notices-online/rows"/> rows</span>-->
						<span style="margin-left:2px;">
							<select id="notices-online-rows" name="rows" onchange="changeNoticesOnlineRows({notices-online/page}, {notices-online/rows});">
								<xsl:choose>
									<xsl:when test="notices-online/rows=20">
										<option value="20" selected="true">20</option>
									</xsl:when>
									<xsl:otherwise>
										<option value="20">20</option>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="notices-online/rows=40">
										<option value="40" selected="true">40</option>
									</xsl:when>
									<xsl:otherwise>
										<option value="40">40</option>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="notices-online/rows=100">
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
			<xsl:for-each select="notices-online/noticesOnlineList/notice-online">
				<a class="notice-online-link" href="./notice/{./permalink}">
					<div class="notice-online" style="overflow:hidden;">
						<div class="pageButton" style="float:left; margin-right: 4px;"><xsl:value-of select="./row"/></div>
						<div class="" style="display: inline-block; float:right; margin-right: 4px; text-align: right;">
							<xsl:value-of select="./type"/><br />
							<xsl:if test="./resumes">
								<span title="Résumé: {./resumes}"><img src="/img/Gnome-dialog-question.svg" style="width: 24px; height: 24px; cursor: help;" /></span>
								<xsl:if test="./contenus">
									<span title="Contenu: {./contenus}"><img src="/img/Gnome-dialog-question.svg" style="width: 24px; height: 24px; cursor: help;" /></span>
								</xsl:if>
							</xsl:if>
						</div>

						<!--<div class="noticeOnlineBloc1">
							<div class='titres'>
								<xsl:for-each select="./titres/titre">
									<div><xsl:value-of select="."/></div>
								</xsl:for-each>
							</div>
							<xsl:choose>
								<xsl:when test="./type='Musique'">
									<div class='auteurscompositeursinterpretes'>
										<div> par
											<xsl:for-each select="./auteurs/auteur">
												<xsl:if test="position() > 1">,</xsl:if>
												<xsl:value-of select="." />
											</xsl:for-each>
										</div>
									</div>
								</xsl:when>
								<xsl:otherwise>
									<xsl:if test="./type!='Musique' and ./type!='Docelec'">
										<div class="auteurs">
											<xsl:for-each select="./auteurs/auteur">
												<div>par <xsl:value-of select="."/></div>
											</xsl:for-each>
										</div>
									</xsl:if>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:if test="./type='Vidéo'">
								<div class="realisateurs">
									<div>Par 
										<xsl:for-each select="./realisateurs/realisateur">
											<xsl:if test="position() > 1">,</xsl:if>
											<xsl:value-of select="."/>
										</xsl:for-each>
									</div>
								</div>
							</xsl:if>
						</div>
						<div class="noticeOnlineBloc2">
							<div></div>
							<div></div>
						</div>
						<div class="noticeOnlineBloc3">
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
						<div class="liens">
						</div>
						<div class='permalinks'>
							<xsl:for-each select="./permalink">
								<div><a href="./notice/{.}"><xsl:value-of select="."/></a></div>
							</xsl:for-each>
						</div>
						<div style="clear:both"></div>
						-->
						
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
						<div class="exemplaires">
						</div>
						<div class="liens">
						</div>
						<div class="permalinks">
							<xsl:for-each select="./permalink">
								<div><a href="./notice/{.}"><xsl:value-of select="."/></a></div>
							</xsl:for-each>
						</div>
						<div style="clear:both"></div>
					</div>
				</a>
			</xsl:for-each>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
