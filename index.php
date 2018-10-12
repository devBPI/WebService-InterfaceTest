<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<?php
	ini_set("display_errors",1);
	$defaultSearchText=null;
	if(isset($_GET['text']) && $_GET['text']!=null && $_GET['text']!="")
	{
		$defaultSearchText=$_GET['text'];
	}
?>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>RFHarvester V2</title>
		<link rel="stylesheet" type="text/css" href="/css/body.css" />
		<link rel="stylesheet" type="text/css" href="/css/head.css" />
		<link rel="stylesheet" type="text/css" href="/css/middle.css" />
		<link rel="stylesheet" type="text/css" href="/css/foot.css" />
		<link rel="stylesheet" type="text/css" href="/css/accessories.css" />
		<link rel="stylesheet" type="text/css" href="/css/table.css" />
		<link rel="stylesheet" type="text/css" href="/css/searchbar.css" />
		<link rel="stylesheet" type="text/css" href="/css/notices.css" />
		<style type="text/css" media="screen"></style>

		<script src="//ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript" language="javascript"></script>
		<script src="/js/search.js" type="text/javascript" language="javascript"></script>

		<script type="text/javascript" language="javascript">
		</script>
	</head>
	<body>
		<div class="pageHead" style="margin-bottom:6px;">
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
		<?php
			$ini_array = parse_ini_file("etc/configuration.ini");
			/*print_r($ini_array);
			echo $ini_array["url"];*/

			include('searchbar.php');
		?>
		</div>
	</body>
</html>
