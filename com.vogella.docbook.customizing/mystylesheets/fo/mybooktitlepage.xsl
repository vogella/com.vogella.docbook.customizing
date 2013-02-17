<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
	<xsl:template name="book.titlepage.recto">
		<fo:block text-align="center" border-before-style="solid"
			border-before-width="2mm" margin-top="60mm">
		</fo:block>
		<fo:block margin-top="10mm" margin-bottom="10mm">
			<fo:table border-width="0.0pt" border-style="solid">
				<fo:table-column />
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell border-width="0.0pt" border-style="solid">
							<fo:block>
								<xsl:apply-templates mode="book.titlepage.recto.auto.mode"
									select="bookinfo/title" />
								<xsl:apply-templates mode="book.titlepage.recto.auto.mode"
									select="bookinfo/subtitle" />
								<!-- <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="bookinfo/author" 
									/> -->
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
		</fo:block>
		<fo:block text-align="center" border-before-style="solid"
			border-before-width="2mm">
		</fo:block>
		<!--  
		<fo:block start-indent="0in" margin-left="90mm" margin-top="60mm">
			<fo:external-graphic src="images/tsi.jpg"
				content-width="2.5in" />
		</fo:block>
			-->
		<fo:block start-indent="0in" margin-left="90mm" margin-top="60mm">
			<fo:external-graphic src="images/vogella_booklogo.png"
				content-width="3in" />
		</fo:block>
	

	</xsl:template>

</xsl:stylesheet>