<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template name="noticesShortTop">
		<xsl:if test="./isbn">
			<div style="float:left; margin-left: 4px; margin-right: 4px;" >
				<img class="couverture lazy" src="{$imgUrl}{./isbn}"/>
			</div>
		</xsl:if>
		<div>
			<div class="pageButton" style="float:left; margin-right: 4px;"><xsl:value-of select="./row"/></div>
			<div class="" style="display: inline-block; float:right; margin-right: 4px; text-align: right;">
				<xsl:value-of select="./type"/><br />
				<xsl:if test="(./type='Vidéo') and ./formats/format">
					<xsl:for-each select="./formats/format">
						<div class="format"><xsl:value-of select="."/></div>
					</xsl:for-each>
				</xsl:if>

				<xsl:if test="(./type!='Musique' and ./type!='Docelec' and ./type!='Site et base') and ./resumes">
					<span title="Résumé : {./resumes}"><img src="/img/Gnome-dialog-question.svg" style="width: 24px; height: 24px; cursor: help;" /></span>
				</xsl:if>
				<xsl:if test="(./type='Musique' or ./type='Docelec' or ./type='Site et base') and ./contenus">
					<span title="Contenu : {./contenus}"><img src="/img/Gnome-dialog-question.svg" style="width: 24px; height: 24px; cursor: help;" /></span>
				</xsl:if>
			</div>
			<div class="titres">
				<xsl:for-each select="./titres/titre">
					<xsl:if test="position() > 1"> ; </xsl:if>
					<xsl:value-of select="."/>
				</xsl:for-each>
				<div class="analytiques">
					<xsl:for-each select="./titresAnalytiques/titreAnalytique">
						<div>Dans <xsl:value-of select="."/></div>
					</xsl:for-each>
				</div>
			</div>
			<xsl:if test="(./auteurs/auteur) or (./realisateurs/realisateur)">
				<div class="auteurs">
				par 
					<xsl:for-each select="./auteurs/auteur">
						<xsl:if test="position() > 1">; </xsl:if>
						<xsl:value-of select="."/>	
					</xsl:for-each>
					<xsl:if test="auteursSecondaires/auteurSecondaire">
						<xsl:for-each select="auteursSecondaires/auteurSecondaire">
							<xsl:if test="position() > 1"> ; </xsl:if>
							<xsl:value-of select="."/>	
						</xsl:for-each>
					</xsl:if>
					<xsl:if test="./realisateurs/realisateur">
						<xsl:for-each select="./realisateurs/realisateur">
							<xsl:if test="position() > 1"> ; </xsl:if>
							<xsl:value-of select="."/>	
						</xsl:for-each>
					</xsl:if>
				</div>
			</xsl:if>
			<div class="editeurs">
				<xsl:for-each select="./editeurs/editeur">
					<xsl:if test="position() > 1"> ; </xsl:if>
					<xsl:value-of select="."/>	
				</xsl:for-each>
			</div>
			<div class="dates">
				<xsl:for-each select="./datesTextuelles/dateTextuelle">
					<div><xsl:value-of select="."/></div>
				</xsl:for-each>
			</div>
		</div>
	</xsl:template>

	<xsl:template name="noticesShortBottom">
		<div class="permalinks">
			<xsl:for-each select="./permalink">
				<div><a href="/notice/{.}"><xsl:value-of select="."/></a></div>
			</xsl:for-each>
		</div>
		<xsl:if test="(./configurationName) and (./configurationId!=1)">
			<div class="configurationOrigin">
				<div>Resultat de <xsl:value-of select="./configurationName"/>
					<xsl:if test="(./configurationPublicUrl)">
						<a href="{./configurationPublicUrl}"><xsl:value-of select="./configurationPublicUrl"/></a>
					</xsl:if>
				</div>
			</div>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
