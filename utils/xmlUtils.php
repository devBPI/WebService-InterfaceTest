<?php
function xmlEscape($string)
{
	return str_replace(array('&', '<', '>', '\'', '"'), array('&amp;', '&lt;', '&gt;', '&apos;', '&quot;'), $string);
}

function array_to_xml($data, &$xml_data)
{
	foreach($data as $key => $value)
	{
		if(is_numeric($key))
		{
			$key = 'item'.$key; //dealing with <0/>..<n/> issues
		}
		if(is_array($value))
		{
			$subnode = $xml_data->addChild($key);
			array_to_xml($value, $subnode);
		}
		else
		{
			$xml_data->addChild("$key",htmlspecialchars("$value"));
		}
	}
}

function array_to_xml_main($mainname, $data)
{
	if(!$mainname || $mainname=="")
		return NULL;
	/*$xml_data = new SimpleXMLElement('<?xml version="1.0"?><'.$mainname.'></'.$mainname.'>');*/
	$xml_data = new SimpleXMLElement('<'.$mainname.'></'.$mainname.'>');
	array_to_xml($data,$xml_data);
	return $xml_data;
}

function xml_adopt($root, $new)
{
	$node = $root->addChild($new->getName(), (string) $new);
	foreach($new->attributes() as $attr => $value)
	{
		$node->addAttribute($attr, $value);
	}
	foreach($new->children() as $ch)
	{
		xml_adopt($node, $ch);
	}
}

