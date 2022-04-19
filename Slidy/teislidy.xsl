<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.w3.org/1999/xhtml" version="2.0">
    <!-- import base conversion style -->
    <xsl:import href="http://www.tei-c.org/release/xml/tei/stylesheet/html/html.xsl"/>
    <xsl:output method="html" exclude-result-prefixes="#all" encoding="utf-8"/>
    <xsl:variable name="now" select="current-time()"/>
    <xsl:variable name="today" select="current-date()"/>
    <xsl:param name="forcewrap">true</xsl:param>
    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                <!--THIS FILE IS GENERATED FROM AN XML MASTER. DO NOT EDIT (5)-->
                <title>
                    <xsl:value-of select="//t:titleStmt/t:title[1]"/>
                </title>
                <meta name="generator" content="Generated by TEISLIDY stylesheet"/>
                <script src="https://www.w3.org/Talks/Tools/Slidy/slidy.js" type="text/javascript"/>
                <!-- special CSS for slidy -->
                <link rel="stylesheet" type="text/css" media="screen, projection"
                    href="https://www.w3.org/Talks/Tools/Slidy/show.css"/>
                <!-- special CSS for egXMLs and cb handling now generated here -->
               <!-- <link href="../css/egXMLhandling.css" rel="stylesheet" type="text/css"/>-->
             <style>
              
              * {    box-sizing: border-box; }
              
              body {
              margin: 0;
              }
              
              /* centre graphics by default */
              img {
              display: block;
              margin-left: auto;
              margin-right: auto;
              }
              
              
              /* Create two unequal columns that floats next to each other */
              .col {
              float: left;
              padding: 10px;
              width: 50%;
              }
              
              
              /* Clear floats after the columns */
              .frame:after {
              content: "";
              display: table;
              clear: both;
              }
              
              div.egXML {
              clear:both;
              margin-top:1em;
              margin-bottom:1em;
              border-top-width:4px;
              border-bottom-width:4px;
              border-left-width:2px;
              border-right-width:2px;
              border-style:solid;
              padding-top:10px;
              padding-right:10px;
              padding-bottom:10px;
              padding-left:10px;
              margin-left: 0;
              color:#000000;
              line-height:1.1em;
              font-family:monospace;
              font-size:24pt;
              white-space:pre;
              background-color:#f7f9f6;
              border-color:#c5d8bb;
              }
              
              .quote {
              clear:both;
              margin-top:0.5em;
              margin-bottom:0.5em;
              border-top-width:2px;
              border-bottom-width:2px;
              border-left-width:2px;
              border-right-width:2px;
              border-style:solid;
              padding-top:10px;
              padding-right:10px;
              padding-bottom:10px;
              padding-left:10px;
              margin-left: 0;
              color:#000000;
              line-height:1.1em;
              font-family:monospace;
              font-size:16pt;   
              background-color:#f7f9f6;
              border-color:#c5d8bb;
              }
              
              div.figure h2 {
              font-size:14pt;
              font-style:italic;
              text-align:right;
              }
           
             </style>
                <!-- load usual TEI css for everything else -->
             <link href="https://www.tei-c.org/release/doc/tei-xsl/tei.css" rel="stylesheet"/>
    <!--                 <link href="../css/tei.css" rel="stylesheet" type="text/css"/>
    -->        </head>
            <body class="simple" id="TOP">
                <xsl:apply-templates select="t:TEI/t:text/t:body"/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="t:body/t:head"/>
    <xsl:template match="t:teiHeader"/>
    <xsl:template match="t:div[@type='comments']"/>
    <xsl:template match="t:div[@type='slide']/t:div[not(@type)]">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template name="egXMLStartHook">
        <xsl:comment>This otherwise redundant comment ensures egXMLs format nicely</xsl:comment>
    </xsl:template>
    
    
    <xsl:template match="t:body">
        
      <div class="slide cover" > 
          <img src="media/logo.png"
              width="40%" style="float:left"
            alt="[Put logo here]" 
            class="cover" /> 
        <br clear="all"/>            
          <h1><xsl:value-of select="//t:titleStmt/t:title[1]"/>
          </h1> 
          <xsl:if test="//t:titleStmt/t:title[@type='sub']">
              <h3 class="sub"><xsl:value-of select="//t:titleStmt/t:title[@type='sub']"/></h3>
          </xsl:if>
        <p><xsl:value-of select="//t:titleStmt/t:author"/></p> 
    </div> 
    <xsl:apply-templates select="t:div[@type='slide']"/>
    </xsl:template>
    
    <!-- Process only slide divs -->
    
    <xsl:template match="t:head">
     <h2>  
         <xsl:for-each select="*|text()">
             <xsl:apply-templates select="."/>
           
         </xsl:for-each>
   </h2> 
    </xsl:template>
    
    
    <xsl:template match="t:div[@type='slide']">
        <div class="slide">
        <!--    <xsl:apply-templates select="t:head"/>
        -->   
            <!-- special case slide divs containing cb -->
            
            <xsl:choose>
                <xsl:when test="t:cb">
                    <div class="frame">
                        <div class="col">
                            <xsl:for-each select="*[following-sibling::t:cb]">
                                <xsl:apply-templates select="."/>
                            </xsl:for-each>
                        </div>
                        <div class="col2">
                            <xsl:for-each select="*[preceding-sibling::t:cb]">
                                <xsl:apply-templates select="."/>
                            </xsl:for-each>
                        </div></div>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates/>
                </xsl:otherwise>
            </xsl:choose>
        </div>
    </xsl:template>

<xsl:template match="t:list[@type='incremental']">
    <ul class='incremental'>
        <xsl:apply-templates/>
    </ul>
</xsl:template>
    
    <!-- for some reason, tag isn't handled by default html styles -->
    <xsl:template match="t:tag">
        <span class="gi">
            <xsl:value-of select="concat('&lt;', ., '&gt;')"/>
        </span>
    </xsl:template>
    
    
</xsl:stylesheet>
