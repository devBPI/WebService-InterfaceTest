<?php
	include "php/phpUtils.php";
	include "php/postXML.php";

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

	$xmlData = array_to_xml_main("search-criterias", $data);
	//$url = $ini_array["CatalogueWebServiceUrl"].'search/notices?parcours='.$parkour.'&page='.$page.'&rows='.$rows.'&general='.urlencode($_GET['text']);
	$url1 = $ini_array["CatalogueWebServiceUrl"]."facets/notices"."?criters=".urlencode($xmlData->asXML())."&rows=0&page=1";
	$url2 = $ini_array["CatalogueWebServiceUrl"]."facets/notices-online"."?criters=".urlencode($xmlData->asXML())."&rows=0&page=1";
	//$result = getArrayToXmlIntoUrl($url, "search-criterias", $data);
	$xslUrl = "xslt/searchFacets.xsl";

	echo "<a href=\"".$url1."\" target=\"_blank\" style=\"font-size: 12px;\">URL du WebService</a>";
	echo "<br />";
	echo "<a href=\"".$url2."\" target=\"_blank\" style=\"font-size: 12px;\">URL du WebService</a>";
	echo "<br />";
	echo "<a href=\"/".$xslUrl."\" target=\"_blank\" style=\"font-size: 12px;\">XSLT utilisée</a>";

	$searchPage1 = file_get_contents($url1);
	$searchPage2 = file_get_contents($url2);
	if(FALSE == $searchPage1 || FALSE == $searchPage2)
	{
		trigger_error("It's all messed up");
		throw new Exception("This is nice error handling");
		exit("Could not continue");
		die("it is over");
	}
	else
	{
		function simplexml_merge(SimpleXMLElement &$xml1, SimpleXMLElement $xml2)
		{
			// convert SimpleXML objects into DOM ones
			$dom1 = new DomDocument();
			$dom2 = new DomDocument();
			$dom1->loadXML($xml1->asXML());
			$dom2->loadXML($xml2->asXML());

			// pull all child elements of second XML
			$xpath = new domXPath($dom2);
			$xpathQuery = $xpath->query('/*');
			for($i = 0; $i < $xpathQuery->length; $i++)
			{
				// and pump them into first one
				$dom1->appendChild($dom1->importNode($xpathQuery->item($i), true));
			} // for($i = 0; $i < $xpathQuery->length; $i++)
			$xml = simplexml_import_dom($dom1);
			return $xml;
		}

		$searchPage = $searchPage1.$searchPage2;
		//echo $searchPage;
		$simpleXml1 = new SimpleXMLElement($searchPage1);
		$simpleXml2 = new SimpleXMLElement($searchPage2);
		$xmlTxt =  simplexml_merge($simpleXml1, $simpleXml2)->asXML();
		//echo $xmlTxt;
		$xml = new DOMDocument('1.0', 'utf-8');
		$xml->loadXML($xmlTxt);

		$xsl = new DOMDocument;
		$xsl->load($xslUrl);

		$proc = new XSLTProcessor();
		$proc->importStyleSheet($xsl);
	 
		echo $proc->transformToXML($xml);
	}
