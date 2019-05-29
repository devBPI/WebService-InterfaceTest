<?php
	include "utils/phpUtils.php";
	include "utils/postXML.php";

	ini_set('display_errors', 1);
	error_reporting(E_ALL);

	//header("Content-Type: text/xml");
	//header("Content-Type: text/html;charset=utf-8");

	$ini_array = @parse_ini_file("etc/configuration.ini");
	if(!$ini_array)
		$ini_array = parse_ini_file("etc/default.ini");
	if(!$ini_array)
	{
		$errorText.=('&#x26a0 Unable to open configuration file. &#x26a0<br />');
		echo($errorText);
		exit(500);
	}

	if(isset($_GET['indicecdu']))
	{
		$indicecdu = $_GET['indicecdu'];
	}
	else
	{
		echo
			'<fieldset class="middlePart middleErrorMessage">
				<legend>ERROR 500!</legend>'.
				'Missing mandatory fields!!!'
			.'</fieldset>'
		;
		exit(1);
	}

?>

<?php
	$url = $ini_array["CatalogueWebServiceUrl"]."cdu-indexes/around?cduindex=".urlencode($indicecdu);
	$xslUrl = "xslt/feuilletageIndexes.xsl";
	$detailsPage = file_get_contents($url);
?>
<!--<div id="feuilletageIndexes">
	<div>
		<a href="<?php echo $url; ?>" target="_blank" style="font-size: 12px;">URL du WebService</a>
		<br />
		<a href="/<?php echo $xslUrl; ?>" target="_blank" style="font-size: 12px;">XSLT utilisée</a>
		<div id="feuilletageIndexes-title">Feuilletage d'indexes</div>
		<hr />
	</div>-->
<?php

	$returnCode = getHttpCode($http_response_header);
	if($returnCode == "200")
	{
		$simpleXml = new SimpleXMLElement($detailsPage);
		$xmlTxt =  $simpleXml->asXML();
		$xml = new DOMDocument('1.0', 'utf-8');
		$xml->loadXML($xmlTxt);

		$xsl = new DOMDocument;
		$xsl->load($xslUrl);

		$proc = new XSLTProcessor;
		$proc->importStyleSheet($xsl);

		$proc->setParameter('', 'rebondUrl', "");

		//echo $proc->transformToXML($xml);
	}
	else
	{
		echo $returnCode;
		exit($returnCode);
	}
?>
<!--</div>-->

<?php
	$data["indice-cote"] = $indicecdu;
	$xmlData = array_to_xml_main("search-criterias", $data);
	$url = $ini_array["CatalogueWebServiceUrl"]."search/notices"."?criters=".urlencode($xmlData->asXML())."&rows=3";
	$xslUrl = "xslt/searchResultsNotices.xsl";
	$detailsPage = file_get_contents($url);
?>
<div id="sameTheme">
	<div>
		<a href="<?php echo $url; ?>" target="_blank" style="font-size: 12px;">URL du WebService</a>
		<br />
		<a href="/<?php echo $xslUrl; ?>" target="_blank" style="font-size: 12px;">XSLT utilisée</a>
	</div>
	<div>Sur le même thème dans le catalogue :</div>
<?php

	$returnCode = getHttpCode($http_response_header);
	if($returnCode == "200")
	{
		$simpleXml = new SimpleXMLElement($detailsPage);
		$xmlTxt =  $simpleXml->asXML();
		$xml = new DOMDocument('1.0', 'utf-8');
		$xml->loadXML($xmlTxt);

		$xsl = new DOMDocument;
		$xsl->load($xslUrl);

		$proc = new XSLTProcessor;
		$proc->importStyleSheet($xsl);

		$proc->setParameter("", "imgUrl", $ini_array["CatalogueWebServiceUrl"]."electre/vignette/");
		$proc->setParameter("", "biblioMondoImgUrl", "https://dev-bpi-musique.bibliomondo.com/in/rest/Thumb/image?id=");

		echo $proc->transformToXML($xml);
	}
	else
	{
		echo $returnCode;
		exit($returnCode);
	}
?>

<!--	<hr />-->

<?php
	$data["indice-cote"] = $indicecdu;
	$xmlData = array_to_xml_main("search-criterias", $data);
	$url = $ini_array["CatalogueWebServiceUrl"]."search/notices-online"."?criters=".urlencode($xmlData->asXML())."&rows=5";
	$xslUrl = "xslt/searchResultsNoticesOnline.xsl";
	$detailsPage = file_get_contents($url);
?>
<!--	<hr />
	<div>
		<a href="<?php echo $url; ?>" target="_blank" style="font-size: 12px;">URL du WebService</a>
		<br />
		<a href="/<?php echo $xslUrl; ?>" target="_blank" style="font-size: 12px;">XSLT utilisée</a>
	</div>
	<div>Sur le même thème en ligne :</div>-->
<?php

	$returnCode = getHttpCode($http_response_header);
	if($returnCode == "200")
	{
		$simpleXml = new SimpleXMLElement($detailsPage);
		$xmlTxt =  $simpleXml->asXML();
		$xml = new DOMDocument('1.0', 'utf-8');
		$xml->loadXML($xmlTxt);

		$xsl = new DOMDocument;
		$xsl->load($xslUrl);

		$proc = new XSLTProcessor;
		$proc->importStyleSheet($xsl);

		$proc->setParameter("", "imgUrl", $ini_array["CatalogueWebServiceUrl"]."electre/vignette/");
		$proc->setParameter("", "biblioMondoImgUrl", "https://dev-bpi-musique.bibliomondo.com/in/rest/Thumb/image?id=");

		//echo $proc->transformToXML($xml);
	}
	else
	{
		echo $returnCode;
		exit($returnCode);
	}
?>
<!--</div>-->

<?php
	print str_pad('',4096)."\n";
	ob_flush();
	flush();
	set_time_limit(45);
?>
