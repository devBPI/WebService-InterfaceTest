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
	$sort='DEFAULT';
	if(isset($_GET['sort']) && !is_numeric($_GET['sort']) && ($_GET['sort']=='TITRE_A_Z' || $_GET['sort']=='TITRE_Z_A' || $_GET['sort']=='AUTEUR_A_Z' || $_GET['sort']=='AUTEUR_Z_A' || $_GET['sort']=='OLDER' || $_GET['sort']=='YOUNGER'))
	{
		$sort=$_GET['sort'];
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

	$simpleSearchCriterias = isGetOk("simpleSearchCriterias");
	$advancedSearchCriterias = isGetOk("advancedSearchCriterias");

	$defaultFacets               = urldecode(isGetOk("facets"));

	$inter_array = parse_ini_file("etc/interface.ini");
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

	$requiredHttpHeader = $inter_array["AuthOriginHttpHeaderName"];
	$AuthOrigin = getHeader($requiredHttpHeader);
	if(NULL == $AuthOrigin)
	{
		echo "HTTP_HEADER[\"AuthOrigin\"] NOT FOUND!!! <br />";
		$AuthOrigin  = $inter_array["DefaultProfil"];
	}

	$opts = [
	"http" => [
		"method" => "GET",
		"header" => "AuthOrigin: ".$AuthOrigin."\r\n"
		]
	];
	$context = stream_context_create($opts);

	$xmlSearchCriterias = new SimpleXMLElement(urldecode((($advancedSearchCriterias)? $advancedSearchCriterias : $simpleSearchCriterias)));
	$parcourXml = new SimpleXMLElement("<parcours>".$parkour."</parcours>");
	xml_adopt($xmlSearchCriterias, $parcourXml);
	$url = $ini_array["CatalogueWebServiceUrl"]."search/all"."?criters=".urlencode($xmlSearchCriterias->asXML());

	if($defaultFacets!=null)
		$url.=("&facets=".urlencode("<facets-wrap>".$defaultFacets."</facets-wrap>"));
	$url.=("&rows=".$rows."&page=".$page."&sort=".$sort);
	//$result = getArrayToXmlIntoUrl($url, "search-criterias", $data);

	echo "<a href=\"".$url."\" target=\"_blank\" style=\"font-size: 12px; font-style: bold;\">URL du WebService de recherche</a>";

	$xml = new DOMDocument('1.0', 'utf-8');
	if(FALSE !== ($searchPage = file_get_contents($url, false, $context)))
	{
		$simpleXml = new SimpleXMLElement($searchPage);
		$xmlTxt =  $simpleXml->asXML();
		$xml->loadXML($xmlTxt);
	}
	else
	{
		trigger_error("It's all messed up");
		throw new Exception("This is nice error handling");
		exit("Could not continue");
		die("it is over");
	}

?>
<div id="facetsdiv" style="margin: 3px; grid-column: 1 / span 2;">
	<div id="facets">
<?php
	if($defaultFacets!=null)
	{
		$xslFacetsDisplayUrl = "xslt/selectedFacets.xsl";
		echo "<a href=\"/".$xslFacetsDisplayUrl."\" target=\"_blank\" style=\"font-size: 12px;\">XSLT utilisée</a>";
		$simpleDefaultFacetsXml = new SimpleXMLElement($defaultFacets);
		$simpleDefaultFacetsXmlTxt =  $simpleDefaultFacetsXml->asXML();
		$simpleDefaultFacetsXml = new DOMDocument('1.0', 'utf-8');
		$simpleDefaultFacetsXml->loadXML($simpleDefaultFacetsXmlTxt);

		$xsl = new DOMDocument;
		$xsl->load($xslFacetsDisplayUrl);

		$proc = new XSLTProcessor();
		$proc->importStyleSheet($xsl);

		echo $proc->transformToXML($simpleDefaultFacetsXml);
	}
?>
		<a class="facet facets" id="facetsShowButton" style="display: block;" onclick="displayFacets(); return false;">Dérouler facettes</a>
		<div class="facets" id="facetsContainer" style="display:none;">
			<a class="facet" style="display: block;" onclick="hideFacets(); return false;">Enrouler facettes</a>
			<br />
<?php
	$xslFacetsUrl = "xslt/searchFacets.xsl";
	echo "<a href=\"/".$xslFacetsUrl."\" target=\"_blank\" style=\"font-size: 12px;\">XSLT utilisée</a>";

	$xsl = new DOMDocument;
	$xsl->load($xslFacetsUrl);

	$proc = new XSLTProcessor();
	$proc->importStyleSheet($xsl);

	echo $proc->transformToXML($xml);
?>
			<br />
			<a class="facet" style="display: block;" onclick="hideFacets(); return false;">Enrouler facettes</a>
		</div>
		<br />
	</div>
</div>
<div id="authoritiesdiv" style="margin: 3px; grid-column: 1 / span 2;">
	<div id="mostRelevantAuthorities">
<?php
	$xslUrl = "xslt/searchMostRelevantAuthorities.xsl";
	echo "<div style='float: right; text-align: right;'>";
	echo "<a href=\"/".$xslUrl."\" target=\"_blank\" style=\"font-size: 12px;\">XSLT utilisée</a>";
	echo "</div>";

	$xsl = new DOMDocument;
	$xsl->load($xslUrl);

	$proc = new XSLTProcessor();
	$proc->importStyleSheet($xsl);

	$proc->setParameter('', 'rebondUrl', "");

	echo $proc->transformToXML($xml);
?>
	</div>
</div>
<div id="pagination" style="padding: 1em; grid-column: 1 / 3">
<?php

	/*$xslUrl = "xslt/orthographicSuggestionsOnline.xsl";

	echo "<div class=\"suggestions\">";

	echo "<a href=\"/".$xslUrl."\" target=\"_blank\" style=\"font-size: 12px;\">XSLT utilisée</a>";

	$xsl = new DOMDocument;
	$xsl->load($xslUrl);

	$proc = new XSLTProcessor();
	$proc->importStyleSheet($xsl);

	$proc->setParameter('', 'rebondUrl', "");

	echo $proc->transformToXML($xml);

	echo "</div>";*/

	$xslUrl = "xslt/searchResultsGlobalPagination.xsl";
	echo "<a href=\"/".$xslUrl."\" target=\"_blank\" style=\"font-size: 12px;\">XSLT utilisée</a>";
	echo "<br />";

	$xsl = new DOMDocument;
	$xsl->load($xslUrl);

	$proc = new XSLTProcessor();
	$proc->importStyleSheet($xsl);
		
	echo $proc->transformToXML($xml);

?>
</div>
<div style="grid-column: 1 / 3">
<?php
	$xslUrl = "xslt/orthographicSuggestions.xsl";

	echo "<div class=\"suggestions\">";

	echo "<a href=\"/".$xslUrl."\" target=\"_blank\" style=\"font-size: 12px;\">XSLT utilisée</a>";

	$xsl = new DOMDocument;
	$xsl->load($xslUrl);

	$proc = new XSLTProcessor();
	$proc->importStyleSheet($xsl);

	$proc->setParameter('', 'rebondUrl', "");

	echo $proc->transformToXML($xml);

	echo "</div>";
?>
</div>
<div id="notices" style="margin: 3px; grid-column: 1;">
<?php
	/*$xslUrl = "xslt/orthographicSuggestions.xsl";

	echo "<div class=\"suggestions\">";

	echo "<a href=\"/".$xslUrl."\" target=\"_blank\" style=\"font-size: 12px;\">XSLT utilisée</a>";

	$xsl = new DOMDocument;
	$xsl->load($xslUrl);

	$proc = new XSLTProcessor();
	$proc->importStyleSheet($xsl);

	$proc->setParameter('', 'rebondUrl', "");

	echo $proc->transformToXML($xml);

	echo "</div>";*/

	$xslUrl = "xslt/searchResultsNoticesOffline.xsl";
	echo "<a href=\"/".$xslUrl."\" target=\"_blank\" style=\"font-size: 12px;\">XSLT utilisée</a>";
	echo "<br />";

	$xsl = new DOMDocument;
	$xsl->load($xslUrl);

	$proc = new XSLTProcessor();
	$proc->importStyleSheet($xsl);
		
	//$proc->setParameter("", "imgUrl", $ini_array["CatalogueWebServiceUrl"]."electre/vignette/");
	$proc->setParameter("", "biblioMondoImgUrl", "https://dev-bpi-musique.bibliomondo.com/in/rest/Thumb/image?id=");
 
	echo $proc->transformToXML($xml);
?>
</div>
<div id="notices-online" style="margin: 3px; grid-column: 2;">
<?php
	/*$xslUrl = "xslt/orthographicSuggestionsOnline.xsl";

	echo "<div class=\"suggestions\">";

	echo "<a href=\"/".$xslUrl."\" target=\"_blank\" style=\"font-size: 12px;\">XSLT utilisée</a>";

	$xsl = new DOMDocument;
	$xsl->load($xslUrl);

	$proc = new XSLTProcessor();
	$proc->importStyleSheet($xsl);

	$proc->setParameter('', 'rebondUrl', "");

	echo $proc->transformToXML($xml);

	echo "</div>";*/

	$xslUrl = "xslt/searchResultsNoticesOnline.xsl";
	echo "<a href=\"/".$xslUrl."\" target=\"_blank\" style=\"font-size: 12px;\">XSLT utilisée</a>";
	echo "<br />";

	$xsl = new DOMDocument;
	$xsl->load($xslUrl);

	$proc = new XSLTProcessor();
	$proc->importStyleSheet($xsl);
		
	//$proc->setParameter("", "imgUrl", $ini_array["CatalogueWebServiceUrl"]."electre/vignette/");
	$proc->setParameter("", "biblioMondoImgUrl", "https://dev-bpi-musique.bibliomondo.com/in/rest/Thumb/image?id=");
 
	echo $proc->transformToXML($xml);
?>
</div>

