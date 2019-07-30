<?php
	include "utils/phpUtils.php";

	ini_set('display_errors', 1);
	error_reporting(E_ALL);

	header("Content-Type: text/xml");
	header("Content-Type: text/html;charset=utf-8");

	$ini_array = @parse_ini_file("etc/configuration.ini");
	if(!$ini_array)
		$ini_array = parse_ini_file("etc/default.ini");
	if(!$ini_array)
	{
		$errorText.=('&#x26a0 Unable to open configuration file. &#x26a0<br />');
		echo($errorText);
		exit(500);
	}

	if(isset($_GET['key'])
	&& isset($_GET['id'])
	&& isset($_GET['rows'])
	&& isset($_GET['count'])
	&& isset($_GET['page'])
	&& isset($_GET['numPages'])
	&& is_numeric($_GET['rows'])
	&& is_numeric($_GET['count'])
	&& is_numeric($_GET['page'])
	&& is_numeric($_GET['numPages']))
	{
		$key      = $_GET['key'];
		$id       = $_GET['id'];
		$rows     = $_GET['rows'];
		$count    = $_GET['count'];
		$page     = $_GET['page'];
		$numPages = $_GET['numPages'];
	}
	else
	{
		echo
			'<fieldset class="middlePart middleErrorMessage">
				<legend>ERROR 500!</legend>'.
				'Missing mandatory fields!!!'
			.'</fieldset>'
		;
		exit(1);
	}
?>
<fieldset style="/*min-height: 120px;*/">
	<legend><?php echo $count; ?> notices de type <?php echo $key; ?></legend>
<?php
	$url = $ini_array["CatalogueWebServiceUrl"]."details/indice-cdu/".$id."/notices/".$key."?page=".$page."&rows=".$rows;
	//$url = $ini_array["CatalogueWebServiceUrl"]."details/notice/".$_GET['permalink'];
	$xslUrl = "xslt/mappedNotices.xsl";
	$detailsPage = file_get_contents($url);
	#var_dump($http_response_header);
?>
	<div>
		<a href="<?php echo $url; ?>" target="_blank" style="font-size: 12px;">URL du WebService</a>
		<br />
		<a href="/<?php echo $xslUrl; ?>" target="_blank" style="font-size: 12px;">XSLT utilisée</a>
	</div>
<?php
	if($page>$numPages)
		$page=$numPages;
	if($page<=0)
		$page=1;

//loadMappedNotices(this.parentNode.parentNode.parentNode, \'' . $key . '\', ' . $id . ', ' .$count . ', ' . $page .');
	echo '<span style="line-height: 30px;">Page ' . $page . '/' . $numPages.'</span>';
	echo '<span style="float: right;">';
	echo '<span onclick="loadMappedNotices(this.parentNode.parentNode.parentNode, \'' . $key . '\', ' . $id . ', ' .$count . ', 1);" class="pageButton clickablePageButton">≪</span>';
	echo '<span onclick="loadMappedNotices(this.parentNode.parentNode.parentNode, \'' . $key . '\', ' . $id . ', ' .$count . ', ' . ($page-1) . ');" class="pageButton clickablePageButton"><</span>';
	if($page>3)
	{
		echo '<span class="pageButton">...</span>';
	}
	if($page>2)
	{
		echo '<span onclick="loadMappedNotices(this.parentNode.parentNode.parentNode, \'' . $key . '\', ' . $id . ', ' .$count . ', ' . ($page-2) .');" class="pageButton clickablePageButton">' . ($page-2) . '</span>';
	}
	if($page>1)
	{
		echo '<span onclick="loadMappedNotices(this.parentNode.parentNode.parentNode, \'' . $key . '\', ' . $id . ', ' .$count . ', ' . ($page-1) .');" class="pageButton clickablePageButton">' . ($page-1) . '</span>';
	}
	echo '<span class="pageButton" style="font-size: 115%; font-weight: bold;">' . ($page) . '</span>';
	if($page<=$numPages-1)
	{
		echo '<span onclick="loadMappedNotices(this.parentNode.parentNode.parentNode, \'' . $key . '\', ' . $id . ', ' .$count . ', ' . ($page+1) .');" class="pageButton clickablePageButton">' . ($page+1) . '</span>';
	}
	if($page<=$numPages-2)
	{
		echo '<span onclick="loadMappedNotices(this.parentNode.parentNode.parentNode, \'' . $key . '\', ' . $id . ', ' .$count . ', ' . ($page+2) .');" class="pageButton clickablePageButton">' . ($page+2) . '</span>';
	}
	if($page<=$numPages-3)
	{
		echo '<span class="pageButton">...</span>';
	}
	echo '<span onclick="loadMappedNotices(this.parentNode.parentNode.parentNode, \'' . $key . '\', ' . $id . ', ' .$count . ', ' . ($page+1) .');" class="pageButton clickablePageButton">></span>';
	echo '<span onclick="loadMappedNotices(this.parentNode.parentNode.parentNode, \'' . $key . '\', ' . $id . ', ' .$count . ', ' . ($numPages) .');" class="pageButton clickablePageButton">≫</span>';
	echo '</span>';

	$returnCode = getHttpCode($http_response_header);
	if($returnCode == "200")
	{
		$simpleXml = new SimpleXMLElement($detailsPage);
		$xmlTxt =  $simpleXml->asXML();
		$xml = new DOMDocument('1.0', 'utf-8');
		$xml->loadXML($xmlTxt);

		$xsl = new DOMDocument;
		$xsl->load($xslUrl);

		$proc = new XSLTProcessor;
		$proc->importStyleSheet($xsl);

		/*$proc->setParameter('', 'couvUrl', $ini_array["CatalogueWebServiceUrl"]."electre/couverture/");
		$proc->setParameter('', 'quatrUrl', $ini_array["CatalogueWebServiceUrl"]."electre/quatrieme/");
		$proc->setParameter('', 'tabMatUrl', $ini_array["CatalogueWebServiceUrl"]."electre/tabledesmatieres/");
*/
		echo $proc->transformToXML($xml);
	}
	else
	{
		echo $returnCode;
		exit($returnCode);
	}


/*
		echo '<table style="width: 100%; cursor: default; border-collapse: collapse;">';
		$i = 0;
		echo
		'<tr>
			<th style="padding-left: 2px; padding-right: 2px;">Manifestation</th>
			<th style="padding-left: 2px; padding-right: 2px;">À</th>
			<th style="padding-left: 2px; padding-right: 2px;">Le</th>
			<th style="padding-left: 2px; padding-right: 2px;">De</th>
			<th style="padding-left: 2px; padding-right: 2px;">Au</th>
		</tr>';
		while($data = mysql_fetch_assoc($req))
		{
			//echo print_r($data) . '<br/>';
			$date = $data[debut_reservation];

			$date = substr($date, 6, 2) . '/' . substr($date, 4, 2) . '/' . substr($date, 0, 4);
			$debut = substr($data[debut_reservation], 8, 2) . 'h' . substr($data[debut_reservation], 10, 2);
			$fin = substr($data[fin_reservation], 8, 2) . 'h' . substr($data[fin_reservation], 10, 2);

			echo
			'<tr class="hoverable" style="cursor: pointer;" onclick = "location.href=\'/?menu=evenement&eventID='.$data[ID].'\'">
				<td style="padding-left: 2px; padding-right: 2px;">'.$data[intitule].'</td>
				<td style="padding-left: 2px; padding-right: 2px;">'.$data[lieu].'</td>
				<td style="padding-left: 2px; padding-right: 2px; text-align: center;">'.$date.'</td>
				<td style="padding-left: 2px; padding-right: 2px; text-align: center;">'.$debut.'</td>
				<td style="padding-left: 2px; padding-right: 2px; text-align: center;">'.$fin.'</td>
			</tr>';
		echo '</table>';
	}
*/

?>
</fieldset>
