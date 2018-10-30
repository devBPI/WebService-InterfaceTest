<?php
function isGetOk($txt)
{
	$result=null;
	if(isset($_GET[$txt]) && $_GET[$txt]!=null && $_GET[$txt]!="")
	$result=$_GET[$txt];
	return $result;
}
