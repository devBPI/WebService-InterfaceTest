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

	$defaultBasicSearchCriterias = isGetOk("basicSearchCriterias");

	/*$defaultGeneralSignification = urldecode(isGetOk("generalSignification"));
	$defaultGeneral              = urldecode(isGetOk("general"));*/
	$defaultTitre                = urldecode(isGetOk("titre"));
	$defaultAuteur               = urldecode(isGetOk("auteur"));
	$defaultSujet                = urldecode(isGetOk("sujet"));
	$defaultIsbnIssnCommercial   = urldecode(isGetOk("isbnissncommercial"));
	$defaultIndiceCote           = urldecode(isGetOk("indicecote"));
	$defaultDatePublication      = urldecode(isGetOk("datepublication"));
	$defaultRealisateur          = urldecode(isGetOk("realisateur"));
	$defaultTheme                = urldecode(isGetOk("theme"));
	$defaultEditeur              = urldecode(isGetOk("editeur"));
	$defaultCollection           = urldecode(isGetOk("collection"));
	$defaultDatePublicationStart = urldecode(isGetOk("datepublicationstart"));
	$defaultDatePublicationEnd   = urldecode(isGetOk("datepublicationend"));

	$defaultFacets               = urldecode(isGetOk("facets"));

	//echo "<pre><code class='language-xml'>".htmlspecialchars($defaultBasicSearchCriterias, ENT_QUOTES)."</code></pre><br/>";

	$ini_array = @parse_ini_file("etc/configuration.ini");
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

	$data = array('parcours' => $parkour);

	$haveAdvancedSearch = false;
	if($defaultTitre!=null)               { $data["titre"]                   = $defaultTitre;                $haveAdvancedSearch = true; }
	if($defaultAuteur!=null)              { $data["auteur"]                  = $defaultAuteur;               $haveAdvancedSearch = true; }
	if($defaultSujet!=null)               { $data["sujet"]                   = $defaultSujet;                $haveAdvancedSearch = true; }
	if($defaultIsbnIssnCommercial!=null)  { $data["isbn-issn-numcommercial"] = $defaultIsbnIssnCommercial;   $haveAdvancedSearch = true; }
	if($defaultIndiceCote!=null)          { $data["indice-cote"]             = $defaultIndiceCote;           $haveAdvancedSearch = true; }
	if($defaultDatePublication!=null)     { $data["date-publication"]        = $defaultDatePublication;      $haveAdvancedSearch = true; }
	if($defaultRealisateur!=null)         { $data["realisateur"]             = $defaultRealisateur;          $haveAdvancedSearch = true; }
	if($defaultTheme!=null)               { $data["theme"]                   = $defaultTheme;                $haveAdvancedSearch = true; }
	if($defaultEditeur!=null)             { $data["editeur"]                 = $defaultEditeur;              $haveAdvancedSearch = true; }
	if($defaultCollection!=null)          { $data["collection-name"]         = $defaultCollection;           $haveAdvancedSearch = true; }
	if($defaultDatePublicationStart!=null){ $data["date-publication-debut"]  = $defaultDatePublicationStart; $haveAdvancedSearch = true; }
	if($defaultDatePublicationEnd!=null)  { $data["date-publication-fin"]    = $defaultDatePublicationEnd;   $haveAdvancedSearch = true; }

	if(isset($data["spell"]))
	{
		$url = $ini_array["CatalogueWebServiceUrl"]."spell/notices-online"."?word=".urlencode($data["spell"]);
		$xslUrl = "xslt/orthographicSuggestions.xsl";

		echo "<div class=\"suggestions\">";

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

			$proc->setParameter('', 'rebondUrl', "");

			echo $proc->transformToXML($xml);
		}
		else
		{
			trigger_error("It's all messed up");
			throw new Exception("This is nice error handling");
		}
		echo "</div>";
	}

	$xmlAdvancedSearchCriterias = array_to_xml_main("search-criterias", $data);

	$url = $ini_array["CatalogueWebServiceUrl"]."search/notices-online"."?criters=".urlencode($xmlAdvancedSearchCriterias->asXML());

	if(null != $defaultBasicSearchCriterias && $haveAdvancedSearch == true)
	{
		$xmlSearchCriterias = new SimpleXMLElement(urldecode($defaultBasicSearchCriterias));
		$andXml = new SimpleXMLElement("<and/>");
		xml_adopt($andXml, $xmlSearchCriterias);
		xml_adopt($xmlAdvancedSearchCriterias, $andXml);
		$url = $ini_array["CatalogueWebServiceUrl"]."search/notices-online"."?criters=".urlencode($xmlAdvancedSearchCriterias->asXML());

	}
	else if(null != $defaultBasicSearchCriterias)
	{
		$xmlSearchCriterias = new SimpleXMLElement(urldecode($defaultBasicSearchCriterias));
		$parcourXml = new SimpleXMLElement("<parcours>".$parkour."</parcours>");
		xml_adopt($xmlSearchCriterias, $parcourXml);
		$url = $ini_array["CatalogueWebServiceUrl"]."search/notices-online"."?criters=".urlencode($xmlSearchCriterias->asXML());
	}


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

		//$proc->setParameter("", "imgUrl", $ini_array["CatalogueWebServiceUrl"]."electre/vignette/");
		$proc->setParameter("", "biblioMondoImgUrl", "https://dev-bpi-musique.bibliomondo.com/in/rest/Thumb/image?id=");
	 
		echo $proc->transformToXML($xml);

		//$indexes = $xml->getElementsByTagName("indice");

	}
	else
	{
		trigger_error("It's all messed up");
		throw new Exception("This is nice error handling");
		exit("Could not continue");
		die("it is over");
	}
