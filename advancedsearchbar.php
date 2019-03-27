<!--
<select id="lstFruits" multiple="multiple">
    <option value="1">Mango</option>
    <option value="2">Apple</option>
    <option value="3">Banana</option>
    <option value="4">Guava</option>
    <option value="5">Orange</option>
</select>
<input type="button" id="btnSelected" value="Get Selected" />
-->

<div class="autocomplete-title">
	<input type="text" id="advancedsearch-titre"                name="advancedsearch-titre"                 autocomplete="off" size=50 placeholder="Titre…"                         onkeyup="if(event.keyCode==13)search();" <?php if($defaultTitre!=null){echo "value=\"".encodeStringForInput($defaultTitre)."\"";} ?> /><br />
</div>
<div class="autocomplete-unk">
	<input type="text" id="advancedsearch-auteur"               name="advancedsearch-auteur"                autocomplete="off" size=50 placeholder="Auteur…"                        onkeyup="if(event.keyCode==13)search();" <?php if($defaultAuteur!=null){echo "value=\"".encodeStringForInput($defaultAuteur)."\"";} ?> /><br />
</div>
<div class="autocomplete-unk">
	<input type="text" id="advancedsearch-sujet"                name="advancedsearch-sujet"                 autocomplete="off" size=50 placeholder="Sujet…"                         onkeyup="if(event.keyCode==13)search();" <?php if($defaultSujet!=null){echo "value=\"".encodeStringForInput($defaultSujet)."\"";} ?> /><br />
</div>
<div class="autocomplete-unk">
	<input type="text" id="advancedsearch-isbnissncommercial"   name="advancedsearch-isbnissncommercial"    autocomplete="off" size=50 placeholder="ISBN/ISSN/Numéros commerciaux…" onkeyup="if(event.keyCode==13)search();" <?php if($defaultIsbnIssnCommercial!=null){echo "value=\"".encodeStringForInput($defaultIsbnIssnCommercial)."\"";} ?> /><br />
</div>
<div class="autocomplete-unk">
	<input type="text" id="advancedsearch-indicecote"           name="advancedsearch-indicecote"            autocomplete="off" size=50 placeholder="Indice/Cote…"                   onkeyup="if(event.keyCode==13)search();" <?php if($defaultIndiceCote!=null){echo "value=\"".encodeStringForInput($defaultIndiceCote)."\"";} ?> /><br />
</div>
<div class="autocomplete-unk">
	<input type="text" id="advancedsearch-datepublication"      name="advancedsearch-datepublication"       autocomplete="off" size=50 placeholder="Date de Publication…"           onkeyup="if(event.keyCode==13)search();" <?php if($defaultDatePublication!=null){echo "value=\"".encodeStringForInput($defaultDatePublication)."\"";} ?> disabled="true" /><br />
</div>
<div class="autocomplete-unk">
	<input type="text" id="advancedsearch-realisateur"          name="advancedsearch-realisateur"           autocomplete="off" size=50 placeholder="Réalisateurs…"                  onkeyup="if(event.keyCode==13)search();" <?php if($defaultRealisateur!=null){echo "value=\"".encodeStringForInput($defaultRealisateur)."\"";} ?> /><br />
</div>
<div class="autocomplete-unk">
	<input type="text" id="advancedsearch-theme"                name="advancedsearch-theme"                 autocomplete="off" size=50 placeholder="Theme…"                         onkeyup="if(event.keyCode==13)search();" <?php if($defaultTheme!=null){echo "value=\"".encodeStringForInput($defaultTheme)."\"";} ?> /><br />
</div>
<div class="autocomplete-unk">
	<input type="text" id="advancedsearch-baserecherche"        name="advancedsearch-baserecherc"           autocomplete="off" size=50 placeholder="Base de Recherche…"             onkeyup="if(event.keyCode==13)search();" <?php if($defaultBaseRecherche!=null){echo "value=\"".encodeStringForInput($defaultBaseRecherche)."\"";} ?> disabled="true" /><br />
</div>
<div class="autocomplete-unk">
	<input type="text" id="advancedsearch-editeur"              name="advancedsearch-Editeur"               autocomplete="off" size=50 placeholder="Éditeur…"                       onkeyup="if(event.keyCode==13)search();" <?php if($defaultEditeur!=null){echo "value=\"".encodeStringForInput($defaultEditeur)."\"";} ?> /><br />
</div>
<div class="autocomplete-unk">
	<input type="text" id="advancedsearch-collection"           name="advancedsearch-collection"            autocomplete="off" size=50 placeholder="Collection…"                    onkeyup="if(event.keyCode==13)search();" <?php if($defaultCollection!=null){echo "value=\"".encodeStringForInput($defaultCollection)."\"";} ?> /><br />
</div>
<div class="autocomplete-unk">
	<input type="text" id="advancedsearch-datepublicationstart" name="advancedsearch-date-publicationstart" autocomplete="off" size=50 placeholder="Date de Publication (Début)…"   onkeyup="if(event.keyCode==13)search();" <?php if($defaultDatePublicationStart!=null){echo "value=\"".encodeStringForInput($defaultDatePublicationStart)."\"";} ?> disabled="true" /><br />
</div>
<div class="autocomplete-unk">
	<input type="text" id="advancedsearch-datepublicationend"   name="advancedsearch-date publicationend"   autocomplete="off" size=50 placeholder="Date de Publication (Fin)…"     onkeyup="if(event.keyCode==13)search();" <?php if($defaultDatePublicationEnd!=null){echo "value=\"".encodeStringForInput($defaultDatePublicationEnd)."\"";} ?> disabled="true" /><br />
</div>
<div class="autocomplete-unk">
	<input type="text" id="advancedsearch-langue"               name="advancedsearch-langue"                autocomplete="off" size=50 placeholder="Langues…"                       onkeyup="if(event.keyCode==13)search();" <?php if($defaultLangue!=null){echo "value=\"".encodeStringForInput($defaultLangue)."\"";} ?> disabled="true" /><br />
</div>
<div class="autocomplete-unk">
	<input type="text" id="advancedsearch-type"                 name="advancedsearch-type"                  autocomplete="off" size=50 placeholder="Type de Document…"              onkeyup="if(event.keyCode==13)search();" <?php if($defaultType!=null){echo "value=\"".encodeStringForInput($defaultType)."\"";} ?> disabled="true" /><br />
</div>
<div class="autocomplete-unk">
	<input type="text" id="advancedsearch-support"              name="advancedsearch-support"               autocomplete="off" size=50 placeholder="Support…"                       onkeyup="if(event.keyCode==13)search();" <?php if($defaultSupport!=null){echo "value=\"".encodeStringForInput($defaultSupport)."\"";} ?> disabled="true" /><br />
</div>
<div class="autocomplete-unk">
	<input type="text" id="advancedsearch-genremusic"           name="advancedsearch-genremusic"            autocomplete="off" size=50 placeholder="Genre Musical…"                 onkeyup="if(event.keyCode==13)search();" <?php if($defaultGenreMusic!=null){echo "value=\"".encodeStringForInput($defaultGenreMusic)."\"";} ?> disabled="true" /><br />
</div>
<div class="autocomplete-unk">
	<input type="text" id="advancedsearch-genrefilm"            name="advancedsearch-genrefilm"             autocomplete="off" size=50 placeholder="Genre Film…"                    onkeyup="if(event.keyCode==13)search();" <?php if($defaultGenreFilm!=null){echo "value=\"".encodeStringForInput($defaultGenreFilm)."\"";} ?> disabled="true" /><br />
</div>
<div class="autocomplete-unk">
	<input type="text" id="advancedsearch-genrelitt"            name="advancedsearch-genrelitt"             autocomplete="off" size=50 placeholder="Genre littéraire…"              onkeyup="if(event.keyCode==13)search();" <?php if($defaultGenreLitt!=null){echo "value=\"".encodeStringForInput($defaultGenreLitt)."\"";} ?> disabled="true" /><br />
</div>
<div class="autocomplete-unk">
	<input type="text" id="advancedsearch-secteur"              name="advancedsearch-secteur"               autocomplete="off" size=50 placeholder="Secteur…"                       onkeyup="if(event.keyCode==13)search();" <?php if($defaultSecteur!=null){echo "value=\"".encodeStringForInput($defaultSecteur)."\"";} ?> disabled="true" /><br />
</div>
<div class="autocomplete-unk">
	<input type="text" id="advancedsearch-audience"             name="advancedsearch-audience"              autocomplete="off" size=50 placeholder="Public Destinataire…"           onkeyup="if(event.keyCode==13)search();" <?php if($defaultAudience!=null){echo "value=\"".encodeStringForInput($defaultAudience)."\"";} ?> disabled="true" />
</div>