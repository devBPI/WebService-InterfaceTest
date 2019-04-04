function addDDmask(dropdown)
{
	var y = document.getElementsByClassName('dd-mask');
	var element = y[0];
	element.style.display="block";
	element.addEventListener("click", function(){ element.style.display="none"; dropdown.style.display="none"; });
}

function displayBtnGrp(obj)
{
	for(var i = 0; i < obj.parentNode.childNodes.length; i++)
	{
		var lst = obj.parentNode.childNodes[i];
		var lstClassList = lst.classList;
		if(null != lstClassList && lstClassList.contains("dropdown-menu"))
		{
			lst.style.display="inline-block";
			addDDmask(lst);
		}
	}
}

function checkElement(obj)
{
	var dropDownElementsList = obj.parentNode.parentNode.parentNode.parentNode;
	var dropDownMainElement = dropDownElementsList.parentNode;

	var countCheckedElements = 0;
	var checkedElements = [];
	for(var i = 0; i < dropDownElementsList.getElementsByClassName("checkbox").length; i++)
	{
		var checkbox = dropDownElementsList.getElementsByClassName("checkbox")[i];
		if(checkbox.getElementsByClassName("checkboxinput")[0].checked)
			checkedElements.push(checkbox.title);
	}
	var newButtonName = dropDownMainElement.getElementsByClassName("btn-default")[0].title;
	if(checkedElements.length > 3)
		newButtonName = checkedElements.length + " " + dropDownMainElement.getElementsByClassName("btn-default")[0].title + " selectionnés"
	else if(checkedElements.length > 0)
		newButtonName = checkedElements.join(", ");

	var txt = dropDownMainElement.getElementsByClassName("multiselect-selected-text")[0];
	txt.innerHTML = newButtonName;
}

function advancedSearchBar()
{
	//var uriParams = getUriParams();
	var uri = "advancedsearchbar.php?";//+uriParams;
	var url = encodeURI(uri);
	console.log(url);
	$("#advancedSearchDiv").load(url);
}

function getAdvancedSearchDropdownParams()
{
	var result = null;
	var newFacets = "";
	//newFacets = "<facets>"+"<facet>"+"<name>"+facetName+"</name>"+"<values>"+"<value>"+value+"</value>"+"</values>"+"</facet>"+"</facets>";
	var advancedSearchLists = document.getElementById("advancedSearchLists");
	for(var i = 0; i < advancedSearchLists.getElementsByClassName("btn-group").length; i++)
	{
		var newFacet = "";
		var btnGroup = advancedSearchLists.getElementsByClassName("btn-group")[i];
		var title = btnGroup.title;
		//var title = btnGroup.getElementsByClassName("btn-default")[0].title;
		var checkedElements = [];
		for(var j = 0; j < btnGroup.getElementsByClassName("checkbox").length; j++)
		{
			var checkbox = btnGroup.getElementsByClassName("checkbox")[j];
			if(checkbox.getElementsByClassName("checkboxinput")[0].checked)
			{
				checkedElements.push(checkbox.title);
				newFacet += "<value>"+checkbox.title+"</value>";
			}
		}
		//result.set(title, checkedElements);
		if(null != newFacet && "" != newFacet)
			newFacets += "<facet>"+"<name>"+title+"</name>"+"<values>"+newFacet+"</values>"+"</facet>";
	}
	if(null != newFacets && "" != newFacets)
	{
		result = "<facets>"+newFacets+"</facets>";
	}
	//console.log(result);

	//$("#advancedSezefezfdechDiv").load(url);

	return result;
}
