<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template name="searchBar">
		<xsl:param name="barsize">50</xsl:param>
		<div class="autocomplete">
			<input type="text" id="searchbar" class="searchbar" name="searchbar" autocomplete="off" size="{$barsize}" placeholder="Rechercher sur le site…"><!-- onkeyup="if(event.keyCode==13)search();">-->
				<xsl:attribute name="onkeyup">if(event.keyCode==13){launchSearch();}</xsl:attribute>
				<xsl:if test="general">
					<xsl:attribute name="value"><xsl:value-of select="general"/></xsl:attribute>
				</xsl:if>
				<xsl:if test="titre">
					<xsl:attribute name="value"><xsl:value-of select="titre"/></xsl:attribute>
				</xsl:if>
				<xsl:if test="auteur">
					<xsl:attribute name="value"><xsl:value-of select="auteur"/></xsl:attribute>
				</xsl:if>
				<xsl:if test="realisateur">
					<xsl:attribute name="value"><xsl:value-of select="realisateur"/></xsl:attribute>
				</xsl:if>
				<xsl:if test="sujet">
					<xsl:attribute name="value"><xsl:value-of select="sujet"/></xsl:attribute>
				</xsl:if>
				<xsl:if test="theme">
					<xsl:attribute name="value"><xsl:value-of select="theme"/></xsl:attribute>
				</xsl:if>
				<xsl:if test="editeur">
					<xsl:attribute name="value"><xsl:value-of select="editeur"/></xsl:attribute>
				</xsl:if>
				<xsl:if test="date-publication">
					<xsl:attribute name="value"><xsl:value-of select="date-publication"/></xsl:attribute>
				</xsl:if>
				<xsl:if test="isbn-issn-numcommercial">
					<xsl:attribute name="value"><xsl:value-of select="isbn-issn-numcommercial"/></xsl:attribute>
				</xsl:if>
				<xsl:if test="indice-cote">
					<xsl:attribute name="value"><xsl:value-of select="indice-cote"/></xsl:attribute>
				</xsl:if>
			</input>
		</div>
	</xsl:template>

	<xsl:template name="searchBarSelection">
		<select id="searchBarSelection" class="searchBarSelection">
			<option class="searchBarSelectionGenerale" value="general">
				<xsl:if test="general"><xsl:attribute name="selected">true</xsl:attribute></xsl:if>
				Tous les mots
			</option>
			<option class="searchBarSelectionAuteur" value="auteur">
				<xsl:if test="auteur"><xsl:attribute name="selected">true</xsl:attribute></xsl:if>
				Auteur
			</option>
			<option class="searchBarSelectionTitre" value="titre">
				<xsl:if test="titre"><xsl:attribute name="selected">true</xsl:attribute></xsl:if>
				Titre
			</option>
			<option class="searchBarSelectionSujet" value="sujet">
				<xsl:if test="sujet"><xsl:attribute name="selected">true</xsl:attribute></xsl:if>
				Sujet
			</option>
			<option class="searchBarSelectionIssnIsbnCom" value="isbn-issn-numcommercial">
				<xsl:if test="isbn-issn-numcommercial"><xsl:attribute name="selected">true</xsl:attribute></xsl:if>
				ISBN, ISSN, numéros commerciaux
			</option>
			<option class="searchBarSelectionIndiceCote" value="indice-cote">
				<xsl:if test="indice-cote"><xsl:attribute name="selected">true</xsl:attribute></xsl:if>
				Indice / Cote
			</option>
			<option class="searchBarSelectionDatePublication" value="date-publication">
				<xsl:if test="date-publication"><xsl:attribute name="selected">true</xsl:attribute></xsl:if>
				Date de publication (précise)
			</option>
			<option class="searchBarSelectionEdition" value="editeur">
				<xsl:if test="editeur"><xsl:attribute name="selected">true</xsl:attribute></xsl:if>
				Éditeur
			</option>
			<option class="searchBarSelectionRealisateur" value="realisateur">
				<xsl:if test="realisateur"><xsl:attribute name="selected">true</xsl:attribute></xsl:if>
				Réalisateur
			</option>
			<option class="searchBarSelectionTheme" value="theme">
				<xsl:if test="theme"><xsl:attribute name="selected">true</xsl:attribute></xsl:if>
				Thème
			</option>
		</select>
	</xsl:template>

	<xsl:template name="additionnalConditions">
		<xsl:for-each select="and/search-criterias">
			<div>
			<select class="searchBarOperator">
				<option value="ET">ET</option>
				<option value="OU">OU</option>
				<option value="SAUF">
					<xsl:if test="not"><xsl:attribute name="selected">true</xsl:attribute></xsl:if>
					SAUF
				</option>
			</select>
			<xsl:call-template name="searchBar">
				<xsl:with-param name="barsize">42</xsl:with-param>
			</xsl:call-template>
			<xsl:call-template name="searchBarSelection" />
			<input class="delConditionButton" type="submit" value="-" onclick="removeCondition(this.parentNode);">-</input>
			Supprimer la condition
			</div>
			<xsl:call-template name="additionnalConditions" />
		</xsl:for-each>
		<xsl:for-each select="or/search-criterias">
			<div>
			<select class="searchBarOperator">
				<option value="ET">ET</option>
				<option selected="true" value="OU">OU</option>
				<option value="SAUF">SAUF</option>
			</select>
			<xsl:call-template name="searchBar">
				<xsl:with-param name="barsize">42</xsl:with-param>
			</xsl:call-template>
			<xsl:call-template name="searchBarSelection" />
			<input class="delConditionButton" type="submit" value="-" onclick="removeCondition(this.parentNode);">-</input>
			Supprimer la condition
			</div>
			<xsl:call-template name="additionnalConditions" />
		</xsl:for-each>
	</xsl:template>

	<xsl:template match="search-criterias">
		<xsl:call-template name="searchBar" />
		<xsl:call-template name="searchBarSelection" />
		<input id="loupe" type="submit" value="&#160;" onclick="launchSearch();"></input>
		<!--<div id="additionnalConditions">&#191;</div>-->
		<div id="additionnalConditions">
			<xsl:choose>
				<xsl:when test="(and) or (or)">
					<xsl:call-template name="additionnalConditions" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:text> </xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</div>
	</xsl:template>
	<xsl:template match="text()"/>
	<xsl:template match="name" mode="encode">
		<xsl:value-of select="url:encode(text())" />
	</xsl:template>
</xsl:stylesheet>
