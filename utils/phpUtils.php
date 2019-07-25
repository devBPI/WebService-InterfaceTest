<?php
function isGetOk($txt)
{
	$result=null;
	if(isset($_GET[$txt]) && $_GET[$txt]!=null && $_GET[$txt]!="")
	$result=$_GET[$txt];
	return $result;
}

function encodeStringForInput($s)
{
	//return $s;
	//return htmlentities($s, ENT_COMPAT|ENT_QUOTES|ENT_HTML5,'ISO-8859-1', true);
	return htmlspecialchars($s, ENT_COMPAT|ENT_QUOTES|ENT_HTML5);
}

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

function getHeader($headerName)
{
	$allHeaders = getAllHeaders();
	$requiredHttpHeader = $headerName;
	$requiredHeader = NULL;
	if(array_key_exists($requiredHttpHeader, $allHeaders))
		$requiredHeader = $allHeaders[$requiredHttpHeader];
	return $requiredHeader;
}
