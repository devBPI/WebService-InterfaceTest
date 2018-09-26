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
	}
	else
	{
		#header("Content-Type: text/xml");
		//$autocomplete_page = file_get_contents('http://10.1.20.44:8983/solr/index_notices/autocomplete?q='.$_GET['text']);
		$url = 'http://10.1.2.91:8080/details/notice/'.$_GET['permalink'];
		$autocomplete_page = file_get_contents($url);
		#var_dump($http_response_header);

		$returnCode = getHttpCode($http_response_header);
		if($returnCode != "200")
		{
			echo $returnCode;
		}
		else
		{
			/*echo('http://10.1.20.44:8983/solr/index_notices/autocomplete?q='.$_GET['permalink']);
			echo('<br />');*/
			//echo $autocomplete_page;
			$xml = new SimpleXMLElement($autocomplete_page);

			echo $xml->asXML();

			$xsl = new DOMDocument('1.0', 'utf-8');

			$xsl->load('xsl/notice.xsl');

			$proc = new XSLTProcessor;
			$proc->importStyleSheet($xsl);
			echo $proc->transformToXML($xml);

			//$xml = substr($xml, strpos($xml, '?'.'>') + 2);

			//$dom = dom_import_simplexml($xml);
			//echo $dom->ownerDocument->saveXML($dom->ownerDocument->documentElement);

			//$t_xml = new DOMDocument();
			//$t_xml->loadXML($xml->asXML());
			//$xml_out = $t_xml->saveXML($t_xml->documentElement);

			//$xml = substr($xml, strpos($xml, '?'.'>') + 2);

			/*$result = $xml->xpath("/notice/titres/titre");
			echo "<results>";
			echo "<url>".$url."</url>";
			while(list( , $node) = each($result))
			{
				echo "<result>".$node."</result>";
			}
			echo "</results>";*/
		}
	}
?>
