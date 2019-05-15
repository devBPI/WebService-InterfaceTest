<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<!-- <xsl:include href="lib/url-encode.xsl"/> -->

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
					<div><xsl:value-of select="."/></div>
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
		<xsl:if test="traductionsDe/traductionDe">
			<div id="traductionsDe">
				Traduction de :
				<xsl:for-each select="traductionsDe/traductionDe">
					<div><xsl:value-of select="."/></div>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="(type='Revue, journal') or (type='Revue numérique') or (type='Article')">
		<xsl:if test="type='Numrev - Article'">
			<div id="dansJournals">
				<xsl:for-each select="journal-infos">
					<div>Dans <xsl:value-of select="titresJournal/titreJournal"/>, n <xsl:value-of select="issues/issue"/>, <xsl:value-of select="volumes/volume"/>, <xsl:value-of select="datesTextuelles/dateTextuelle"/>, pp <xsl:value-of select="premieresPages/premierePage"/> - <xsl:value-of select="dernieresPages/dernierePage"/></div>
				</xsl:for-each>
			</div>
		</xsl:if>
			<div id="titresAnalytic">
				<xsl:for-each select="titresAnalytic/titreAnalytic">
					<div class="titreForm">Dans <xsl:value-of select="."/></div>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:choose>
			<xsl:when test="type='Vidéo'">
				Réalisateur(s) : 
				<div id="realisateurs">
					<xsl:for-each select="realisateurs/realisateur">
						<div style="margin-left: 1em;"><xsl:value-of select="."/></div>
					</xsl:for-each>
				</div>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="auteurs/auteur">
					<div id="auteurs">
						Auteur(s)<xsl:if test="(type='Musique')">, compositeur(s), interprète(s)</xsl:if>
						: 
						<xsl:for-each select="auteurs/auteur">
							<div>
								<a href='{$rebondUrl}/?auteur={value}'>
									<xsl:value-of select="value"/>
									<xsl:if test="complement"> , <xsl:value-of select="complement"/></xsl:if>
								</a>
							</div>
						</xsl:for-each>
					</div>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:if test="(resumes/resume)">
			<div id="resume">
				Résumé  
				<xsl:for-each select="resumes/resume">
					<div style="margin-left: 1em;"><xsl:value-of select="."/></div>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="(contenus/contenu) and (type='Musique')">
			Pistes  
			<div id="contenus">
				<xsl:for-each select="contenus/contenu">
					<div style="margin-left: 1em;"><xsl:value-of select="."/></div>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="auteursSecondaires/auteurSecondaire">
			<div id="auteursSecondaires">
				Autre(s) auteur(s)<xsl:if test="(type='Musique')">, compositeur(s), interprète(s)</xsl:if>
				<xsl:for-each select="auteursSecondaires/auteurSecondaire">
					<div>
						<a href='{$rebondUrl}/?auteur={value}'>
							<xsl:value-of select="value"/>
							<xsl:if test="complement"> , <xsl:value-of select="complement"/></xsl:if>
						</a>
					</div>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="contributeurs/contributeur">
			<div id="contributeurs">
				Contributeur(s) 
				<xsl:if test="type='Vidéo'">
					<xsl:for-each select="auteurs/auteur">
						<div style="margin-left: 1em;">	
							<a href='{$rebondUrl}/?auteur={value}'>
								<xsl:value-of select="./value"/>
								<xsl:if test="complement"> - <xsl:value-of select="complement"/></xsl:if>
							</a>
						</div>
					</xsl:for-each>
				</xsl:if>
				<xsl:for-each select="contributeurs/contributeur">
					<div style="margin-left: 1em;">	
						<a href='{$rebondUrl}/?auteur={value}'>
							<xsl:value-of select="./value"/>
							<xsl:if test="complement"> - <xsl:value-of select="complement"/></xsl:if>
						</a>
					</div>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="editeurs/editeur">
			<div id="editeurs">
				Editeur(s)   
				<xsl:for-each select="editeurs/editeur">
					<div style="margin-left: 1em;">	
						<a href='{$rebondUrl}/?editeur={.}'>
							<xsl:value-of select="."/>
						</a>
					</div>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="datesTextuelles/dateTextuelle">
			<div id="dates">
				Date(s) 
				<xsl:for-each select="datesTextuelles/dateTextuelle">
					<xsl:if test="position() > 1">- </xsl:if>
					<xsl:value-of select="."/>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="autresDates/autreDate">
			<div id="dates">
				 Date d'édition papier 
				<xsl:for-each select="autresDates/autreDate">
					<xsl:if test="position() > 1">. </xsl:if>
					<xsl:value-of select="."/>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="periodicites/periodicite">
			<div id="periodicites">
				Périodicité 
				<xsl:for-each select="periodicites/periodicite">
					<xsl:if test="position() > 1">. </xsl:if>
					<xsl:value-of select="."/>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="titresUniform/titreUniform">
			<div id="oeuvres">
				Oeuvre(s) 
				<xsl:for-each select="titresUniform/titreUniform">
					<div style="margin-left: 1em;"><xsl:value-of select="."/></div>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="titresAlternatifs/titreAlternatif">
			<div id="titresAutresFormes">
				Autre(s) forme(s) de titre  
				<xsl:for-each select="titresAlternatifs/titreAlternatif">
					<div style="margin-left: 1em;"><xsl:value-of select="."/></div>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="(contenus/contenu) and (type!='Musique')">
			Contenu  
			<div id="contenus">
				<xsl:for-each select="contenus/contenu">
					<div style="margin-left: 1em;"><xsl:value-of select="."/></div>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="notes/note">
			Notes  
			<div id="notes">
				<xsl:for-each select="notes/note">
					<div style="margin-left: 1em;"><xsl:value-of select="."/></div>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="(resumes/resume) and (type='Musique')">
			<div id="resume">
				Résumé  
				<xsl:for-each select="resumes/resume">
					<div style="margin-left: 1em;"><xsl:value-of select="."/></div>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="langues/langue">
			<div id="langues">
				Langue(s)
				<xsl:for-each select="langues/langue">
					<xsl:if test="position() > 1">, </xsl:if>
					<xsl:value-of select="."/>
				</xsl:for-each>
				<xsl:if test="(langues) and (languesOriginal)">, </xsl:if>
				<xsl:for-each select="languesOriginales/langueOriginale">
					<xsl:if test="position() > 1">, </xsl:if>
				, traduit de : <xsl:value-of select="."/>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="descriptionsMaterielle/descriptionMaterielle">
			<div id="descriptionsMaterielle">
				Description matérielle 
				<xsl:for-each select="descriptionsMaterielle/descriptionMaterielle">
					<div style="margin-left: 1em;"><xsl:value-of select="."/></div>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="seriesCollection/serieCollection">
			<div id="seriesCollection">
			Série / Collection 
				<xsl:for-each select="seriesCollection/serieCollection">
					<div style="margin-left: 1em;"><xsl:value-of select="."/></div>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="titresEnsemble/titreEnsemble">
			<div id="titresEnsemble">
				Titre(s) d'ensemble 
				<xsl:for-each select="titresEnsemble/titreEnsemble">
					<div style="margin-left: 1em;"><xsl:value-of select="."/></div>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="titresEnRelation/titreEnRelation">
			<div id="titresEnRelation">
				Titre(s) en relation 
				<xsl:for-each select="titresEnRelation/titreEnRelation">
					<div style="margin-left: 1em;"><xsl:value-of select="."/></div>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="reunits/reunit">
			<div id="reunits">
				Réunit  
				<xsl:for-each select="reunits/reunit">
					<div style="margin-left: 1em;"><xsl:value-of select="."/></div>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="autresEditions/autreEdition">
			<div id="autresEditions">
				Autre(s) édition(s)  
				<xsl:for-each select="autresEditions/autreEdition">
					<xsl:if test="position() > 1"> ; </xsl:if>
					<xsl:value-of select="."/>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="conservations/conservation">
			<div id="conservations">
				Conservation 
				<xsl:for-each select="conservations/conservation">
					<xsl:if test="position() > 1"> ; </xsl:if>
					<xsl:value-of select="."/>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="sujets/sujet">
			<div id="sujets">
				Sujet(s) 
				<xsl:for-each select="sujets/sujet">
					<a href='{$rebondUrl}/?sujet={value}'>
						<div style="margin-left: 1em;"><xsl:value-of select="./value"/></div>
						<xsl:if test="complement"> - <xsl:value-of select="complement"/></xsl:if>
					</a>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="epoques/epoque">
			<div id="epoques">
				Epoque
				<xsl:for-each select="epoques/epoque">
					<div style="margin-left: 1em;"><xsl:value-of select="."/></div>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="lieux/lieu">
			<div id="lieux">
				Lieu
				<xsl:for-each select="lieux/lieu">
					<div style="margin-left: 1em;"><xsl:value-of select="."/></div>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="genres/genre">
			<div id="genres">
				Genre
				<xsl:for-each select="genres/genre">
					<div style="margin-left: 1em;"><xsl:value-of select="."/></div>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="themes/theme">
			<div id="themes">
				Thème(s) 
				<xsl:for-each select="themes/theme">
					<div style="margin-left: 1em;"><xsl:value-of select="."/></div>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="isbns/isbn">
			<div id="isbns">
				ISBN
				<xsl:for-each select="isbns/isbn">
					<xsl:if test="position() > 1"> ; </xsl:if>
					<xsl:value-of select="."/>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="issns/issn">
			<div id="issns">
				ISSN
				<xsl:for-each select="issns/issn">
					<xsl:if test="position() > 1"> ; </xsl:if>
					<xsl:value-of select="."/>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="numerosCommerciaux">
			<div id="numerosCommerciaux">
				Numéros commerciaux  
				<xsl:for-each select="numerosCommerciaux/numeroCommercial">
					<xsl:if test="position() > 1"> ; </xsl:if>
					<xsl:value-of select="."/>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="indices/indice">
			<div id="indices">
				Indice
				<xsl:for-each select="indices/indice">
					<div style="margin-left: 1em;">	
						<a href='{$rebondUrl}/?indicecote={.}'>
							<xsl:value-of select="."/>
						</a>
					</div>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="publiques/publique">
			<div id="publiques">
				Public
				<xsl:for-each select="publiques/publique">
					<xsl:if test="position() > 1"> ; </xsl:if>
					<xsl:value-of select="."/>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="(droits-infos/droits/droit) or (droits-infos/licences/licence) or (droits-infos/copyrights/copyright)">
			<div id="droits">
				Droit(s) 
				<xsl:for-each select="droits-infos/droits/droit">
					<xsl:if test="position() > 1"> . </xsl:if>
					<xsl:value-of select="."/>
				</xsl:for-each>
				<xsl:for-each select="droits-infos/licences/licence">
					<xsl:if test="position() > 1"> . </xsl:if>
					<xsl:value-of select="."/>
				</xsl:for-each>
				<xsl:for-each select="droits-infos/copyrights/copyright">
					<xsl:if test="position() > 1"> . </xsl:if>
					<xsl:value-of select="."/>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="lieuxManifestations/lieuManifestation">
			<div id="lieuxManifestations">
				Lieu de la manifestation
				<xsl:for-each select="lieuxManifestations/lieuManifestation">
					<xsl:if test="position() > 1"> ; </xsl:if>
					<xsl:value-of select="."/>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="origines/origine">
			<div id="origines" style="font-size: smaller; color: grey;">
				Origine
				<xsl:for-each select="origines/origine">
					<xsl:if test="position() > 1"> ; </xsl:if>
					<xsl:value-of select="."/>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="nomPubliqueConfiguration">
			<div id="resultatDe">
				Résultat de
				<xsl:if test="(urlPubliqueConfiguration)">
					<a href="{urlPubliqueConfiguration}"><xsl:value-of select="nomPubliqueConfiguration"/></a>
				</xsl:if>
				<xsl:if test="not(urlPubliqueConfiguration)">
					<xsl:value-of select="nomPubliqueConfiguration"/>
				</xsl:if>
			</div>
		</xsl:if>

		<!--<div id="s">
			<xsl:for-each select="s/">
				<div><xsl:value-of select="."/></div>
			</xsl:for-each>
		</div>-->

		<br />

		<xsl:if test="isbns/isbn">
			<div id="quatrieme">
				 Quatrième de couverture  
				<xsl:value-of select="$quatrUrl"/><xsl:value-of select="isbns/isbn"/>
			</div>
			<div id="tableDesMatieres">
				Table des matières 
				<xsl:value-of select="$tabMatUrl"/><xsl:value-of select="isbns/isbn"/>
			</div>
		</xsl:if>

		<xsl:for-each select="exemplaires/exemplaire">
			<hr />
			<div class="exemplaire">
				<xsl:value-of select="disponibilite"/> - 
				<xsl:value-of select="cote"/> - 
				<xsl:for-each select="supports/support">
					<xsl:if test="position()&gt;1"> - </xsl:if>
					<xsl:value-of select="."/>
				</xsl:for-each>
				<div><xsl:for-each select="notes/note">
					<div style="margin-left: 1em;"><xsl:value-of select="."/></div>
				</xsl:for-each></div>
				<div><xsl:value-of select="localisation"/> - <xsl:value-of select="categorie"/></div>
			</div>
		</xsl:for-each>
		<br />
		<xsl:for-each select="seriels/seriel">
			<hr />
			<div class="seriel">
			<xsl:value-of select="disponibilite"/> -
			<xsl:value-of select="cote"/> -
				<xsl:for-each select="supports/support">
					<xsl:if test="position()&gt;1"> - </xsl:if>
					<xsl:value-of select="."/>
				</xsl:for-each>
				<div><xsl:value-of select="localisation"/> <xsl:value-of select="categorie"/></div>
				Dernier numéro reçu :
				<div><xsl:value-of select="description"/></div>
			</div>
		</xsl:for-each>
		<br />
		<xsl:for-each select="liens/lien">
			<hr />
			<div class="lien">
				<div><a href="{url}"><xsl:value-of select="url"/></a></div>
				<div><xsl:value-of select="cote"/></div>
				<div><xsl:value-of select="localisation"/> <xsl:value-of select="categorie"/></div>
			</div>
		</xsl:for-each>
	</xsl:template>

</xsl:stylesheet>
