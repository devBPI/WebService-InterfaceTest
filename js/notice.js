function sleep(ms)
{
	return new Promise(resolve => setTimeout(resolve, ms));
}

async function loadIndexes()
{
	
	var feuilletageIndexesLists = document.getElementById("datasIndexes");
	var indiceCdu = feuilletageIndexesLists.getElementsByClassName("indiceCduFeuille")[0].innerHTML;
	var isOnline = feuilletageIndexesLists.getElementsByClassName("isOnlineFeuille")[0].innerHTML;
	var tabDiv = feuilletageIndexesLists.getElementsByClassName("feuilletageIndexes-tab")[0];
	tabDiv.innerHTML = "<img style=\"width:60px; height: 60px;\" src=\"/img/spin.svg\" alt=\"loading\" srcset=\"/img/spin.svg\"/>";

	await sleep(750);

	var url = "/noticeMemeThemes.php?indicecdu="+encodeURIComponent(indiceCdu)+"&isOnline="+encodeURIComponent(isOnline);
	//console.log(indiceCdu + " - " + isOnline);
	console.log(url);
	$(tabDiv).load(url);
}

$(window).load(function()
{
	loadIndexes();
	//loadQuatrieme();
	//loadTableMatieres();
});
