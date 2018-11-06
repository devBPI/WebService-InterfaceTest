<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<div id="types"><xsl:value-of select="type"/></div>
		<div id="collection_id"><xsl:value-of select="resultatDe"/></div>
		<div id="titres">
			<xsl:for-each select="notice/titres/titre">
				<div>Titre: <xsl:value-of select="."/></div>
			</xsl:for-each>
		</div>
		<div id="titresForm">
			<xsl:for-each select="notice/titresForm/titreForm">
				<div class="titreForm"><xsl:value-of select="."/></div>
			</xsl:for-each>
		</div>
		<xsl:if test="./type='Numrev - Article'">
			<div id="dansJournals">
				<xsl:for-each select="notice/dansJournals/dansJournal">
					<div>dans <xsl:value-of select="."/></div>
				</xsl:for-each>
			</div>
		</xsl:if>
		<div id="traductionsDe">
			<xsl:for-each select="notice/traductionDes/traductionsDe">
				<div><xsl:value-of select="."/></div>
			</xsl:for-each>
		</div>
		<div id="titresAnalytic">
			<xsl:for-each select="notice/titresAnalytic/titreAnalytic">
				<div class="titreForm"><xsl:value-of select="."/></div>
			</xsl:for-each>
		</div>
		<xsl:choose>
			<xsl:when test="./type='Vidéo'">
				<div id="realisateurs">
					<xsl:for-each select="notice/realisateurs/realisateur">
						<div>Par <xsl:value-of select="."/></div>
					</xsl:for-each>
				</div>
			</xsl:when>
			<xsl:otherwise>
				<div id="auteurs">
					Auteurs
					<xsl:for-each select="notice/auteurs/auteur">
						<xsl:if test="position() >1">,</xsl:if>
						<xsl:value-of select="."/>
					</xsl:for-each>
				</div>
			</xsl:otherwise>
		</xsl:choose>
		<div id="contributeurs">
			<xsl:for-each select="notice/contributeurs/contributeur">
				<div><xsl:value-of select="."/></div>
			</xsl:for-each>
		</div>
		<div id="editeurs">
			<xsl:for-each select="notice/editeurs/editeur">
				<div><xsl:value-of select="."/></div>
			</xsl:for-each>
		</div>
		<div id="datesPublication">
			<!--TODO
			<xsl:for-each select="notice/s/">
				<div><xsl:value-of select="."/></div>
			</xsl:for-each>-->
		</div>
		<div id="resume">
			<xsl:for-each select="notice/resumes/resume">
				<div><xsl:value-of select="."/></div>
			</xsl:for-each>
		</div>
		<div id="pistes">
			<xsl:for-each select="notice/pistes/piste">
				<div><xsl:value-of select="."/></div>
			</xsl:for-each>
		</div>
		<div id="periodicites">
			<xsl:for-each select="notice/periodicites/periodicite">
				<div><xsl:value-of select="."/></div>
			</xsl:for-each>
		</div>
		<div id="oeuvres">
			<xsl:for-each select="notice/titresUniform/titreUniform">
				<div><xsl:value-of select="."/></div>
			</xsl:for-each>
		</div>
		<div id="titresAutresFormes">
			<xsl:for-each select="notice/titresAlternatifs/titreAlternatif">
				<div><xsl:value-of select="."/></div>
			</xsl:for-each>
		</div>
		<div id="contenus">
			<xsl:for-each select="notice/contenus/contenu">
				<div><xsl:value-of select="."/></div>
			</xsl:for-each>
		</div>
		<div id="langues">
			<xsl:for-each select="notice/langues/langue">
				<div><xsl:value-of select="."/></div>
			</xsl:for-each>
		</div>
		<div id="languesOriginal">
			<xsl:for-each select="notice/languesOriginal/langueOriginale">
				<div><xsl:value-of select="."/></div>
			</xsl:for-each>
		</div>
		<div id="descriptionsMaterielle">
			<xsl:for-each select="notice/descriptionsMaterielle/descriptionMaterielle">
				<div><xsl:value-of select="."/></div>
			</xsl:for-each>
		</div>
		<div id="seriesCollection">
			<xsl:for-each select="notice/seriesCollection/serieCollection">
				<div><xsl:value-of select="."/></div>
			</xsl:for-each>
		</div>
		<div id="titresEnsemble">
			<xsl:for-each select="notice/titresEnsembles/titreEnsemble">
				<div><xsl:value-of select="."/></div>
			</xsl:for-each>
		</div>
		<div id="reunits">
			<xsl:for-each select="notice/reunits/reunit">
				<div><xsl:value-of select="."/></div>
			</xsl:for-each>
		</div>
		<div id="autresEditions">
			<xsl:for-each select="notice/autresEditions/autreEdition">
				<div><xsl:value-of select="."/></div>
			</xsl:for-each>
		</div>
		<div id="conservations">
			<xsl:for-each select="notice/conservations/conservation">
				<div><xsl:value-of select="."/></div>
			</xsl:for-each>
		</div>
		<div id="sujets">
			<xsl:for-each select="notice/sujets/sujet">
				<div><xsl:value-of select="."/></div>
			</xsl:for-each>
		</div>
		<div id="epoques">
			<xsl:for-each select="notice/epoques/epoque">
				<div><xsl:value-of select="."/></div>
			</xsl:for-each>
		</div>
		<div id="lieux">
			<xsl:for-each select="notice/lieux/lieu">
				<div><xsl:value-of select="."/></div>
			</xsl:for-each>
		</div>
		<div id="genres">
			<xsl:for-each select="notice/genres/genre">
				<div><xsl:value-of select="."/></div>
			</xsl:for-each>
		</div>
		<div id="themes">
			<xsl:for-each select="notice/themes/theme">
				<div><xsl:value-of select="."/></div>
			</xsl:for-each>
		</div>
		<div id="isbns">
			<xsl:for-each select="notice/isbns/isbn">
				<div><xsl:value-of select="."/></div>
			</xsl:for-each>
		</div>
		<div id="issns">
			<xsl:for-each select="notice/issns/issn">
				<div><xsl:value-of select="."/></div>
			</xsl:for-each>
		</div>
		<div id="numerosCommerciaux">
			<xsl:for-each select="notice/numerosCommerciaux/numeroCommercial">
				<div><xsl:value-of select="."/></div>
			</xsl:for-each>
		</div>
		<div id="indices">
			<xsl:for-each select="notice/indices/indice">
				<div><xsl:value-of select="."/></div>
			</xsl:for-each>
		</div>
		<div id="publiques">
			<xsl:for-each select="notice/publiques/publique">
				<div><xsl:value-of select="."/></div>
			</xsl:for-each>
		</div>
		<div id="droits">
			<xsl:for-each select="notice/droits/droit">
				<div><xsl:value-of select="."/></div>
			</xsl:for-each>
		</div>
		<div id="origines">
			<xsl:for-each select="notice/origines/origine">
				<div><xsl:value-of select="."/></div>
			</xsl:for-each>
		</div>

		<!--<div id="s">
			<xsl:for-each select="notice/s/">
				<div><xsl:value-of select="."/></div>
			</xsl:for-each>
		</div>-->
	</xsl:template>

</xsl:stylesheet>
