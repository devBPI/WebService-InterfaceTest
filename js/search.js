function search()
{
	var txt = document.getElementById('searchbar').value;
	//alert(txt);
	var uri = "search.php?text="+txt;
	var url = encodeURI(uri);
	$("#notices_research").load(url);
	//alert(url);
}

function autocomplete(inp, arr)
{
	/*the autocomplete function takes two arguments,
 	the text field element and an array of possible autocompleted values:*/
	var currentFocus;
	/*execute a function when someone writes in the text field:*/
	inp.addEventListener("input", function(e)
	{
		var a, b, i, val = this.value;
		/*close any already open lists of autocompleted values*/
		closeAllLists();
		if(!val)
			return false;
		currentFocus = -1;
		/*create a DIV element that will contain the items (values):*/
		a = document.createElement("div");
		a.setAttribute("id", this.id + "autocomplete-list");
		a.setAttribute("class", "autocomplete-items");
		/*append the DIV element as a child of the autocomplete container:*/
		this.parentNode.appendChild(a);

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
						});
						a.appendChild(b);
					}
				}
			}
		};
		xmlHttp.open("GET", url, true);
		xmlHttp.send();
		//document.getElementById("notices").innerHTML = url;//.getElementsByTagName('str')[0].childNodes[0].nodeValue;
	});

	/*execute a function presses a key on the keyboard:*/
	inp.addEventListener("keydown", function(e)
	{
		var x = document.getElementById(this.id + "autocomplete-list");
		if(x) x = x.getElementsByTagName("div");
		if(e.keyCode == 40)
		{
			/*If the arrow DOWN key is pressed,
 			increase the currentFocus variable:*/
			currentFocus++;
			/*and and make the current item more visible:*/
			addActive(x);
		}
		else if(e.keyCode == 38) { //up
			/*If the arrow UP key is pressed,
 			decrease the currentFocus variable:*/
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
		}
	});

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
		{
			x[i].classList.remove("autocomplete-active");
		}
	}

	function closeAllLists(elmnt)
	{
		/*close all autocomplete lists in the document,
 		except the one passed as an argument:*/
		var x = document.getElementsByClassName("autocomplete-items");
		for(var i = 0; i < x.length; i++)
		{
			if(elmnt != x[i] && elmnt != inp)
			{
				x[i].parentNode.removeChild(x[i]);
			}
		}
	}

	/*execute a function when someone clicks in the document:*/
	document.addEventListener("click", function (e)
	{
		closeAllLists(e.target);
	});
}

autocomplete(document.getElementById("searchbar"), []);;

