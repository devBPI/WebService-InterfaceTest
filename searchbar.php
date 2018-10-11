<!--<label for="searchbar">Search: </label>-->
<div id="search">
	<div class="autocomplete">
		<input type="text" id="searchbar" name="searchbar" autocomplete="off" size=50 placeholder="Rechercher sur le site…" onkeyup="if(event.keyCode==13)search();" />
	</div>
	<select id="searchBarSelection">
		<option value="Generale">Générale</option>
		<option value="Titre" disabled="true">Titre</option>
		<option value="Auteur" disabled="true">Auteur</option>
	</select>
	<input id="loupe" type="submit" value=" " onclick="search();" />
	<input id="advancedSearchButton" type="submit" value="+" onclick="advancedSearch();" />
</div>
<div id="advancedSearchDiv" style="display:none;">
	<div class="autocomplete-title">
		<input type="text" id="advancedsearch-title" name="advancedsearch-title" autocomplete="off" size=50 placeholder="Titre…" onkeyup="if(event.keyCode==13)search();" disabled="true" />
	</div>
</div>
<div id="result-lists" style="width: 100%;">
	<div id="notices" style="margin: 3px; grid-column: 1;"></div>
	<div id="notices-online" style="margin: 3px; grid-column: 2;"></div>
</div>
