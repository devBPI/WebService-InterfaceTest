<?php
include "php/xmlUtils.php";

function postSimpleXML($url, $xmlData)
{
	$data = array('paramImg' => 'value', "general" => "urb", "criters" => $xmlData->asXML());
	$options = array(
		'http' => array(
			'header'  => "Content-type: application/x-www-form-urlencoded",
			'method'  => 'POST',
			'content' => http_build_query($data),
		)
	);

	$context  = stream_context_create($options);
	return file_get_contents($url, false, $context);
}

function postArrayToXmlIntoUrl($url, $xmlName, $data)
{
	return postSimpleXML($url, array_to_xml_main($xmlName, $data));
}

function getSimpleXML($url, $xmlData)
{
	$uri = $url."?criters=".urlencode($xmlData->asXML());
	return file_get_contents($uri);
}

function getArrayToXmlIntoUrl($url, $xmlName, $data)
{
	return getSimpleXML($url, array_to_xml_main($xmlName, $data));
}

