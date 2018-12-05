<?php
	function simplexml_merge(SimpleXMLElement &$xml1, SimpleXMLElement $xml2)
	{
		// convert SimpleXML objects into DOM ones
		$dom1 = new DomDocument();
		$dom2 = new DomDocument();
		$dom1->loadXML($xml1->asXML());
		$dom2->loadXML($xml2->asXML());
		$dom = new DomDocument();
		$headNode = $dom->createElement("merged");
		$dom->appendChild($headNode);

		$xpath = new domXPath($dom1);
		$xpathQuery = $xpath->query('/*');
		for($i = 0; $i < $xpathQuery->length; $i++)
		{
			$headNode->appendChild($dom->importNode($xpathQuery->item($i), true));
		}
		$xpath = new domXPath($dom2);
		$xpathQuery = $xpath->query('/*');
		for($i = 0; $i < $xpathQuery->length; $i++)
		{
			$headNode->appendChild($dom->importNode($xpathQuery->item($i), true));
		}
		$xml = simplexml_import_dom($dom);
		return $xml;
	}
