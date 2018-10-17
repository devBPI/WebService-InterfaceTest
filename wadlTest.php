<?php
	$ini_array = parse_ini_file("etc/configuration.ini");
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
	$url = $ini_array["CatalogueWebServiceUrl"]."search/notices";
	echo "<a href=\"".$url."\" target=\"_blank\" style=\"font-size: 12px;\">URL du WebService</a><br />";
	$opts = array('http'=>array('method'=>'GET','header'=>'Content-type: application/x-www-form-urlencoded', ));
	$opts['http']['content'] = json_encode(array('general'=>'urb'));
	$context = stream_context_create($opts);
	$search = file_get_contents($url, false, $context);
	echo $search."<br />";

	$url = $ini_array["CatalogueWebServiceUrl"]."search/notices-crit";
	$opts = array('http'=>array('method'=>'GET','header'=>'Content-type: application/x-www-form-urlencoded', ));
	//$opts['http']['content'] = json_encode(array('general'=>'urb'));
	
	class NoticeSearchCriterias
	{
public $general;
public $title;
public $creator;
public $director;
public $publisher;
public $description;
public $subject;
public $type;
public $datePublishing;
public $spatialCoverage;
public $temporalCoverage;
public $language;
public $rights;
public $issn;
public $isbn;
public $commercialNumber;
public $audience;
public $styleMusical;
public $styleLiterary;
public $styleCinematographic;
public $theme;
public $indexCdu;
public $page;
public $rows;
public $parcours;
	}
	$noticeSearchCriterias = new NoticeSearchCriterias();
	$noticeSearchCriterias->general="urb";

	$opts['http']['content'] = json_encode(array('criters' => $noticeSearchCriterias));
	$opts['http']['criters'] = json_encode($noticeSearchCriterias);
	$opts['http']['criters'] = json_encode(array('general' => 'urb'));
	 
	$context = stream_context_create($opts);
	$search_crits = file_get_contents($url, false, $context);

	echo $search_crits;
