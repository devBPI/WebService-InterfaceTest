<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="elements">
		<div id="carousel">
			<xsl:for-each select="element">
				<div id="case{position()}" style="border: 1px solid black;">
					<a href="{url}">
						<div>
							<h1><xsl:value-of select="title"/></h1>
							<img src="{image-path}" alt="{photo-credit}"/>
							<p><xsl:value-of select="description"/></p>
							
						</div>
					</a>
				</div>
			</xsl:for-each>
		</div>
	</xsl:template>
	<xsl:template match="text()"/>
</xsl:stylesheet>
