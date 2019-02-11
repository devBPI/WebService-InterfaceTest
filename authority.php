<?php
	function getHttpCode($http_response_header)
	{
		if(is_array($http_response_header))
		{
			$parts=explode(' ', $http_response_header[0]);
			if(count($parts) > 1)
				return intval($parts[1]); //Get code
		}
		return 0;
	}

	$errorText="";
	if(!isset($_GET['permalink']) || $_GET['permalink']=='' || $_GET['permalink']==null)
	{
		$errorText.=('&#x26a0 Missing text. &#x26a0<br />');
		echo($errorText);
		exit(500);
	}

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


	#header("Content-Type: text/xml");
	//$autocomplete_page = file_get_contents('http://10.1.20.44:8983/solr/index_notices/autocomplete?q='.$_GET['text']);
	$url = $ini_array["CatalogueWebServiceUrl"]."details/authority/".$_GET['permalink'];
	$xslUrl = "xslt/authority.xsl";
	$detailsPage = file_get_contents($url);
	#var_dump($http_response_header);

	echo "<a href=\"".$url."\" target=\"_blank\" style=\"font-size: 12px;\">URL du WebService</a>";
	echo "<br />";
	echo "<a href=\"/".$xslUrl."\" target=\"_blank\" style=\"font-size: 12px;\">XSLT utilisée</a>";

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

		$proc->setParameter('', 'mappedNoticesUrl', $ini_array["CatalogueWebServiceUrl"]."details/authority/");

		echo $proc->transformToXML($xml);
	}
	else
	{
		echo $returnCode;
		exit($returnCode);
	}
