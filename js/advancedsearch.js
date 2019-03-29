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
			lst.style.display="block";
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
