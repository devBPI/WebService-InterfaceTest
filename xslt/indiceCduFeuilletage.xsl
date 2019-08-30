<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/around-indexes-list">
		<table id="around">
			<tr>
				<th>
					<!--<a class="selected" href='{$rebondUrl}/?simpleSearchCriterias=%3Csearch-criterias%3E%3Cindice-cote%3E{around-indexes-list/previous}%3C%2Findice-cote%3E%3C%2Fsearch-criterias%3E'>Page précédente</a>-->
					<div class="selected" onclick="loadIndices('{previous}');">Page précédente</div>
				</th>
			</tr>
			<tr>
				<th>Feuilletage d'indices</th>
			</tr>
			<xsl:for-each select="around-indexes/index">
				<tr>
					<td>
						<xsl:choose>
							<xsl:when test="(cote) = (../../../cote)">
								<a class="selected" href='{$rebondUrl}/?simpleSearchCriterias=%3Csearch-criterias%3E%3Cindice-cote%3E{cote}%3C%2Findice-cote%3E%3C%2Fsearch-criterias%3E'><xsl:value-of select="cote"/>&#160;-&#160;<xsl:value-of select="libelle"/></a>
							</xsl:when>
							<xsl:otherwise>
								<a href='{$rebondUrl}/?simpleSearchCriterias=%3Csearch-criterias%3E%3Cindice-cote%3E{cote}%3C%2Findice-cote%3E%3C%2Fsearch-criterias%3E'><xsl:value-of select="cote"/>&#160;-&#160;<xsl:value-of select="libelle"/></a>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</xsl:for-each>
			<tr>
				<th>
					<!--<a class="selected" href='{$rebondUrl}/?simpleSearchCriterias=%3Csearch-criterias%3E%3Cindice-cote%3E{around-indexes-list/next}%3C%2Findice-cote%3E%3C%2Fsearch-criterias%3E'>Page suivante</a>-->
					<div class="selected" onclick="loadIndices('{next}');">Page suivante</div>
				</th>
			</tr>
		</table>
	</xsl:template>
</xsl:stylesheet>
