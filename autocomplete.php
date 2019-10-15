<?php
	$errorText="";
	$criteria="";
	if(isset($_GET['criteria']) && $_GET['criteria']!=null && $_GET['criteria']!='')
	{
		switch($_GET['criteria'])
		{
			case "general":
			case "titre":
			case "auteur":
			case "realisateur":
			case "sujet":
			case "theme":
			case "editeur":
			case "collection":
			$criteria="criteria=".$_GET['criteria']."&";
			break;
		}
	}
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

	header("Content-Type: text/xml");
	//$autocomplete_page = file_get_contents('http://10.1.20.44:8983/solr/index_notices/autocomplete?q='.$_GET['text']);

	$url = $ini_array["CatalogueWebServiceUrl"]."autocomplete/notices?".$criteria."word=".urlencode($_GET['text']);
	//$autocomplete_page = file_get_contents('http://10.1.2.91:8080/autocomplete?word='.$_GET['text']);
	$autocomplete_page = file_get_contents($url);
	/*echo('http://10.1.20.44:8983/solr/index_notices/autocomplete?q='.$_GET['text']);
	echo('<br />');*/
	//echo $autocomplete_page;
	$xml = new SimpleXMLElement($autocomplete_page);
	$result = $xml->xpath("/suggestions-list/suggestions/suggestion");
	echo "<results>";
	while(list( , $node) = each($result))
	{
		echo "<result>".$node."</result>";
	}
	echo "</results>";
