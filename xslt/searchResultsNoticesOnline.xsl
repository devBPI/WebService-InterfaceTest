<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<link rel="stylesheet" type="text/css" href="css/body.css" />
		<link rel="stylesheet" type="text/css" href="css/accessories.css" />
		<link rel="stylesheet" type="text/css" href="css/notices.css" />
		<div>
			<div>
				<div>
					<span><xsl:value-of select="notices-online/results"/> notices online found</span>
					<span style="float:right;">
						<span style="margin-left:2px;">Page <xsl:value-of select="notices-online/page"/> on <xsl:value-of select="notices-online/num-pages"/> - </span>
						<span style="margin-left:2px;"><xsl:value-of select="notices-online/rows"/> rows</span>
					</span>
				</div>
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
						<xsl:when test="notices-online/page&lt;=(notices-online/num-pages)-1"> <span onclick="changeNoticesOnlinePage({(notices-online/page)+1})" class="pageButton clickablePageButton">&gt;</span> </xsl:when>
						<xsl:otherwise><span onclick="changeNoticesOnlinePage({notices-online/page})" class="pageButton clickablePageButton">&gt;</span></xsl:otherwise>
					</xsl:choose>
					<span onclick="changeNoticesOnlinePage({notices-online/num-pages})" class="pageButton clickablePageButton">≫</span>
				</div>
			</div>
			<xsl:for-each select="notices-online/noticesOnlineList/notice-online">
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
	</xsl:template>
</xsl:stylesheet>
