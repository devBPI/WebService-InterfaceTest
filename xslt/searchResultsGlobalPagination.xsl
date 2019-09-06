<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:variable name="notices-label">notices</xsl:variable>
	<xsl:variable name="notices-java-pagination">changeSearchPage</xsl:variable>
	<xsl:variable name="notices-java-changerows">changeSearchRows</xsl:variable>
	<xsl:variable name="notices-java-changesort">changeSearchSort</xsl:variable>
	<xsl:variable name="notices-rows-id">search-rows</xsl:variable>
	<xsl:variable name="notices-sort-id">search-sort</xsl:variable>
	<xsl:template name="pagination">
		<div class="pagination">
			<div style="overflow:hidden;">
				<div class="pageSelector" style="float:right;">
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
				<!--<div style="clear:both"></div>-->
			</div>
			<div style="border-bottom : 2px solid black; overflow:hidden;">
				<xsl:if test="($notices-label) and (results)">
					<span><xsl:value-of select="results"/>&#160;<xsl:value-of select="$notices-label" /> found</span>
				</xsl:if>
				<span class="rowsSelector" style="float:right;">
					<span style="margin-left:2px;">Page <xsl:value-of select="page"/> on <xsl:value-of select="num-pages"/></span>
					<!--<span style="margin-left:2px;"><xsl:value-of select="notices/rows"/> rows</span>-->
					<span class="rowsSelector">&#160;-&#160;
						<select id="{$notices-rows-id}" name="rows" onchange="{$notices-java-changerows}({page}, {rows});">
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
					<span class="sortSelector">&#160;-&#160;Tri&#160;:&#160;
						<select id="{$notices-sort-id}" name="sort" onchange="{$notices-java-changesort}();">
							<xsl:choose>
								<xsl:when test="not(sort) or sort='DEFAULT'">
									<option value="DEFAULT" selected="true">Pertinence</option>
								</xsl:when>
								<xsl:otherwise>
									<option value="DEFAULT">Pertinence</option>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="sort='TITRE_A_Z'">
									<option value="TITRE_A_Z" selected="true">Titre A-Z</option>
								</xsl:when>
								<xsl:otherwise>
									<option value="TITRE_A_Z">Titre A-Z</option>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="sort='TITRE_Z_A'">
									<option value="TITRE_Z_A" selected="true">Titre Z-A</option>
								</xsl:when>
								<xsl:otherwise>
									<option value="TITRE_Z_A">Titre Z-A</option>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="sort='AUTEUR_A_Z'">
									<option value="AUTEUR_A_Z" selected="true">Auteur A-Z</option>
								</xsl:when>
								<xsl:otherwise>
									<option value="AUTEUR_A_Z">Auteur A-Z</option>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="sort='AUTEUR_Z_A'">
									<option value="AUTEUR_Z_A" selected="true">Auteur Z-A</option>
								</xsl:when>
								<xsl:otherwise>
									<option value="AUTEUR_Z_A">Auteur Z-A</option>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="sort='YOUNGER'">
									<option value="YOUNGER" selected="true">Les plus récents d'abord</option>
								</xsl:when>
								<xsl:otherwise>
									<option value="YOUNGER">Les plus récents d'abord</option>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="sort='OLDER'">
									<option value="OLDER" selected="true">Les moins récents d'abord</option>
								</xsl:when>
								<xsl:otherwise>
									<option value="OLDER">Les moins récents d'abord</option>
								</xsl:otherwise>
							</xsl:choose>
						</select>
					</span>
				</span>
				<!--<div style="clear:both"></div>-->
			</div>
		</div>
	</xsl:template>
	<xsl:template match="results">
		<div>
			<xsl:call-template name="pagination"/>
		</div>
	</xsl:template>
	<xsl:template match="text()"/>
</xsl:stylesheet>
