function printXmlNode(node, depth)
{
	if(node==null)
		return;
	if(depth==null)
		depth = 0;
	var tab = "";
	for(var i = 0; i < depth; i++)
		tab += " ";
	console.log(tab + "<" + node.nodeName + ">");
	console.log(tab + "  " + node.nodeValue);
	var childNode = node.childNodes;
	for(var i = 0; i < childNode.length; i++)
		printXmlNode(childNode[i], depth+1);
}

function addFacet(facet, value)
{
	var parser = new DOMParser();
	console.log("Adding facet " + facet + " with value " + value);
	var urlParams = new URLSearchParams(window.location.search);
	console.log(window.location.search);
	var curFacets = urlParams.get('facets');
	console.log("Current facets: " + curFacets);
	var newFacets = curFacets;
	if(curFacets==null)
	{
		console.log("Current facets null. Creating them.");
		newFacets = "<facets>"+"<facet>"+"<name>"+facet+"</name>"+"<value>"+value+"</value>"+"</facet>"+"</facets>";
	}
	else
	{
		var xmlDocument = parser.parseFromString(newFacets, "text/xml");

		console.log("###");
		printXmlNode(xmlDocument.documentElement, 0);
		console.log("###");

		console.log("~~~");
		var facetssArray = xmlDocument.getElementsByTagName("facet");
		for(var i = 0; i < facetssArray.length; i++)
		{
			console.log(facetssArray[i]);
		}

		console.log("~~~");

		var namesArray = xmlDocument.getElementsByTagName("name");
		for(var i = 0; i < namesArray.length; i++)
		{
			var nodeValue=namesArray[i].childNodes[0].nodeValue;
			if(nodeValue==facet)
			{
				console.log("Same name \"" + nodeValue + "\" found.");
				console.log(namesArray[i].childNodes[0]);
			}
		}
	}
	urlParams.set('facets', newFacets);
	console.log(urlParams.toString());
	var xmlDoc = parser.parseFromString(newFacets, "text/xml");
	//console.log(newFacets);
	console.log(new XMLSerializer().serializeToString(xmlDoc.documentElement));
	console.log(xmlDoc.getElementsByTagName("name")[0].childNodes[0].nodeValue);
	//window.location.search = urlParams.toString();
}

