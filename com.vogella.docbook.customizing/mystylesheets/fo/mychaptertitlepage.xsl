<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:fo="http://www.w3.org/1999/XSL/Format">
  
  <xsl:attribute-set name="chapter.titlepage.recto.style">
    <xsl:attribute name="text-align">right</xsl:attribute>
    <xsl:attribute name="font-family">
      <xsl:value-of select="$title.font.family"/>
    </xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="chapter.titlepage.label.properties">
    <xsl:attribute name="font-size">60pt</xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="chapter.titlepage.title.properties">
    <xsl:attribute name="font-size">20pt</xsl:attribute>
    <xsl:attribute name="font-weight">bold</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:template match="title" mode="chapter.titlepage.recto.auto.mode">    
    <fo:block xsl:use-attribute-sets="chapter.titlepage.recto.style">
      <fo:block xsl:use-attribute-sets="chapter.titlepage.label.properties">
        <xsl:apply-templates select=".." mode="label.markup"/>
      </fo:block>
      <fo:block xsl:use-attribute-sets="chapter.titlepage.title.properties">
        <xsl:apply-templates select=".." mode="title.markup"/>
      </fo:block>
      <fo:block text-align-last="justify"><fo:leader
        leader-pattern="rule"
        leader-pattern-width="1pt"/></fo:block>
    </fo:block>    
  </xsl:template>
  
  <!-- Old code: -->
  <!--<xsl:template match="title" mode="chapter.titlepage.recto.auto.mode">
		<fo:block xmlns:fo="http://www.w3.org/1999/XSL/Format"
			xsl:use-attribute-sets="chapter.titlepage.recto.style" margin-left="{$title.margin.left}"
			font-size="18pt" font-weight="bold" font-family="{$title.font.family}">
			<xsl:call-template name="component.title">
				<xsl:with-param name="node" select="ancestor-or-self::chapter[1]" />
			</xsl:call-template>
		</fo:block>
	</xsl:template>-->

</xsl:stylesheet>