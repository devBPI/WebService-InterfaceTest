<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template name="carouselWebMag">
		<!--<div class="numbertext"><xsl:value-of select="position()" /> / <xsl:value-of select="count(../element)" /></div>-->
		<a class="urlDiv" href="{url}">
			<div class="block-parent" style="width:100%;">
				<img class="float-carousel" src="{image-path}" alt="{photo-credit}"/>
				<h1><xsl:value-of select="title"/></h1>
				<p><xsl:value-of select="description"/></p>
			</div>
		</a>
	</xsl:template>
	<xsl:template name="carouselNotices">
		<!--<div class="numbertext"><xsl:value-of select="position()" /> / <xsl:value-of select="count(../element)" /></div>-->
				<div class="noticeUrlDiv">
					<a class="urlDiv" href="/notice/{permalink}">
						<xsl:choose>
							<xsl:when test="image-path">
								<img class="float-carousel" src="{image-path}"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:choose>
									<xsl:when test="type='Livre'">
										<img class="float-carousel" src="/img/NoticeLivre.png"/>
									</xsl:when>
									<xsl:otherwise>
										<img class="float-carousel" src="/img/Notice.png"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:otherwise>
						</xsl:choose>
						<h1><xsl:value-of select="title"/></h1>
						<h2><xsl:value-of select="creator"/></h2>
						<!--<p><xsl:value-of select="description"/></p>-->
					</a>
				</div>
	</xsl:template>

	<xsl:variable name="groupBy" select="4" />
	<xsl:template match="carousel">
		<div id="carousel">
			<xsl:apply-templates select="notices/notice[position() mod $groupBy = 1]" mode="e1" />
			<br />
			<div style="text-align:center">
				<xsl:apply-templates select="notices/notice[position() mod $groupBy = 1]" mode="e2" />
			</div>
			<br />
		</div>
	</xsl:template>
	<xsl:template match="notice" mode="e1">
		<div class="slideshow-container">
			<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
			<xsl:choose>
				<xsl:when test="position()=1">
					<div class="mySlides fade">
						<div class="block-parent-notices" style="width:100%;">
							<xsl:for-each select=".|following-sibling::notice[not(position() > $groupBy - 1)]">
								<xsl:call-template name="carouselNotices"/>
							</xsl:for-each>
						</div>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div class="mySlides fade" style="display:none;">
						<div class="block-parent-notices" style="width:100%;">
							<xsl:for-each select=".|following-sibling::notice[not(position() > $groupBy - 1)]">
								<xsl:call-template name="carouselNotices"/>
							</xsl:for-each>
						</div>
					</div>
				</xsl:otherwise>
			</xsl:choose>
			<a class="next" onclick="plusSlides(1)">&#10095;</a>
		</div>
 	</xsl:template>
	<xsl:template match="notice" mode="e2">
			<xsl:choose>
				<xsl:when test="position()=1">
					<span class="dot active" onclick="currentSlide({position()})">&#160;</span>
				</xsl:when>
				<xsl:otherwise>
					<span class="dot" onclick="currentSlide({position()})">&#160;</span>
				</xsl:otherwise>
			</xsl:choose>
 	</xsl:template>
	<xsl:template match="text()"/>
</xsl:stylesheet>
