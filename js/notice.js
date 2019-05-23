function loadIndexes()
{
	var feuilletageIndexesLists = document.getElementById("datasIndexes");
	var indiceCdu = feuilletageIndexesLists.getElementsByClassName("indiceCduFeuille")[0].innerHTML;
	var tabDiv = feuilletageIndexesLists.getElementsByClassName("feuilletageIndexes-tab")[0];
	var url = "/feuilletageIndexes.php?indicecdu="+encodeURIComponent(indiceCdu);
	console.log(indiceCdu);
	console.log(url);
	$(tabDiv).load(url);
}

$(window).load(function()
{
	loadIndexes();
	//loadQuatrieme();
	//loadTableMatieres();
});
