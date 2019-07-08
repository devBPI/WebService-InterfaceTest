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
					//case "musique":
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
		<!--<a id="parkourMusique" onclick="window.location='/musique'+window.location.search;" <?php /*if($parkour=="musique"){echo "class=\"selected-parkour\"";}*/?>>Musique</a>-->
		<a id="parkourPresse" onclick="window.location='/presse'+window.location.search;" <?php if($parkour=="presse"){echo "class=\"selected-parkour\"";}?>>Presse</a>
	</div>
	<div id="carouselWrapper"></div>

	<div>
		<div>
			<div class="autocomplete">
				<input type="text" id="searchbar" class="searchbar" name="searchbar" autocomplete="off" size=50 placeholder="Rechercher sur le site…" onkeyup="if(event.keyCode==13){search();}" <?php if($defaultSearchText!=null){echo "value=\"".$defaultSearchText."\"";} ?> />
			</div>
			<select id="searchBarSelection" class="searchBarSelection">
				<option class="searchBarSelectionGenerale" "selected" value="general">Tous les mots</option>
				<option class="searchBarSelectionAuteur" value="auteur">Auteur</option>
				<option class="searchBarSelectionTitre" value="titre">Titre</option>
				<option class="searchBarSelectionSujet" value="sujet">Sujet</option>
				<option class="searchBarSelectionIssnIsbnCom" value="isbn-issn-commercial">ISBN, ISSN, numéros commerciaux</option>
				<option class="searchBarSelectionIndiceCote" value="indicecote">Indice / Cote</option>
				<option class="searchBarSelectionDatePublication" value="date-publication">Date de publication (précise)</option>
				<option class="searchBarSelectionEdition" value="editeur">Éditeur</option>
				<option class="searchBarSelectionRealisateur" value="realisateur">Réalisateur</option>
				<option class="searchBarSelectionTheme" value="theme">Thème</option>
			</select>
			<input id="loupe" type="submit" value=" " onclick="search();" />
			<input id="advancedSearchButton" type="submit" value="+" onclick="advancedSearch();" />
		</div>
		<div>
			<div id="conditionSchema" style="display: none;">
				<select class="searchBarOperator">
					<option value="ET">ET</option>
					<option value="OU">OU</option>
					<option value="SAUF">SAUF</option>
				</select>
				<div class="autocomplete">
					<input type="text" class="searchbar" name="searchbar" autocomplete="off" size=42 placeholder="Rechercher sur le site…" onkeyup="if(event.keyCode==13){search();}" />
				</div>
				<select class="searchBarSelection">
					<option class="searchBarSelectionGenerale" <?php if($defaultGeneralSignification=="general") echo "selected"; ?> value="general">Tous les mots</option>
					<option class="searchBarSelectionAuteur" <?php if($defaultGeneralSignification=="auteur") echo "selected"; ?> value="auteur">Auteur</option>
					<option class="searchBarSelectionTitre" <?php if($defaultGeneralSignification=="titre") echo "selected"; ?> value="titre">Titre</option>
					<option class="searchBarSelectionSujet" <?php if($defaultGeneralSignification=="sujet") echo "selected"; ?> value="sujet">Sujet</option>
					<option class="searchBarSelectionIssnIsbnCom" <?php if($defaultGeneralSignification=="isbnissncommercial") echo "selected"; ?> value="isbn-issn-commercial">ISBN, ISSN, numéros commerciaux</option>
					<option class="searchBarSelectionIndiceCote" <?php if($defaultGeneralSignification=="indicecote") echo "selected"; ?> value="indicecote">Indice / Cote</option>
					<option class="searchBarSelectionDatePublication" <?php if($defaultGeneralSignification=="datepublication") echo "selected"; ?> value="date-publication">Date de publication (précise)</option>
					<option class="searchBarSelectionEdition" <?php if($defaultGeneralSignification=="editeur") echo "selected"; ?> value="editeur">Éditeur</option>
					<option class="searchBarSelectionRealisateur" <?php if($defaultGeneralSignification=="realisateur") echo "selected"; ?> value="realisateur">Réalisateur</option>
					<option class="searchBarSelectionTheme" <?php if($defaultGeneralSignification=="theme") echo "selected"; ?> value="theme">Thème</option>
				</select>
				<input class="delConditionButton" type="submit" value="-" onclick="removeCondition(this.parentNode);" />
				Supprimer la condition
			</div>
			<div id="additionnalConditions">
			</div>
			<input class="addConditionButton" type="submit" value="+" onclick="addCondition();" />
			ajouter une condition
		</div>
	</div>
</div>
<div id="advancedSearchDiv" style="margin-top: 10px; display:none;">
	<?php include('advancedsearchbar.php'); ?>
</div>
<div id="result-lists" style="width: 100%;">
	<div id="facetsdiv" style="margin: 3px; grid-column: 1 / span 2;">
		<div id="facets"></div>
	</div>
	<div id="authoritiesdiv" style="margin: 3px; grid-column: 1 / span 2;">
		<div id="mostRelevantAuthorities"></div>
	</div>
	<div id="notices" style="margin: 3px; grid-column: 1;"></div>
	<div id="notices-online" style="margin: 3px; grid-column: 2;"></div>
</div>
