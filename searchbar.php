<!--<label for="searchbar">Search: </label>-->
<div id="search">
	<div id="parkour">
		<?php
			$parkour="general";
			if(isset($_GET['parkour']) && $_GET['parkour']!=null && $_GET['parkour']!="")
			{
				switch($_GET['parkour'])
				{
					case "autoformation":
					case "cinema":
					//case "musique":
					case "presse":
						$parkour=$_GET['parkour'];
					break;
					default:
					break;
				}
			}
		?>
		<!--<a href="/" <?php if($parkour=="general"){echo "class=\"selected-parkour\"";}?>>General</a>
		<a id="parkourAutoformation" href="/autoformation" <?php if($parkour=="autoformation"){echo "class=\"selected-parkour\"";}?>>Autoformation</a>
		<a id="parkourCinema" href="/cinema" <?php if($parkour=="cinema"){echo "class=\"selected-parkour\"";}?>>Cinema</a>
		<a id="parkourMusique" href="/musique" <?php if($parkour=="musique"){echo "class=\"selected-parkour\"";}?>>Musique</a>
		<a id="parkourPresse" href="/presse" <?php if($parkour=="presse"){echo "class=\"selected-parkour\"";}?>>Presse</a>-->
		<a onclick="window.location='/'+window.location.search;" <?php if($parkour=="general"){echo "class=\"selected-parkour\"";}?>>General</a>
		<a id="parkourAutoformation" onclick="window.location='/autoformation'+window.location.search;" <?php if($parkour=="autoformation"){echo "class=\"selected-parkour\"";}?>>Autoformation</a>
		<a id="parkourCinema" onclick="window.location='/cinema'+window.location.search;" <?php if($parkour=="cinema"){echo "class=\"selected-parkour\"";}?>>Cinema</a>
		<!--<a id="parkourMusique" onclick="window.location='/musique'+window.location.search;" <?php /*if($parkour=="musique"){echo "class=\"selected-parkour\"";}*/?>>Musique</a>-->
		<a id="parkourPresse" onclick="window.location='/presse'+window.location.search;" <?php if($parkour=="presse"){echo "class=\"selected-parkour\"";}?>>Presse</a>
	</div>
	<div class="autocomplete">
		<input type="text" id="searchbar" name="searchbar" autocomplete="off" size=50 placeholder="Rechercher sur le site…" onkeyup="if(event.keyCode==13){search();cleanFacets();}" <?php if($defaultSearchText!=null){echo "value=\"".$defaultSearchText."\"";} ?> />
	</div>
	<select id="searchBarSelection">
		<option value="Generale">Générale</option>
		<option value="Titre" disabled="true">Titre</option>
		<option value="Auteur" disabled="true">Auteur</option>
	</select>
	<input id="loupe" type="submit" value=" " onclick="search();cleanFacets();" />
	<input id="advancedSearchButton" type="submit" value="+" onclick="advancedSearch();" />
</div>
<div id="advancedSearchDiv" style="display:none;">
	<div class="autocomplete-title">
	<input type="text" id="advancedsearch-titre"                name="advancedsearch-titre"                 autocomplete="off" size=50 placeholder="Titre…"                         onkeyup="if(event.keyCode==13)search();" <?php if($defaultTitre!=null){echo "value=\"".encodeStringForInput($defaultTitre)."\"";} ?> /><br />
	<input type="text" id="advancedsearch-auteur"               name="advancedsearch-auteur"                autocomplete="off" size=50 placeholder="Auteur…"                        onkeyup="if(event.keyCode==13)search();" <?php if($defaultAuteur!=null){echo "value=\"".encodeStringForInput($defaultAuteur)."\"";} ?> /><br />
	<input type="text" id="advancedsearch-sujet"                name="advancedsearch-sujet"                 autocomplete="off" size=50 placeholder="Sujet…"                         onkeyup="if(event.keyCode==13)search();" <?php if($defaultSujet!=null){echo "value=\"".encodeStringForInput($defaultSujet)."\"";} ?> /><br />
	<input type="text" id="advancedsearch-isbnissncommercial"   name="advancedsearch-isbnissncommercial"    autocomplete="off" size=50 placeholder="ISBN/ISSN/Numéros commerciaux…" onkeyup="if(event.keyCode==13)search();" <?php if($defaultIsbnIssnCommercial!=null){echo "value=\"".encodeStringForInput($defaultIsbnIssnCommercial)."\"";} ?> /><br />
	<input type="text" id="advancedsearch-indicecote"           name="advancedsearch-indicecote"            autocomplete="off" size=50 placeholder="Indice/Cote…"                   onkeyup="if(event.keyCode==13)search();" <?php if($defaultIndiceCote!=null){echo "value=\"".encodeStringForInput($defaultIndiceCote)."\"";} ?> /><br />
	<input type="text" id="advancedsearch-datepublication"      name="advancedsearch-datepublication"       autocomplete="off" size=50 placeholder="Date de Publication…"           onkeyup="if(event.keyCode==13)search();" <?php if($defaultDatePublication!=null){echo "value=\"".encodeStringForInput($defaultDatePublication)."\"";} ?> disabled="true" /><br />
	<input type="text" id="advancedsearch-realisateur"          name="advancedsearch-realisateur"           autocomplete="off" size=50 placeholder="Réalisateurs…"                  onkeyup="if(event.keyCode==13)search();" <?php if($defaultRealisateur!=null){echo "value=\"".encodeStringForInput($defaultRealisateur)."\"";} ?> /><br />
	<input type="text" id="advancedsearch-theme"                name="advancedsearch-theme"                 autocomplete="off" size=50 placeholder="Theme…"                         onkeyup="if(event.keyCode==13)search();" <?php if($defaultTheme!=null){echo "value=\"".encodeStringForInput($defaultTheme)."\"";} ?> /><br />

	<input type="text" id="advancedsearch-baserecherche"        name="advancedsearch-baserecherc"           autocomplete="off" size=50 placeholder="Base de Recherche…"             onkeyup="if(event.keyCode==13)search();" <?php if($defaultBaseRecherche!=null){echo "value=\"".encodeStringForInput($defaultBaseRecherche)."\"";} ?> disabled="true" /><br />
	<input type="text" id="advancedsearch-editeur"              name="advancedsearch-Editeur"               autocomplete="off" size=50 placeholder="Éditeur…"                       onkeyup="if(event.keyCode==13)search();" <?php if($defaultEditeur!=null){echo "value=\"".encodeStringForInput($defaultEditeur)."\"";} ?> /><br />
	<input type="text" id="advancedsearch-collection"           name="advancedsearch-collection"            autocomplete="off" size=50 placeholder="Collection…"                    onkeyup="if(event.keyCode==13)search();" <?php if($defaultCollection!=null){echo "value=\"".encodeStringForInput($defaultCollection)."\"";} ?> /><br />
	<input type="text" id="advancedsearch-datepublicationstart" name="advancedsearch-date-publicationstart" autocomplete="off" size=50 placeholder="Date de Publication (Début)…"   onkeyup="if(event.keyCode==13)search();" <?php if($defaultDatePublicationStart!=null){echo "value=\"".encodeStringForInput($defaultDatePublicationStart)."\"";} ?> disabled="true" /><br />
	<input type="text" id="advancedsearch-datepublicationend"   name="advancedsearch-date publicationend"   autocomplete="off" size=50 placeholder="Date de Publication (Fin)…"     onkeyup="if(event.keyCode==13)search();" <?php if($defaultDatePublicationEnd!=null){echo "value=\"".encodeStringForInput($defaultDatePublicationEnd)."\"";} ?> disabled="true" /><br />
	<input type="text" id="advancedsearch-langue"               name="advancedsearch-langue"                autocomplete="off" size=50 placeholder="Langues…"                       onkeyup="if(event.keyCode==13)search();" <?php if($defaultLangue!=null){echo "value=\"".encodeStringForInput($defaultLangue)."\"";} ?> disabled="true" /><br />
	<input type="text" id="advancedsearch-type"                 name="advancedsearch-type"                  autocomplete="off" size=50 placeholder="Type de Document…"              onkeyup="if(event.keyCode==13)search();" <?php if($defaultType!=null){echo "value=\"".encodeStringForInput($defaultType)."\"";} ?> disabled="true" /><br />
	<input type="text" id="advancedsearch-support"              name="advancedsearch-support"               autocomplete="off" size=50 placeholder="Support…"                       onkeyup="if(event.keyCode==13)search();" <?php if($defaultSupport!=null){echo "value=\"".encodeStringForInput($defaultSupport)."\"";} ?> disabled="true" /><br />
	<input type="text" id="advancedsearch-genremusic"           name="advancedsearch-genremusic"            autocomplete="off" size=50 placeholder="Genre Musical…"                 onkeyup="if(event.keyCode==13)search();" <?php if($defaultGenreMusic!=null){echo "value=\"".encodeStringForInput($defaultGenreMusic)."\"";} ?> disabled="true" /><br />
	<input type="text" id="advancedsearch-genrefilm"            name="advancedsearch-genrefilm"             autocomplete="off" size=50 placeholder="Genre Film…"                    onkeyup="if(event.keyCode==13)search();" <?php if($defaultGenreFilm!=null){echo "value=\"".encodeStringForInput($defaultGenreFilm)."\"";} ?> disabled="true" /><br />
	<input type="text" id="advancedsearch-genrelitt"            name="advancedsearch-genrelitt"             autocomplete="off" size=50 placeholder="Genre littéraire…"              onkeyup="if(event.keyCode==13)search();" <?php if($defaultGenreLitt!=null){echo "value=\"".encodeStringForInput($defaultGenreLitt)."\"";} ?> disabled="true" /><br />
	<input type="text" id="advancedsearch-secteur"              name="advancedsearch-secteur"               autocomplete="off" size=50 placeholder="Secteur…"                       onkeyup="if(event.keyCode==13)search();" <?php if($defaultSecteur!=null){echo "value=\"".encodeStringForInput($defaultSecteur)."\"";} ?> disabled="true" /><br />
	<input type="text" id="advancedsearch-audience"             name="advancedsearch-audience"              autocomplete="off" size=50 placeholder="Public Destinataire…"           onkeyup="if(event.keyCode==13)search();" <?php if($defaultAudience!=null){echo "value=\"".encodeStringForInput($defaultAudience)."\"";} ?> disabled="true" />
	</div>
</div>
<div id="result-lists" style="width: 100%;">
	<div id="facetsdiv" style="margin: 3px; grid-column: 1 / span 2;">
		<div id="facets"></div>
		<!--<a id="facetsShowButton" onclick="displayFacets(); return false;">Dérouler facettes</a>
		<div id="facetsContainer" style="display:none;">
			<a onclick="hideFacets(); return false;">Enrouler facettes</a>
			<div id="facets"></div>
			<a onclick="hideFacets(); return false;">Enrouler facettes</a>
		</div>-->
	</div>
	<div id="authoritydiv" style="margin: 3px; grid-column: 1 / span 2;">
		<div id="mostRelevantAuthority"></div>
	</div>
	<div id="notices" style="margin: 3px; grid-column: 1;"></div>
	<div id="notices-online" style="margin: 3px; grid-column: 2;"></div>
</div>
