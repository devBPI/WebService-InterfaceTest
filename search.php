<?php
	$errorText="";
	if(!isset($_GET['text']) || $_GET['text']=='' || $_GET['text']==null)
	{
		$errorText.=('&#x26a0 Missing text. &#x26a0<br />');
		echo($errorText);
	}
	else
	{
		//echo $_GET['text'];
		header("Content-Type: text/xml");
		$url = 'http://10.1.2.91:8080/search/search-notices?general='.urlencode($_GET['text']).'';
		//$url = urlencode('http://10.1.2.91:8080/search/search-notices?general='.$_GET['text'].'');
		//echo '\n'.$url;
		$autocomplete_page = file_get_contents($url);
		/*echo('http://10.1.20.44:8983/solr/index_notices/autocomplete?q='.$_GET['text']);
		echo('<br />');*/
		//echo $autocomplete_page;
		$xml = new SimpleXMLElement($autocomplete_page);

		//echo $xml->asXML();

		/*$result = $xml->xpath("/results/notices/notice/titres/titre");
		echo "<div>";
		while(list( , $node) = each($result))
		{
			echo "<div>".$node."</div>";
		}
		echo "</div>";*/

		echo "<div id='notices'>";
		$notices = $xml->xpath("/results/notices/notice");
		while(list( , $notice) = each($notices))
		{
			echo "<div class='notice'>";

				$titres = $notice->xpath("titres/titre");
				echo "<div class='titres'>";
				while(list( , $titre) = each($titres))
				{
					echo "<div>$titre</div>";
				}
				echo "</div>";

				$auteurs = $notice->xpath("auteurs/auteur");
				echo "<div class='auteurs'>";
				while(list( , $auteur) = each($auteurs))
				{
					echo "<div>$auteur</div>";
				}
				echo "</div>";
				$permalinks = $notice->xpath("permalink");
				echo "<div class='permalinks'>";
				while(list( , $permalink) = each($permalinks))
				{
					echo "<a href=\"./notice/".$permalink."\">".$permalink."</a>";
				}
				echo "</div>";

			echo "</div>";
		}
		echo "</div>";
	}
?>
