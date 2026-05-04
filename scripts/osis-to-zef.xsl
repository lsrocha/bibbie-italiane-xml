<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
  version="1.0"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:osis="http://www.bibletechnologies.net/2003/OSIS/namespace"
  xmlns="http://www.bgfdb.de/zefania/2005/namespace"
  xsi:schemaLocation="http://www.w3.org/1999/XSL/Transform https://raw.githubusercontent.com/eclipse-lemminx/lemminx/refs/heads/main/org.eclipse.lemminx/src/main/resources/schemas/xslt/xslt-1.0.xsd
                      http://www.bibletechnologies.net/2003/OSIS/namespace https://crosswire.org/osis/osisCore.2.1.1.xsd
                      http://www.bgfdb.de/zefania/2005/namespace ./zef2005.xsd"
  exclude-result-prefixes="osis xsi">

  <xsl:output method="xml" encoding="UTF-8" indent="yes" />

  <xsl:template match="/">
    <xsl:apply-templates select="osis:osis/osis:osisText[@osisRefWork='Bible']" />
  </xsl:template>

  <xsl:template match="/osis:osis/osis:osisText">
    <xsl:variable name="work-id" select="@osisIDWork" />  
  
    <XMLBIBLE>
      <xsl:apply-templates select="osis:header/osis:work[@osisWork=$work-id]" />

      <xsl:for-each select="osis:div[@type='book']">
        <xsl:call-template
          name="book" />
      </xsl:for-each>
    </XMLBIBLE>
  </xsl:template>

  <xsl:template match="osis:work">
    <xsl:attribute name="biblename">
      <xsl:value-of select="osis:title"></xsl:value-of>
    </xsl:attribute>

    <xsl:call-template
      name="information" />
  </xsl:template>

  <xsl:template name="book">
    <BIBLEBOOK bnumber="{position()}">
      <xsl:call-template name="book-name-attributes" />
      <CHAPTER />
    </BIBLEBOOK>
  </xsl:template>

  <xsl:template name="book-name-attributes">
    <xsl:choose>
      <xsl:when test="osis:title">
        <xsl:if test="string-length(osis:title/@short) > 0">
          <xsl:attribute name="bsname">
            <xsl:value-of select="osis:title/@short" />
          </xsl:attribute>
        </xsl:if>
        <xsl:attribute
          name="bname">
          <xsl:value-of select="osis:title" />
        </xsl:attribute>
      </xsl:when>
      <xsl:when test="@osisID='Gen'">
        <xsl:attribute name="bsname">Ge</xsl:attribute>
        <xsl:attribute name="bname">Genesi</xsl:attribute>
      </xsl:when>
      <xsl:when test="@osisID='Exod'">
        <xsl:attribute name="bsname">Es</xsl:attribute>
        <xsl:attribute name="bname">Esodo</xsl:attribute>
      </xsl:when>
      <xsl:when test="@osisID='Lev'">
        <xsl:attribute name="bsname">Le</xsl:attribute>
        <xsl:attribute name="bname">Levitico</xsl:attribute>
      </xsl:when>
      <xsl:when test="@osisID='Num'">
        <xsl:attribute name="bsname">Nu</xsl:attribute>
        <xsl:attribute name="bname">Numeri</xsl:attribute>
      </xsl:when>
      <xsl:when test="@osisID='Deut'">
        <xsl:attribute name="bsname">De</xsl:attribute>
        <xsl:attribute name="bname">Deuteronomio</xsl:attribute>
      </xsl:when>
      <xsl:when test="@osisID='Josh'">
        <xsl:attribute name="bsname">Gs</xsl:attribute>
        <xsl:attribute name="bname">Giosuè</xsl:attribute>
      </xsl:when>
      <xsl:when test="@osisID='Judg'">
        <xsl:attribute name="bsname">Gc</xsl:attribute>
        <xsl:attribute name="bname">Giudici</xsl:attribute>
      </xsl:when>
      <xsl:when test="@osisID='Ruth'">
        <xsl:attribute name="bsname">Ru</xsl:attribute>
        <xsl:attribute name="bname">Rut</xsl:attribute>
      </xsl:when>
      <xsl:when test="@osisID='1Sam'">
        <xsl:attribute name="bsname">1S</xsl:attribute>
        <xsl:attribute name="bname">1 Samuele</xsl:attribute>
      </xsl:when>
      <xsl:when test="@osisID='2Sam'">
        <xsl:attribute name="bsname">2S</xsl:attribute>
        <xsl:attribute name="bname">2 Samuele</xsl:attribute>
      </xsl:when>
      <xsl:when test="@osisID='1Kgs'">
        <xsl:attribute name="bsname">1R</xsl:attribute>
        <xsl:attribute name="bname">1 Re</xsl:attribute>
      </xsl:when>
      <xsl:when test="@osisID='2Kgs'">
        <xsl:attribute name="bsname">2R</xsl:attribute>
        <xsl:attribute name="bname">2 Re</xsl:attribute>
      </xsl:when>
      <xsl:when test="@osisID='1Chr'">
        <xsl:attribute name="bsname">1Cr</xsl:attribute>
        <xsl:attribute name="bname">1 Cronache</xsl:attribute>
      </xsl:when>
      <xsl:when test="@osisID='2Chr'">
        <xsl:attribute name="bsname">2Cr</xsl:attribute>
        <xsl:attribute name="bname">2 Cronache</xsl:attribute>
      </xsl:when>
      <xsl:when test="@osisID='Ezra'">
        <xsl:attribute name="bsname">Ed</xsl:attribute>
        <xsl:attribute name="bname">Esdra</xsl:attribute>
      </xsl:when>
      <xsl:when test="@osisID='Neh'">
        <xsl:attribute name="bsname">Ne</xsl:attribute>
        <xsl:attribute name="bname">Neemia</xsl:attribute>
      </xsl:when>
      <xsl:when test="@osisID='Esth'">
        <xsl:attribute name="bsname">Et</xsl:attribute>
        <xsl:attribute name="bname">Ester</xsl:attribute>
      </xsl:when>
      <xsl:when test="@osisID='Job'">
        <xsl:attribute name="bsname">Gb</xsl:attribute>
        <xsl:attribute name="bname">Giobbe</xsl:attribute>
      </xsl:when>
      <xsl:when test="@osisID='Ps'">
        <xsl:attribute name="bsname">Sl</xsl:attribute>
        <xsl:attribute name="bname">Salmi</xsl:attribute>
      </xsl:when>
      <xsl:when test="@osisID='Prov'">
        <xsl:attribute name="bsname">Pr</xsl:attribute>
        <xsl:attribute name="bname">Proverbi</xsl:attribute>
      </xsl:when>
      <xsl:when test="@osisID='Eccl'">
        <xsl:attribute name="bsname">Ec</xsl:attribute>
        <xsl:attribute name="bname">Ecclesiaste</xsl:attribute>
      </xsl:when>
      <xsl:when test="@osisID='Song'">
        <xsl:attribute name="bsname">Ca</xsl:attribute>
        <xsl:attribute name="bname">Cantico dei
    Cantici</xsl:attribute>
      </xsl:when>
      <xsl:when test="@osisID='Isa'">
        <xsl:attribute name="bsname">Is</xsl:attribute>
        <xsl:attribute name="bname">Isaia</xsl:attribute>
      </xsl:when>
      <xsl:when test="@osisID='Jer'">
        <xsl:attribute name="bsname">Gr</xsl:attribute>
        <xsl:attribute name="bname">Geremia</xsl:attribute>
      </xsl:when>
      <xsl:when test="@osisID='Lam'">
        <xsl:attribute name="bsname">La</xsl:attribute>
        <xsl:attribute name="bname">Lamentazioni</xsl:attribute>
      </xsl:when>
      <xsl:when test="@osisID='Ezek'">
        <xsl:attribute name="bsname">Ez</xsl:attribute>
        <xsl:attribute name="bname">Ezechiele</xsl:attribute>
      </xsl:when>
      <xsl:when test="@osisID='Dan'">
        <xsl:attribute name="bsname">Da</xsl:attribute>
        <xsl:attribute name="bname">Daniele</xsl:attribute>
      </xsl:when>
      <xsl:when test="@osisID='Hos'">
        <xsl:attribute name="bsname">Os</xsl:attribute>
        <xsl:attribute name="bname">Osea</xsl:attribute>
      </xsl:when>
      <xsl:when test="@osisID='Joel'">
        <xsl:attribute name="bsname">Gl</xsl:attribute>
        <xsl:attribute name="bname">Gioele</xsl:attribute>
      </xsl:when>
      <xsl:when test="@osisID='Amos'">
        <xsl:attribute name="bsname">Am</xsl:attribute>
        <xsl:attribute name="bname">Amos</xsl:attribute>
      </xsl:when>
      <xsl:when test="@osisID='Obad'">
        <xsl:attribute name="bsname">Ad</xsl:attribute>
        <xsl:attribute name="bname">Abdia</xsl:attribute>
      </xsl:when>
      <xsl:when test="@osisID='Jonah'">
        <xsl:attribute name="bsname">Gn</xsl:attribute>
        <xsl:attribute name="bname">Giona</xsl:attribute>
      </xsl:when>
      <xsl:when test="@osisID='Mic'">
        <xsl:attribute name="bsname">Mi</xsl:attribute>
        <xsl:attribute name="bname">Michea</xsl:attribute>
      </xsl:when>
      <xsl:when test="@osisID='Nah'">
        <xsl:attribute name="bsname">Na</xsl:attribute>
        <xsl:attribute name="bname">Naum</xsl:attribute>
      </xsl:when>
      <xsl:when test="@osisID='Hab'">
        <xsl:attribute name="bsname">Ac</xsl:attribute>
        <xsl:attribute name="bname">Abacuc</xsl:attribute>
      </xsl:when>
      <xsl:when test="@osisID='Zeph'">
        <xsl:attribute name="bsname">So</xsl:attribute>
        <xsl:attribute name="bname">Sofonia</xsl:attribute>
      </xsl:when>
      <xsl:when test="@osisID='Hag'">
        <xsl:attribute name="bsname">Ag</xsl:attribute>
        <xsl:attribute name="bname">Aggeo</xsl:attribute>
      </xsl:when>
      <xsl:when test="@osisID='Zech'">
        <xsl:attribute name="bsname">Za</xsl:attribute>
        <xsl:attribute name="bname">Zaccaria</xsl:attribute>
      </xsl:when>
      <xsl:when test="@osisID='Mal'">
        <xsl:attribute name="bsname">Ml</xsl:attribute>
        <xsl:attribute name="bname">Malachia</xsl:attribute>
      </xsl:when>
      <xsl:when test="@osisID='Matt'">
        <xsl:attribute name="bsname">Mt</xsl:attribute>
        <xsl:attribute name="bname">Matteo</xsl:attribute>
      </xsl:when>
      <xsl:when test="@osisID='Mark'">
        <xsl:attribute name="bsname">Mr</xsl:attribute>
        <xsl:attribute name="bname">Marco</xsl:attribute>
      </xsl:when>
      <xsl:when test="@osisID='Luke'">
        <xsl:attribute name="bsname">Lu</xsl:attribute>
        <xsl:attribute name="bname">Luca</xsl:attribute>
      </xsl:when>
      <xsl:when test="@osisID='John'">
        <xsl:attribute name="bsname">Gv</xsl:attribute>
        <xsl:attribute name="bname">Giovanni</xsl:attribute>
      </xsl:when>
      <xsl:when test="@osisID='Acts'">
        <xsl:attribute name="bsname">At</xsl:attribute>
        <xsl:attribute name="bname">Atti</xsl:attribute>
      </xsl:when>
      <xsl:when test="@osisID='Rom'">
        <xsl:attribute name="bsname">Ro</xsl:attribute>
        <xsl:attribute name="bname">Romani</xsl:attribute>
      </xsl:when>
      <xsl:when test="@osisID='1Cor'">
        <xsl:attribute name="bsname">1Co</xsl:attribute>
        <xsl:attribute name="bname">1 Corinzi</xsl:attribute>
      </xsl:when>
      <xsl:when test="@osisID='2Cor'">
        <xsl:attribute name="bsname">2Co</xsl:attribute>
        <xsl:attribute name="bname">2 Corinzi</xsl:attribute>
      </xsl:when>
      <xsl:when test="@osisID='Gal'">
        <xsl:attribute name="bsname">Ga</xsl:attribute>
        <xsl:attribute name="bname">Galati</xsl:attribute>
      </xsl:when>
      <xsl:when test="@osisID='Eph'">
        <xsl:attribute name="bsname">Ef</xsl:attribute>
        <xsl:attribute name="bname">Efesini</xsl:attribute>
      </xsl:when>
      <xsl:when test="@osisID='Phil'">
        <xsl:attribute name="bsname">Fl</xsl:attribute>
        <xsl:attribute name="bname">Filippesi</xsl:attribute>
      </xsl:when>
      <xsl:when test="@osisID='Col'">
        <xsl:attribute name="bsname">Cl</xsl:attribute>
        <xsl:attribute name="bname">Colossesi</xsl:attribute>
      </xsl:when>
      <xsl:when test="@osisID='1Thess'">
        <xsl:attribute name="bsname">1Te</xsl:attribute>
        <xsl:attribute name="bname">1 Tessalonicesi</xsl:attribute>
      </xsl:when>
      <xsl:when test="@osisID='2Thess'">
        <xsl:attribute name="bsname">2Te</xsl:attribute>
        <xsl:attribute name="bname">2 Tessalonicesi</xsl:attribute>
      </xsl:when>
      <xsl:when test="@osisID='1Tim'">
        <xsl:attribute name="bsname">1Ti</xsl:attribute>
        <xsl:attribute name="bname">1 Timoteo</xsl:attribute>
      </xsl:when>
      <xsl:when test="@osisID='2Tim'">
        <xsl:attribute name="bsname">2Ti</xsl:attribute>
        <xsl:attribute name="bname">2 Timoteo</xsl:attribute>
      </xsl:when>
      <xsl:when test="@osisID='Titus'">
        <xsl:attribute name="bsname">Tt</xsl:attribute>
        <xsl:attribute name="bname">Tito</xsl:attribute>
      </xsl:when>
      <xsl:when test="@osisID='Phlm'">
        <xsl:attribute name="bsname">Fi</xsl:attribute>
        <xsl:attribute name="bname">Filemone</xsl:attribute>
      </xsl:when>
      <xsl:when test="@osisID='Heb'">
        <xsl:attribute name="bsname">Eb</xsl:attribute>
        <xsl:attribute name="bname">Ebrei</xsl:attribute>
      </xsl:when>
      <xsl:when test="@osisID='Jas'">
        <xsl:attribute name="bsname">Gm</xsl:attribute>
        <xsl:attribute name="bname">Giacomo</xsl:attribute>
      </xsl:when>
      <xsl:when test="@osisID='1Pet'">
        <xsl:attribute name="bsname">1P</xsl:attribute>
        <xsl:attribute name="bname">1 Pietro</xsl:attribute>
      </xsl:when>
      <xsl:when test="@osisID='2Pet'">
        <xsl:attribute name="bsname">2P</xsl:attribute>
        <xsl:attribute name="bname">2 Pietro</xsl:attribute>
      </xsl:when>
      <xsl:when test="@osisID='1John'">
        <xsl:attribute name="bsname">1Gv</xsl:attribute>
        <xsl:attribute name="bname">1 Giovanni</xsl:attribute>
      </xsl:when>
      <xsl:when test="@osisID='2John'">
        <xsl:attribute name="bsname">2Gv</xsl:attribute>
        <xsl:attribute name="bname">2 Giovanni</xsl:attribute>
      </xsl:when>
      <xsl:when test="@osisID='3John'">
        <xsl:attribute name="bsname">3Gv</xsl:attribute>
        <xsl:attribute name="bname">3 Giovanni</xsl:attribute>
      </xsl:when>
      <xsl:when test="@osisID='Jude'">
        <xsl:attribute name="bsname">Gd</xsl:attribute>
        <xsl:attribute name="bname">Giuda</xsl:attribute>
      </xsl:when>
      <xsl:when test="@osisID='Rev'">
        <xsl:attribute name="bsname">Ap</xsl:attribute>
        <xsl:attribute name="bname">Apocalisse</xsl:attribute>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="information">
    <INFORMATION>
      <!-- TODO: use xsl:copy -->
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