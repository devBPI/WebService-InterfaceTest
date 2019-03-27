<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<?php
	include "php/phpUtils.php";

	ini_set("display_errors",1);
	$defaultSearchText           = urldecode(isGetOk("general"));
	$defaultTitre                = urldecode(isGetOk("titre"));
	$defaultAuteur               = urldecode(isGetOk("auteur"));
	$defaultSujet                = urldecode(isGetOk("sujet"));
	$defaultIsbnIssnCommercial   = urldecode(isGetOk("isbnissncommercial"));
	$defaultIndiceCote           = urldecode(isGetOk("indicecote"));
	$defaultDatePublication      = urldecode(isGetOk("datepublication"));
	$defaultRealisateur          = urldecode(isGetOk("realisateur"));
	$defaultTheme                = urldecode(isGetOk("theme"));
	$defaultBaseRecherche        = urldecode(isGetOk("baserecherche"));
	$defaultEditeur              = urldecode(isGetOk("editeur"));
	$defaultCollection           = urldecode(isGetOk("collection"));
	$defaultDatePublicationStart = urldecode(isGetOk("datepublicationstart"));
	$defaultDatePublicationEnd   = urldecode(isGetOk("datepublicationend"));
	$defaultLangue               = urldecode(isGetOk("langue"));
	$defaultType                 = urldecode(isGetOk("type"));
	$defaultSupport              = urldecode(isGetOk("support"));
	$defaultGenreMusic           = urldecode(isGetOk("genremusic"));
	$defaultGenreFilm            = urldecode(isGetOk("genrefilm"));
	$defaultGenreLitt            = urldecode(isGetOk("genrelitt"));
	$defaultSecteur              = urldecode(isGetOk("secteur"));
	$defaultAudience             = urldecode(isGetOk("audience"));
	$defaultFacets               = urldecode(isGetOk("facets"));
	
	$ini_array = parse_ini_file("etc/configuration.ini");
	if(!$ini_array)
		$ini_array = parse_ini_file("etc/default.ini");
	if(!$ini_array)
	{
		$errorText.=('&#x26a0 Unable to open configuration file. &#x26a0<br />');
		echo($errorText);
		exit(500);
	}
	/*print_r($ini_array);
	echo $ini_array["url"];*/

?>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>Interface WebService Test</title>
		<link rel="stylesheet" type="text/css" href="/css/body.css" />
		<link rel="stylesheet" type="text/css" href="/css/head.css" />
		<link rel="stylesheet" type="text/css" href="/css/middle.css" />
		<link rel="stylesheet" type="text/css" href="/css/foot.css" />
		<link rel="stylesheet" type="text/css" href="/css/accessories.css" />
		<link rel="stylesheet" type="text/css" href="/css/table.css" />
		<link rel="stylesheet" type="text/css" href="/css/searchbar.css" />
		<link rel="stylesheet" type="text/css" href="/css/notices.css" />
		<link rel="stylesheet" type="text/css" href="/css/facets.css" />
		<link rel="stylesheet" type="text/css" href="/css/authorities.css" />
		<style type="text/css" media="screen"></style>

		<!-- BOOTSTRAP -->
		<!--<link href="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js"></script>
		<link href="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/css/bootstrap-multiselect.css" rel="stylesheet" type="text/css" />
		<script src="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/js/bootstrap-multiselect.js" type="text/javascript"></script>-->
		<!-- BOOTSTRAP -->

		<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js" type="text/javascript" language="javascript"></script>
		<script src="/js/search.js"         type="text/javascript" language="javascript"></script>
		<script src="/js/advancedsearch.js" type="text/javascript" language="javascript"></script>
		<script src="/js/authorities.js"    type="text/javascript" language="javascript"></script>
		<script src="/js/facets.js"         type="text/javascript" language="javascript"></script>

		<script type="text/javascript" language="javascript">
		</script>

	</head>
	<body>
		<div class="pageHead" style="margin-bottom:6px;">
			<div style="float:right; text-align:right;">
				<?php
					echo "<p>Catalog Webservice version : ";
					include('getWebServiceVersion.php');
					echo "</p>";
					echo "<a target=\"_blank\" href=\"".$ini_array["CatalogueWebServiceUrl"]."\">WebService Doc</a>";
					echo "<br />";
					echo "<a target=\"_blank\" href=\"".$ini_array["CatalogueWebServiceUrl"]."application.wadl\">WADL File</a>";
					echo "<br />";
					echo "<a target=\"_blank\" href=\"".$ini_array["CatalogueWebServiceUrl"]."api/swagger.json\">swagger.json</a>";
					echo "<br />";
					echo "<a target=\"_blank\" href=\"".$ini_array["CatalogueWebServiceUrl"]."webjars/swagger-ui/3.17.6/index.html?url=".$ini_array["CatalogueWebServiceUrl"]."api/swagger.json\">SWAGGER</a>";
					//echo "<br />INTERFACE 1";
				?>
			</div>
		<?php
			/*$url =  "//{$_SERVER['HTTP_HOST']}{$_SERVER['REQUEST_URI']}";
			$url = $_SERVER['PHP_SELF'];
			$parts = array();
			foreach( $_GET as $k=>$v ) {
				    $parts[] = "$k=" . urlencode($v);
			}
			$url .= "?" . implode("&", $parts);
			$url = "{$_SERVER['HTTP_HOST']}{$url}";
			echo "<a href=\"//{$url}\">{$url}</a>";*/
		?>
		</div>
		<div class="pageMid">
		 <?php include('searchbar.php'); ?>
		</div>
	</body>
</html>
