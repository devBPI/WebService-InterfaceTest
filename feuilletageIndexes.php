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

	if(isset($_GET['indicecdu']))
	{
		$indicecdu = $_GET['indicecdu'];
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

	echo $indicecdu;
?>


<fieldset style="/*min-height: 120px;*/">
	<legend><?php echo $count; ?> notices de type <?php echo $key; ?></legend>
<?php
	$url = $ini_array["CatalogueWebServiceUrl"]."cdu-indexes/around?cduindex=".$indicecdu;
	$xslUrl = "xslt/feuilletageIndexes.xsl";
	$detailsPage = file_get_contents($url);
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

		echo $proc->transformToXML($xml);
	}
	else
	{
		echo $returnCode;
		exit($returnCode);
	}
?>
</fieldset>
