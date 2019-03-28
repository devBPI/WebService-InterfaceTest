function addDDmask(dropdown)
{
	var y = document.getElementsByClassName('dd-mask');
	var element = y[0];
	element.style.display="block";
	element.addEventListener("click", function(){ element.style.display="none"; dropdown.style.display="none"; });
	//element.classList.add("dd-open");
}

function displayBtnGrp(obj)
{
	//alert(obj.parentNode.id);
	//alert(obj.parentNode.childNodes.length);
	for(var i = 0; i < obj.parentNode.childNodes.length; i++)
	{
		var lst = obj.parentNode.childNodes[i];
		var lstClassList = lst.classList;
		if(null != lstClassList && lstClassList.contains("dropdown-menu"))
		{
			/*console.log("Child " + i);
			console.log(lst.innerHTML);*/
			lst.style.display="block";
			addDDmask(lst);
		}
	}
}

function checkElement(obj)
{
	var dropDownElementsList = obj.parentNode.parentNode.parentNode.parentNode;
	var dropDownMainElement = dropDownElementsList.parentNode;
	console.log(dropDownElementsList.innerHTML);

	var countCheckedElements = 0;
	var checkedElements = [];
	for(var i = 0; i < dropDownElementsList.getElementsByClassName("checkbox").length; i++)
	{
		var checkbox = dropDownElementsList.getElementsByClassName("checkbox")[i];
		if(checkbox.getElementsByClassName("checkboxinput")[0].checked)
			checkedElements.push(checkbox.title);
		//console.log(dropDownElementsList.getElementsByClassName("checkboxinput")[i].checked);
		//var chkBox = dropDownElementsList.childNodes[i].childNodes[0].childNodes[0];
		//console.log(chkBox);
	}
	var newButtonName = dropDownMainElement.getElementsByClassName("btn-default")[0].title;
	if(checkedElements.length > 3)
		newButtonName = checkedElements.length + " selectionnés"
	else if(checkedElements.length > 0)
		newButtonName = checkedElements.join(", ");
	console.log(newButtonName);

	//alert(dropDownMainElement.id);
	/*for(var i = 0; i < dropDownMainElement.childNodes.length; i++)
	{
		var txtBtn = dropDownMainElement.childNodes[i];
		var txtBtnClassList = txtBtn.classList;
		if(null != txtBtnClassList && txtBtnClassList.contains("btn-default"))
		{
			//console.log(txtBtn.innerHTML);
			for(var j = 0; j < txtBtn.childNodes.length; j++)
			{
				var txt = txtBtn.childNodes[j];
				var txtClassList = txt.classList;
				if(null != txtClassList && txtClassList.contains("multiselect-selected-text"))
				{
					//console.log(obj.parentNode.innerHTML);
					//txt.innerHTML = obj.parentNode.innerHTML;
					txt.innerHTML = newButtonName;
					//console.log(txt.innerHTML);
				}
			}
			//console.log("Child " + i);
			//lst.style.display="block";
			//addDDmask(lst);
		}
	}*/
	var txt = dropDownMainElement.getElementsByClassName("multiselect-selected-text")[0];
	txt.innerHTML = newButtonName;
}
