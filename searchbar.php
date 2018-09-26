<!--<label for="searchbar">Search: </label>-->
<div class="autocomplete">
	<input type="text" id="searchbar" name="searchbar" autocomplete="off" size=50 placeholder="Rechercher sur le site…" onkeydown="if(event.keyCode==13)search();" />
</div>
<input id="loupe" type="submit" value=" " onclick="search();" />
<br />
<div id="notices_research"></div>
<div id="notices_online_research"></div>
