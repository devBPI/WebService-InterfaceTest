<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/authority">
		<div class="authority" style="margin-left: 2px;">
			<xsl:if test="permalink">
				<div><a href="/authority/{permalink}"><xsl:value-of select="permalink" /></a></div>
			</xsl:if>
			<br />
			<div><span style="margin-right: 0.5em; text-decoration: underline;">Type d'autorité :</span><xsl:value-of select="type"/></div>
			<div><span style="margin-right: 0.5em; text-decoration: underline;"></span><xsl:value-of select="formeRetenue"/></div>
			<xsl:if test="formesParalleles/formeParallele">
				<div id="formesParalelles" style="font-style: italic; font-size: small;">
					<xsl:for-each select="formesParalleles/formeParallele">
						<div><xsl:value-of select="."/></div>
					</xsl:for-each>
				</div>
			</xsl:if>
			<xsl:if test="((type='Personne') or (type='Collectivité')) and (pays/pays)">
				<div id="pays">
					Pays
					<xsl:for-each select="pays/pays">
					<xsl:if test="position() > 1">;&#160;</xsl:if>
					<xsl:value-of select="."/>
					</xsl:for-each>
				</div>
			</xsl:if>
			<xsl:if test="not(type='Concept' or type='Nom géographique') and (langues/langue)">
				<div id="langues">
					Langue(s)
					<xsl:for-each select="langues/langue">
						<xsl:if test="position() > 1">;&#160;</xsl:if>
						<xsl:value-of select="."/>
					</xsl:for-each>
				</div>
			</xsl:if>

			<xsl:if test="genresMusicaux/genreMusical">
				<div id="genresMusicaux">
					Genre musical&#160;:&#160;
					<xsl:for-each select="genresMusicaux/genreMusical">
						<xsl:if test="position() > 1">;&#160;</xsl:if>
						<xsl:value-of select="."/>
					</xsl:for-each>
				</div>
			</xsl:if>
			<xsl:if test="(type='Personne')">
				<xsl:if test="dateNaissance"><div>Naissance&#160;:&#160;<xsl:value-of select="dateNaissance"/><xsl:if test="lieuNaissance">&#160;&#160;<xsl:value-of select="lieuNaissance"/></xsl:if></div></xsl:if>
				<xsl:if test="dateMort"><div>Mort&#160;:&#160;<xsl:value-of select="dateMort"/><xsl:if test="lieuNaissance">&#160;-&#160;<xsl:value-of select="lieuMort"/></xsl:if></div></xsl:if>
			</xsl:if>
			<xsl:if test="(type!='Personne') and (type!='Nom géographique') and (type!='Concept')">
				<div>Date(s)&#160;:&#160;<xsl:value-of select="dateNaissanceTextuelle"/>&#160;-&#160;<xsl:value-of select="dateMortTextuelle"/></div>
			</xsl:if>
			<xsl:if test="((type='Personne') or (type='Collectivité')) and (activitesPrincipales/activitePrincipale)">
				<div>Activité(s) principale(s)&#160;:&#160;
					<div id="activiteesPrincipales" style="margin-left:0.5em;">
						<xsl:for-each select="activitesPrincipales/activitePrincipale">
							<xsl:if test="position() > 1">; </xsl:if>
							<xsl:value-of select="."/>
						</xsl:for-each>
					</div>
				</div>
			</xsl:if>
			<xsl:if test="notes/note">
				<div id="notes">
					Notes
					<xsl:for-each select="notes/note">
						<div style="margin-left: 0.5em;"><xsl:value-of select="."/></div>
					</xsl:for-each>
				</div>
			</xsl:if>
			<xsl:if test="autresNoms/autreNom">
				<div id="autresNoms">
					Autre(s) nom(s)
					<xsl:for-each select="autresNoms/autreNom">
						<div style="margin-left: 0.5em;"><xsl:value-of select="."/></div>
					</xsl:for-each>
				</div>
			</xsl:if>
			<xsl:if test="employePour">
				<div id="employePour">Employé pour<xsl:value-of select="employePour"/></div>
			</xsl:if>
			<xsl:if test="formesAssociees/formeAssociee">
				<div id="formesAssociees">
					<div style="margin-right: 0.5em; text-decoration: underline;">Nom(s) associé(s) / Nom(s) lié(s)</div>
					<xsl:for-each select="formesAssociees/formeAssociee">
						<div style="margin-left: 0.5em;"><a href="{$rebondUrl}/?simpleSearchCriterias=&#60;search-criterias&#62;&#60;general&#62;{.}&#60;&#47;general&#62;&#60;&#47;search-criterias&#62;"><xsl:value-of select="."/></a></div>
					</xsl:for-each>
				</div>
			</xsl:if>
			<xsl:if test="notesClassement/noteClassement">
				<div id="employePour">Note(s) sur le classement:</div>
					<xsl:for-each select="notesClassement/noteClassement">
						<div style="margin-left: 0.5em;"><xsl:value-of select="."/></div>
					</xsl:for-each>
			</xsl:if>
			<xsl:if test="((type='Personne') or (type='Collectivité')) and isni">
				<div id="isni">ISNI : <xsl:value-of select="isni"/></div>
			</xsl:if>
			<xsl:if test="origines/origine">
				<div id="origines" style="font-size:small; font color: grey;">Origines :
					<xsl:for-each select="origines/origine">
						<xsl:if test="position() > 1">; </xsl:if>
						<div style="margin-left: 0.5em;"><xsl:value-of select="."/></div>
					</xsl:for-each>
				</div>
			</xsl:if>
			<xsl:if test="urlOrigine">
				<div id="urlOrigin"><a href="{urlOrigine}"><xsl:value-of select="urlOrigine"/></a></div>
			</xsl:if>
			<br />
			<div id="noticesMappees">
				<xsl:for-each select="linkingTypesWithNotices/entry">
					<xsl:if test="value and (value>0)">
						<div class="noticeMappee">
							<!--<a href="{$mappedNoticesUrl}{../../id}/notices/{key}?page=1" target="_blank"><xsl:value-of select="value"/> notices liées de type <xsl:value-of select="key"/></a>-->
							<!--<div class="noticeMappee-tab" onload="loadMappedNotices(this, '{key}', {../../id});" />-->
							<div class="key" style="display:none;"><xsl:value-of select="key"/></div>
							<div class="count" style="display:none;"><xsl:value-of select="value"/></div>
							<div class="id" style="display:none;"><xsl:value-of select="../../id"/></div>
							<div class="noticeMappee-tab">EMPTY TAB!!!</div>
						</div>
					</xsl:if>
				</xsl:for-each>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
