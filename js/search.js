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

function getCombinedSearchCriterias(selectedSearch)
{
	console.log("START-COMBINED");
	var searchBarOperators = selectedSearch.getElementsByClassName("searchBarOperator");
	var searchBars = selectedSearch.getElementsByClassName("searchbar");
	var searchBarSelections = selectedSearch.getElementsByClassName("searchBarSelection");
	var i;
	var searchBarOperatorsArray = [], searchBarsArray = [], searchBarSelectionsArray = [];
	for(i=0; i<searchBars.length-1; i++)
	{
		if(i>0)
			searchBarOperatorsArray.push(searchBarOperators[i-1].value);
		else
			searchBarOperatorsArray.push(null);
		searchBarsArray.push(searchBars[i].value.EncodeXMLEscapeChars());
		searchBarSelectionsArray.push(searchBarSelections[i].value);
	}
	var basicSearchArray = [];
	basicSearchArray["operators"] = searchBarOperatorsArray;
	basicSearchArray["texts"] = searchBarsArray;
	basicSearchArray["fields"] = searchBarSelectionsArray;
	console.log(basicSearchArray);

	var xml = "";
	xml += "<search-criterias>";
	for(i=0; i<basicSearchArray["texts"].length; i++)
	{
		xml += "<" + basicSearchArray["fields"][i] + ">";
		xml += basicSearchArray["texts"][i];
		xml += "</" + basicSearchArray["fields"][i] + ">";
		if(i<basicSearchArray["texts"].length-1)
		{
			switch(basicSearchArray["operators"][i+1])
			{
				case "OU":
					xml += "<or><search-criterias>";
				break;
				case "SAUF":
					xml += "<and><search-criterias><not>true</not>"
				break;
				case "ET":
					xml += "<and><search-criterias>"
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
	console.log(xml);
	return xml;
}

function getSearchCriterias()
{
	var searchCriterias = {};

	var urlParams = new URLSearchParams();

	var selectedSearch = ((isAdvancedSearchSelected())? document.getElementById("advancedSearchDiv") : document.getElementById("simpleSearchDiv"));

	if(isAdvancedSearchSelected())
		urlParams.set("advancedSearchCriterias", getCombinedSearchCriterias(selectedSearch));
	else
		urlParams.set("simpleSearchCriterias", getCombinedSearchCriterias(selectedSearch));

	var advancedSearchFacets = ((isAdvancedSearchSelected())? getAdvancedSearchDropdownParams() : null);
	if(null != advancedSearchFacets)
		urlParams.set("facets", advancedSearchFacets);

	//console.log(urlParams);
	return urlParams;
}

function getSearchCriteriasWithFacets()
{
	var searchCriterias = getSearchCriterias();
	var parkour = getParkour();
	var urlParams = new URLSearchParams(window.location.search);
	var curFacets = urlParams.get('facets');
	var searchFacets = searchCriterias.get('facets');
	var hasAlreadyFacets = searchCriterias.has("facets");
	if(curFacets!=null && !hasAlreadyFacets)
		searchCriterias.set("facets", curFacets);

	var curPage = urlParams.get('page');
	if(curPage!=null)
		searchCriterias.set("page", curPage);

	var curRows = urlParams.get('rows');
	if(curRows!=null)
		searchCriterias.set("rows", curRows);

	var curSort = urlParams.get('sort');
	if(curSort!=null)
		searchCriterias.set("sort", curSort);

	return searchCriterias;
}

function getUriParams()
{
	var searchCriterias = getSearchCriterias();//= getSearchCriteriasWithFacets();
	var uriParams = searchCriterias.toString();
	return uriParams;
}

function searchAll(uriParams)
{
	document.getElementById("result-lists").innerHTML = "<img style=\"width:60px; height: 60px;\" src=\"/img/spin.svg\" alt=\"loading\" srcset=\"/img/spin.svg\"/>";
	var uri = "searchAll.php?parkour="+getParkour()+"&"+uriParams;
	var url = encodeURI(uri);
	//$("#result-lists").load(url);
}

function search()
{
	/*var selectedSearch = ((isAdvancedSearchSelected())? document.getElementById("advancedSearchDiv") : document.getElementById("simpleSearchDiv"));
	getCombinedSearchCriterias(selectedSearch);*/

	var parkour = getParkour();
	var uriParams = getUriParams();
	console.log("search():\n\t/"+parkour+"?"+uriParams);
	//history.pushState({}, null, "./"+parkour+"?"+uriParams);
	//window.location = "#./"+parkour+"?"+uriParams;
	//window.location = "/"+parkour+"?"+uriParams;
	searchAll(uriParams);
}

function launchSearch()
{
	var parkour = getParkour();
	var uriParams = getUriParams();
	console.log("search():\n\t/"+parkour+"?"+uriParams);
	//history.pushState({}, null, "./"+parkour+"?"+uriParams);
	//window.location = "#./"+parkour+"?"+uriParams;
	window.location.href = "/"+parkour+"?"+uriParams;
}

function changeSearchPage(page)
{
	var parkour = getParkour();
	var searchCriterias = getSearchCriteriasWithFacets();
	searchCriterias.set("page", page);
	var uriParams = searchCriterias.toString();
	console.log("search():\n\t/"+parkour+"?"+uriParams);
	//history.pushState({}, null, "./"+parkour+"?"+uriParams);
	//window.location = "#./"+parkour+"?"+uriParams;
	window.location = "/"+parkour+"?"+uriParams;
}

function changeSearchRows(currentPage, currentRows)
{
	var parkour = getParkour();
	var searchCriterias = getSearchCriteriasWithFacets();
	var rows=document.getElementById("search-rows").value;
	var page = (Math.ceil(((currentPage-1)*currentRows+1)/rows));
	searchCriterias.set("page", page);
	searchCriterias.set("rows", rows);
	var uriParams = searchCriterias.toString();
	console.log("search():\n\t/"+parkour+"?"+uriParams);
	//history.pushState({}, null, "./"+parkour+"?"+uriParams);
	//window.location = "#./"+parkour+"?"+uriParams;
	window.location = "/"+parkour+"?"+uriParams;
}

function changeSearchSort()
{
	var parkour = getParkour();
	var searchCriterias = getSearchCriteriasWithFacets();
	var sort = document.getElementById("search-sort").value;
	searchCriterias.set("sort", sort);
	var uriParams = searchCriterias.toString();
	console.log("search():\n\t/"+parkour+"?"+uriParams);
	//history.pushState({}, null, "./"+parkour+"?"+uriParams);
	//window.location = "#./"+parkour+"?"+uriParams;
	window.location = "/"+parkour+"?"+uriParams;
}

