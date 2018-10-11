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
	$rows=20;
	if(isset($_GET['rows']) && is_numeric($_GET['rows']) && ($_GET['rows']==20 || $_GET['rows']==40 || $_GET['rows']==100))
	{
		$rows=$_GET['rows'];
	}

	$ini_array = parse_ini_file("etc/configuration.ini");

	ini_set("display_errors",1);
	error_reporting(E_ALL);

	header("Content-Type: text/xml");
	header("Content-Type: text/html;charset=utf-8");
	$url = $ini_array["url"].'search/notices?page='.$page.'&rows='.$rows.'&general='.urlencode($_GET['text']);
	$xslUrl = "xslt/searchResultsNotices.xsl";

	echo "<a href=\"".$url."\" target=\"_blank\" style=\"font-size: 12px;\">URL du WebService</a>";
	echo "<br />";
	echo "<a href=\"".$xslUrl."\" target=\"_blank\" style=\"font-size: 12px;\">XSLT utilisée</a>";

	$searchPage;
	if(FALSE !== ($searchPage = file_get_contents($url)))
	{
		$simpleXml = new SimpleXMLElement($searchPage);
		$xmlTxt =  $simpleXml->asXML();
		$xml = new DOMDocument();
		$xml->loadXML($xmlTxt);

		$xsl = new DOMDocument;
		$xsl->load($xslUrl);

		$proc = new XSLTProcessor();
		$proc->importStyleSheet($xsl);
	 
		echo $proc->transformToXML($xml);
	}
	else
	{
		trigger_error("It's all messed up");
		throw new Exception("This is nice error handling");
		exit("Could not continue");
		die("it is over");
	}
