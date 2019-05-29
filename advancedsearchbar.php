<div id="advancedSearchTyping" style="float: left; margin-right: 10px;">
	<div id="advancedsearch-titre-div" class="autocomplete-title">
		<input type="text" id="advancedsearch-titre"                name="advancedsearch-titre"                 autocomplete="off" size=50 placeholder="Titre…"                         onkeyup="if(event.keyCode==13)search();" <?php if($defaultTitre!=null){echo "value=\"".encodeStringForInput($defaultTitre)."\"";} ?> /><br />
	</div>
	<div id="advancedsearch-auteur-div" class="autocomplete-unk">
		<input type="text" id="advancedsearch-auteur"               name="advancedsearch-auteur"                autocomplete="off" size=50 placeholder="Auteur…"                        onkeyup="if(event.keyCode==13)search();" <?php if($defaultAuteur!=null){echo "value=\"".encodeStringForInput($defaultAuteur)."\"";} ?> /><br />
	</div>
	<div id="advancedsearch-realisateur-div" class="autocomplete-unk">
		<input type="text" id="advancedsearch-realisateur"          name="advancedsearch-realisateur"           autocomplete="off" size=50 placeholder="Réalisateurs…"                  onkeyup="if(event.keyCode==13)search();" <?php if($defaultRealisateur!=null){echo "value=\"".encodeStringForInput($defaultRealisateur)."\"";} ?> /><br />
	</div>
	<div id="advancedsearch-editeur-div" class="autocomplete-unk">
		<input type="text" id="advancedsearch-editeur"              name="advancedsearch-editeur"               autocomplete="off" size=50 placeholder="Éditeur…"                       onkeyup="if(event.keyCode==13)search();" <?php if($defaultEditeur!=null){echo "value=\"".encodeStringForInput($defaultEditeur)."\"";} ?> /><br />
	</div>
	<div id="advancedsearch-sujet-div" class="autocomplete-unk">
		<input type="text" id="advancedsearch-sujet"                name="advancedsearch-sujet"                 autocomplete="off" size=50 placeholder="Sujet…"                         onkeyup="if(event.keyCode==13)search();" <?php if($defaultSujet!=null){echo "value=\"".encodeStringForInput($defaultSujet)."\"";} ?> /><br />
	</div>
	<div id="advancedsearch-theme-div" class="autocomplete-unk">
		<input type="text" id="advancedsearch-theme"                name="advancedsearch-theme"                 autocomplete="off" size=50 placeholder="Theme…"                         onkeyup="if(event.keyCode==13)search();" <?php if($defaultTheme!=null){echo "value=\"".encodeStringForInput($defaultTheme)."\"";} ?> /><br />
	</div>
	<div id="advancedsearch-collection-div" class="autocomplete-unk">
		<input type="text" id="advancedsearch-collection"           name="advancedsearch-collection"            autocomplete="off" size=50 placeholder="Collection…"                    onkeyup="if(event.keyCode==13)search();" <?php if($defaultCollection!=null){echo "value=\"".encodeStringForInput($defaultCollection)."\"";} ?> /><br />
	</div>
	<div id="advancedsearch-isbnissncommercial-div" class="autocomplete-unk">
		<input type="text" id="advancedsearch-isbnissncommercial"   name="advancedsearch-isbnissncommercial"    autocomplete="off" size=50 placeholder="ISBN/ISSN/Numéros commerciaux…" onkeyup="if(event.keyCode==13)search();" <?php if($defaultIsbnIssnCommercial!=null){echo "value=\"".encodeStringForInput($defaultIsbnIssnCommercial)."\"";} ?> /><br />
	</div>
	<div id="advancedsearch-indicecote-div" class="autocomplete-unk">
		<input type="text" id="advancedsearch-indicecote"           name="advancedsearch-indicecote"            autocomplete="off" size=50 placeholder="Indice/Cote…"                   onkeyup="if(event.keyCode==13)search();" <?php if($defaultIndiceCote!=null){echo "value=\"".encodeStringForInput($defaultIndiceCote)."\"";} ?> /><br />
	</div>
	<div id="advancedsearch-datepublication-div" class="date-searchbar-div autocomplete-unk">

		<label id="dateSwitch" class="switch">
			<input type="checkbox" onclick="switchDatesPreciseIntervale(this.checked);" <?php if($defaultDatePublicationStart!=null || $defaultDatePublicationEnd!=null) echo "checked"; ?> />
			<span class="slider"></span>
		</label>

		<span id="advancedSearchBarDatePrecise" <?php if($defaultDatePublicationStart!=null || $defaultDatePublicationEnd!=null) echo 'style="display: none;"'; ?>>
			<input type="text" id="advancedsearch-datepublication"      name="advancedsearch-datepublication"       autocomplete="off" size=43 placeholder="Date de Publication…"           onkeyup="if(event.keyCode==13)search();" <?php if($defaultDatePublication!=null){echo "value=\"".encodeStringForInput($defaultDatePublication)."\"";} ?> />
		</span>
		<span id="advancedSearchBarDateInterval" <?php if($defaultDatePublicationStart==null && $defaultDatePublicationEnd==null) echo 'style="display: none;"'; ?>>
			<input type="text" id="advancedsearch-datepublicationstart" name="advancedsearch-date-publicationstart" autocomplete="off" size=17 placeholder="Date de Publication (Début)…"   onkeyup="if(event.keyCode==13)search();" <?php if($defaultDatePublicationStart!=null){echo "value=\"".encodeStringForInput($defaultDatePublicationStart)."\"";} ?> />
			<span style="display: inline-block; width: 8px; text-align: center;">-</span>
			<input type="text" id="advancedsearch-datepublicationend"   name="advancedsearch-date publicationend"   autocomplete="off" size=17 placeholder="Date de Publication (Fin)…"     onkeyup="if(event.keyCode==13)search();" <?php if($defaultDatePublicationEnd!=null){echo "value=\"".encodeStringForInput($defaultDatePublicationEnd)."\"";} ?> /><br />
		</span>
	</div>
	<div id="advancedsearch-datepublicationstart-div" class="autocomplete-unk">
	</div>
	<div id="advancedsearch-datepublicationend-div" class="autocomplete-unk">
	</div>
</div>
<div id="advancedSearchLists" style= "margin-left: 10px;">
<?php
	$data = array('parcours' => $parkour, 'page' => $page, 'rows' => $rows);
	if($defaultGeneral!=null)              $data["general"]                 = $defaultGeneral;
	if($defaultTitre!=null)                $data["titre"]                   = $defaultTitre;
	if($defaultAuteur!=null)               $data["auteur"]                  = $defaultAuteur;
	if($defaultSujet!=null)                $data["sujet"]                   = $defaultSujet;
	if($defaultIsbnIssnCommercial!=null)   $data["isbn-issn-numcommercial"] = $defaultIsbnIssnCommercial;
	if($defaultIndiceCote!=null)           $data["indice-cote"]             = $defaultIndiceCote;
	if($defaultDatePublication!=null)      $data["date-publication"]        = $defaultDatePublication;
	if($defaultRealisateur!=null)          $data["realisateur"]             = $defaultRealisateur;
	if($defaultTheme!=null)                $data["theme"]                   = $defaultTheme;
	if($defaultBaseRecherche!=null)        $data["baserecherche"]           = $defaultBaseRecherche;
	if($defaultEditeur!=null)              $data["editeur"]                 = $defaultEditeur;
	if($defaultCollection!=null)           $data["collection"]              = $defaultCollection;
	if($defaultDatePublicationStart!=null) $data["date-publication-debut"]  = $defaultDatePublicationStart;
	if($defaultDatePublicationEnd!=null)   $data["date-publication-fin"]    = $defaultDatePublicationEnd;
	/*if($defaultLangue!=null)               $data["langue"]                  = $defaultLangue;
	if($defaultType!=null)                 $data["type"]                    = $defaultType;
	if($defaultSupport!=null)              $data["support"]                 = $defaultSupport;
	if($defaultGenreMusic!=null)           $data["genre-musical"]           = $defaultGenreMusic;
	if($defaultGenreFilm!=null)            $data["genre-cinematographique"] = $defaultGenreFilm;
	if($defaultGenreLitt!=null)            $data["genre-literraire"]        = $defaultGenreLitt;
	if($defaultSecteur!=null)              $data["secteur"]                 = $defaultSecteur;
	if($defaultAudience!=null)             $data["audience"]                = $defaultAudience;*/
	$xmlData = array_to_xml_main("search-criterias", $data);
	//$url = $ini_array["CatalogueWebServiceUrl"]."facets"."?criters=".urlencode($xmlData->asXML())."&rows=0&page=1";


	$url = $ini_array["CatalogueWebServiceUrl"]."advanced-search/list-elements";
	$advancedSearchElements = file_get_contents($url);
	$xslUrl = "xslt/advancedSearchBar.xsl";

	echo "<div style='margin-bottom: 13px;'>";
	echo "<a href=\"".$url."\" target=\"_blank\" style=\"font-size: 12px;\">URL du WebService</a>";
	echo "<br />";
	echo "<a href=\"/".$xslUrl."\" target=\"_blank\" style=\"font-size: 12px;\">XSLT utilisée</a>";
	echo "</div>";

	$simpleXml = new SimpleXMLElement($advancedSearchElements);
	$xmlTxt =  $simpleXml->asXML();
	$xml = new DOMDocument('1.0', 'utf-8');
	$xml->loadXML($xmlTxt);

	$xsl = new DOMDocument;
	$xsl->load($xslUrl);

	$proc = new XSLTProcessor();
	$proc->importStyleSheet($xsl);

	echo $proc->transformToXML($xml);
?>
</div>
