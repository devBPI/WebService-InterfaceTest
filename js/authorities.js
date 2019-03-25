function displaySupplAuthorities()
{
	document.getElementById("displaySupplAuthorities").style.display = 'none';
	document.getElementById("hideSupplAuthorities").style.display = 'block';
	var supplAuthorities = document.getElementsByClassName("supplAuthority");
	var i;
	for(i=0; i<supplAuthorities.length; i++)
	{
		supplAuthorities[i].style.display = 'block';
	}
}

function hideSupplAuthorities()
{
	document.getElementById("displaySupplAuthorities").style.display = 'block';
	document.getElementById("hideSupplAuthorities").style.display = 'none';
	var supplAuthorities = document.getElementsByClassName("supplAuthority");
	var i;
	for(i=0; i<supplAuthorities.length; i++)
	{
		supplAuthorities[i].style.display = 'none';
	}
}
