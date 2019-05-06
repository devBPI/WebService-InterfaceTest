<?php
	$errorText="";
	if(!isset($_GET['text']) || $_GET['text']=='' || $_GET['text']==null)
	{
		$errorText.=('&#x26a0 Missing text. &#x26a0<br />');
		echo($errorText);
		exit(500);
	}

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

	#header("Content-Type: text/html;charset=utf-8");
	header("Content-Type: text/xml");
	$url = $ini_array["url"].'search/notices?general='.urlencode($_GET['text']).'';

	$searchPage = file_get_contents($url);

	$simpleXml = new SimpleXMLElement($searchPage);
	$xmlTxt =  $simpleXml->asXML();
	$xml = new DOMDocument();
	$xml->loadXML($xmlTxt);

	$xsl = new DOMDocument;
	$xsl->load('xslt/searchResults.xsl');

	$proc = new XSLTProcessor();
	$proc->importStyleSheet($xsl);
	 
	echo $proc->transformToXML($xml);
