function addCondition()
{
	var itm = document.getElementById("conditionSchema");
	var cln = itm.cloneNode(true);
	//cln.getElementsByClassName("searchbar")[0].value="";
	cln.style.display="block";
	cln.id="";
	document.getElementById("additionnalConditions").appendChild(cln);
}

function removeCondition(node)
{
	var childNode = node;
	childNode.parentNode.removeChild(childNode);
}
