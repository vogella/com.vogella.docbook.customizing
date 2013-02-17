<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xslthl="http://xslthl.sf.net" exclude-result-prefixes="xslthl" version="1.0">
  <!-- ********************************************************************
     $Id: highlight.xsl 8911 2010-09-28 17:02:06Z abdelazer $
     ********************************************************************

     This file is part of the XSL DocBook Stylesheet distribution.
     See ../README or http://docbook.sf.net/release/xsl/current/ for
     and other information.

     ******************************************************************** -->
  <xsl:import href="../highlighting/common.xsl"/>
  <xsl:template match="xslthl:keyword" mode="xslthl">
    <span class="hl-keyword">
      <xsl:apply-templates mode="xslthl"/>
    </span>
  </xsl:template>
  <xsl:template match="xslthl:string" mode="xslthl">
    <span class="hl-string" style="color:blue">
        <xsl:apply-templates mode="xslthl"/>
    </span>
  </xsl:template>
  <xsl:template match="xslthl:comment" mode="xslthl">
    <em class="hl-comment" style="color: #080">
      <xsl:apply-templates mode="xslthl"/>
    </em>
  </xsl:template>
  <xsl:template match="xslthl:directive" mode="xslthl">
    <span class="hl-directive" style="color: maroon">
      <xsl:apply-templates mode="xslthl"/>
    </span>
  </xsl:template>
  <xsl:template match="xslthl:tag" mode="xslthl">
    <span class="hl-tag" style="color: #080">
      <xsl:apply-templates mode="xslthl"/>
    </span>
  </xsl:template>
  <xsl:template match="xslthl:attribute" mode="xslthl">
    <span class="hl-attribute" style="color: #7F0055">
      <xsl:apply-templates mode="xslthl"/>
    </span>
  </xsl:template>
  <xsl:template match="xslthl:value" mode="xslthl">
    <span class="hl-value" style="color: blue">
      <xsl:apply-templates mode="xslthl"/>
    </span>
  </xsl:template>
  <xsl:template match="xslthl:html" mode="xslthl">
    <strong>
      <em style="color: red">
        <xsl:apply-templates mode="xslthl"/>
      </em>
    </strong>
  </xsl:template>
  <xsl:template match="xslthl:xslt" mode="xslthl">
    <strong style="color: #0066FF">
      <xsl:apply-templates mode="xslthl"/>
    </strong>
  </xsl:template>
  <!-- Not emitted since XSLTHL 2.0 -->
  <xsl:template match="xslthl:section" mode="xslthl">
    <strong>
      <xsl:apply-templates mode="xslthl"/>
    </strong>
  </xsl:template>
  <xsl:template match="xslthl:number" mode="xslthl">
    <span class="hl-number">
      <xsl:apply-templates mode="xslthl"/>
    </span>
  </xsl:template>
  <xsl:template match="xslthl:annotation" mode="xslthl">
    <em>
      <span class="hl-annotation" style="color: gray">
        <xsl:apply-templates mode="xslthl"/>
      </span>
    </em>
  </xsl:template>
  <!-- Not sure which element will be in final XSLTHL 2.0 -->
  <xsl:template match="xslthl:doccomment|xslthl:doctype" mode="xslthl">
    <div class="hl-tag" style="color: #080">
      <xsl:apply-templates mode="xslthl"/>
    </div>
  </xsl:template>
</xsl:stylesheet>
