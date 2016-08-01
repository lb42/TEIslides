<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
  xmlns:teix="http://www.tei-c.org/ns/Examples" xmlns:tei="http://www.tei-c.org/ns/1.0"
  exclude-result-prefixes="tei teix xsl" xpath-default-namespace="http://www.tei-c.org/ns/1.0">

  <!-- xsl:import
    href="/Applications/oxygen/frameworks/tei/xml/tei/stylesheet/markdown/tei-to-markdown.xsl"/-->
<xsl:import href="/usr/share/xml/tei/stylesheet/markdown/tei-to-markdown.xsl"/>

  <xsl:output method="html" version="5" indent="yes"/>

  <xsl:strip-space elements="egXML"/>

  <xsl:param name="language" select="fr"/>

  <xsl:template match="/">
    <html>
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>Programme</title>
        <link href="themes/remark-dark.css" rel="stylesheet" media="all" type="text/css"/>
      </head>
      <body>
        <textarea id="source">
          <xsl:apply-templates select="TEI/teiHeader"/>
          <xsl:text/>
          <xsl:apply-templates select="TEI/text"/>
        </textarea>
        <!--<script src="http://gnab.github.com/remark/downloads/remark-0.6.5.min.js" type="text/javascript"></script>-->
        <script src="js/remark-0.6.5.min.js" type="text/javascript"/>
        <script type="text/javascript">
        var hljs = remark.highlighter.engine;
      </script>
        <script src="remark.language.js" type="text/javascript"/>
        <script type="text/javascript">
        var slideshow = remark.create({
        highlightStyle: 'monokai',
        highlightLanguage: 'remark'
        }) ;
      </script>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="teiHeader">
    <xsl:call-template name="newline"/>
    <xsl:text>title: </xsl:text>
    <xsl:apply-templates select="fileDesc/titleStmt/title"/>
    <xsl:call-template name="newline"/>
    <xsl:text>description: </xsl:text>
    <xsl:apply-templates select="fileDesc/titleStmt/author"/>
    <xsl:text>, </xsl:text>
    <xsl:apply-templates select="fileDesc/publicationStmt/date"/>
    <xsl:call-template name="newline"/>
    <xsl:text>theme: theme/remark-dark-em.css</xsl:text>
    <xsl:call-template name="newline"/>
    <xsl:text>name: inverse</xsl:text>
    <xsl:call-template name="newline"/>
    <xsl:text>layout: true</xsl:text>
    <xsl:call-template name="newline"/>
    <xsl:text>class: inverse</xsl:text>
    <xsl:call-template name="newline"/>
  </xsl:template>

  <xsl:template match="titlePage">
    <xsl:call-template name="newline"/>
    <xsl:text>---</xsl:text>
    <xsl:call-template name="newline"/>
    <xsl:text>class: center middle</xsl:text>
    <xsl:call-template name="newline"/>
    <xsl:if test="./@xml:id">
      <xsl:text>name: </xsl:text>
      <xsl:value-of select="@xml:id"/>
    </xsl:if>
    <xsl:call-template name="newline"/>
    <xsl:call-template name="newline"/>
    <xsl:apply-templates/>
    <xsl:text>![test](images/logo-ecole-nationale-des-chartes.png)</xsl:text>
    <xsl:call-template name="newline"/>
  </xsl:template>

  <xsl:template match="div[@type = 'part' and not(div[@type = 'title'])]">
    <xsl:call-template name="newline"/>
    <xsl:text>---</xsl:text>
    <xsl:call-template name="newline"/>
    <xsl:text>template: inverse</xsl:text>
    <xsl:call-template name="newline"/>
    <xsl:text>class: center middle</xsl:text>
    <xsl:call-template name="newline"/>
    <xsl:if test="./@xml:id">
      <xsl:text>name: </xsl:text>
      <xsl:value-of select="@xml:id"/>
      <xsl:call-template name="newline"/>
    </xsl:if>
    <xsl:call-template name="newline"/>
    <xsl:apply-templates/>
  </xsl:template>
  
  <xsl:template match=" div[@type = 'title']">
    <xsl:call-template name="newline"/>
    <xsl:text>---</xsl:text>
    <xsl:call-template name="newline"/>
    <xsl:text>template: inverse</xsl:text>
    <xsl:call-template name="newline"/>
    <xsl:text>class: center middle</xsl:text>
    <xsl:call-template name="newline"/>
    <xsl:if test="./@xml:id">
      <xsl:text>name: </xsl:text>
      <xsl:value-of select="@xml:id"/>
      <xsl:call-template name="newline"/>
    </xsl:if>
    <xsl:call-template name="newline"/>
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match=" div[@type = 'slide'] | div[@type = 'sommaire'] | div[not(@type)]">
    <xsl:call-template name="newline"/>
    <xsl:text>---</xsl:text>
    <xsl:call-template name="newline"/>
    <xsl:if test="@xml:id">
      <xsl:text>name: </xsl:text>
      <xsl:value-of select="@xml:id"/>
    </xsl:if>
    <xsl:call-template name="newline"/>
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="div[@type = 'slide']/div[2] | div[@type = 'title']/div[2]">
    <xsl:call-template name="newline"/>
    <xsl:text>???</xsl:text>
    <xsl:call-template name="newline"/>
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="figure">
    <xsl:text>![</xsl:text>
    <xsl:apply-templates select="figDesc"/>
    <xsl:text>]</xsl:text>
    <xsl:text>(</xsl:text>
    <xsl:apply-templates select="graphic/@url"/>
    <xsl:text>)</xsl:text>
  </xsl:template>

  <xsl:template match="p/graphic">
    <xsl:text>![</xsl:text>
    <xsl:text>]</xsl:text>
    <xsl:text>(</xsl:text>
    <xsl:apply-templates select="@url"/>
    <xsl:text>)</xsl:text>
  </xsl:template>

  <xsl:template match="teix:egXML">
    <xsl:text>
```xml
</xsl:text>
    <xsl:copy-of select="./*" copy-namespaces="no" exclude-result-prefixes="#all"/>
    <xsl:text>
```
</xsl:text>
  </xsl:template>

  <xsl:template match="att">
    <xsl:text>`@</xsl:text>
    <xsl:apply-templates/>
    <xsl:text>`</xsl:text>
  </xsl:template>

  <xsl:template match="note">
    <xsl:call-template name="newline"/>
    <xsl:text>.footnote[</xsl:text>
    <xsl:for-each select=".">
      <xsl:apply-templates/>
      <xsl:if test="position() != last()">
        <xsl:text> | </xsl:text>
      </xsl:if>
    </xsl:for-each>
    <xsl:text>]</xsl:text>
    <xsl:call-template name="newline"/>
  </xsl:template>
  
  <xsl:template match="note[@rend='none']">
    <xsl:call-template name="newline"/>
    <xsl:text>???</xsl:text>
    <xsl:call-template name="newline"/>
    <xsl:apply-templates/>
  </xsl:template>


  <xsl:template match="gi">
    <xsl:text>`&lt;</xsl:text>
    <xsl:apply-templates/>
    <xsl:text>&gt;`</xsl:text>
  </xsl:template>

  <xsl:template match="hi">
    <xsl:text>.red[</xsl:text>
    <xsl:apply-templates/>
    <xsl:text>]</xsl:text>
  </xsl:template>
  
  <xsl:template match="hi[@rend='superscript']">
    <xsl:text>&lt;sup&gt;</xsl:text>
    <xsl:apply-templates/>
    <xsl:text>&lt;/sup&gt;</xsl:text>
  </xsl:template>

  <xsl:template match="ident">
    <xsl:text>`</xsl:text>
    <xsl:apply-templates/>
    <xsl:text>`</xsl:text>
  </xsl:template>

  <xsl:template match="label[parent::list]">
    <xsl:choose>
      <xsl:when test="tei:isOrderedList(..)">
        <xsl:text>1. </xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>* </xsl:text>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:value-of select="."/>
    <xsl:text> : </xsl:text>
    <xsl:value-of select="following-sibling[1]"/>
  </xsl:template>
  
  <xsl:template match="item[preceding-sibling::label]">
    <xsl:apply-templates />
    <xsl:call-template name="newline"/>
  </xsl:template>

  <xsl:template match="titlePart">
    <xsl:call-template name="newline"/>
    <xsl:text># </xsl:text>
    <xsl:apply-templates/>
    <xsl:call-template name="newline"/>
  </xsl:template>

  <xsl:template match="docImprint">
    <xsl:call-template name="newline"/>
    <xsl:text>## </xsl:text>
    <xsl:apply-templates/>
    <xsl:call-template name="newline"/>
  </xsl:template>

  <xsl:template match="ref">
    <xsl:text>[</xsl:text>
    <xsl:apply-templates/>
    <xsl:text>](</xsl:text>
    <xsl:value-of select="@target"/>
    <xsl:text>)</xsl:text>
  </xsl:template>
  
  <xsl:template match="code">
    <xsl:text>`</xsl:text>
    <xsl:apply-templates/>
    <xsl:text>`</xsl:text>
  </xsl:template>
  
</xsl:stylesheet>
