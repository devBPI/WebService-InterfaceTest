function search()
{
	var txt = document.getElementById("searchbar").value;
	//alert(txt);
	if(document.getElementById("searchbar").value!="")
	{
		var parkour = "";
		var parkourAutoformation = document.getElementById("parkourAutoformation");
		var parkourCinema = document.getElementById("parkourCinema");
		var parkourMusique = document.getElementById("parkourMusique");
		var parkourPresse = document.getElementById("parkourPresse");
		if(parkourAutoformation.classList.contains("selected-parkour"))
			parkour="autoformation";
		if(parkourCinema.classList.contains("selected-parkour"))
			parkour="cinema";
		if(parkourMusique.classList.contains("selected-parkour"))
			parkour="musique";
		if(parkourPresse.classList.contains("selected-parkour"))
			parkour="presse";
		history.pushState({}, null, "/"+parkour+"?text="+txt);
	}
	var uri = "searchNotices.php?text="+txt;
	var url = encodeURI(uri);
	$("#notices").load(url);
	//alert(url);

	var txt = document.getElementById("searchbar").value;
	//alert(txt);
	var uri = "searchNoticesOnline.php?text="+txt;
	var url = encodeURI(uri);
	$("#notices-online").load(url);
}

function changeNoticesRows(currentPage, currentRows)
{
	var rows=document.getElementById("notices-rows").value;

	changeNoticesPage(Math.ceil(((currentPage-1)*currentRows+1)/rows));
}

function changeNoticesOnlineRows(currentPage, currentRows)
{
	var rows=document.getElementById("notices-online-rows").value;

	changeNoticesOnlinePage(Math.ceil(((currentPage-1)*currentRows+1)/rows));
}

function changeNoticesPage(page)
{
	var rows=document.getElementById("notices-rows").value;
	var txt = document.getElementById("searchbar").value;
	var uri = "searchNotices.php?page="+page+"&rows="+rows+"&text="+txt;
	var url = encodeURI(uri);
	$("#notices").load(url);
}

function changeNoticesOnlinePage(page)
{
	var rows=document.getElementById("notices-online-rows").value;
	var txt = document.getElementById('searchbar').value;
	var uri = "searchNoticesOnline.php?page="+page+"&rows="+rows+"&text="+txt;
	var url = encodeURI(uri);
	$("#notices-online").load(url);
}

function advancedSearch()
{
	var buttonValue=document.getElementById("advancedSearchButton").value;
	if(buttonValue=='+')
	{
		document.getElementById("advancedSearchButton").value = '-';
		document.getElementById("advancedSearchDiv").style.display = 'block';
	}
	else if(buttonValue=='-')
	{
		document.getElementById("advancedSearchButton").value = '+';
		document.getElementById("advancedSearchDiv").style.display = 'none';
	}
}

function autocomplete(inp, arr)
{
	/*the autocomplete function takes two arguments,
 	the text field element and an array of possible autocompleted values:*/
	var currentFocus;
	/*execute a function when someone writes in the text field:*/

	function openList(x)
	{
		var a, b, i, val = x.value;
		//var a, b, i, val = this.value;
		/*close any already open lists of autocompleted values*/
		//alert(val);
		closeAllLists();
		if(!val)
			return false;
		currentFocus = -1;
		/*create a DIV element that will contain the items (values):*/
		a = document.createElement("div");
		a.setAttribute("id", x.id + "autocomplete-list");
		a.setAttribute("class", "autocomplete-items");
		/*append the DIV element as a child of the autocomplete container:*/
		x.parentNode.appendChild(a);

		var url = "autocomplete.php?text="+val;
		//alert(url);
		var xmlHttp = new XMLHttpRequest();
		xmlHttp.onreadystatechange = function() {
			if (xmlHttp.readyState == 4 && xmlHttp.status == 200)
			{
				var xml = xmlHttp.responseXML;
				//document.getElementById("notices_online").innerHTML = xml;//.getElementsByTagName('str')[0].childNodes[0].nodeValue;

				/*for each item in the array...*/

				var results = xml.getElementsByTagName("result");

				for(i = 0; i < results.length; i++)
				{
					/*check if the item starts with the same letters as the text field value:*/
					if(results[i].childNodes[0].nodeValue.substr(0, val.length).toUpperCase() == val.toUpperCase())
					{
						/*create a DIV element for each matching element:*/
						b = document.createElement("div");
						/*make the matching letters bold:*/
						b.innerHTML = "<strong>" + results[i].childNodes[0].nodeValue.substr(0, val.length) + "</strong>";
						b.innerHTML += results[i].childNodes[0].nodeValue.substr(val.length);
						/*insert a input field that will hold the current array item's value:*/
						b.innerHTML += "<input type='hidden' value='" + results[i].childNodes[0].nodeValue + "'>";
						/*execute a function when someone clicks on the item value (DIV element):*/
						b.addEventListener("click", function(e)
						{
							/*insert the value for the autocomplete text field:*/
							inp.value = this.getElementsByTagName("input")[0].value;
							/*close the list of autocompleted values,
							(or any other open lists of autocompleted values:*/
							closeAllLists();
							search();
						});
						a.appendChild(b);
					}
				}
			}
		};
		xmlHttp.open("GET", url, true);
		xmlHttp.send();
		//document.getElementById("notices").innerHTML = url;//.getElementsByTagName('str')[0].childNodes[0].nodeValue;
	}


	function addActive(x)
	{
		/*a function to classify an item as "active":*/
		if(!x)
			return false;
		/*start by removing the "active" class on all items:*/
		removeActive(x);
		if(currentFocus >= x.length)
			currentFocus = 0;
		if(currentFocus < 0)
			currentFocus = (x.length - 1);
		/*add class "autocomplete-active":*/
		x[currentFocus].classList.add("autocomplete-active");
	}

	function removeActive(x)
	{
		/*a function to remove the "active" class from all autocomplete items:*/
		for(var i = 0; i < x.length; i++)
			x[i].classList.remove("autocomplete-active");
	}

	function closeAllLists(elmnt)
	{
		/*close all autocomplete lists in the document,
 		except the one passed as an argument:*/
		var x = document.getElementsByClassName("autocomplete-items");
		for(var i = 0; i < x.length; i++)
		{
			if(elmnt != x[i] && elmnt != inp)
				x[i].parentNode.removeChild(x[i]);
		}
	}

	inp.addEventListener("input", function(e) { openList(this); });

	/*execute a function presses a key on the keyboard:*/
	inp.addEventListener("keydown", function(e)
	{
		var x = document.getElementById(this.id + "autocomplete-list");
		if(x) x = x.getElementsByTagName("div");
		if(e.keyCode == 40 || e.keyCode == 38)
		{
			if(!x) //open list if closed
			{
				openList(this);
				return false;
			}
		
			/*If the arrow UP or DOWN key is pressed,
 			change the currentFocus variable:*/
			if(e.keyCode == 40)
				currentFocus++;
			else if(e.keyCode == 38)
				currentFocus--;
			/*and and make the current item more visible:*/
			addActive(x);
		}
		else if(e.keyCode == 13)
		{
			/*If the ENTER key is pressed, prevent the form from being submitted,*/
			e.preventDefault();
			if(currentFocus > -1)
			{
				/*and simulate a click on the "active" item:*/
				if(x)
					x[currentFocus].click();
			}
			search();
			closeAllLists();
		}
		else if(e.keyCode == 27) {
			/*If the ESCAPE key is pressed,
 			close lists*/
			closeAllLists();
		}
	});

	/*execute a function when someone clicks in the document:*/
	document.addEventListener("click", function (e)
	{
		closeAllLists(e.target);
	});
}

window.onload = function(e)
{
	autocomplete(document.getElementById("searchbar"), []);;
	if(document.getElementById("searchbar").value!="")
		search();
}
