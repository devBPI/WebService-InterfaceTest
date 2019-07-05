function addCondition()
{
	var itm = document.getElementById("conditionSchema");
	var cln = itm.cloneNode(true);
	cln.style.display="block";
	document.getElementById("additionnalConditions").appendChild(cln);
}

function removeCondition(node)
{
	var childNode = node;
	childNode.parentNode.removeChild(childNode);
}
