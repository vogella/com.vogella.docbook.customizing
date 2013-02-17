<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
	<xsl:import href="../docbook-xsl-1.77.1/fo/profile-docbook.xsl" />
	<xsl:import href="../docbook-xsl-1.77.1/fo/highlight.xsl" />
	<xsl:import href="./fo/mybooktitlepage.xsl" />
	<xsl:import href="./fo/myparttitlepage.xsl" />

	<!-- Defining my parameters -->
	<xsl:param name="footnotetext">
	</xsl:param>

	<xsl:attribute-set name="formal.object.properties">
		<xsl:attribute name="keep-together.within-column">
    <xsl:choose>
      <xsl:when test="self::task">auto</xsl:when>
      <xsl:otherwise>always</xsl:otherwise>
    </xsl:choose>
  </xsl:attribute>
	</xsl:attribute-set>
	<!-- <xsl:attribute-set name="section.level1.properties"> <xsl:attribute 
		name="break-after"> <xsl:choose> <xsl:when test="ancestor::preface/@role 
		= 'preface'">auto</xsl:when> <xsl:otherwise>page</xsl:otherwise> </xsl:choose> 
		</xsl:attribute> </xsl:attribute-set> -->

	<xsl:attribute-set name="section.level1.properties">
		<xsl:attribute name="break-after">
    	<xsl:choose>
     	 <xsl:when test="ancestor::preface/@role = 'preface'">auto</xsl:when>
     	 <xsl:otherwise>auto</xsl:otherwise>
    	</xsl:choose>
 	 </xsl:attribute>
	</xsl:attribute-set>


	<!-- Table adjustments -->
	<!-- My Table Mods -->
	<xsl:param name="met.table.font.size">
		1.0
	</xsl:param> <!-- -->
	<xsl:param name="met.table.head.font.size">
		1.0
	</xsl:param>
	<!-- Set table body font size and alignment -->
	<xsl:attribute-set name="table.properties">
		<xsl:attribute name="keep-together.within-column">auto</xsl:attribute>
		<xsl:attribute name="font-size">
            <xsl:value-of select="$body.font.master * 0.9" />
            <xsl:text>pt</xsl:text>
        </xsl:attribute>
	</xsl:attribute-set>
	<!-- Set table header font size -->
	<xsl:template name="table.row.properties">
		<xsl:if test="ancestor::thead">
			<xsl:attribute name="font-weight">bold</xsl:attribute>
			<xsl:attribute name="color">#000000</xsl:attribute>
			<!-- White -->
			<xsl:attribute name="background-color">#E6E8FA</xsl:attribute>
			<!-- Black -->
			<xsl:attribute name="font-size">
              <xsl:value-of select="$body.font.master * 0.9" />
              <xsl:text>pt</xsl:text>
          </xsl:attribute>
		</xsl:if>
	</xsl:template>


	<!-- Adjusting the size of the header -->
	<xsl:attribute-set name="component.title.properties">
		<xsl:attribute name="font-size">
    	<xsl:value-of select="$body.font.master * 1.3" />
    	<xsl:text>pt</xsl:text>
	  </xsl:attribute>
		<xsl:attribute name="border-top">0.5pt solid black</xsl:attribute>
		<xsl:attribute name="border-bottom">0.5pt solid black</xsl:attribute>
		<xsl:attribute name="padding-top">6pt</xsl:attribute>
		<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
	</xsl:attribute-set>


	<!-- Adjusting the size of the header -->
	<xsl:attribute-set name="section.title.level1.properties">
		<xsl:attribute name="font-size">
    	<xsl:value-of select="$body.font.master * 1.2" />
    	<xsl:text>pt</xsl:text>
	  </xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="section.title.level1.properties">

	</xsl:attribute-set>

	<xsl:attribute-set name="section.title.level2.properties">
		<xsl:attribute name="font-size">
    <xsl:value-of select="$body.font.master * 1.1" />
    <xsl:text>pt</xsl:text>
  </xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="section.title.level3.properties">
		<xsl:attribute name="font-size">
    <xsl:value-of select="$body.font.master * 1.0" />
    <xsl:text>pt</xsl:text>
  </xsl:attribute>
	</xsl:attribute-set>


	<!-- <xsl:attribute-set name="monospace.verbatim.properties"> <xsl:attribute 
		name="font-size"> <xsl:value-of select="$body.font.master * 0.7" /> <xsl:text>pt</xsl:text> 
		</xsl:attribute> </xsl:attribute-set> -->
	<xsl:param name="shade.verbatim" select="0"></xsl:param>
	<xsl:attribute-set name="shade.verbatim.style">
		<xsl:attribute name="font-family">
            <xsl:value-of select="$monospace.font.family" />
        </xsl:attribute>
		<xsl:attribute name="font-size">
            <xsl:value-of select="$body.font.master * 0.60" />
            <xsl:text>pt</xsl:text>
        </xsl:attribute>
		<xsl:attribute name="border-color">#E6E8FA</xsl:attribute>
		<xsl:attribute name="border-style">solid</xsl:attribute>
		<xsl:attribute name="border-width">heavy</xsl:attribute>
		<xsl:attribute name="background-color">#F0F0F0</xsl:attribute>
		<xsl:attribute name="padding">10pt</xsl:attribute>
	</xsl:attribute-set>

	<!-- Use this if you need line breaks in long listings <xsl:attribute-set 
		name="monospace.verbatim.properties"> <xsl:attribute name="wrap-option">wrap</xsl:attribute> 
		</xsl:attribute-set> -->

	<!-- =================== Program listing shading =================== -->
	<xsl:attribute-set name="monospace.verbatim.properties"
		use-attribute-sets="verbatim.properties">
		<xsl:attribute name="font-family">
            <xsl:value-of select="$monospace.font.family" />
        </xsl:attribute>
		<xsl:attribute name="font-size">
            <xsl:value-of select="$body.font.master * 0.75" />
            <xsl:text>pt</xsl:text>
        </xsl:attribute>
		<xsl:attribute name="border-color">#E6E8FA</xsl:attribute>
		<xsl:attribute name="border-style">solid</xsl:attribute>
		<xsl:attribute name="border-width">heavy</xsl:attribute>
		<xsl:attribute name="background-color">#F0F0F0</xsl:attribute>
		<xsl:attribute name="padding">4pt</xsl:attribute>
		<xsl:attribute name="margin">0pt</xsl:attribute>

		<!-- <xsl:attribute name="wrap-option">wrap</xsl:attribute> <xsl:attribute 
			name="hyphenation-character">&#x25BA;</xsl:attribute> FOP doesn't support 
			this yet? -->
	</xsl:attribute-set>




	<xsl:template match="title" mode="chapter.titlepage.recto.auto.mode">
		<fo:block xmlns:fo="http://www.w3.org/1999/XSL/Format"
			xsl:use-attribute-sets="chapter.titlepage.recto.style" margin-left="{$title.margin.left}"
			font-size="18pt" font-weight="bold" font-family="{$title.font.family}">
			<xsl:call-template name="component.title">
				<xsl:with-param name="node" select="ancestor-or-self::chapter[1]" />
			</xsl:call-template>
		</fo:block>
	</xsl:template>




	<!-- Customize the TOC Title -->
	<xsl:template name="table.of.contents.titlepage" priority="1">
		<fo:block xsl:use-attribute-sets="section.title.level1.properties"
			border-bottom="0.5pt solid black" space-after="10pt">
			<xsl:call-template name="gentext">
				<xsl:with-param name="key" select="'TableofContents'" />
			</xsl:call-template>
		</fo:block>
	</xsl:template>

	<!-- Customize the TOC -->
	<xsl:attribute-set name="toc.line.properties">

		<xsl:attribute name="font-size">
		<xsl:choose>
    		<xsl:when test="self::part | self::preface | self::appendix">12pt</xsl:when>
    		<xsl:otherwise>10pt</xsl:otherwise>
    	</xsl:choose>
   		</xsl:attribute>

		<xsl:attribute name="font-weight">
		<xsl:choose>
    		<xsl:when test="self::part | self::preface | self::appendix">bold</xsl:when>
    		<xsl:otherwise>normal</xsl:otherwise>
    	</xsl:choose>
   		</xsl:attribute>
		<!-- <xsl:attribute name="border-top"> <xsl:choose> <xsl:when test="self::part 
			| self::preface | self::appendix">0.5pt solid black</xsl:when> <xsl:otherwise>none</xsl:otherwise> 
			</xsl:choose> </xsl:attribute> -->
		<xsl:attribute name="space-before">
		<xsl:choose>
    		<xsl:when test="self::part | self::preface | self::appendix">12pt</xsl:when>
    		<xsl:otherwise>0</xsl:otherwise>
    	</xsl:choose>
   		</xsl:attribute>

		<xsl:attribute name="space-after">
		<xsl:choose>
    		<xsl:when test="self::part | self::preface | self::appendix">6pt</xsl:when>
    		<xsl:otherwise>0</xsl:otherwise>
    	</xsl:choose>
   		</xsl:attribute>


	</xsl:attribute-set>

	<!-- Remove all sections marked with wrapper -->
	<xsl:template match="section[@role='wrapper']" mode="profile">
		<xsl:apply-templates select="section" mode="profile" />
	</xsl:template>

	<xsl:template name="footer.content">
		<xsl:param name="pageclass" select="''" />
		<xsl:param name="sequence" select="''" />
		<xsl:param name="position" select="''" />
		<xsl:param name="gentext-key" select="''" />

		<!-- <fo:block> <xsl:value-of select="$pageclass"/> <xsl:text>, </xsl:text> 
			<xsl:value-of select="$sequence"/> <xsl:text>, </xsl:text> <xsl:value-of 
			select="$position"/> <xsl:text>, </xsl:text> <xsl:value-of select="$gentext-key"/> 
			</fo:block> -->

		<fo:block>
			<!-- pageclass can be front, body, back -->
			<!-- sequence can be odd, even, first, blank -->
			<!-- position can be left, center, right -->
			<xsl:choose>
				<xsl:when test="$pageclass = 'titlepage'">
					<!-- nop; no footer on title pages -->
				</xsl:when>

				<xsl:when
					test="$double.sided != 0 and $sequence = 'even'
                      and $position='left'">
					<fo:page-number />
				</xsl:when>


				<xsl:when
					test="$double.sided != 0 and $sequence = 'even'
                      and $position='right'">
					<xsl:choose>
						<xsl:when test="string($footnotetext) != 0">
							<xsl:value-of select="$footnotetext" />
						</xsl:when>
					</xsl:choose>
				</xsl:when>

				<xsl:when
					test="$double.sided != 0 and $sequence = 'odd'
                      and $position='left'">
					<xsl:choose>
						<xsl:when test="string($footnotetext) != 0">
							<xsl:value-of select="$footnotetext" />
						</xsl:when>
					</xsl:choose>
				</xsl:when>


				<xsl:when
					test="$double.sided != 0 and ($sequence = 'odd' or $sequence = 'first')
                      and $position='right'">
					<fo:page-number />
				</xsl:when>

				<xsl:when
					test="$double.sided != 0 and ($sequence = 'odd' or $sequence = 'first')
                      and $position='left'">
					<xsl:choose>
						<xsl:when test="string($footnotetext) != 0">
							<xsl:value-of select="$footnotetext" />
						</xsl:when>
					</xsl:choose>
				</xsl:when>

				<xsl:when test="$double.sided = 0 and $position='center'">
					<fo:page-number />
				</xsl:when>

				<xsl:when test="$double.sided = 0 and $position='left'">

				</xsl:when>

				<xsl:when test="$double.sided = 0 and $position='right'">
					<xsl:choose>
						<xsl:when test="string($footnotetext) != 0">
							<xsl:value-of select="$footnotetext" />
						</xsl:when>
					</xsl:choose>
				</xsl:when>

				<xsl:when test="$sequence='blank'">
					<xsl:choose>
						<xsl:when test="$double.sided != 0 and $position = 'left'">
							<fo:page-number />
						</xsl:when>
						<xsl:when test="$double.sided = 0 and $position = 'center'">
							<fo:page-number />
						</xsl:when>
						<xsl:otherwise>
							<!-- nop -->
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>


				<xsl:otherwise>
					<!-- nop -->
				</xsl:otherwise>
			</xsl:choose>
		</fo:block>
	</xsl:template>


	<!-- Setting italic font for guilabel guibutton and property -->

	<xsl:template match="guilabel">
		<fo:inline font-style="italic">
			<xsl:apply-imports />
		</fo:inline>
	</xsl:template>

	<xsl:template match="guibutton">
		<fo:inline font-style="italic">
			<xsl:apply-imports />
		</fo:inline>
	</xsl:template>

	<xsl:template match="property">
		<fo:inline font-style="italic">
			<xsl:apply-imports />
		</fo:inline>
	</xsl:template>

	<xsl:template match="guimenu">
		<fo:inline font-style="italic">
			<xsl:apply-imports />
		</fo:inline>
	</xsl:template>

	<xsl:template match="guisubmenu">
		<fo:inline font-style="italic">
			<xsl:apply-imports />
		</fo:inline>
	</xsl:template>

</xsl:stylesheet>