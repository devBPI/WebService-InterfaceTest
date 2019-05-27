<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="authorities">
		<xsl:apply-templates select="sujets-liees-list"/>
		<xsl:apply-templates select="authorities-list"/>
	</xsl:template>
	<xsl:template match="sujets-liees-list">
		<div style="margin-bottom: 0.5em;">
			<span style="margin-right: 0.5em; font-weight: bold; text-decoration: underline;">Sujet(s) lié(s) :</span>
			<xsl:for-each select="sujet-liee">
				<xsl:if test="position() > 1">, </xsl:if>
				<a href="{$rebondUrl}/?general={.}"><xsl:value-of select="."/></a>
			</xsl:for-each>
		</div>
	</xsl:template>
	<xsl:template match="authorities-list">
		<div style="margin-bottom: 0.5em; font-weight: bold; text-decoration: underline;">Notices d'Autorités les plus relevantes trouvées:</div>
		<div id="authorities">
		<xsl:for-each select="authority">
			<xsl:sort select="rank"/>
			<!--<xsl:value-of select="position()"/> | Last: <xsl:value-of select="last()"/>-->
			<xsl:variable name="authorityDisplay">
				<xsl:choose>
					<xsl:when test="position()=1">
						block
					</xsl:when>
					<xsl:otherwise>
						none
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="authorityClass">
				<xsl:choose>
					<xsl:when test="position()=1">
						authority
					</xsl:when>
					<xsl:otherwise>
						authority supplAuthority
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<div class="{$authorityClass}" style="display: {$authorityDisplay};">
				<!--<div class="pageButton" style="float:left; margin-right: 4px;"><xsl:value-of select="{$position()}"/></div>-->
				<div style="margin-left:2px;"><span style="margin-right: 4px; text-decoration: underline;"></span><xsl:value-of select="formeRetenue"/></div>
				<div style="margin-left:2px;"><span style="margin-right: 4px; text-decoration: underline;">Type d'autorité :</span><xsl:value-of select="type"/></div>
				<xsl:if test="(type='Vedettes matières / noms communs') or (type='Noms géographiques') and (autresNoms/autreNom)">
					<div id="autresNoms">
						<span style="margin-right: 4px; text-decoration: underline;">Autre(s) nom(s) :</span>
						<xsl:for-each select="autresNoms/autreNom">
							<xsl:if test="position() > 1">; </xsl:if>
							<xsl:value-of select="."/>
						</xsl:for-each>
					</div>
				</xsl:if>
				<xsl:if test="(type='Personne') or (type='Collectivité') or (type='Titres uniformes') or (type='Auteurs-titres')">
					<div><xsl:value-of select="dateNaissance"/> - <xsl:value-of select="dateMort"/></div>
				</xsl:if>
				<xsl:if test="pays/pays">
					<div id="pays">
						<span style="margin-right: 4px; text-decoration: underline;">Pays:</span>
						<xsl:for-each select="pays/pays">
							<xsl:if test="position() > 1">; </xsl:if>
							<xsl:value-of select="."/>
						</xsl:for-each>
					</div>
				</xsl:if>
				<xsl:if test="langues/langue">
					<div id="langues">
						<span style="margin-right: 4px; text-decoration: underline;">Langue(s):</span>
						<xsl:for-each select="langues/langue">
							<xsl:if test="position() > 1">; </xsl:if>
							<xsl:value-of select="."/>
						</xsl:for-each>
					</div>
				</xsl:if>
				<xsl:if test="(type='Personne') or (type='Collectivité') and (activitesPrincipales/activitePrincipale)">
					<div id="activiteesPrincipales">
						<span style="margin-right: 4px; text-decoration: underline;">Activité(s) principale(s) :</span>
						<xsl:for-each select="activitesPrincipales/activitePrincipale">
							<xsl:if test="position() > 1">; </xsl:if>
							<xsl:value-of select="."/>
						</xsl:for-each>
					</div>
				</xsl:if>
				<div><a href="authority/{permalink}"><xsl:value-of select="permalink"/></a></div>
			</div>
		</xsl:for-each>
		</div>
		<xsl:if test="count(authority) > 1">
			<input id="displaySupplAuthorities" class="bigButton" type="submit" value="+ Afficher plus d'autorités" onclick="displaySupplAuthorities();" />
			<input id="hideSupplAuthorities"    class="bigButton" style="display:none;" type="submit" value="- Masquer les autorités supplémentaires" onclick="hideSupplAuthorities();" />
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
