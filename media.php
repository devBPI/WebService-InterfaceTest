<?php

$errorText="";
if(!isset($_GET['media']) || $_GET['media']=='' || $_GET['media']==null)
{
	$errorText.=('&#x26a0 Missing text. &#x26a0<br />');
	echo($errorText);
	exit(500);
}

header('Content-Type: application/octet-stream');
header('Content-Disposition: attachment; filename="launch.media"');
header("Cache-Control: no-cache, must-revalidate");

echo "<media><id_objet>999999</id_objet><nom_bdm>".$_GET['media']."</nom_bdm></media>";

