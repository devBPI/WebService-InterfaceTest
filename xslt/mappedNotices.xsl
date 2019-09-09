<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/mappedNotices">
		<div id="notices">
		<xsl:for-each select="mappedNotices/mappedNotice">
			<div class="notice" style="overflow:hidden;">
				<xsl:if test="./images-info/image-info/url">
					<div style="float:left; margin-left: 4px; margin-right: 4px;" >
						<xsl:choose>
							<xsl:when test="./images-info/image-info/description">
								<img class="couverture lazy" src="{./images-info/image-info/url}" alt="{./images-info/image-info/description}"/>
							</xsl:when>
							<xsl:otherwise>
								<img class="couverture lazy" src="{./images-info/image-info/url}"/>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</xsl:if>
				<div class="pageButton" style="float:left; margin-right: 4px;"><xsl:value-of select="../../pagination/start + position()"/></div>
				<!--<div class="" style="display: inline-block; float:right; margin-right: 4px; text-align: right;">
					<<xsl:value-of select="./type"/><br />
					<xsl:if test="./formats/format">
						<xsl:for-each select="./formats/format">
							<div class="format"><xsl:value-of select="."/></div>
						</xsl:for-each>
					</xsl:if>

					<xsl:if test="./resumes">
						<span title="Résumé : {./resumes}"><img src="/img/Gnome-dialog-question.svg" style="width: 24px; height: 24px; cursor: help;" /></span>
					</xsl:if>
					<xsl:if test="./contenus">
						<span title="Contenu : {./contenus}"><img src="/img/Gnome-dialog-question.svg" style="width: 24px; height: 24px; cursor: help;" /></span>
					</xsl:if>
				</div>-->
				<xsl:if test="titres">
					<div><xsl:value-of select="titres"/></div>
				</xsl:if>
				<xsl:if test="auteurs/auteur">
					<div class="auteurs">
					par 
						<xsl:for-each select="./auteurs/auteur">
							<xsl:if test="position() > 1"> ; </xsl:if>
							<xsl:value-of select="."/>	
						</xsl:for-each>
					</div>
				</xsl:if>
				<!--<xsl:if test="isbn">
					<div class="isbn">
						<xsl:value-of select="isbn"/>	
					</div>
				</xsl:if>-->
				<xsl:for-each select="./permalink">
					<div><a href="/notice/{.}"><xsl:value-of select="."/></a></div>
				</xsl:for-each>
			</div>
			<!--<hr />-->
		</xsl:for-each>
		</div>
	</xsl:template>
</xsl:stylesheet>
