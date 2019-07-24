<html xmlns="http://www.w3.org/1999/xhtml">
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

	$url = $ini_array["CatalogueWebServiceUrl"]."details/test-header";

	$opts = [
	"http" => [
		"method" => "GET",
		"header" => "Accept-language: en\r\n" .
		"AuthOrigin: INTERNET\r\n" .
		"Cookie: foo=bar\r\n"
		]
	];
	$context = stream_context_create($opts);

	$detailsPage = file_get_contents($url, false, $context);
	#var_dump($http_response_header);

	$returnCode = getHttpCode($http_response_header);
	if($returnCode == "200")
	{
		echo $detailsPage;
	}
	else
	{
		echo $returnCode;
		exit($returnCode);
	}
