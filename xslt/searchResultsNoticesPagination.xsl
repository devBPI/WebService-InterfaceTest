<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template name="pagination">
		<div class="pagination">
			<div style="overflow:hidden;">
				<div style="float:right;">
					<span onclick="{$notices-java-pagination}(1)" class="pageButton clickablePageButton">≪</span>
					<span onclick="{$notices-java-pagination}({(page)-1})" class="pageButton clickablePageButton">&lt;</span>
					<xsl:if test="page&gt;3">
						<span class="pageButton">...</span>
					</xsl:if>
					<xsl:if test="page&gt;2">
						<span onclick="{$notices-java-pagination}({(page)-2})" class="pageButton clickablePageButton"><xsl:value-of select="(page)-2"/></span>
					</xsl:if>
					<xsl:if test="page&gt;1">
						<span onclick="{$notices-java-pagination}({(page)-1})" class="pageButton clickablePageButton"><xsl:value-of select="(page)-1"/></span>
					</xsl:if>
					<span class="pageButton" style="font-size: 115%; font-weight: bold;"><xsl:value-of select="page"/></span>
					<xsl:if test="page&lt;=(num-pages)-1">
						<span onclick="{$notices-java-pagination}({(page)+1})" class="pageButton clickablePageButton"><xsl:value-of select="(page)+1"/></span>
					</xsl:if>
					<xsl:if test="page&lt;=(num-pages)-2">
						<span onclick="{$notices-java-pagination}({(page)+2})" class="pageButton clickablePageButton"><xsl:value-of select="(page)+2"/></span>
					</xsl:if>
					<xsl:if test="page&lt;=(num-pages)-3">
						<span class="pageButton">...</span>
					</xsl:if>
					<xsl:choose>
						<xsl:when test="page&lt;=(num-pages)-1"><span onclick="{$notices-java-pagination}({(page)+1})" class="pageButton clickablePageButton">&gt;</span></xsl:when>
						<xsl:otherwise><span onclick="{$notices-java-pagination}({page})" class="pageButton clickablePageButton">&gt;</span></xsl:otherwise>
					</xsl:choose>
					<span onclick="{$notices-java-pagination}({num-pages})" class="pageButton clickablePageButton">≫</span>
				</div>
				<div style="clear:both"></div>
			</div>
			<div style="border-bottom : 2px solid black; overflow:hidden;">
				<span><xsl:value-of select="results"/>&#160;<xsl:value-of select="$notices-label" /> found</span>
				<span style="float:right;">
					<span style="margin-left:2px;">Page <xsl:value-of select="page"/> on <xsl:value-of select="num-pages"/> - </span>
					<!--<span style="margin-left:2px;"><xsl:value-of select="notices/rows"/> rows</span>-->
					<span style="margin-left:2px;">
						<select id="{$notices-rows-id}" name="rows" onchange="changeNoticesRows({page}, {rows});">
							<xsl:choose>
								<xsl:when test="rows=20">
									<option value="20" selected="true">20</option>
								</xsl:when>
								<xsl:otherwise>
									<option value="20">20</option>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="rows=40">
									<option value="40" selected="true">40</option>
								</xsl:when>
								<xsl:otherwise>
									<option value="40">40</option>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="rows=100">
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
	</xsl:template>
</xsl:stylesheet>
