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
	if(!isset($_GET['permalink']) || $_GET['permalink']=='' || $_GET['permalink']==null)
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
	header("Content-Type: text/html;charset=utf-8");


	#header("Content-Type: text/xml");
	//$autocomplete_page = file_get_contents('http://10.1.20.44:8983/solr/index_notices/autocomplete?q='.$_GET['text']);
	$url = $ini_array["CatalogueWebServiceUrl"]."details/notice/".$_GET['permalink'];
	$xslHeadUrl = "xslt/noticeHead.xsl";
	$xslBodyUrl = "xslt/noticeBody.xsl";
	$detailsPage = file_get_contents($url);
	#var_dump($http_response_header);

	$returnCode = getHttpCode($http_response_header);
	if($returnCode == "200")
	{
		$simpleXml = new SimpleXMLElement($detailsPage);
		$xmlTxt =  $simpleXml->asXML();
		$xml = new DOMDocument('1.0', 'utf-8');
		$xml->loadXML($xmlTxt);
	?>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<?php
			$xsl = new DOMDocument;
			$xsl->load($xslHeadUrl);

			$proc = new XSLTProcessor;
			$proc->importStyleSheet($xsl);

			echo $proc->transformToXML($xml);
		?>
		<link rel="stylesheet" type="text/css" href="../../../../css/body.css" />
		<style type="text/css" media="screen"></style>

		<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js" type="text/javascript" language="javascript"></script>
		<script src="../../../../js/notice.js" type="text/javascript" language="javascript"></script>
		<script type="text/javascript" language="javascript">
		</script>
	</head>
	<body>
		<a href="<?php echo $url; ?>" target="_blank" style="font-size: 12px;">URL du WebService</a>
		<br />
		<a href="/<?php echo $xslBodyUrl; ?>" target="_blank" style="font-size: 12px;">XSLT utilisée</a>
		<?php
			$xsl = new DOMDocument;
			$xsl->load($xslBodyUrl);

			$proc = new XSLTProcessor;
			$proc->importStyleSheet($xsl);

			$proc->setParameter('', 'rebondUrl', "");

			$proc->setParameter('', 'couvUrl', $ini_array["CatalogueWebServiceUrl"]."electre/couverture/");
			$proc->setParameter('', 'quatrUrl', $ini_array["CatalogueWebServiceUrl"]."electre/quatrieme/");
			$proc->setParameter('', 'tabMatUrl', $ini_array["CatalogueWebServiceUrl"]."electre/tabledesmatieres/");

			echo $proc->transformToXML($xml);
		}
		else
		{
			echo $returnCode;
			exit($returnCode);
		}
		?>
		<!--<div id="feuilletageIndexes"></div>-->
	</body>
</html>
