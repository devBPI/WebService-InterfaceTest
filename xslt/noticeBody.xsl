<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<!-- <xsl:include href="lib/url-encode.xsl"/> -->

	<xsl:template match="/notice|/notice-themed/notice">
		<div style="font-weight: bold;" id="collection_id">configuration_id : <xsl:value-of select="resultatDe"/></div>
		<div style="font-weight: bold;" id="source_id">source_id : <xsl:value-of select="sourceId"/></div>
		<br />
		<xsl:if test="isbns/isbn">
			<div id="couverture">
				<img class="couverture lazy" src="{$couvUrl}{isbns/isbn}"/>
			</div>
		</xsl:if>
		<xsl:if test="type">
			<div id="types">Type&#160;:&#160;<xsl:value-of select="type"/></div>
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
					<div>
						<a href='{$rebondUrl}/?titre={value}'><xsl:value-of select="."/></a>
					</div>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="(type='Revue, journal') or (type='Revue numérique') or (type='Article')">
		<xsl:if test="type='Numrev - Article'">
			<div id="dansJournals">
				<xsl:for-each select="journal-infos">
					<div>Dans <xsl:value-of select="titresJournal/titreJournal"/>,&#160;n&#160;<xsl:value-of select="issues/issue"/>,&#160;<xsl:value-of select="volumes/volume"/>,&#160;<xsl:value-of select="datesTextuelles/dateTextuelle"/>,&#160;pp&#160;<xsl:value-of select="premieresPages/premierePage"/>&#160;-&#160;<xsl:value-of select="dernieresPages/dernierePage"/></div>
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
						<div style="margin-left: 1em;">
							<a href='{$rebondUrl}/?auteur={value}'><xsl:value-of select="."/></a>
						</div>
					</xsl:for-each>
				</div>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="auteurs/auteur">
					<div id="auteurs">
						Auteur(s)<xsl:if test="(type='Musique')">, compositeur(s), interprète(s)</xsl:if>&#160;:&#160; 
						<xsl:for-each select="auteurs/auteur">
							<div>
								<a href='{$rebondUrl}/?auteur={value}'>
									<xsl:value-of select="value"/>
									<xsl:if test="complement">&#160;,&#160;<xsl:value-of select="complement"/></xsl:if>
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
							<xsl:if test="complement">&#160;,&#160;<xsl:value-of select="complement"/></xsl:if>
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
								<xsl:if test="complement">&#160;-&#160;<xsl:value-of select="complement"/></xsl:if>
							</a>
						</div>
					</xsl:for-each>
				</xsl:if>
				<xsl:for-each select="contributeurs/contributeur">
					<div style="margin-left: 1em;">	
						<a href='{$rebondUrl}/?auteur={value}'>
							<xsl:value-of select="./value"/>
							<xsl:if test="complement">&#160;-&#160;<xsl:value-of select="complement"/></xsl:if>
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
		<xsl:if test="(datesPublication/datePublication)">
			<div id="dates">
				Date(s)&#160;
				<xsl:if test="(datesPublication/datePublication)">
					<xsl:for-each select="datesPublication/datePublication">
						<xsl:if test="position() > 1">&#160;;&#160;</xsl:if>
						<xsl:value-of select="."/>
					</xsl:for-each>
				</xsl:if>
				<xsl:if test="(type='Revue, journal') and (anneeMaximaleSeriel)">
					&#160;-&#160;<xsl:value-of select="anneeMaximaleSeriel"/>
				</xsl:if>
			</div>
		</xsl:if>
		<xsl:if test="not(datesPublication/datePublication) and (datesTextuelles/dateTextuelle)">
			<div id="dates">
				Date(s)&#160;
				<xsl:for-each select="datesTextuelles/dateTextuelle">
					<xsl:if test="position() > 1"> ; </xsl:if>
					<xsl:value-of select="."/>
				</xsl:for-each>
				<xsl:if test="(type='Revue, journal') and (anneeMaximaleSeriel)">
					&#160;-&#160;<xsl:value-of select="anneeMaximaleSeriel"/>
				</xsl:if>
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
					<div style="margin-left: 1em;">
						<a href='{$rebondUrl}/?titre={.}'><xsl:value-of select="."/></a>
					</div>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="titresAlternatifs/titreAlternatif">
			<div id="titresAutresFormes">
				Autre(s) forme(s) de titre  
				<xsl:for-each select="titresAlternatifs/titreAlternatif">
					<div style="margin-left: 1em;">
						<a href='{$rebondUrl}/?titre={.}'><xsl:value-of select="."/></a>
					</div>
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
				, traduit de :
				<xsl:for-each select="languesOriginales/langueOriginale">
					<xsl:if test="position() > 1">, </xsl:if>
				<xsl:value-of select="."/>
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
					<div style="margin-left: 1em;">
						<a href='{$rebondUrl}/?titre={.}'><xsl:value-of select="."/></a>
					</div>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="titresEnRelation/titreEnRelation">
			<div id="titresEnRelation">
				Titre(s) en relation 
				<xsl:for-each select="titresEnRelation/titreEnRelation">
					<div style="margin-left: 1em;">
						<a href='{$rebondUrl}/?titre={.}'><xsl:value-of select="."/></a>
					</div>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="reunits/reunit">
			<div id="reunits">
				Réunit  
				<xsl:for-each select="reunits/reunit">
					<div style="margin-left: 1em;">
						<a href='{$rebondUrl}/?titre={.}'><xsl:value-of select="."/></a>
					</div>
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
					<div style="margin-left: 1em;">
						<a href='{$rebondUrl}/?sujet={value}'>
							<xsl:value-of select="./value"/><xsl:if test="complement"> - <xsl:value-of select="complement"/></xsl:if>
						</a>
					</div>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="epoques/epoque">
			<div id="epoques">
				Epoque
				<xsl:for-each select="epoques/epoque">
					<div style="margin-left: 1em;">
						<a href='{$rebondUrl}/?sujet={.}'><xsl:value-of select="."/></a>
					</div>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="lieux/lieu">
			<div id="lieux">
				Lieu
				<xsl:for-each select="lieux/lieu">
					<div style="margin-left: 1em;">
						<a href='{$rebondUrl}/?sujet={.}'><xsl:value-of select="."/></a>
					</div>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="genres/genre">
			<div id="genres">
				Genre
				<xsl:for-each select="genres/genre">
					<div style="margin-left: 1em;">
						<a href='{$rebondUrl}/?sujet={.}'><xsl:value-of select="."/></a>
					</div>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="themes/theme">
			<div id="themes">
				Thème(s) 
				<xsl:for-each select="themes/theme">
					<div style="margin-left: 1em;">
						<a href='{$rebondUrl}/?sujet={.}'><xsl:value-of select="."/></a>
					</div>
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
						<a href='{$rebondUrl}/?indicecote={cote}'><xsl:value-of select="cote"/>&#160;<xsl:value-of select="libelle"/></a>
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
					<xsl:if test="position() > 1">. </xsl:if>
					<xsl:value-of select="."/>
				</xsl:for-each>
				<xsl:for-each select="droits-infos/licences/licence">
					<xsl:if test="position() > 1">. </xsl:if>
					<xsl:value-of select="."/>
				</xsl:for-each>
				<xsl:for-each select="droits-infos/copyrights/copyright">
					<xsl:if test="position() > 1">. </xsl:if>
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

		<br />
		<!--<xsl:if test="isbns/isbn">
			<div id="quatrieme">
				 Quatrième de couverture  
				<xsl:value-of select="$quatrUrl"/><xsl:value-of select="isbns/isbn"/>
			</div>
			<div id="tableDesMatieres">
				Table des matières 
				<xsl:value-of select="$tabMatUrl"/><xsl:value-of select="isbns/isbn"/>
			</div>
		</xsl:if>-->
		<xsl:if test="quatrieme">
			<div>
				<div><button class="derouleButton" style="margin-right:0.5em;" onclick="quatrieme(this);">+</button><span style="font-weight: bold; text-decoration: underline;">Quatrième de couverture</span></div>
				<div id="quatrieme" style="margin-left: 2.5em; display: none;">
					<xsl:for-each select="quatrieme">
						<!--<xsl:value-of disable-output-escaping="yes" select="."/>-->
						<xsl:if test="presentation">
							<xsl:for-each select="presentation">
								<div style="text-decoration: underline;">Presentation</div>
								<div style="margin-left: 1em;">
									<xsl:for-each select="p">
										<xsl:choose>
											<xsl:when test="i">
												<i>— <xsl:value-of select="."/></i>
											</xsl:when>
											<xsl:otherwise>
												<p>— <xsl:value-of select="."/></p>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:for-each>
								</div>
							</xsl:for-each>
						</xsl:if>
						<xsl:if test="biographie">
							<xsl:for-each select="biographie">
								<div style="text-decoration: underline;">Biographie</div>
									<div style="margin-left: 1em;">
									<xsl:for-each select="p">
										<xsl:choose>
											<xsl:when test="i">
												<i>— <xsl:value-of select="."/></i>
											</xsl:when>
											<xsl:otherwise>
												<p>— <xsl:value-of select="."/></p>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:for-each>
								</div>
							</xsl:for-each>
						</xsl:if>
					</xsl:for-each>
				</div>
			</div>
		</xsl:if>
		<br />
		<xsl:if test="table-des-matieres">
			<div>
				<div><button class="derouleButton" style="margin-right:0.5em;" onclick="tableMatieres(this);">+</button><span style="font-weight: bold; text-decoration: underline;">Table des matières</span></div>
				<div id="tableDesMatieres" style="margin-left: 2.5em; display:none;">
					<xsl:for-each select="table-des-matieres">
						<xsl:for-each select="head">
							<div style="text-decoration: underline; margin-left:{@level*0.5}em;"><xsl:value-of select="." /></div>
						</xsl:for-each>
						<ul class="tableDesMatieres">
							<xsl:for-each select="tocitem">
								<li>
									<div>
										<span style="margin-left:{((item/@level)*0.6)}em;"><xsl:value-of select="item" /></span>
										<!--<span><xsl:value-of select="item" /></span>-->
										<span><xsl:value-of select="page" /></span>
										<div class="clear" style="clear:both"></div>
									</div>
								</li>
							</xsl:for-each>
						</ul>
						<!--<xsl:value-of select="."/>-->
					</xsl:for-each>
				</div>
			</div>
		</xsl:if>

		<xsl:for-each select="exemplaires/exemplaire">
			<div class="exemplaire">
				<hr />
				<xsl:value-of select="disponibilite"/> - 
				<xsl:value-of select="cote"/> - 
				<xsl:if test="not(supports/support='Papier')"> -
					<xsl:for-each select="supports/support">
						<xsl:if test="position()&gt;1"> - </xsl:if>
						<xsl:value-of select="."/>
					</xsl:for-each>
				</xsl:if>
				<xsl:if test="notes/note">
				<div>
					<xsl:for-each select="notes/note">
						<div style="margin-left: 1em;"><xsl:value-of select="."/></div>
					</xsl:for-each>
				</div>
				</xsl:if>
				<xsl:if test="(localisation) and (categorie)">
					<div><xsl:value-of select="localisation"/> - <xsl:value-of select="categorie"/></div>
				</xsl:if>
			</div>
		</xsl:for-each>
		<xsl:for-each select="seriels/seriel">
			<div class="seriel">
				<hr />
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
		<xsl:for-each select="liens/lien">
			<div class="lien">
				<hr />
				<xsl:if test="url"><div><a href="{url}"><xsl:value-of select="url"/></a></div></xsl:if>
				<xsl:if test="cote"><div><xsl:value-of select="cote"/></div></xsl:if>
				<xsl:if test="(localisation) and (categorie)"><div><xsl:value-of select="localisation"/> <xsl:value-of select="categorie"/></div></xsl:if>
			</div>
		</xsl:for-each>

		

		<!--<xsl:if test="indices/indice/cote">
			<div id="datasIndexes">
				<div class="indiceCduFeuille" style="display:none;"><xsl:value-of select="indices/indice/cote"/></div>
				<div class="isOnlineFeuille" style="display:none;"><xsl:value-of select="is-online"/></div>
				<div class="feuilletageIndexes-tab">EMPTY TAB!!!</div>
			</div>
		</xsl:if>-->
	</xsl:template>
	<xsl:variable name="notices-label">notices</xsl:variable>
	<xsl:variable name="notices-java-pagination">changeNoticesPage</xsl:variable>
	<xsl:variable name="notices-rows-id">notices-rows</xsl:variable>
	<xsl:include href="searchResultsNotices.xsl"/>
	<!--<xsl:include href="searchResultsNoticesOnline.xsl"/>-->
	<xsl:template match="/notice-themed/notices">
		<div id="sameTheme">
			<div>Sur le même thème dans le catalogue :</div>
			<!--<xsl:call-template name="pagination"/>-->
			<div class="noticesContainer">
				<xsl:for-each select="noticesList/notice | noticesList/notice-online">
					<div class="notice" style="overflow:hidden;">
						<xsl:call-template name="noticesShortTop"/>

						<xsl:if test="(./exemplaires/exemplaire)">
							<div class="exemplaires">
								<xsl:for-each select="./exemplaires/exemplaire">
									<div class="exemplaire">
										<div class="exemplaire-desc">
											<div>
												<xsl:value-of select="./availability"/> - <xsl:value-of select="./call_num"/>
												<xsl:if test="(./material_support) and not((./material_support) = 'Papier')">
													- <xsl:value-of select="./material_support"/>
												</xsl:if>
											</div>
											<xsl:if test="(./note)">
												<div>
													<xsl:value-of select="./note"/>
												</div>
											</xsl:if>
											<div>
												<xsl:value-of select="./location"/>
												<xsl:if test="(./category)">
													 - <xsl:value-of select="./category"/>
												</xsl:if>
											</div>
										</div>
									</div>
								</xsl:for-each>
							</div>
						</xsl:if>
						<xsl:if test="(./liens/lien)">
							<div class="liens">
								<xsl:for-each select="./liens/lien">
									<div class="lien">
										Lien <xsl:value-of select="position()"/>: 
										<a href="{./url}"><xsl:value-of select="./url"/></a>
										<xsl:if test="(./right)">
											 - <xsl:value-of select="./right"/>
										</xsl:if>
									</div>
								</xsl:for-each>
							</div>
						</xsl:if>

						<div style="clear:both">
							<xsl:call-template name="noticesShortBottom"/>
						</div>
					</div>
				</xsl:for-each>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="text()"/>
</xsl:stylesheet>
