<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/advanced-search-elements">
		<xsl:if test="bases-recherche/base-recherche">
			<div id="basesRechercheList" class="btn-group">
				<button type="button" class="btn btn-default" data-toggle="dropdown" title="Bases de recherche" onclick="displayBtnGrp(this);">
					<span class="multiselect-selected-text">Bases de recherche</span><div class="caret"></div>
				</button><br />
				<ul id="basesRechercheUl" class="multiselect-container dropdown-menu">
					<xsl:for-each select="bases-recherche/base-recherche">
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
			<div id="languesList" class="btn-group">
				<button type="button" class="btn btn-default" data-toggle="dropdown" title="Langues" onclick="displayBtnGrp(this);">
					<span class="multiselect-selected-text">Langues</span><div class="caret"></div>
				</button><br />
				<ul id="languesUl" class="multiselect-container dropdown-menu">
					<xsl:for-each select="langues/langue">
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
			<div id="typesList" class="btn-group">
				<button type="button" class="btn btn-default" data-toggle="dropdown" title="Types" onclick="displayBtnGrp(this);">
					<span class="multiselect-selected-text">Types</span><div class="caret"></div>
				</button><br />
				<ul id="languesUl" class="multiselect-container dropdown-menu">
					<xsl:for-each select="types/type">
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
			<div id="supportsList" class="btn-group">
				<button type="button" class="btn btn-default" data-toggle="dropdown" title="Supports" onclick="displayBtnGrp(this);">
					<span class="multiselect-selected-text">Supports</span><div class="caret"></div>
				</button><br />
				<ul id="supportsUl" class="multiselect-container dropdown-menu">
					<xsl:for-each select="supports/support">
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
			<div id="genresMusicauxList" class="btn-group">
				<button type="button" class="btn btn-default" data-toggle="dropdown" title="Genres musicaux" onclick="displayBtnGrp(this);">
					<span class="multiselect-selected-text">Genres musicaux</span><div class="caret"></div>
				</button><br />
				<ul id="genresMusicauxUl" class="multiselect-container dropdown-menu">
					<xsl:for-each select="genres-musicaux/genre-musical">
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
			<div id="genresFilmsList" class="btn-group">
				<button type="button" class="btn btn-default" data-toggle="dropdown" title="Genres films" onclick="displayBtnGrp(this);">
					<span class="multiselect-selected-text">Genres films</span><div class="caret"></div>
				</button><br />
				<ul id="genresFilmsUl" class="multiselect-container dropdown-menu">
					<xsl:for-each select="genres-films/genre-film">
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
			<div id="genresLitterairesList" class="btn-group">
				<button type="button" class="btn btn-default" data-toggle="dropdown" title="Genres litteraires" onclick="displayBtnGrp(this);">
					<span class="multiselect-selected-text">Genres litteraires</span><div class="caret"></div>
				</button><br />
				<ul id="genresLitterairesUl" class="multiselect-container dropdown-menu">
					<xsl:for-each select="genres-litteraires/genre-litteraire">
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
			<div id="secteursList" class="btn-group">
				<button type="button" class="btn btn-default" data-toggle="dropdown" title="Secteurs" onclick="displayBtnGrp(this);">
					<span class="multiselect-selected-text">Langues</span><div class="caret"></div>
				</button><br />
				<ul id="secteursUl" class="multiselect-container dropdown-menu">
					<xsl:for-each select="secteurs/secteur">
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
			<div id="publiquesList" class="btn-group">
				<button type="button" class="btn btn-default" data-toggle="dropdown" title="Publiques" onclick="displayBtnGrp(this);">
					<span class="multiselect-selected-text">Publiques</span><div class="caret"></div>
				</button><br />
				<ul id="publiquesUl" class="multiselect-container dropdown-menu">
					<xsl:for-each select="langues/langue">
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
			<div id="languesList" class="btn-group">
				<button type="button" class="btn btn-default" data-toggle="dropdown" title="Supports" onclick="displayBtnGrp(this);">
					<span class="multiselect-selected-text">Supports</span><div class="caret"></div>
				</button><br />
				<ul id="supportsUl" class="multiselect-container dropdown-menu">
					<xsl:for-each select="supports/support">
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
