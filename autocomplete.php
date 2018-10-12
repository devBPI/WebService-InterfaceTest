<?php
	$errorText="";
	if(!isset($_GET['text']) || $_GET['text']=='' || $_GET['text']==null)
	{
		$errorText.=('&#x26a0 Missing text. &#x26a0<br />');
		echo($errorText);
		exit(500);
	}

	$ini_array = parse_ini_file("etc/configuration.ini");

	ini_set("display_errors",1);
	error_reporting(E_ALL);

	header("Content-Type: text/xml");
	//$autocomplete_page = file_get_contents('http://10.1.20.44:8983/solr/index_notices/autocomplete?q='.$_GET['text']);
	$url = $ini_array["CatalogueWebServiceUrl"].'autocomplete/notices?word='.urlencode($_GET['text']).'';
	//$autocomplete_page = file_get_contents('http://10.1.2.91:8080/autocomplete?word='.$_GET['text']);
	$autocomplete_page = file_get_contents($url);
	/*echo('http://10.1.20.44:8983/solr/index_notices/autocomplete?q='.$_GET['text']);
	echo('<br />');*/
	//echo $autocomplete_page;
	$xml = new SimpleXMLElement($autocomplete_page);
	$result = $xml->xpath("/autocomplete/suggestions/suggestion");
	echo "<results>";
	while(list( , $node) = each($result))
	{
		echo "<result>".$node."</result>";
	}
	echo "</results>";
