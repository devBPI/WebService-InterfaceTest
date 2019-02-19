<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="authority">
		<div class="authority">
			<div style="color: #0044BB; font-weight: bold; text-decoration: underline;">Notice d'Autorité la plus relevante trouvée:</div>
			<div style="margin-left:2px;"><span style="margin-right: 4px; text-decoration: underline;">Type:</span><xsl:value-of select="type"/></div>
			<div style="margin-left:2px;"><span style="margin-right: 4px; text-decoration: underline;">Nom:</span><xsl:value-of select="formeRetenue"/></div>
			<xsl:if test="autresNoms/autreNom">
				<div id="autresNoms">
					<div style="margin-right: 4px; text-decoration: underline;">Autre(s) nom(s):</div>
					<xsl:for-each select="autresNoms/autreNom">
						<div style="margin-left: 4px;"><xsl:value-of select="."/></div>
					</xsl:for-each>
				</div>
			</xsl:if>
			<xsl:if test="(type!='Personne') and (type!='Collectivité')">
				<div>Date (<xsl:value-of select="dateNaissance"/> - <xsl:value-of select="dateMort"/>)</div>
			</xsl:if>
			<xsl:if test="pays/pays">
				<div id="pays">
					<div style="margin-right: 4px; text-decoration: underline;">Pays:</div>
					<xsl:for-each select="pays/pays">
						<div style="margin-left: 4px;"><xsl:value-of select="."/></div>
					</xsl:for-each>
				</div>
			</xsl:if>
			<xsl:if test="langues/langue">
				<div id="langues">
					<div style="margin-right: 4px; text-decoration: underline;">Langues:</div>
					<xsl:for-each select="langues/langue">
						<div style="margin-left: 4px;"><xsl:value-of select="."/></div>
					</xsl:for-each>
				</div>
			</xsl:if>
			<xsl:if test="(type='Personne') or (type='Collectivité') and (activitesPrincipales/activitePrincipale)">
				<div>Activité(s) principale(s):</div>
				<div id="activiteesPrincipales">
					<xsl:for-each select="activitesPrincipales/activitePrincipale">
						<div style="margin-left: 4px;"><xsl:value-of select="."/></div>
					</xsl:for-each>
				</div>
			</xsl:if>
			<div><a href="authority/{permalink}"><xsl:value-of select="permalink"/></a></div>
		</div>
	</xsl:template>
</xsl:stylesheet>
