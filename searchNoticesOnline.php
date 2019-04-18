<?php
	include "utils/phpUtils.php";
	include "utils/postXML.php";

	$errorText="";
	/*if(!isset($_GET['general']) || $_GET['general']=='' || $_GET['general']==null)
	{
		$errorText.=('&#x26a0 Missing text. &#x26a0<br />');
		echo($errorText);
		exit(500);
	}*/
	$page=1;
	if(isset($_GET['page']) && is_numeric($_GET['page']) && $_GET['page']>=1)
	{
		$page=$_GET['page'];
	}
	$rows=20;
	if(isset($_GET['rows']) && is_numeric($_GET['rows']) && ($_GET['rows']==20 || $_GET['rows']==40 || $_GET['rows']==100))
	{
		$rows=$_GET['rows'];
	}
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

	$defaultGeneralSignification = urldecode(isGetOk("generalSignification"));
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

	$data = array('parcours' => $parkour, 'page' => $page, 'rows' => $rows);

	if($defaultGeneral!=null)
	{
		switch($defaultGeneralSignification)
		{
			case "auteur":
				$data["auteur"] = $defaultGeneral;
			break;
			case "titre":
				$data["titre"] = $defaultGeneral;
			break;
			case "sujet":
				$data["sujet"] = $defaultGeneral;
			break;
			case "isbnissncommercial":
				$data["isbn-issn-numcommercial"] = $defaultGeneral;
			break;
			case "indicecote":
				$data["indice-cote"] = $defaultGeneral;
			break;
			case "datepublication":
				$data["date-publication"] = $defaultGeneral;
			break;
			case "editeur":
				$data["editeur"] = $defaultGeneral;
			break;
			case "realisateur":
				$data["realisateur"] = $defaultGeneral;
			break;
			case "theme":
				$data["theme"] = $defaultGeneral;
			break;
			default:
				$data["general"] = $defaultGeneral;
		}
	}

	if($defaultTitre!=null)                $data["titre"]                   = $defaultTitre;
	if($defaultAuteur!=null)               $data["auteur"]                  = $defaultAuteur;
	if($defaultSujet!=null)                $data["sujet"]                   = $defaultSujet;
	if($defaultIsbnIssnCommercial!=null)   $data["isbn-issn-numcommercial"] = $defaultIsbnIssnCommercial;
	if($defaultIndiceCote!=null)           $data["indice-cote"]             = $defaultIndiceCote;
	if($defaultDatePublication!=null)      $data["date-publication"]        = $defaultDatePublication;
	if($defaultRealisateur!=null)          $data["realisateur"]             = $defaultRealisateur;
	if($defaultTheme!=null)                $data["theme"]                   = $defaultTheme;
	if($defaultEditeur!=null)              $data["editeur"]                 = $defaultEditeur;
	if($defaultCollection!=null)           $data["collection-name"]         = $defaultCollection;
	if($defaultDatePublicationStart!=null) $data["date-publication-debut"]  = $defaultDatePublicationStart;
	if($defaultDatePublicationEnd!=null)   $data["date-publication-fin"]    = $defaultDatePublicationEnd;
	/*if($defaultBaseRecherche!=null)        $data["baserecherche"]           = $defaultBaseRecherche;
	if($defaultLangue!=null)               $data["langue"]                  = $defaultLangue;
	if($defaultType!=null)                 $data["type"]                    = $defaultType;
	if($defaultSupport!=null)              $data["support"]                 = $defaultSupport;
	if($defaultGenreMusic!=null)           $data["genre-musical"]           = $defaultGenreMusic;
	if($defaultGenreFilm!=null)            $data["genre-cinematographique"] = $defaultGenreFilm;
	if($defaultGenreLitt!=null)            $data["genre-literraire"]        = $defaultGenreLitt;
	if($defaultSecteur!=null)              $data["secteur"]                 = $defaultSecteur;
	if($defaultAudience!=null)             $data["audience"]                = $defaultAudience;*/
	//if($defaultFacets!=null)               $data["facets"]                  = $defaultFacets;

	$xmlData = array_to_xml_main("search-criterias", $data);
	//$url = $ini_array["CatalogueWebServiceUrl"].'search/notices-online?parcours='.$parkour.'&page='.$page.'&rows='.$rows.'&general='.urlencode($_GET['text']);
	$url = $ini_array["CatalogueWebServiceUrl"]."search/notices-online"."?criters=".urlencode($xmlData->asXML());
	if($defaultFacets!=null)
		$url.=("&facets=".urlencode("<facets-wrap>".$defaultFacets."</facets-wrap>"));
	$url=$url."&rows=".$rows."&page=".$page;
	//$result = getArrayToXmlIntoUrl($url, "search-criterias", $data);
	$xslUrl = "xslt/searchResultsNoticesOnline.xsl";

	echo "<a href=\"".$url."\" target=\"_blank\" style=\"font-size: 12px;\">URL du WebService</a>";
	echo "<br />";
	echo "<a href=\"/".$xslUrl."\" target=\"_blank\" style=\"font-size: 12px;\">XSLT utilisée</a>";

	$searchPage;
	if(FALSE !== ($searchPage = file_get_contents($url)))
	{
		$simpleXml = new SimpleXMLElement($searchPage);
		$xmlTxt =  $simpleXml->asXML();
		$xml = new DOMDocument('1.0', 'utf-8');
		$xml->loadXML($xmlTxt);

		$xsl = new DOMDocument;
		$xsl->load($xslUrl);

		$proc = new XSLTProcessor();
		$proc->importStyleSheet($xsl);

		$proc->setParameter("", "imgUrl", $ini_array["CatalogueWebServiceUrl"]."electre/vignette/");
		$proc->setParameter("", "biblioMondoImgUrl", "https://dev-bpi-musique.bibliomondo.com/in/rest/Thumb/image?id=");
	 
		echo $proc->transformToXML($xml);
	}
	else
	{
		trigger_error("It's all messed up");
		throw new Exception("This is nice error handling");
		exit("Could not continue");
		die("it is over");
	}
