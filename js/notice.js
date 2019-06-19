function quatrieme(button)
{
	if(button.innerHTML=='+')
	{
		document.getElementById("quatrieme").style.display = 'block';
		button.innerHTML='-';
	}
	else
	{
		document.getElementById("quatrieme").style.display = 'none';
		button.innerHTML='+';
	}
}

function tableMatieres(button)
{
	if(button.innerHTML=='+')
	{
		document.getElementById("tableDesMatieres").style.display = 'block';
		button.innerHTML='-';
	}
	else
	{
		document.getElementById("tableDesMatieres").style.display = 'none';
		button.innerHTML='+';
	}
}

function sleep(ms)
{
	return new Promise(resolve => setTimeout(resolve, ms));
}

async function loadMemeThemes()
{
	
	var memeThemesLists = document.getElementById("datasIndexes");
	var indiceCdu = memeThemesLists.getElementsByClassName("indiceCduFeuille")[0].innerHTML;
	var isOnline = memeThemesLists.getElementsByClassName("isOnlineFeuille")[0].innerHTML;
	var tabDiv = memeThemesLists.getElementsByClassName("feuilletageIndexes-tab")[0];
	tabDiv.innerHTML = "<img style=\"width:60px; height: 60px;\" src=\"/img/spin.svg\" alt=\"loading\" srcset=\"/img/spin.svg\"/>";

	await sleep(750);

	var url = "/noticeMemeThemes.php?indicecdu="+encodeURIComponent(indiceCdu)+"&isOnline="+encodeURIComponent(isOnline);
	//console.log(indiceCdu + " - " + isOnline);
	console.log(url);
	$(tabDiv).load(url);
}

$(window).load(function()
{
//	loadMemeThemes();
	//loadQuatrieme();
	//loadTableMatieres();
});

