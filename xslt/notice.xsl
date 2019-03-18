<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/notice">
		<div style="font-weight: bold;" id="collection_id">configuration_id : <xsl:value-of select="resultatDe"/></div>
		<div style="font-weight: bold;" id="source_id">source_id : <xsl:value-of select="sourceId"/></div>
		<br />
		<xsl:if test="isbns/isbn">
			<div id="couverture">
				<img class="couverture" src="{$couvUrl}{isbns/isbn}"/>
			</div>
		</xsl:if>
		<xsl:if test="type">
			<div id="types">Type : <xsl:value-of select="type"/></div>
		</xsl:if>
		<!--<xsl:if test="./isbn">
			<img class="couverture" style="float:left; margin-left: 4px; margin-right: 4px;" src="{$imgUrl}{./isbn}"/>
		</xsl:if>-->
		<xsl:if test="titres/titre">
			<div id="titres">
				<xsl:for-each select="titres/titre">
					<div>Titre: <xsl:value-of select="."/></div>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="titresForm/titreForm">
			<div id="titresForm">
				<xsl:for-each select="titresForm/titreForm">
					<div style="font-style: italic; font-size: small;" class="titreForm"><xsl:value-of select="."/></div>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="type='Numrev - Article'">
			<div id="dansJournals">
				<xsl:for-each select="journal-infos">
					<div>dans <xsl:value-of select="titresJournal/titreJournal"/>, n <xsl:value-of select="issues/issue"/>, <xsl:value-of select="volumes/volume"/>, <xsl:value-of select="datesTextuelles/dateTextuelle"/>, pp <xsl:value-of select="premieresPages/premierePage"/> - <xsl:value-of select="dernieresPages/dernierePage"/></div>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="traductionsDe/traductionDe">
			<div id="traductionsDe">
				<xsl:for-each select="traductionsDe/traductionDe">
					<div>Traduction de <xsl:value-of select="."/></div>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="(type='Revue, journal') or (type='Revue numérique') or (type='Article')">
			<div id="titresAnalytic">
				<xsl:for-each select="titresAnalytic/titreAnalytic">
					<div class="titreForm">Dans <xsl:value-of select="."/></div>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:choose>
			<xsl:when test="type='Vidéo'">
				Realisateur(s) : 
				<div id="realisateurs">
					<xsl:for-each select="realisateurs/realisateur">
						<div style="margin-left: 1em;"><xsl:value-of select="."/></div>
					</xsl:for-each>
				</div>
			</xsl:when>
			<xsl:otherwise>
				<div id="auteurs">
					Auteur(s)
					<xsl:if test="(type='Musique')">
						, Compositeur(s), Interprète(s)
					</xsl:if>
					: 
					<xsl:for-each select="auteurs/auteur">
						<xsl:if test="position() > 1">, </xsl:if>
						<xsl:value-of select="./value"/>
						<xsl:if test="complement"> - <xsl:value-of select="complement"/></xsl:if>
					</xsl:for-each>
				</div>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:if test="auteursSecondaires/auteurSecondaire">
			<div id="auteursSecondaires">
				Autre(s) auteur(s)
				<xsl:if test="(type='Musique')">
					, Compositeur(s), Interprète(s)
				</xsl:if>
				: 
				<xsl:for-each select="auteursSecondaires/auteurSecondaire">
					<xsl:if test="position() > 1">, </xsl:if>
					<xsl:value-of select="./value"/>
					<xsl:if test="complement"> - <xsl:value-of select="complement"/></xsl:if>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="contributeurs/contributeur">
			<div id="contributeurs">
				Contributeur(s) : 
				<xsl:if test="type='Vidéo'">
					<xsl:for-each select="auteurs/auteur">
						<div style="margin-left: 1em;"><xsl:value-of select="./value"/></div>
						<xsl:if test="complement"> - <xsl:value-of select="complement"/></xsl:if>
					</xsl:for-each>
				</xsl:if>
				<xsl:for-each select="contributeurs/contributeur">
					<div style="margin-left: 1em;"><xsl:value-of select="./value"/></div>
					<xsl:if test="complement"> - <xsl:value-of select="complement"/></xsl:if>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="editeurs/editeur">
			<div id="editeurs">
				Editeur(s) : 
				<xsl:for-each select="editeurs/editeur">
					<div style="margin-left: 1em;"><xsl:value-of select="."/></div>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="datesTextuelles/dateTextuelle">
			<div id="dates">
				Date(s) :
				<xsl:for-each select="datesTextuelles/dateTextuelle">
					<div style="margin-left: 1em;"><xsl:value-of select="."/></div>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="(type='Revue')">
			<div id="periodicites">
				<xsl:for-each select="periodicites/periodicite">
					<div>Périodicité : <xsl:value-of select="."/></div>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="titresUniform/titreUniforme">
			<div id="oeuvres">
				<xsl:for-each select="titresUniform/titreUniform">
					<div>Oeuvre : <xsl:value-of select="."/></div>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="titresAlternatifs/titreAlternatif">
			<div id="titresAutresFormes">
				Autre(s) forme(s) de titre : 
				<xsl:for-each select="titresAlternatifs/titreAlternatif">
					<div style="margin-left: 1em;"><xsl:value-of select="."/></div>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="(type!='Musique') and (resumes/resume)">
			<div id="resume">
				Résumé : 
				<xsl:for-each select="resumes/resume">
					<div style="margin-left: 1em;"><xsl:value-of select="."/></div>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="contenus/contenu">
			<xsl:if test="(type='Musique')">
				Pistes : 
			</xsl:if>
			<xsl:if test="(type!='Musique')">
				Contenu : 
			</xsl:if>
			<div id="contenus">
				<xsl:for-each select="contenus/contenu">
					<div style="margin-left: 1em;"><xsl:value-of select="."/></div>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="notes/note">
			Notes : 
			<div id="notes">
				<xsl:for-each select="notes/note">
					<div style="margin-left: 1em;"><xsl:value-of select="."/></div>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="langues/langue">
			<div id="langues">
				Langue(s) :
				<xsl:for-each select="langues/langue">
					<xsl:if test="position() > 1">, </xsl:if>
					<xsl:value-of select="."/>
				</xsl:for-each>
				<xsl:if test="(langues) and (languesOriginal)">, </xsl:if>
				<xsl:for-each select="languesOriginales/langueOriginale">
					<xsl:if test="position() > 1">, </xsl:if>
					Traduit de <xsl:value-of select="."/>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="descriptionsMaterielle/descriptionMaterielle">
			<div id="descriptionsMaterielle">
				<xsl:for-each select="descriptionsMaterielle/descriptionMaterielle">
					<div>Description matérielle : <xsl:value-of select="."/></div>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="seriesCollection/serieCollection">
			<div id="seriesCollection">
				<xsl:for-each select="seriesCollection/serieCollection">
					<div>Série / Collection : <xsl:value-of select="./value"/></div>
					<xsl:if test="complement"> - <xsl:value-of select="complement"/></xsl:if>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="titresEnsemble/titreEnsemble">
			<div id="titresEnsemble">
				Titre(s) d'ensemble: 
				<xsl:for-each select="titresEnsemble/titreEnsemble">
					<xsl:if test="position() > 1">, </xsl:if>
					<xsl:value-of select="."/>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="titresEnRelation/titreEnRelation">
			<div id="titresEnRelation">
				Titre(s) en relation: 
				<xsl:for-each select="titresEnRelation/titreEnRelation">
					<xsl:if test="position() > 1">, </xsl:if>
					<xsl:value-of select="."/>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="reunits/reunit">
			<div id="reunits">
				Reunit : 
				<xsl:for-each select="reunits/reunit">
					<xsl:if test="position() > 1">, </xsl:if>
					<xsl:value-of select="."/>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="autresEditions">
			<div id="autresEditions">
				Autre(s) éditions : 
				<xsl:for-each select="autresEditions/autreEdition">
					<xsl:if test="position() > 1">, </xsl:if>
					<xsl:value-of select="."/>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="conservations/conservation">
			<div id="conservations">
				<xsl:for-each select="conservations/conservation">
					<div>Conservation : <xsl:value-of select="."/></div>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="sujets/sujet">
			<div id="sujets">
				Sujet(s) :
				<xsl:for-each select="sujets/sujet">
					<div style="margin-left: 1em;"><xsl:value-of select="./value"/></div>
					<xsl:if test="complement"> - <xsl:value-of select="complement"/></xsl:if>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="epoques/epoque">
			<div id="epoques">
				<xsl:for-each select="epoques/epoque">
					<div>Epoque : <xsl:value-of select="."/></div>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="lieux/lieu">
			<div id="lieux">
				<xsl:for-each select="lieux/lieu">
					<div>Lieu : <xsl:value-of select="."/></div>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="genres/genre">
			<div id="genres">
				<xsl:for-each select="genres/genre">
					<div>Genre : <xsl:value-of select="."/></div>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="themes/theme">
			<div id="themes">
				Thème(s) :
				<xsl:for-each select="themes/theme">
					<div style="margin-left: 1em;"><xsl:value-of select="."/></div>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="isbns/isbn">
			<div id="isbns">
				<xsl:for-each select="isbns/isbn">
					<div>ISBN : <xsl:value-of select="."/></div>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="issns/issn">
			<div id="issns">
				<xsl:for-each select="issns/issn">
					<div>ISSN : <xsl:value-of select="."/></div>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="numerosCommerciaux">
			<div id="numerosCommerciaux">
				Numéros commerciaux : 
				<xsl:for-each select="numerosCommerciaux/numeroCommercial">
					<div style="margin-left: 1em;"><xsl:value-of select="."/></div>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="indices/indice">
			<div id="indices">
				<xsl:for-each select="indices/indice">
					<div>Indice : <xsl:value-of select="."/></div>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="publiques/publique">
			<div id="publiques">
				<xsl:for-each select="publiques/publique">
					<div>Public : <xsl:value-of select="."/></div>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="droits-infos/droits/droit">
			<div id="droits">
				Droit(s) :
				<xsl:for-each select="droits-infos/droits/droit">
					<div style="margin-left: 1em;"><xsl:value-of select="."/></div>
				</xsl:for-each>
				<xsl:for-each select="droits-infos/licences/licence">
					<div style="margin-left: 1em;"><xsl:value-of select="."/></div>
				</xsl:for-each>
				<xsl:for-each select="droits-infos/copyrights/copyright">
					<div style="margin-left: 1em;"><xsl:value-of select="."/></div>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="lieuxManifestations/lieuManifestation">
			<div id="lieuxManifestations">
				<xsl:for-each select="lieuxManifestations/lieuManifestation">
					<div>Lieu de la manifestation : <xsl:value-of select="."/></div>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="origines/origine">
			<div id="origines">
				<xsl:for-each select="origines/origine">
					<div style="font-size: smaller; color: grey;">Origine : <xsl:value-of select="."/></div>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="urlPubliqueConfiguration">
			<div id="urlPubliqueConfiguration" >Public Url de configuration : <a href="{urlPubliqueConfiguration}"><xsl:value-of select="urlPubliqueConfiguration"/></a></div>
		</xsl:if>

		<!--<div id="s">
			<xsl:for-each select="s/">
				<div><xsl:value-of select="."/></div>
			</xsl:for-each>
		</div>-->

		<br />

		<xsl:if test="isbns/isbn">
			<div id="quatrieme">
				<xsl:value-of select="$quatrUrl"/><xsl:value-of select="isbns/isbn"/>
			</div>
			<div id="tableDesMatieres">
				<xsl:value-of select="$tabMatUrl"/><xsl:value-of select="isbns/isbn"/>
			</div>
		</xsl:if>

		<xsl:for-each select="exemplaires/exemplaire">
			<div class="exemplaire">
				Disponibilité, Cote, Support :
				<div style="margin-left: 1em;"><xsl:value-of select="disponibilite"/></div>
				<div style="margin-left: 1em;"><xsl:value-of select="cote"/></div>
				<xsl:for-each select="supports/support">
					<div style="margin-left: 1em;"><xsl:value-of select="."/></div>
				</xsl:for-each>
				<div><xsl:value-of select="localisation"/> <xsl:value-of select="categorie"/></div>
			</div>
		</xsl:for-each>
		<br />
		<xsl:for-each select="seriels/seriel">
			<div class="seriel">
				Disponibilité, Cote, Support :
				<div style="margin-left: 1em;"><xsl:value-of select="disponibilite"/></div>
				<div style="margin-left: 1em;"><xsl:value-of select="cote"/></div>
				<xsl:for-each select="supports/support">
					<div style="margin-left: 1em;"><xsl:value-of select="."/></div>
				</xsl:for-each>
				<div><xsl:value-of select="localisation"/> <xsl:value-of select="categorie"/></div>
				<div><xsl:value-of select="description"/></div>
			</div>
		</xsl:for-each>
		<br />
		<xsl:for-each select="liens/lien">
			<div class="lien">
				<div><a href="{url}"><xsl:value-of select="url"/></a></div>
				<div><xsl:value-of select="cote"/></div>
				<div><xsl:value-of select="localisation"/> <xsl:value-of select="categorie"/></div>
			</div>
		</xsl:for-each>
	</xsl:template>

</xsl:stylesheet>
