<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/facets/facetsList|/results/facets/facetsList">
		<div id="facetsFlex">
			<xsl:for-each select="facet">
				<xsl:if test="name='disponibilite' or name='type' or name='creator' or name='date_publishing' or name='language' or name='subject' or name='genre_musical' or name='genre_film' or name='genre_litteraire' or name='configuration_name' or name='secteur' or name='material_support' or name='audience'">
					<div id="{name}">
						<xsl:variable name="facetLabel">
							<xsl:choose>
								<xsl:when test="name='disponibilite'">Disponibilité</xsl:when>
								<xsl:when test="name='type'">Type de document</xsl:when>
								<xsl:when test="name='creator'">Auteurs, Contributeurs</xsl:when>
								<xsl:when test="name='date_publishing'">Date de publication</xsl:when>
								<xsl:when test="name='language'">Langues</xsl:when>
								<xsl:when test="name='subject'">Sujets</xsl:when>
								<xsl:when test="name='genre_musical'">Genre musical</xsl:when>
								<xsl:when test="name='genre_film'">Genre film</xsl:when>
								<xsl:when test="name='genre_litteraire'">Genre littéraire</xsl:when>
								<xsl:when test="name='configuration_name'">Base de recherche</xsl:when>
								<xsl:when test="name='secteur'">Secteur</xsl:when>
								<xsl:when test="name='material_support'">Support</xsl:when>
								<xsl:when test="name='audience'">Public destinataire</xsl:when>
								<xsl:when test="name='contenu'">Contenu</xsl:when>
								<xsl:otherwise><xsl:value-of select="name"/></xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<!--<xsl:if test="(count-offline&gt;0) or (count-online&gt;0)">-->
						<div class="facet" onclick="displayHideFacet(facet{position()});">
							<xsl:value-of select="$facetLabel"/>&#160;<span style="font-weight: bold;">(<xsl:value-of select="count(valuesCounts/value)"/>)</span>
						</div>
						<xsl:variable name="facetName" select="name"/>
						<xsl:variable name="slash">\</xsl:variable>
						<xsl:variable name="doubleSlash">\\</xsl:variable>
						<xsl:variable name="quote">'</xsl:variable>
						<xsl:variable name="slashQuote">\'</xsl:variable>
						<div id="facet{position()}" style="display: none;">
							<xsl:choose>
								<xsl:when test="name='date_publishing'">
									<xsl:for-each select="valuesCounts/value">
										<xsl:sort select="name" data-type="number" order="descending" />
										<xsl:variable name="replacedSlashString">
											<xsl:call-template name="replace_single_quote">
												<xsl:with-param name="string" select="name" />
												<xsl:with-param name="find" select="$slash" />
												<xsl:with-param name="replace" select="$doubleSlash" />
											</xsl:call-template>
										</xsl:variable>
										<xsl:variable name="replacedQuoteString">
											<xsl:call-template name="replace_single_quote">
												<xsl:with-param name="string" select="$replacedSlashString" />
												<xsl:with-param name="find" select="$quote" />
												<xsl:with-param name="replace" select="$slashQuote" />
											</xsl:call-template>
										</xsl:variable>
										<div class="facet" onclick="addFacet('{$facetName}', '{$replacedQuoteString}');">
											- <xsl:value-of select="name"/>&#160;<span style="font-weight: bold;">(<xsl:value-of select="count-total"/>)</span>
										</div>
									</xsl:for-each>
								</xsl:when>
								<xsl:otherwise>
									<xsl:for-each select="valuesCounts/value">
										<xsl:sort select="count-total" data-type="number" order="descending"/>
										<xsl:variable name="replacedSlashString">
											<xsl:call-template name="replace_single_quote">
												<xsl:with-param name="string" select="name" />
												<xsl:with-param name="find" select="$slash" />
												<xsl:with-param name="replace" select="$doubleSlash" />
											</xsl:call-template>
										</xsl:variable>
										<xsl:variable name="replacedQuoteString">
											<xsl:call-template name="replace_single_quote">
												<xsl:with-param name="string" select="$replacedSlashString" />
												<xsl:with-param name="find" select="$quote" />
												<xsl:with-param name="replace" select="$slashQuote" />
											</xsl:call-template>
										</xsl:variable>
										<div class="facet" onclick="addFacet('{$facetName}', '{$replacedQuoteString}');">
											- <xsl:value-of select="name"/>&#160;<span style="font-weight: bold;">(<xsl:value-of select="count-total"/>)</span>
										</div>
									</xsl:for-each>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
				</xsl:if>
			</xsl:for-each>
		</div>
	</xsl:template>
	<xsl:template name="replace_single_quote">
		<xsl:param name="string" select="''"/>
		<xsl:param name="find" select="''"/>
		<xsl:param name="replace" select="''"/>
		<xsl:choose>
			<xsl:when test="contains($string,$find)">
				<xsl:value-of select="concat(substring-before($string,$find),$replace)"/>
				<xsl:call-template name="replace_single_quote">
					<xsl:with-param name="string" select="substring-after($string,$find)"/>
					<xsl:with-param name="find" select="$find"/>
					<xsl:with-param name="replace" select="$replace"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$string"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="text()"/>
</xsl:stylesheet>
