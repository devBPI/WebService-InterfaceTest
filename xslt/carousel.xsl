<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template name="carouselWebMag">
		<div class="numbertext"><xsl:value-of select="position()" /> / <xsl:value-of select="count(../element)" /></div>
		<a class="urlDiv" href="{url}">
			<div class="block-parent" style="width:100%;">
				<img class="float-carousel" src="{image-path}" alt="{photo-credit}"/>
				<h1><xsl:value-of select="title"/></h1>
				<p><xsl:value-of select="description"/></p>
			</div>
		</a>
	</xsl:template>
	<xsl:template name="carouselNotices">
		<div class="numbertext"><xsl:value-of select="position()" /> / <xsl:value-of select="count(../element)" /></div>
		<div class="block-parent-notices" style="width:100%;">
			<xsl:for-each select="notices/notice">
				<div class="noticeUrlDiv">
				<a class="urlDiv" href="/notice/{permalink}">
					<img class="float-carousel" src="{image-path}" alt="img/defaultNotice.jpg"/>
					<h1><xsl:value-of select="title"/></h1>
					<p><xsl:value-of select="description"/></p>
				</a>
				</div>
			</xsl:for-each>
		</div>
	</xsl:template>

	<xsl:template match="elements">
		<div id="carousel">
			<div class="slideshow-container">
				<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
				<xsl:for-each select="element">
					<xsl:choose>
						<xsl:when test="position()=1">
							<div class="mySlides fade">
								<xsl:choose>
									<xsl:when test="notices">
										<xsl:call-template name="carouselNotices"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="carouselWebMag"/>
									</xsl:otherwise>
								</xsl:choose>
							</div>
						</xsl:when>
						<xsl:otherwise>
							<div class="mySlides fade" style="display:none;">
								<xsl:choose>
									<xsl:when test="notices">
										<xsl:call-template name="carouselNotices"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="carouselWebMag"/>
									</xsl:otherwise>
								</xsl:choose>
							</div>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
				<a class="next" onclick="plusSlides(1)">&#10095;</a>
			</div>
			<br />
			<div style="text-align:center">
				<xsl:for-each select="element">
					<xsl:choose>
						<xsl:when test="position()=1">
							<span class="dot active" onclick="currentSlide({position()})">&#160;</span>
						</xsl:when>
						<xsl:otherwise>
							<span class="dot" onclick="currentSlide({position()})">&#160;</span>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</div>
			<br />
		</div>
	</xsl:template>
	<xsl:template match="text()"/>
</xsl:stylesheet>
