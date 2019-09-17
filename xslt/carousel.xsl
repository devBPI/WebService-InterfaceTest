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
		<div class="block-parent-notices" style="width:100%;">
			<xsl:for-each select="notices/notice">
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
								<xsl:if test="notices/notice">
									<xsl:call-template name="carouselNotices"/>
								</xsl:if>
							</div>
						</xsl:when>
						<xsl:otherwise>
							<div class="mySlides fade" style="display:none;">
								<xsl:if test="notices/notice">
									<xsl:call-template name="carouselNotices"/>
								</xsl:if>
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
