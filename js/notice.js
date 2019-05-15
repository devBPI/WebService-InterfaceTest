function loadIndexes()
{
	var feuilletageIndexesLists = document.getElementById("feuilletageIndexes");
	var indiceCdu = feuilletageIndexesLists.getElementsByClassName("indiceCdu")[0].innerHTML;
	var tabDiv = feuilletageIndexesLists.getElementsByClassName("feuilletageIndexes-tab")[0];
	var url = "/feuilletageIndexes.php?indicecdu="+encodeURIComponent(indiceCdu);
	console.log(url);
	$(tabDiv).load(url);
}

window.onload = function()
{
	loadIndexes();
	//loadQuatrieme();
	//loadTableMatieres();
}
