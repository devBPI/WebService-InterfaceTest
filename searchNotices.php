<?php
	$errorText="";
	if(!isset($_GET['text']) || $_GET['text']=='' || $_GET['text']==null)
	{
		$errorText.=('&#x26a0 Missing text. &#x26a0<br />');
		echo($errorText);
		exit(500);
	}
	$page=1;
	if(isset($_GET['page']) && is_numeric($_GET['page']) && $_GET['page']>=1)
	{
		$page=$_GET['page'];
	}

	$ini_array = parse_ini_file("etc/configuration.ini");

	ini_set("display_errors",1);
	error_reporting(E_ALL);

	header("Content-Type: text/xml");
	header("Content-Type: text/html;charset=utf-8");
	$url = $ini_array["url"].'search/notices?page='.$page.'&general='.urlencode($_GET['text']);

	$searchPage = file_get_contents($url);

	$simpleXml = new SimpleXMLElement($searchPage);
	$xmlTxt =  $simpleXml->asXML();
	$xml = new DOMDocument();
	$xml->loadXML($xmlTxt);

	$xsl = new DOMDocument;
	$xsl->load('xslt/searchResultsNotices.xsl');

	$proc = new XSLTProcessor();
	$proc->importStyleSheet($xsl);
	 
	echo $proc->transformToXML($xml);
