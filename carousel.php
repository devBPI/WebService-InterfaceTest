<?php
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

	$url = $ini_array["CatalogueWebServiceUrl"];//.'carousel/general';
	if(isset($parkour) && $parkour!=null && $parkour!='')
	{
		switch($parkour)
		{
			case "autoformation":
				$url.='carousel/autoformation';
			break;
			case "cinema":
				$url.='carousel/cinema';
			break;
			case "presse":
				$url.='carousel/presse';
			break;
			default:
				$url.='carousel/general';
			break;
		}
	}
	//echo $url;
	$xslUrl = 'xslt/carousel.xsl';
?>
	<a href="<?php echo $url; ?>" target="_blank" style="font-size: 12px;">URL du WebService</a>
	<br />
	<a href="/<?php echo $xslUrl; ?>" target="_blank" style="font-size: 12px;">XSLT utilisée</a>
<?php

	$searchPage = file_get_contents($url);

	$simpleXml = new SimpleXMLElement($searchPage);
	$xmlTxt =  $simpleXml->asXML();
	$xml = new DOMDocument();
	$xml->loadXML($xmlTxt);

	$xsl = new DOMDocument;
	$xsl->load($xslUrl);

	$proc = new XSLTProcessor();
	$proc->importStyleSheet($xsl);
	 
	echo $proc->transformToXML($xml);
