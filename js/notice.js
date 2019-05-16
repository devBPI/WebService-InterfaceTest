function loadIndexes()
{
	var feuilletageIndexesLists = document.getElementById("feuilletageIndexes");
	var indiceCdu = feuilletageIndexesLists.getElementsByClassName("indiceCduFeuille")[0].innerHTML;
	var tabDiv = feuilletageIndexesLists.getElementsByClassName("feuilletageIndexes-tab")[0];
	var url = "/feuilletageIndexes.php?indicecdu="+encodeURIComponent(indiceCdu);
	console.log(indiceCdu);
	console.log(url);
	$(tabDiv).load(url);
}

window.onload = function()
{
	loadIndexes();
	//loadQuatrieme();
	//loadTableMatieres();
}
