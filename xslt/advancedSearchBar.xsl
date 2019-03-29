<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/advanced-search-elements">
		<xsl:if test="genres-musicaux/genre-musical">
			<div id="genresMusicauxList" class="btn-group">
				<button type="button" class="btn btn-default" data-toggle="dropdown" title="Genres musicaux" onclick="displayBtnGrp(this);">
					<span class="multiselect-selected-text">Genres musicaux</span><div class="caret"></div>
				</button>
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
				</button>
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
				</button>
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
	</xsl:template>
</xsl:stylesheet>
