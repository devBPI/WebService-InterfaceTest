<?php
	include "utils/phpUtils.php";
	include "utils/postXML.php";
	
	$errorText="";

	$parkour="general";
	if(isset($_GET['parkour']) && $_GET['parkour']!=null && $_GET['parkour']!="")
	{
		switch($_GET['parkour'])
		{
			case "autoformation":
			case "cinema":
			case "musique":
			case "presse":
			$parkour=$_GET['parkour'];
			break;
			default:
			break;
		}
	}

	$defaultGeneral              = urldecode(isGetOk("general"));
	$defaultTitre                = urldecode(isGetOk("titre"));
	$defaultAuteur               = urldecode(isGetOk("auteur"));
	$defaultSujet                = urldecode(isGetOk("sujet"));
	$defaultIsbnIssnCommercial   = urldecode(isGetOk("isbnissncommercial"));
	$defaultIndiceCote           = urldecode(isGetOk("indicecote"));
	$defaultDatePublication      = urldecode(isGetOk("datepublication"));
	$defaultRealisateur          = urldecode(isGetOk("realisateur"));
	$defaultTheme                = urldecode(isGetOk("theme"));
	$defaultBaseRecherche        = urldecode(isGetOk("baserecherche"));
	$defaultEditeur              = urldecode(isGetOk("editeur"));
	$defaultCollection           = urldecode(isGetOk("collection"));
	$defaultDatePublicationStart = urldecode(isGetOk("datepublicationstart"));
	$defaultDatePublicationEnd   = urldecode(isGetOk("datepublicationend"));
	$defaultLangue               = urldecode(isGetOk("langue"));
	$defaultType                 = urldecode(isGetOk("type"));
	$defaultSupport              = urldecode(isGetOk("support"));
	$defaultGenreMusic           = urldecode(isGetOk("genremusic"));
	$defaultGenreFilm            = urldecode(isGetOk("genrefilm"));
	$defaultGenreLitt            = urldecode(isGetOk("genrelitt"));
	$defaultSecteur              = urldecode(isGetOk("secteur"));
	$defaultAudience             = urldecode(isGetOk("audience"));

	$defaultFacets               = urldecode(isGetOk("facets"));

	$ini_array = parse_ini_file("etc/configuration.ini");
	if(!$ini_array)
		$ini_array = parse_ini_file("etc/default.ini");
	if(!$ini_array)
	{
		$errorText.=('&#x26a0 Unable to open configuration file. &#x26a0<br />');
		echo($errorText);
		exit(500);
	}

	ini_set("display_errors",1);
	error_reporting(E_ALL);

	header("Content-Type: text/xml");
	header("Content-Type: text/html;charset=utf-8");

	$data = array();//'parcours' => $parkour, 'page' => $page, 'rows' => $rows);
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
	if($defaultLangue!=null)               $data["langue"]                  = $defaultLangue;
	if($defaultType!=null)                 $data["type"]                    = $defaultType;
	if($defaultSupport!=null)              $data["support"]                 = $defaultSupport;
	if($defaultGenreMusic!=null)           $data["genre-musical"]           = $defaultGenreMusic;
	if($defaultGenreFilm!=null)            $data["genre-cinematographique"] = $defaultGenreFilm;
	if($defaultGenreLitt!=null)            $data["genre-literraire"]        = $defaultGenreLitt;
	if($defaultSecteur!=null)              $data["secteur"]                 = $defaultSecteur;
	if($defaultAudience!=null)             $data["audience"]                = $defaultAudience;
	//if($defaultFacets!=null)               $data["facets"]                  = $defaultFacets;

	$xmlData = array_to_xml_main("search-criterias", $data);
?>








<div id="testList" class="btn-group">
	<button type="button" class="btn btn-default" data-toggle="dropdown" title="Fruits" onclick="displayBtnGrp(this);">
		<span class="multiselect-selected-text">Fruits</span><b class="caret"></b>
	</button>
	<ul id="testListUl" class="multiselect-container dropdown-menu">
		<li class="">
			<div tabindex="0">
				<label class="checkbox" title="Mango">
					<input class="checkboxinput" value="1" type="checkbox" onchange="checkElement(this);">
					Mango
				</label>
			</div>
		</li>
		<li class="">
			<div tabindex="0">
				<label class="checkbox" title="Apple">
					<input class="checkboxinput" value="2" type="checkbox" onchange="checkElement(this);">
					Apple
				</label>
			</div>
		</li>
		<li class="">
			<div tabindex="0">
				<label class="checkbox" title="Banana">
					<input class="checkboxinput" value="3" type="checkbox" onchange="checkElement(this);">
					Banana
				</label>
			</div>
		</li>
		<li class="">
			<div tabindex="0">
				<label class="checkbox" title="Guava">
					<input class="checkboxinput" value="4" type="checkbox" onchange="checkElement(this);">
					Guava
				</label>
			</div>
		</li>
		<li>
			<div tabindex="0">
				<label class="checkbox" title="Orange">
					<input class="checkboxinput" value="5" type="checkbox" onchange="checkElement(this);">
					Orange
				</label>
			</div>
		</li>
	</ul>
</div>

<div id="vehiculeList" class="btn-group">
	<button type="button" class="multiselect dropdown-toggle btn btn-default" data-toggle="dropdown" title="Vehicules" onclick="displayBtnGrp(this);">
		<span class="multiselect-selected-text">Vehicules</span><b class="caret"></b>
	</button>
	<ul id="testListUl" class="multiselect-container dropdown-menu">
		<li class="">
			<div tabindex="0">
				<label class="checkbox" title="Bateau">
					<input class="checkboxinput" value="2" type="checkbox" onchange="checkElement(this);">
					Bateau
				</label>
			</div>
		</li>
		<li class="">
			<div tabindex="0">
				<label class="checkbox" title="Train">
					<input class="checkboxinput" value="3" type="checkbox" onchange="checkElement(this);">
					Train
				</label>
			</div>
		</li>
		<li class="">
			<div tabindex="0">
				<label class="checkbox" title="Voiture">
					<input class="checkboxinput" value="4" type="checkbox" onchange="checkElement(this);">
					Voiture
				</label>
			</div>
		</li>
		<li>
			<div tabindex="0">
				<label class="checkbox" title="Avion">
					<input class="checkboxinput" value="5" type="checkbox" onchange="checkElement(this);">
					Avion
				</label>
			</div>
		</li>
	</ul>
</div>


<div class="autocomplete-title">
	<input type="text" id="advancedsearch-titre"                name="advancedsearch-titre"                 autocomplete="off" size=50 placeholder="Titre…"                         onkeyup="if(event.keyCode==13)search();" <?php if($defaultTitre!=null){echo "value=\"".encodeStringForInput($defaultTitre)."\"";} ?> /><br />
</div>
<div class="autocomplete-unk">
	<input type="text" id="advancedsearch-auteur"               name="advancedsearch-auteur"                autocomplete="off" size=50 placeholder="Auteur…"                        onkeyup="if(event.keyCode==13)search();" <?php if($defaultAuteur!=null){echo "value=\"".encodeStringForInput($defaultAuteur)."\"";} ?> /><br />
</div>
<div class="autocomplete-unk">
	<input type="text" id="advancedsearch-sujet"                name="advancedsearch-sujet"                 autocomplete="off" size=50 placeholder="Sujet…"                         onkeyup="if(event.keyCode==13)search();" <?php if($defaultSujet!=null){echo "value=\"".encodeStringForInput($defaultSujet)."\"";} ?> /><br />
</div>
<div class="autocomplete-unk">
	<input type="text" id="advancedsearch-isbnissncommercial"   name="advancedsearch-isbnissncommercial"    autocomplete="off" size=50 placeholder="ISBN/ISSN/Numéros commerciaux…" onkeyup="if(event.keyCode==13)search();" <?php if($defaultIsbnIssnCommercial!=null){echo "value=\"".encodeStringForInput($defaultIsbnIssnCommercial)."\"";} ?> /><br />
</div>
<div class="autocomplete-unk">
	<input type="text" id="advancedsearch-indicecote"           name="advancedsearch-indicecote"            autocomplete="off" size=50 placeholder="Indice/Cote…"                   onkeyup="if(event.keyCode==13)search();" <?php if($defaultIndiceCote!=null){echo "value=\"".encodeStringForInput($defaultIndiceCote)."\"";} ?> /><br />
</div>
<div class="autocomplete-unk">
	<input type="text" id="advancedsearch-datepublication"      name="advancedsearch-datepublication"       autocomplete="off" size=50 placeholder="Date de Publication…"           onkeyup="if(event.keyCode==13)search();" <?php if($defaultDatePublication!=null){echo "value=\"".encodeStringForInput($defaultDatePublication)."\"";} ?> disabled="true" /><br />
</div>
<div class="autocomplete-unk">
	<input type="text" id="advancedsearch-realisateur"          name="advancedsearch-realisateur"           autocomplete="off" size=50 placeholder="Réalisateurs…"                  onkeyup="if(event.keyCode==13)search();" <?php if($defaultRealisateur!=null){echo "value=\"".encodeStringForInput($defaultRealisateur)."\"";} ?> /><br />
</div>
<div class="autocomplete-unk">
	<input type="text" id="advancedsearch-theme"                name="advancedsearch-theme"                 autocomplete="off" size=50 placeholder="Theme…"                         onkeyup="if(event.keyCode==13)search();" <?php if($defaultTheme!=null){echo "value=\"".encodeStringForInput($defaultTheme)."\"";} ?> /><br />
</div>
<div class="autocomplete-unk">
	<input type="text" id="advancedsearch-baserecherche"        name="advancedsearch-baserecherc"           autocomplete="off" size=50 placeholder="Base de Recherche…"             onkeyup="if(event.keyCode==13)search();" <?php if($defaultBaseRecherche!=null){echo "value=\"".encodeStringForInput($defaultBaseRecherche)."\"";} ?> disabled="true" /><br />
</div>
<div class="autocomplete-unk">
	<input type="text" id="advancedsearch-editeur"              name="advancedsearch-Editeur"               autocomplete="off" size=50 placeholder="Éditeur…"                       onkeyup="if(event.keyCode==13)search();" <?php if($defaultEditeur!=null){echo "value=\"".encodeStringForInput($defaultEditeur)."\"";} ?> /><br />
</div>
<div class="autocomplete-unk">
	<input type="text" id="advancedsearch-collection"           name="advancedsearch-collection"            autocomplete="off" size=50 placeholder="Collection…"                    onkeyup="if(event.keyCode==13)search();" <?php if($defaultCollection!=null){echo "value=\"".encodeStringForInput($defaultCollection)."\"";} ?> /><br />
</div>
<div class="autocomplete-unk">
	<input type="text" id="advancedsearch-datepublicationstart" name="advancedsearch-date-publicationstart" autocomplete="off" size=50 placeholder="Date de Publication (Début)…"   onkeyup="if(event.keyCode==13)search();" <?php if($defaultDatePublicationStart!=null){echo "value=\"".encodeStringForInput($defaultDatePublicationStart)."\"";} ?> disabled="true" /><br />
</div>
<div class="autocomplete-unk">
	<input type="text" id="advancedsearch-datepublicationend"   name="advancedsearch-date publicationend"   autocomplete="off" size=50 placeholder="Date de Publication (Fin)…"     onkeyup="if(event.keyCode==13)search();" <?php if($defaultDatePublicationEnd!=null){echo "value=\"".encodeStringForInput($defaultDatePublicationEnd)."\"";} ?> disabled="true" /><br />
</div>
<div class="autocomplete-unk">
	<input type="text" id="advancedsearch-langue"               name="advancedsearch-langue"                autocomplete="off" size=50 placeholder="Langues…"                       onkeyup="if(event.keyCode==13)search();" <?php if($defaultLangue!=null){echo "value=\"".encodeStringForInput($defaultLangue)."\"";} ?> disabled="true" /><br />
</div>
<div class="autocomplete-unk">
	<input type="text" id="advancedsearch-type"                 name="advancedsearch-type"                  autocomplete="off" size=50 placeholder="Type de Document…"              onkeyup="if(event.keyCode==13)search();" <?php if($defaultType!=null){echo "value=\"".encodeStringForInput($defaultType)."\"";} ?> disabled="true" /><br />
</div>
<div class="autocomplete-unk">
	<input type="text" id="advancedsearch-support"              name="advancedsearch-support"               autocomplete="off" size=50 placeholder="Support…"                       onkeyup="if(event.keyCode==13)search();" <?php if($defaultSupport!=null){echo "value=\"".encodeStringForInput($defaultSupport)."\"";} ?> disabled="true" /><br />
</div>
<div class="autocomplete-unk">
	<input type="text" id="advancedsearch-genremusic"           name="advancedsearch-genremusic"            autocomplete="off" size=50 placeholder="Genre Musical…"                 onkeyup="if(event.keyCode==13)search();" <?php if($defaultGenreMusic!=null){echo "value=\"".encodeStringForInput($defaultGenreMusic)."\"";} ?> disabled="true" /><br />
</div>
<div class="autocomplete-unk">
	<input type="text" id="advancedsearch-genrefilm"            name="advancedsearch-genrefilm"             autocomplete="off" size=50 placeholder="Genre Film…"                    onkeyup="if(event.keyCode==13)search();" <?php if($defaultGenreFilm!=null){echo "value=\"".encodeStringForInput($defaultGenreFilm)."\"";} ?> disabled="true" /><br />
</div>
<div class="autocomplete-unk">
	<input type="text" id="advancedsearch-genrelitt"            name="advancedsearch-genrelitt"             autocomplete="off" size=50 placeholder="Genre littéraire…"              onkeyup="if(event.keyCode==13)search();" <?php if($defaultGenreLitt!=null){echo "value=\"".encodeStringForInput($defaultGenreLitt)."\"";} ?> disabled="true" /><br />
</div>
<div class="autocomplete-unk">
	<input type="text" id="advancedsearch-secteur"              name="advancedsearch-secteur"               autocomplete="off" size=50 placeholder="Secteur…"                       onkeyup="if(event.keyCode==13)search();" <?php if($defaultSecteur!=null){echo "value=\"".encodeStringForInput($defaultSecteur)."\"";} ?> disabled="true" /><br />
</div>
<div class="autocomplete-unk">
	<input type="text" id="advancedsearch-audience"             name="advancedsearch-audience"              autocomplete="off" size=50 placeholder="Public Destinataire…"           onkeyup="if(event.keyCode==13)search();" <?php if($defaultAudience!=null){echo "value=\"".encodeStringForInput($defaultAudience)."\"";} ?> disabled="true" />
</div>








