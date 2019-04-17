<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/authority">
		<div class="authority" style="margin-left: 2px;">
			<br />
			<div><span style="margin-right: 4px; text-decoration: underline;">Type d'autorité :</span><xsl:value-of select="type"/></div>
			<div><span style="margin-right: 4px; text-decoration: underline;"></span><xsl:value-of select="formeRetenue"/></div>
			<xsl:if test="formesParalleles/formeParallele">
				<div id="formesParalelles" style="font-style: italic; font-size: small;">
					<xsl:for-each select="formesParalleles/formeParallele">
						<div><xsl:value-of select="."/></div>
					</xsl:for-each>
				</div>
			</xsl:if>
			<xsl:if test="pays/pays">
				<div id="pays">
					Pays
					<xsl:for-each select="pays/pays">
					<xsl:if test="position() > 1">; </xsl:if>
					<xsl:value-of select="."/>
					</xsl:for-each>
				</div>
			</xsl:if>
			<xsl:if test="langues/langue">
				<div id="langues">
					Langue(s)
					<xsl:for-each select="langues/langue">
						<xsl:if test="position() > 1">; </xsl:if>
						<xsl:value-of select="."/>
					</xsl:for-each>
				</div>
			</xsl:if>

			<xsl:if test="genresMusicaux/genreMusical">
				<div id="genresMusicaux">
					Genre musical
					<xsl:for-each select="genresMusicaux/genreMusical">
						<xsl:if test="position() > 1">; </xsl:if>
						<xsl:value-of select="."/>
					</xsl:for-each>
				</div>
			</xsl:if>
			<xsl:if test="(type='Personne') or (type='Collectivité')">
				<div>Naissance (<xsl:value-of select="dateNaissance"/> - <xsl:value-of select="lieuNaissance"/>)</div>
				<div>Mort (<xsl:value-of select="dateMort"/> - <xsl:value-of select="lieuMort"/>)</div>
			</xsl:if>
			<xsl:if test="(type!='Personne') and (type!='Collectivité')">
				<div>Date(s) (<xsl:value-of select="dateNaissance"/> - <xsl:value-of select="dateMort"/>)</div>
			</xsl:if>
			<xsl:if test="(type='Personne') or (type='Collectivité') and (activitesPrincipales/activitePrincipale)">
				<div>Activité(s) principale(s)</div>
				<div id="activiteesPrincipales">
					<xsl:for-each select="activitesPrincipales/activitePrincipale">
						<xsl:if test="position() > 1">; </xsl:if>
						<xsl:value-of select="."/>
					</xsl:for-each>
				</div>
			</xsl:if>
			<xsl:if test="notes/note">
				<div id="notes">
				Notes
					<xsl:for-each select="notes/note">
						<div style="margin-left: 4px;"><xsl:value-of select="."/></div>
					</xsl:for-each>
				</div>
			</xsl:if>
			<xsl:if test="autresNoms/autreNom">
				<div id="autresNoms">
					Autre(s) nom(s):
					<xsl:for-each select="autresNoms/autreNom">
						<div style="margin-left: 4px;"><xsl:value-of select="."/></div>
					</xsl:for-each>
				</div>
			</xsl:if>
			<xsl:if test="employePour">
				<div id="employePour">Employé pour<xsl:value-of select="employePour"/></div>
			</xsl:if>
			<xsl:if test="formesAssociees/formeAssociee">
				<div id="formesAssociees">
					<div style="margin-right: 4px; text-decoration: underline;">Nom(s) associé(s) / Nom(s) lié(s):</div>
					<xsl:for-each select="formesAssociees/formeAssociee">
						<div style="margin-left: 4px;"><xsl:value-of select="."/></div>
					</xsl:for-each>
				</div>
			</xsl:if>
			<xsl:if test="notesClassement/noteClassement">
				<div id="employePour">Note(s) sur le classement:</div>
					<xsl:for-each select="notesClassement/noteClassement">
						<div style="margin-left: 4px;"><xsl:value-of select="."/></div>
					</xsl:for-each>
			</xsl:if>
			<xsl:if test="((type='Personne') or (type='Collectivité')) and 'isni'">
				<div id="isni">ISNI<xsl:value-of select="isni"/></div>
			</xsl:if>
			<xsl:if test="origines/origine">
				<div id="origines" style="font-size:small; font color: grey;">Origines :</div>
					<xsl:for-each select="origines/origine">
						<div style="margin-left: 4px;"><xsl:value-of select="."/></div>
					</xsl:for-each>
			</xsl:if>
			<div id="urlOrigin"><a href="{urlOrigine}"><xsl:value-of select="urlOrigine"/></a></div>

			<br />
			<xsl:for-each select="linkingTypesWithNotices/entry">
				<div class="noticeMappee">
					<a href="{$mappedNoticesUrl}{../../id}/notices/{key}?page=1">
						<xsl:value-of select="value"/> notices liées de type <xsl:value-of select="key"/>
					</a>
				</div>
			</xsl:for-each>
		</div>
	</xsl:template>
</xsl:stylesheet>
