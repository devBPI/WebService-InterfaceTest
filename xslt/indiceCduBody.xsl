<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/indice">
		<div class="indice-cdu" style="margin-left: 2px;">
			<xsl:if test="permalink">
				<div><a href="/indice-cdu/{permalink}"><xsl:value-of select="permalink" /></a></div>
			</xsl:if>
			<br />
			<div><span style="margin-right: 0.5em; text-decoration: underline;">Type d'autorité :</span>Indice de classement</div>
			<div style="font-weight: bold;">
				<xsl:if test="cote"><xsl:value-of select="cote"/></xsl:if>
				<xsl:if test="libelle"> - <xsl:value-of select="libelle"/></xsl:if>
			</div>
			<br />
			<xsl:if test="usedFor_s/usedFor">
				<div id="usedFor">
					Employé pour&#160;:&#160;
					<xsl:for-each select="usedFor_s/usedFor">
						<xsl:if test="position() > 1">&#160;;&#160;</xsl:if>
						<xsl:value-of select="."/>
					</xsl:for-each>
				</div>
			</xsl:if>
			<br />
			<xsl:if test="notesArrangements/noteArrangement">
				<div id="notesArrangements">
					Notes sur le classement&#160;:&#160;
					<xsl:for-each select="notesArrangements/noteArrangement">
						<div>
							<xsl:value-of select="."/>
						</div>
					</xsl:for-each>
				</div>
			</xsl:if>
			<br />
			<table id="around">
				<tr>
					<th>Feuilletage d'indices</th>
				</tr>
				<xsl:for-each select="around-indexes-list/around-indexes/index">
					<tr>
						<td>
							<xsl:choose>
								<xsl:when test="(cote) = (../../../cote)">
									<a class="selected" href="{$rebondUrl}/?indicecote={cote}"><xsl:value-of select="cote"/>&#160;-&#160;<xsl:value-of select="libelle"/></a>
								</xsl:when>
								<xsl:otherwise>
									<a href="{$rebondUrl}/?indicecote={cote}"><xsl:value-of select="cote"/>&#160;-&#160;<xsl:value-of select="libelle"/></a>
								</xsl:otherwise>
							</xsl:choose>
						</td>
					</tr>
				</xsl:for-each>
			</table>
		</div>
	</xsl:template>
</xsl:stylesheet>
