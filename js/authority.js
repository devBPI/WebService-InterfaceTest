function loadMappedNotices(element, key, id, count, page, rows)
{
	if(typeof count === "undefined") {count = 1;}
	if(typeof page === "undefined" || page <=0) {page = 1;}
	if(typeof rows === "undefined") {rows = 5;}
	//$("#reservation"+numLieu).load("reservationList.php?espaceID="+numLieu+"&page="+page);
	var numPages=Math.round(count/rows);
	console.log(id + " : load " + key + ", p" + page + "/" + numPages + " x " + count);
	//element.innerHTML=("+"+page);
	var url = "/mappedNoticesToAuthorities.php?key="+key+"&id="+id+"&rows="+rows+"&count="+count+"&page="+page+"&numPages="+numPages;
	console.log(url);
	$(element).load(url);
}

window.onload = function()
{
	var mappedNoticesLists = document.getElementsByClassName("noticeMappee");
	for(var i = 0; i < mappedNoticesLists.length; i++)
	{
		var key = mappedNoticesLists[i].getElementsByClassName("key")[0].innerHTML;
		var count = mappedNoticesLists[i].getElementsByClassName("count")[0].innerHTML;
		var id = mappedNoticesLists[i].getElementsByClassName("id")[0].innerHTML;
		var tabDiv = mappedNoticesLists[i].getElementsByClassName("noticeMappee-tab")[0];
		loadMappedNotices(tabDiv, key, id, count);
	}
	/*loadReservation(1);
	loadReservation(2);
	loadReservation(3);
	loadReservation(4);*/
}
