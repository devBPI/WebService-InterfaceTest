<?php
	$errorText="";
	if(!isset($_GET['text']) || $_GET['text']=='' || $_GET['text']==null)
	{
		$errorText.=('&#x26a0 Missing text. &#x26a0<br />');
		echo($errorText);
	}
	else
	{
		header("Content-Type: text/xml");
		//$autocomplete_page = file_get_contents('http://10.1.20.44:8983/solr/index_notices/autocomplete?q='.$_GET['text']);
		$autocomplete_page = file_get_contents('http://10.1.2.91:8080/autocomplete?word='.$_GET['text']);
		/*echo('http://10.1.20.44:8983/solr/index_notices/autocomplete?q='.$_GET['text']);
		echo('<br />');*/
		//echo $autocomplete_page;
		$xml = new SimpleXMLElement($autocomplete_page);
		$result = $xml->xpath("/autocomplete/suggestions/suggestion");
		echo "<results>";
		while(list( , $node) = each($result))
		{
			echo "<result>".$node."</result>";
		}
		echo "</results>";
	}
?>
