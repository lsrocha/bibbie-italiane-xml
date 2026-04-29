<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:osis="http://www.bibletechnologies.net/2003/OSIS/namespace"
  xmlns:zef="https://raw.githubusercontent.com/biblenerd/Zefania-XML-Preservation/refs/heads/main/zef2005.xsd"
  exclude-result-prefixes="osis">

  <xsl:output method="xml" indent="yes" />

  <xsl:template match="/">
    <xsl:apply-templates select="osis:osis/osis:osisText[@osisRefWork='Bible']" />
  </xsl:template>

  <xsl:template match="/osis:osis/osis:osisText">
    <xsl:variable name="work_id" select="@osisIDWork" />
    <xsl:apply-templates select="osis:header/osis:work[@osisWork=$work_id]" />
  </xsl:template>

  <xsl:template match="/osis:osis/osis:osisText/osis:header/osis:work">
    <XMLBIBLE biblename="{osis:title}">
      <xsl:call-template name="information" />
    </XMLBIBLE>
  </xsl:template>

  <xsl:template name="information">
    <INFORMATION>
      <title>
        <xsl:value-of select="osis:title" />
      </title>

      <identifier>
        <xsl:value-of select="osis:identifier" />
      </identifier>

      <language>
        <xsl:value-of select="osis:language" />
      </language>

      <format>Zefania XML Bible Markup Language</format>

      <xsl:if test="osis:type">
        <type>
          <xsl:value-of select="osis:type" />
        </type>
      </xsl:if>

      <xsl:if test="osis:description">
        <description>
          <xsl:value-of select="osis:description" />
        </description>
      </xsl:if>

      <xsl:if test="osis:subject">
        <subject>
          <xsl:value-of select="osis:subject" />
        </subject>
      </xsl:if>

      <xsl:if test="osis:date">
        <date>
          <xsl:value-of select="osis:date" />
        </date>
      </xsl:if>

      <xsl:if test="osis:source">
        <source>
          <xsl:value-of select="osis:source" />
        </source>
      </xsl:if>

      <xsl:if test="osis:coverage">
        <coverage>
          <xsl:value-of select="osis:coverage" />
        </coverage>
      </xsl:if>

      <xsl:if test="osis:rights">
        <rights>
          <xsl:value-of select="osis:rights" />
        </rights>
      </xsl:if>

      <xsl:for-each select="osis:creator[string-length(text()) > 0]">
        <creator>
          <xsl:value-of select="." />
        </creator>
      </xsl:for-each>

      <xsl:for-each select="osis:contributor[string-length(text()) > 0]">
        <contributors>
          <xsl:value-of select="." />
        </contributors>
      </xsl:for-each>

      <xsl:if test="osis:publisher">
        <publisher>
          <xsl:value-of select="osis:publisher" />
        </publisher>
      </xsl:if>
    </INFORMATION>
  </xsl:template>
</xsl:stylesheet>