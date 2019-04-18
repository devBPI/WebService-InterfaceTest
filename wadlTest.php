<?php
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

	include "utils/postXML.php";

	header("Content-Type: text/xml");
	header("Content-Type: text/html;charset=utf-8");
	$url = $ini_array["CatalogueWebServiceUrl"]."search/notices-get-crit";
	echo "<a href=\"".$url."\" target=\"_blank\" style=\"font-size: 12px;\">URL du WebService</a><br />";

	$data = array('general' => 'YES');
	$url = $ini_array["CatalogueWebServiceUrl"]."search/notices-crit";
	$result = postArrayToXmlIntoUrl($url, "search-criterias", $data);

	$url = $ini_array["CatalogueWebServiceUrl"]."search/notices-get-crit";
	$result = getArrayToXmlIntoUrl($url, "search-criterias", $data);

	//print_r($xml_data->asXML());

	var_dump($result);

