<?php
	$errorText="";

	$ini_array = @parse_ini_file("etc/configuration.ini");
	if(!$ini_array)
		$ini_array = @parse_ini_file("etc/default.ini");
	if(!$ini_array)
	{
		$errorText.=('&#x26a0 Unable to open configuration file. &#x26a0<br />');
		echo($errorText);
		exit(500);
	}

	ini_set("display_errors",1);
	error_reporting(E_ALL);

	#header("Content-Type: text/html;charset=utf-8");
	$url = $ini_array["CatalogueWebServiceUrl"].'appliinfo/version';

	$searchPage = file_get_contents($url);

	echo $searchPage;
