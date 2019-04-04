<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/advanced-search-elements">
		<xsl:if test="bases-recherche/base-recherche">
			<div id="basesRechercheList" title="configuration_name" class="btn-group">
				<button type="button" class="btn btn-default" data-toggle="dropdown" title="Bases de recherche" onclick="displayBtnGrp(this);">
					<span class="multiselect-selected-text">Bases de recherche</span><div class="caret"></div>
				</button><br />
				<ul id="basesRechercheUl" class="multiselect-container dropdown-menu">
					<xsl:for-each select="bases-recherche/base-recherche">
						<xsl:sort select="."/>
						<li class="">
							<div tabindex="0">
								<label class="checkbox" title="{.}">
									<input class="checkboxinput" type="checkbox" onchange="checkElement(this);"></input>
									<xsl:value-of select="."/>
								</label>
							</div>
						</li>
					</xsl:for-each>
				</ul>
			</div>
		</xsl:if>
		<xsl:if test="langues/langue">
			<div id="languesList" title="language" class="btn-group">
				<button type="button" class="btn btn-default" data-toggle="dropdown" title="Langues" onclick="displayBtnGrp(this);">
					<span class="multiselect-selected-text">Langues</span><div class="caret"></div>
				</button><br />
				<ul id="languesUl" class="multiselect-container dropdown-menu">
					<xsl:for-each select="langues/langue">
						<xsl:sort select="."/>
						<li class="">
							<div tabindex="0">
								<label class="checkbox" title="{.}">
									<input class="checkboxinput" type="checkbox" onchange="checkElement(this);"></input>
									<xsl:value-of select="."/>
								</label>
							</div>
						</li>
					</xsl:for-each>
				</ul>
			</div>
		</xsl:if>
		<xsl:if test="types/type">
			<div id="typesList" title="type" class="btn-group">
				<button type="button" class="btn btn-default" data-toggle="dropdown" title="Type de document" onclick="displayBtnGrp(this);">
					<span class="multiselect-selected-text">Type de document</span><div class="caret"></div>
				</button><br />
				<ul id="languesUl" class="multiselect-container dropdown-menu">
					<xsl:for-each select="types/type">
						<xsl:sort select="."/>
						<li class="">
							<div tabindex="0">
								<label class="checkbox" title="{.}">
									<input class="checkboxinput" type="checkbox" onchange="checkElement(this);"></input>
									<xsl:value-of select="."/>
								</label>
							</div>
						</li>
					</xsl:for-each>
				</ul>
			</div>
		</xsl:if>
		<xsl:if test="supports/support">
			<div id="supportsList" title="material_support" class="btn-group">
				<button type="button" class="btn btn-default" data-toggle="dropdown" title="Support" onclick="displayBtnGrp(this);">
					<span class="multiselect-selected-text">Support</span><div class="caret"></div>
				</button><br />
				<ul id="supportsUl" class="multiselect-container dropdown-menu">
					<xsl:for-each select="supports/support">
						<xsl:sort select="."/>
						<li class="">
							<div tabindex="0">
								<label class="checkbox" title="{.}">
									<input class="checkboxinput" type="checkbox" onchange="checkElement(this);"></input>
									<xsl:value-of select="."/>
								</label>
							</div>
						</li>
					</xsl:for-each>
				</ul>
			</div>
		</xsl:if>
		<xsl:if test="genres-musicaux/genre-musical">
			<div id="genresMusicauxList" title="genre_musical" class="btn-group">
				<button type="button" class="btn btn-default" data-toggle="dropdown" title="Genre musical" onclick="displayBtnGrp(this);">
					<span class="multiselect-selected-text">Genre musical</span><div class="caret"></div>
				</button><br />
				<ul id="genresMusicauxUl" class="multiselect-container dropdown-menu">
					<xsl:for-each select="genres-musicaux/genre-musical">
						<xsl:sort select="."/>
						<li class="">
							<div tabindex="0">
								<label class="checkbox" title="{.}">
									<input class="checkboxinput" type="checkbox" onchange="checkElement(this);"></input>
									<xsl:value-of select="."/>
								</label>
							</div>
						</li>
					</xsl:for-each>
				</ul>
			</div>
		</xsl:if>
		<xsl:if test="genres-films/genre-film">
			<div id="genresFilmsList" title="genre_film" class="btn-group">
				<button type="button" class="btn btn-default" data-toggle="dropdown" title="Genre film" onclick="displayBtnGrp(this);">
					<span class="multiselect-selected-text">Genre film</span><div class="caret"></div>
				</button><br />
				<ul id="genresFilmsUl" class="multiselect-container dropdown-menu">
					<xsl:for-each select="genres-films/genre-film">
						<xsl:sort select="."/>
						<li class="">
							<div tabindex="0">
								<label class="checkbox" title="{.}">
									<input class="checkboxinput" type="checkbox" onchange="checkElement(this);"></input>
									<xsl:value-of select="."/>
								</label>
							</div>
						</li>
					</xsl:for-each>
				</ul>
			</div>
		</xsl:if>
		<xsl:if test="genres-litteraires/genre-litteraire">
			<div id="genresLitterairesList" title="genre_litteraire" class="btn-group">
				<button type="button" class="btn btn-default" data-toggle="dropdown" title="Genre litteraire" onclick="displayBtnGrp(this);">
					<span class="multiselect-selected-text">Genre littéraire</span><div class="caret"></div>
				</button><br />
				<ul id="genresLitterairesUl" class="multiselect-container dropdown-menu">
					<xsl:for-each select="genres-litteraires/genre-litteraire">
						<xsl:sort select="."/>
						<li class="">
							<div tabindex="0">
								<label class="checkbox" title="{.}">
									<input class="checkboxinput" type="checkbox" onchange="checkElement(this);"></input>
									<xsl:value-of select="."/>
								</label>
							</div>
						</li>
					</xsl:for-each>
				</ul>
			</div>
		</xsl:if>
		<xsl:if test="secteurs/secteur">
			<div id="secteursList" title="secteur" class="btn-group">
				<button type="button" class="btn btn-default" data-toggle="dropdown" title="Secteurs" onclick="displayBtnGrp(this);">
					<span class="multiselect-selected-text">Secteur</span><div class="caret"></div>
				</button><br />
				<ul id="secteursUl" class="multiselect-container dropdown-menu">
					<xsl:for-each select="secteurs/secteur">
						<xsl:sort select="."/>
						<li class="">
							<div tabindex="0">
								<label class="checkbox" title="{.}">
									<input class="checkboxinput" type="checkbox" onchange="checkElement(this);"></input>
									<xsl:value-of select="."/>
								</label>
							</div>
						</li>
					</xsl:for-each>
				</ul>
			</div>
		</xsl:if>
		<xsl:if test="publiques/publique">
			<div id="publiquesList" title="audience" class="btn-group">
				<button type="button" class="btn btn-default" data-toggle="dropdown" title="Public destinataire" onclick="displayBtnGrp(this);">
					<span class="multiselect-selected-text">Public destinataire</span><div class="caret"></div>
				</button><br />
				<ul id="publiquesUl" class="multiselect-container dropdown-menu">
					<xsl:for-each select="publiques/publique">
						<xsl:sort select="."/>
						<li class="">
							<div tabindex="0">
								<label class="checkbox" title="{.}">
									<input class="checkboxinput" type="checkbox" onchange="checkElement(this);"></input>
									<xsl:value-of select="."/>
								</label>
							</div>
						</li>
					</xsl:for-each>
				</ul>
			</div>
		</xsl:if>
		<xsl:if test="mediationss/mediation">
			<div id="mediationsList" title="mediation" class="btn-group">
				<button type="button" class="btn btn-default" data-toggle="dropdown" title="Mediation" onclick="displayBtnGrp(this);">
					<span class="multiselect-selected-text">Mediations</span><div class="caret"></div>
				</button><br />
				<ul id="mediationsUl" class="multiselect-container dropdown-menu">
					<xsl:for-each select="mediations/mediation">
						<xsl:sort select="."/>
						<li class="">
							<div tabindex="0">
								<label class="checkbox" title="{.}">
									<input class="checkboxinput" type="checkbox" onchange="checkElement(this);"></input>
									<xsl:value-of select="."/>
								</label>
							</div>
						</li>
					</xsl:for-each>
				</ul>
			</div>
		</xsl:if>
		<xsl:if test="contenus/contenu">
			<div id="contenusList" title="contenu" class="btn-group">
				<button type="button" class="btn btn-default" data-toggle="dropdown" title="Contenu" onclick="displayBtnGrp(this);">
					<span class="multiselect-selected-text">Contenu</span><div class="caret"></div>
				</button><br />
				<ul id="contenusUl" class="multiselect-container dropdown-menu">
					<xsl:for-each select="contenus/contenu">
						<xsl:sort select="."/>
						<li class="">
							<div tabindex="0">
								<label class="checkbox" title="{.}">
									<input class="checkboxinput" type="checkbox" onchange="checkElement(this);"></input>
									<xsl:value-of select="."/>
								</label>
							</div>
						</li>
					</xsl:for-each>
				</ul>
			</div>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
