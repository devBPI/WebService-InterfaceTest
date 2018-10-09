<!--<label for="searchbar">Search: </label>-->
<div class="autocomplete">
	<input type="text" id="searchbar" name="searchbar" autocomplete="off" size=50 placeholder="Rechercher sur le site…" onkeyup="if(event.keyCode==13)search();" />
</div>
<input id="loupe" type="submit" value=" " onclick="search();" />
<br />
<div id="result-lists" style="width: 100%;">
	<div id="notices" style="margin: 3px; grid-column: 1;"></div>
	<div id="notices-online" style="margin: 3px; grid-column: 2;"></div>
</div>
