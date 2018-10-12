<!--<label for="searchbar">Search: </label>-->
<div id="search">
	<div id="parkour">
		<?php
			$parkour="general";
			if(isset($_GET['parkour']) && $_GET['parkour']!=null && $_GET['parkour']!="")
			{
				switch($_GET['parkour'])
				{
					case "autoformation":
					case "cinema":
					case "musique":
					case "presse":
						$parkour=$_GET['parkour'];
					break;
					default:
					break;
				}
			}
		?>
		<!--<a href="/" <?php if($parkour=="general"){echo "class=\"selected-parkour\"";}?>>General</a>
		<a id="parkourAutoformation" href="/autoformation" <?php if($parkour=="autoformation"){echo "class=\"selected-parkour\"";}?>>Autoformation</a>
		<a id="parkourCinema" href="/cinema" <?php if($parkour=="cinema"){echo "class=\"selected-parkour\"";}?>>Cinema</a>
		<a id="parkourMusique" href="/musique" <?php if($parkour=="musique"){echo "class=\"selected-parkour\"";}?>>Musique</a>
		<a id="parkourPresse" href="/presse" <?php if($parkour=="presse"){echo "class=\"selected-parkour\"";}?>>Presse</a>-->
		<a onclick="window.location='/'+window.location.search;" <?php if($parkour=="general"){echo "class=\"selected-parkour\"";}?>>General</a>
		<a id="parkourAutoformation" onclick="window.location='/autoformation'+window.location.search;" <?php if($parkour=="autoformation"){echo "class=\"selected-parkour\"";}?>>Autoformation</a>
		<a id="parkourCinema" onclick="window.location='/cinema'+window.location.search;" <?php if($parkour=="cinema"){echo "class=\"selected-parkour\"";}?>>Cinema</a>
		<a id="parkourMusique" onclick="window.location='/musique'+window.location.search;" <?php if($parkour=="musique"){echo "class=\"selected-parkour\"";}?>>Musique</a>
		<a id="parkourPresse" onclick="window.location='/presse'+window.location.search;" <?php if($parkour=="presse"){echo "class=\"selected-parkour\"";}?>>Presse</a>
	</div>
	<div class="autocomplete">
		<input type="text" id="searchbar" name="searchbar" autocomplete="off" size=50 placeholder="Rechercher sur le site…" onkeyup="if(event.keyCode==13)search();" <?php if($defaultSearchText!=null){echo "value=\"".$defaultSearchText."\"";} ?>	/>
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
