function printKeys(map)
{
	for (var i = 0, keys = Object.keys(map), ii = keys.length; i < ii; i++)
	{
		val = map[keys[i]];
		if(typeof val === 'object')
		{
			printKeys(val);
		}
		/*else
		{
			console.log(keys[i] + '|' + map[keys[i]]);
		}*/
	}
}

function keysToParams(map)
{
	var result = "";
	for (var i = 0, keys = Object.keys(map), ii = keys.length; i < ii; i++)
	{
		val = map[keys[i]];
		if(typeof val === 'object')
			result += keysToParams(val);
		else if(map[keys[i]]!=null && map[keys[i]]!='')
			result+=('&' + keys[i] + '=' + encodeURIComponent(map[keys[i]]));
	}
	return result;
}

function getParkour()
{
	var parkour = "";
	var parkourAutoformation = document.getElementById("parkourAutoformation");
	var parkourCinema = document.getElementById("parkourCinema");
	//var parkourMusique = document.getElementById("parkourMusique");
	var parkourPresse = document.getElementById("parkourPresse");
	if(parkourAutoformation.classList.contains("selected-parkour"))
		parkour="autoformation";
	if(parkourCinema.classList.contains("selected-parkour"))
		parkour="cinema";
	/*if(parkourMusique.classList.contains("selected-parkour"))
		parkour="musique";*/
	if(parkourPresse.classList.contains("selected-parkour"))
		parkour="presse";
	return parkour;
}

function getGeneralSearchBar()
{
	var searchBarSelectionValue = document.getElementById("searchBarSelection").value;
	switch(searchBarSelectionValue)
	{
		case "auteur":
			return "auteur";
		break;
		case "titre":
			return "titre";
		break;
		case "sujet":
			return "sujet";
		break;
		case "isbnissncommercial":
			return "isbnissncommercial";
		break;
		case "indicecote":
			return "indicecote";
		break;
		case "datepublication":
			return "datepublication";
		break;
		case "editeur":
			return "editeur";
		break;
		case "realisateur":
			return "realisateur";
		break;
		case "theme":
			return "theme";
		break;
		default:
			return "general";
		break;
	}
	return "general";
}

function getBasicSearchCriterias()
{
	console.log("START");
	//document.getElementsByClassname();
	var searchBarOperators = document.getElementsByClassName("searchBarOperator");
	var searchBars = document.getElementsByClassName("searchbar");
	var searchBarSelections = document.getElementsByClassName("searchBarSelection");
	var i;
	var searchBarOperatorsArray = [], searchBarsArray = [], searchBarSelectionsArray = [];
	for(i=0; i<searchBars.length; i++)
	{
		if(i==1)
			continue;
		if(i>0)
			searchBarOperatorsArray.push(searchBarOperators[i-1].value);
		else
			searchBarOperatorsArray.push(null);
		searchBarsArray.push(searchBars[i].value.EncodeXMLEscapeChars());
		searchBarSelectionsArray.push(searchBarSelections[i].value);
	}
	/*console.log(searchBarOperatorsArray);
	console.log(searchBarsArray);
	console.log(searchBarSelectionsArray);*/
	var basicSearchArray = [];
	basicSearchArray["operators"] = searchBarOperatorsArray;
	basicSearchArray["texts"] = searchBarsArray;
	basicSearchArray["fields"] = searchBarSelectionsArray;
	//console.log(basicSearchArray);

	var xml = "";
	for(i=0; i<basicSearchArray["texts"].length; i++)
	{
		xml += "<search-criterias>";
		xml += "<" + basicSearchArray["fields"][i] + ">";
		xml += basicSearchArray["texts"][i];
		xml += "</" + basicSearchArray["fields"][i] + ">";
		if(i<i<basicSearchArray["texts"].length-1)
		{
			switch(basicSearchArray["operators"][i+1])
			{
				case "OU":
					xml += "<or>";
				break;
				case "SAUF":
					xml += "<and><not>true</not>"
				break;
				case "ET":
					xml += "<and>"
				break;
				default:
				break;
			}
		}
	}
	for(i=basicSearchArray["texts"].length-1; i>=0; i--)
	{
		xml += "</search-criterias>";
		if(i>0)
		{
			switch(basicSearchArray["operators"][i])
			{
				case "OU":
					xml += "</or>";
				break;
				default:
					xml += "</and>"
				break;
			}
		}
	}
	//console.log(xml);
	return xml;
}

function getSearchCriterias()
{
	var searchCriterias = {};

	var urlParams = new URLSearchParams();
	//urlParams.set("general", document.getElementById("searchbar").value);

	urlParams.set("basicSearchCriterias", getBasicSearchCriterias());

	//alert(getGeneralSearchBar());
	urlParams.set("generalSignification", getGeneralSearchBar());
	if(document.getElementById("searchbar").value)
		urlParams.set("general", document.getElementById("searchbar").value.EncodeXMLEscapeChars());
	//console.log(document.getElementById("advancedsearch-titre").value);
	if(document.getElementById("advancedsearch-titre").value)
		urlParams.set("titre", document.getElementById("advancedsearch-titre").value.EncodeXMLEscapeChars());
	//console.log(urlParams.get("titre"));
	if(document.getElementById("advancedsearch-auteur").value)
		urlParams.set("auteur", document.getElementById("advancedsearch-auteur").value.EncodeXMLEscapeChars());
		//urlParams.set("auteur", encodeURIComponent(document.getElementById("advancedsearch-auteur").value));
	if(document.getElementById("advancedsearch-sujet").value)
		urlParams.set("sujet", document.getElementById("advancedsearch-sujet").value.EncodeXMLEscapeChars());
	if(document.getElementById("advancedsearch-isbnissncommercial").value)
		urlParams.set("isbnissncommercial", document.getElementById("advancedsearch-isbnissncommercial").value.EncodeXMLEscapeChars());
	if(document.getElementById("advancedsearch-indicecote").value)
		urlParams.set("indicecote", document.getElementById("advancedsearch-indicecote").value.EncodeXMLEscapeChars());
	if(document.getElementById("advancedsearch-datepublication").value)
		urlParams.set("datepublication", document.getElementById("advancedsearch-datepublication").value.EncodeXMLEscapeChars());
	if(document.getElementById("advancedsearch-realisateur").value)
		urlParams.set("realisateur", document.getElementById("advancedsearch-realisateur").value.EncodeXMLEscapeChars());
	if(document.getElementById("advancedsearch-theme").value)
		urlParams.set("theme", document.getElementById("advancedsearch-theme").value.EncodeXMLEscapeChars());
	if(document.getElementById("advancedsearch-editeur").value)
		urlParams.set("editeur", document.getElementById("advancedsearch-editeur").value.EncodeXMLEscapeChars());
	if(document.getElementById("advancedsearch-collection").value)
		urlParams.set("collection", document.getElementById("advancedsearch-collection").value.EncodeXMLEscapeChars());
	if(document.getElementById("advancedsearch-datepublicationstart").value)
		urlParams.set("datepublicationstart", document.getElementById("advancedsearch-datepublicationstart").value.EncodeXMLEscapeChars());
	if(document.getElementById("advancedsearch-datepublicationend").value)
		urlParams.set("datepublicationend", document.getElementById("advancedsearch-datepublicationend").value.EncodeXMLEscapeChars());
	/*urlParams.set("baserecherche", document.getElementById("advancedsearch-baserecherche").value);
	urlParams.set("langue", document.getElementById("advancedsearch-langue").value);
	urlParams.set("type", document.getElementById("advancedsearch-type").value);
	urlParams.set("support", document.getElementById("advancedsearch-support").value);
	urlParams.set("genremusic", document.getElementById("advancedsearch-genremusic").value);
	urlParams.set("genrefilm", document.getElementById("advancedsearch-genrefilm").value);
	urlParams.set("genrelitt", document.getElementById("advancedsearch-genrelitt").value);
	urlParams.set("secteur", document.getElementById("advancedsearch-secteur").value);
	urlParams.set("audience", document.getElementById("advancedsearch-audience").value);*/


	var advancedSearchFacets = getAdvancedSearchDropdownParams();
	if(null != advancedSearchFacets)
		urlParams.set("facets", advancedSearchFacets);
	//JSONObject jsonObj = new JSONObject(params);
	//alert(jsonObj.toString());


	//console.log(urlParams);
	//console.log(urlParams.toString());
	return urlParams;
}

function searchFacets(uriParams)
{
	document.getElementById("facets").innerHTML = "<img style=\"width:60px; height: 60px;\" src=\"/img/spin.svg\" alt=\"loading\" srcset=\"/img/spin.svg\"/>";
	var uri = "searchFacets.php?"+uriParams;
	var url = encodeURI(uri);
	//console.log(url);
	$("#facets").load(url);
}

function searchNotices(uriParams)
{
	var uri = "searchNotices.php?"+uriParams;
	var url = encodeURI(uri);
	//console.log(url);
	$("#notices").load(url);
}

function searchNoticesOnline(uriParams)
{
	var uri = "searchNoticesOnline.php?"+uriParams;
	var url = encodeURI(uri);
	//console.log(url);
	$("#notices-online").load(url);
}

function getUriParams()
{
	var searchCriterias = getSearchCriterias();
	var parkour = getParkour();
	var urlParams = new URLSearchParams(window.location.search);
	var curFacets = urlParams.get('facets');
	var searchFacets = searchCriterias.get('facets');
	var hasAlreadyFacets = searchCriterias.has("facets");
	if(curFacets!=null && !searchCriterias.has("facets"))
		searchCriterias.set("facets", curFacets);
	var uriParams = searchCriterias.toString();
	//console.log("/"+parkour+"?"+uriParams);
	//history.pushState({}, null, "./"+parkour+"?"+uriParams);

	//searchCriterias.set("parkour", parkour);
	//uriParams = searchCriterias.toString();

	//console.log(uriParams);
	return uriParams;
}

function searchNoticesNoticesOnline(uriParams)
{
	var searchCriterias = getSearchCriterias();
	var parkour = getParkour();
	var urlParams = new URLSearchParams(window.location.search);
	var curFacets = urlParams.get('facets');
	if(curFacets!=null)
		searchCriterias.set("facets", curFacets);
	var uriParams = searchCriterias.toString();
	//history.pushState({}, null, "/"+parkour+"?"+uriParams);
	//history.pushState({}, null, "./"+parkour+"?"+uriParams);

	//searchCriterias.set("parkour", parkour);
	uriParams = searchCriterias.toString();
	searchNotices(uriParams);
	searchNoticesOnline(uriParams);
	searchFacets(uriParams);
}

function searchMostRelevantAuthorities(uriParams)
{
	document.getElementById("mostRelevantAuthorities").innerHTML = "<img style=\"width:60px; height: 60px;\" src=\"/img/spin.svg\" alt=\"loading\" srcset=\"/img/spin.svg\"/>";
	var uri = "searchMostRelevantAuthorities.php?"+uriParams;
	var url = encodeURI(uri);
	$("#mostRelevantAuthorities").load(url);
}

function searchAll(uriParams)
{
	document.getElementById("result-lists").innerHTML = "<img style=\"width:60px; height: 60px;\" src=\"/img/spin.svg\" alt=\"loading\" srcset=\"/img/spin.svg\"/>";
	var uri = "searchAll.php?"+uriParams;
	var url = encodeURI(uri);
	$("#result-lists").load(url);
}

function search()
{
	getBasicSearchCriterias();
	//return;

	//searchadvanced();
	//console.log("documents getted");
	//document.getElementById("notices").innerHTML = "<img style=\"width:60px; height: 60px;\" src=\"/img/spin.svg\" alt=\"loading\" srcset=\"/img/spin.svg\"/>";
	//document.getElementById("notices-online").innerHTML = "<img style=\"width:60px; height: 60px;\" src=\"/img/spin.svg\" alt=\"loading\" srcset=\"/img/spin.svg\"/>";
	var parkour = getParkour();
	var uriParams = getUriParams();
	//alert(parkour);
	console.log("search():\n\t/"+parkour+"?"+uriParams);
	history.pushState({}, null, "./"+parkour+"?"+uriParams);
	//window.location = "#./"+parkour+"?"+uriParams
	//searchNoticesNoticesOnline(uriParams);
	//searchMostRelevantAuthorities(uriParams);
	searchAll(uriParams);
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
	document.getElementById("notices").innerHTML = "<img style=\"width:60px; height: 60px;\" src=\"/img/spin.svg\" alt=\"loading\" srcset=\"/img/spin.svg\"/>";
	var searchCriterias = getSearchCriterias();
	var parkour = getParkour();
	searchCriterias.set("parkour", parkour);
	var uriParams = searchCriterias.toString();
	//console.log(uriParams);

	document.getElementById("notices").innerHTML = "<img style=\"width:60px; height: 60px;\" src=\"/img/spin.svg\" alt=\"loading\" srcset=\"/img/spin.svg\"/>";

	var uri = "searchNotices.php?"+uriParams+"&page="+page+"&rows="+rows
	var url = encodeURI(uri);
	$("#notices").load(url);
}

function changeNoticesOnlinePage(page)
{
	var rows=document.getElementById("notices-online-rows").value;
	document.getElementById("notices-online").innerHTML = "<img style=\"width:60px; height: 60px;\" src=\"/img/spin.svg\" alt=\"loading\" srcset=\"/img/spin.svg\"/>";
	var searchCriterias = getSearchCriterias();
	var parkour = getParkour();
	searchCriterias.set("parkour", parkour);

	var urlParams = new URLSearchParams(window.location.search);
	var curFacets = urlParams.get('facets');
	searchCriterias.set('facets', curFacets);

	var uriParams = searchCriterias.toString();
	//console.log(uriParams);

	document.getElementById("notices-online").innerHTML = "<img style=\"width:60px; height: 60px;\" src=\"/img/spin.svg\" alt=\"loading\" srcset=\"/img/spin.svg\"/>";

	var uri = "searchNoticesOnline.php?"+uriParams+"&page="+page+"&rows="+rows
	var url = encodeURI(uri);
	$("#notices-online").load(url);
}

function advancedSearch()
{
	var buttonValue=document.getElementById("advancedSearchButton").value;
	if(buttonValue=='+')
	{
		document.getElementById("advancedSearchButton").value = '-';
		document.getElementById("advancedSearchDiv").style.display = 'flex';
	}
	else if(buttonValue=='-')
	{
		document.getElementById("advancedSearchButton").value = '+';
		document.getElementById("advancedSearchDiv").style.display = 'none';
	}
}

function displayHideFacet(facetDiv)
{
	facetDiv.style.display = ((facetDiv.style.display == 'none') ? 'block' : 'none');
}

function hideFacets()
{
	document.getElementById("facetsContainer").style.display = 'none';
	document.getElementById("facetsShowButton").style.display = 'block';
}

function displayFacets()
{
	document.getElementById("facetsContainer").style.display = 'block';
	document.getElementById("facetsShowButton").style.display = 'none';
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
