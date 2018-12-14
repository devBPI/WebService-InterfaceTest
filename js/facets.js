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

function addFacet(facetName, value)
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
		newFacets = "<facets>"+"<facet>"+"<name>"+facetName+"</name>"+"<values>"+"<value>"+value+"</value>"+"</values>"+"</facet>"+"</facets>";
	}
	else
	{
		console.log("###");
		console.log("###");
		console.log("###");
		console.log("###");
		console.log("###");
		var xmlDocument = parser.parseFromString(newFacets, "text/xml");
		var documentRoot = xmlDocument.documentElement;
		var facets = documentRoot.childNodes;
		var i = 0;
		var len = facets.length;
		for(i = 0; i < len; i++)
		{
			var facet = facets[i];
			if(facet.hasChildNodes())
			{
				var childNodesLen = facet.childNodes.length;
				var j = 0;
				for(j = 0; j < childNodesLen; j++)
				{
					//console.log("<> " + facet.childNodes[j].childNodes[0].nodeValue);
					if(facet.childNodes[j].nodeName == "name" && facet.childNodes[j].childNodes[0].nodeValue==facetName)
					{
						console.log(facetName + " found");
						break;
					}
				}
				if(j >= childNodesLen) // NOT FOUND
					continue;
				//ELSE
				for(j = 0; j < childNodesLen; j++)
				{
					if(facet.childNodes[j].nodeName == "values")
					{
						var valuesArray = facet.childNodes[j].childNodes;
						var k = 0;
						for(k = 0; k < valuesArray.length; k++)
						{
							console.log("=> " + valuesArray[k].nodeName);
							console.log("=> " + valuesArray[k].childNodes[0].nodeValue);
							if(valuesArray[k].nodeName == "value" && valuesArray[k].childNodes[0].nodeValue==value)
							{
								console.log(facetName + " - " + value + " already exists");
								return;
							}
						}
						if(k >= valuesArray.length)
						{
							console.log(facetName + " - " + value + " don't exists");
							var xmlElement = parser.parseFromString("<value>"+value+"</value>", "text/xml").documentElement;
							documentRoot.childNodes[i].childNodes[j].appendChild(xmlElement);
							//var newel = xmlDoc.createElement("value");
							break;
						}
					}
				}
				break;
				
			}
		}
		if(i>=len) // NOT FOUND
		{
			console.log(facetName + " not found");
			var xmlElement = parser.parseFromString("<facet>"+"<name>"+facetName+"</name>"+"<values>"+"<value>"+value+"</value>"+"</values>"+"</facet>", "text/xml").documentElement;
			documentRoot.appendChild(xmlElement);
		}
		console.log("###");
		console.log("###");
		console.log("###");
		console.log("###");
		console.log("###");
		newFacets=new XMLSerializer().serializeToString(documentRoot);
		//console.log(new XMLSerializer().serializeToString(documentRoot));
		//console.log("###");

		/*console.log("~~~");
		printXmlNode(xmlDocument.documentElement, 0);
		console.log("~~~");*/

		/*console.log("~~~");
		var facetsArray = xmlDocument.getElementsByTagName("facet");
		for(var i = 0; i < facetsArray.length; i++)
		{
			console.log(facetsArray[i]);
		}

		console.log("~~~");

		var namesArray = xmlDocument.getElementsByTagName("name");
		for(var i = 0; i < namesArray.length; i++)
		{
			var nodeValue=namesArray[i].childNodes[0].nodeValue;
			if(nodeValue==facetName)
			{
				console.log("Same name \"" + nodeValue + "\" found.");
				console.log(namesArray[i].childNodes[0]);
			}
		}*/
	}
	urlParams.set('facets', newFacets);
	console.log(urlParams.toString());
	var xmlDoc = parser.parseFromString(newFacets, "text/xml");
	//console.log(newFacets);
	//console.log(new XMLSerializer().serializeToString(xmlDoc.documentElement));
	//console.log(xmlDoc.getElementsByTagName("name")[0].childNodes[0].nodeValue);
	window.location.search = urlParams.toString();
}

function removeFacet(facetName, value)
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
		console.log("Current facets null.");
		return;
	}
	else
	{
		var xmlDocument = parser.parseFromString(newFacets, "text/xml");
		var documentRoot = xmlDocument.documentElement;
		var facets = documentRoot.childNodes;
		var i = 0;
		var len = facets.length;
		for(i = 0; i < len; i++)
		{
			var facet = facets[i];
			if(facet.hasChildNodes())
			{
				var childNodesLen = facet.childNodes.length;
				var j = 0;
				for(j = 0; j < childNodesLen; j++)
				{
					if(facet.childNodes[j].nodeName == "name" && facet.childNodes[j].childNodes[0].nodeValue==facetName)
					{
						console.log(facetName + " found");
						break;
					}
				}
				if(j >= childNodesLen) // NOT FOUND
					continue;
				//ELSE
				for(j = 0; j < childNodesLen; j++)
				{
					if(facet.childNodes[j].nodeName == "values")
					{
						var valuesArray = facet.childNodes[j].childNodes;
						var len = valuesArray.length;
						var k = 0;
						for(k = 0; k < len; k++)
						{
							console.log("=> " + valuesArray[k].nodeName);
							console.log("=> " + valuesArray[k].childNodes[0].nodeValue);
							if(valuesArray[k].nodeName == "value" && valuesArray[k].childNodes[0].nodeValue==value)
							{
								console.log("Removing node: " + facetName + " - " + value);
								var removedNode = documentRoot.childNodes[i].childNodes[j].childNodes[k];
								documentRoot.childNodes[i].childNodes[j].removeChild(removedNode);
								break;
							}
						}
						if(valuesArray.length <= 0)
						{
							var removedNode = documentRoot.childNodes[i];
							documentRoot.removeChild(removedNode);
							break;
						}
						if(k >= len)
						{
							console.log(facetName + " - " + value + " don't exists");
							return;
						}
						else
							break;
					}
				}
				break;
				
			}
		}
		newFacets=new XMLSerializer().serializeToString(documentRoot);
		console.log(newFacets);
	}
	urlParams.set('facets', newFacets);
	console.log(urlParams.toString());
	var xmlDoc = parser.parseFromString(newFacets, "text/xml");
	window.location.search = urlParams.toString();
}

function cleanFacets()
{
	var urlParams = new URLSearchParams(window.location.search);
	var curFacets = urlParams.get('facets');
	if(curFacets != null)
	{
		urlParams.delete('facets');
	}
	window.location.search = urlParams.toString();
}

