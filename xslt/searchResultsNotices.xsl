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
				<div class="notice">
					<div class="pageButton" style="float:left; margin-right: 4px;"><xsl:value-of select="./row"/></div>
					<div class="titres">
						<xsl:for-each select="./titres/titre">
							<div><xsl:value-of select="."/></div>
						</xsl:for-each>
					</div>
					<div class="auteurs">
						<xsl:for-each select="./auteurs/auteur">
							<div><xsl:value-of select="."/></div>
						</xsl:for-each>
					</div>
					<div class="permalinks">
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
