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
	<div id="carouselWrapper">
		<?php include('carousel.php'); ?>
	</div>
<?php
	if(null != $defaultAdvancedSearchCriterias)
		echo "<div id=\"simpleSearchDiv\" style=\"display:none;\" selected>";
	else
		echo "<div id=\"simpleSearchDiv\" style=\"display:block;\" selected>";
?>
		<div>
<?php
	if(null != $defaultSimpleSearchCriterias)
	{
		$xslUrl = "xslt/simpleSearchCriterias.xsl";
		$xml = new DOMDocument('1.0', 'utf-8');
		$xml->loadXML($defaultSimpleSearchCriterias);

		$xsl = new DOMDocument;
		$xsl->load($xslUrl);

		$proc = new XSLTProcessor;
		$proc->importStyleSheet($xsl);

		//echo str_replace("¿", "", $proc->transformToXML($xml));
		echo $proc->transformToXML($xml);
	}
	else
	{
?>
			<span class="searchbarWithSelection">
				<div class="autocomplete">
					<input type="text" id="searchbar" class="searchbar" name="searchbar" autocomplete="off" size=50 placeholder="Rechercher sur le site…" onkeyup="if(event.keyCode==13){launchSearch();}" />
				</div>
				<select class="searchBarSelection">
					<option class="searchBarSelectionGenerale" "selected" value="general">Tous les mots</option>
					<option class="searchBarSelectionTitre" value="titre">Titre</option>
					<option class="searchBarSelectionAuteur" value="auteur">Auteur</option>
					<option class="searchBarSelectionRealisateur" value="realisateur">Réalisateur</option>
					<option class="searchBarSelectionSujet" value="sujet">Sujet</option>
					<option class="searchBarSelectionTheme" value="theme">Thème</option>
					<option class="searchBarSelectionEdition" value="editeur">Éditeur</option>
					<option class="searchBarSelectionDatePublication" value="date-publication">Date de publication (précise)</option>
					<option class="searchBarSelectionIssnIsbnCom" value="isbn-issn-numcommercial">ISBN, ISSN, numéros commerciaux</option>
					<option class="searchBarSelectionIndiceCote" value="indice-cote">Indice / Cote</option>
				</select>
			</span>
			<input id="loupe" type="submit" value=" " onclick="launchSearch();" />
<?php
	}
?>
			<div style="display: none;">
				<div id="conditionSchema" style="display: none;">
					<select class="searchBarOperator">
						<option value="ET">ET</option>
						<option value="OU">OU</option>
						<option value="SAUF">SAUF</option>
					</select>
					<span class="searchbarWithSelection">
						<div class="autocomplete">
							<input type="text" class="searchbar" name="searchbar" autocomplete="off" size=42 placeholder="Rechercher sur le site…" onkeyup="if(event.keyCode==13){launchSearch();}" />
						</div>
						<select class="searchBarSelection">
							<option class="searchBarSelectionGenerale" value="general">Tous les mots</option>
							<option class="searchBarSelectionAuteur" value="auteur">Auteur</option>
							<option class="searchBarSelectionTitre" value="titre">Titre</option>
							<option class="searchBarSelectionSujet" value="sujet">Sujet</option>
							<option class="searchBarSelectionIssnIsbnCom" value="isbn-issn-numcommercial">ISBN, ISSN, numéros commerciaux</option>
							<option class="searchBarSelectionIndiceCote" value="indice-cote">Indice / Cote</option>
							<option class="searchBarSelectionDatePublication" value="date-publication">Date de publication (précise)</option>
							<option class="searchBarSelectionEdition" value="editeur">Éditeur</option>
							<option class="searchBarSelectionRealisateur" value="realisateur">Réalisateur</option>
							<option class="searchBarSelectionTheme" value="theme">Thème</option>
						</select>
					</span>
					<input class="delConditionButton" type="submit" value="-" onclick="removeCondition(this.parentNode);" />
					Supprimer la condition
				</div>
				<input class="addConditionButton" type="submit" value="+" onclick="addCondition();" />
				Ajouter une condition
			</div>
		</div>
	</div>

<?php
	if(null != $defaultAdvancedSearchCriterias)
		echo "<div id=\"advancedSearchDiv\" style=\"display:block;\" >";
	else
		echo "<div id=\"advancedSearchDiv\" style=\"display:none;\" ><span />";
		include('advancedsearchbar.php');
?>
	</div>
	<input id="advancedSearchButton" type="submit" <?php if(null != $defaultAdvancedSearchCriterias) echo 'value="-"'; else echo 'value="+"' ?> onclick="advancedSearch();" /> Recherche avancée
</div>
<div id="result-lists" style="width: 100%;">
	<!--<div id="facetsdiv" style="margin: 3px; grid-column: 1 / span 2;">
		<div id="facets"></div>
	</div>
	<div id="authoritiesdiv" style="margin: 3px; grid-column: 1 / span 2;">
		<div id="mostRelevantAuthorities"></div>
	</div>
	<div id="notices" style="margin: 3px; grid-column: 1;"></div>
	<div id="notices-online" style="margin: 3px; grid-column: 2;"></div>-->
<?php
	if(isGetOk("simpleSearchCriterias") || isGetOk("advancedSearchCriterias"))
		include('searchAll.php');
?>
</div>
