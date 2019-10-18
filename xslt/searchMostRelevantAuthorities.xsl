<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="authorities|/results/relevant-authorities">
		<xsl:apply-templates select="sujets-liees-list"/>
		<xsl:apply-templates select="authorities-list"/>
	</xsl:template>
	<xsl:template match="sujets-liees-list">
		<div style="margin-bottom: 0.5em;">
			<span style="margin-right: 0.5em; font-weight: bold; text-decoration: underline;">Sujet(s) lié(s) :</span>
			<xsl:for-each select="sujet-liee">
				<xsl:if test="position() &#62; 1">, </xsl:if>
				<a href='{$rebondUrl}?simpleSearchCriterias=%3Csearch-criterias%3E%3Csujet%3E{.}%3C%2Fsujet%3E%3C%2Fsearch-criterias%3E'><xsl:value-of select="."/></a>
			</xsl:for-each>
		</div>
	</xsl:template>
	<xsl:template match="authorities-list">
		<div style="margin-bottom: 0.5em; font-weight: bold; text-decoration: underline;">Notices d'Autorités les plus relevantes trouvées:</div>
		<xsl:if test="(ranked-authority-indice-cdu/authority) or (ranked-authority-indice-cdu/indice-cdu)">
			<div id="authorities">
				<xsl:for-each select="ranked-authority-indice-cdu">
					<xsl:sort select="rank"/>
					<xsl:variable name="authorityDisplay">
						<xsl:choose>
							<xsl:when test="position() &#61; 1">
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
						<xsl:for-each select="authority">
							<div style="margin-left:2px;"><span style="margin-right: 4px; text-decoration: underline;"></span><xsl:value-of select="formeRetenue"/></div>
							<div style="margin-left:2px;"><span style="margin-right: 4px; text-decoration: underline;">Type d'autorité :</span><xsl:value-of select="type"/></div>
							<xsl:if test="((type='Concept') or (type='Nom géographique')) and (autresNoms/autreNom)">
								<div id="autresNoms">
									<span style="margin-right: 4px; text-decoration: underline;">Autre(s) nom(s) :</span>
									<xsl:for-each select="autresNoms/autreNom">
										<xsl:if test="position() &#60;&#61; 2">
											<xsl:if test="position() &#62; 1"> ; </xsl:if>
											<xsl:value-of select="."/>
										</xsl:if>
									</xsl:for-each>
								</div>
							</xsl:if>
							<xsl:if test="((type='Personne') or (type='Collectivité') or (type='Titres uniformes') or (type='Oeuvre')) and ((dateNaissance) or (dateMort))">
								<div><xsl:value-of select="dateNaissance"/>&#160;<xsl:if test="(type='Personne')">-</xsl:if>&#160;<xsl:value-of select="dateMort"/></div>
							</xsl:if>
							<xsl:if test="pays/pays">
								<div id="pays">
									<span style="margin-right: 4px; text-decoration: underline;">Pays:</span>
									<xsl:for-each select="pays/pays">
										<xsl:if test="position() &#62; 1">; </xsl:if>
										<xsl:value-of select="."/>
									</xsl:for-each>
								</div>
							</xsl:if>
							<xsl:if test="langues/langue">
								<div id="langues">
									<span style="margin-right: 4px; text-decoration: underline;">Langue(s):</span>
									<xsl:for-each select="langues/langue">
										<xsl:if test="position() &#62; 1">; </xsl:if>
										<xsl:value-of select="."/>
									</xsl:for-each>
								</div>
							</xsl:if>
							<xsl:if test="((type='Personne') or (type='Collectivité')) and (activitesPrincipales/activitePrincipale)">
								<div id="activiteesPrincipales">
									<span style="margin-right: 4px; text-decoration: underline;">Activité(s) principale(s) :</span>
									<xsl:for-each select="activitesPrincipales/activitePrincipale">
										<xsl:if test="position() &#62; 1">; </xsl:if>
										<xsl:value-of select="."/>
									</xsl:for-each>
								</div>
							</xsl:if>
							<div><a href="authority/{permalink}"><xsl:value-of select="permalink"/></a></div>
						</xsl:for-each>
						<xsl:for-each select="indice-cdu">
							<div style="margin-left:2px;"><span style="margin-right: 4px; text-decoration: underline;"></span><xsl:value-of select="cote"/>&#160;-&#160;<xsl:value-of select="libelle"/></div>
							<div style="margin-left:2px;"><span style="margin-right: 4px; text-decoration: underline;">Type d'autorité :</span>Indice de classement</div>
							<div><a href="indice-cdu/{permalink}"><xsl:value-of select="permalink"/></a></div>
						</xsl:for-each>
					</div>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="count(ranked-authority-indice-cdu) > 1">
			<input id="displaySupplAuthorities" class="bigButton" type="submit" value="+ Afficher plus d'autorités" onclick="displaySupplAuthorities();" />
			<input id="hideSupplAuthorities"    class="bigButton" style="display:none;" type="submit" value="- Masquer les autorités supplémentaires" onclick="hideSupplAuthorities();" />
		</xsl:if>
	</xsl:template>
	<xsl:template match="text()"/>
</xsl:stylesheet>
