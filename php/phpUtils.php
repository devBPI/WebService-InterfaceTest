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
	return htmlentities($s, ENT_COMPAT|ENT_QUOTES,'ISO-8859-1', true); 
}
