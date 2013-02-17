<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
	

<!-- Only chapters in TOC of Parts -->
	<xsl:template match="preface|chapter|appendix|article"
		mode="toc">
		<xsl:param name="toc-context" select="." />

		<xsl:variable name="id">
			<xsl:call-template name="object.id" />
		</xsl:variable>

		<xsl:variable name="cid">
			<xsl:call-template name="object.id">
				<xsl:with-param name="object" select="$toc-context" />
			</xsl:call-template>
		</xsl:variable>

		<xsl:call-template name="toc.line">
			<xsl:with-param name="toc-context" select="$toc-context" />
		</xsl:call-template>

		<xsl:variable name="nodes"
			select="section|sect1
                                     |qandaset[$qanda.in.toc != 0]
                                     |simplesect[$simplesect.in.toc != 0]
                                     |refentry|appendix" />

		<xsl:variable name="depth.from.context"
			select="count(ancestor::*)-count($toc-context/ancestor::*)" />

		<xsl:if
			test="local-name($toc-context) != 'part'
                and $toc.section.depth > 0
                and $toc.max.depth > $depth.from.context
                and $nodes">
			<fo:block id="toc.{$cid}.{$id}">
				<xsl:attribute name="margin-{$direction.align.start}">
        <xsl:call-template name="set.toc.indent" />
      </xsl:attribute>

				<xsl:apply-templates select="$nodes" mode="toc">
					<xsl:with-param name="toc-context" select="$toc-context" />
				</xsl:apply-templates>
			</fo:block>
		</xsl:if>
	</xsl:template>
	
	
</xsl:stylesheet>