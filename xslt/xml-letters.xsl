<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/1999/xhtml" version="3.0">

    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="yes" include-content-type="no" indent="yes"/>

    <xsl:variable name="xmlLetter" as="document-node()+" select="collection('../xml/?select=*.xml')[not(contains(base-uri(), 'advisory'))]"/>
    
    <xsl:variable name="xmlImage" as="document-node()+" select="collection('../docs/output/documents/?select=*.PNG')"/>


    <xsl:template match="/">
        <xsl:for-each select="$xmlLetter">
            
            <xsl:variable name="currentLetter" as="document-node()" select="current()"/>
            <xsl:variable name="matchString" as="xs:string" select="$currentLetter ! base-uri() ! substring-after(., 'xml/') !substring-before(., '.xml')"/>
            
            
            <xsl:result-document method="xhtml" html-version="5" omit-xml-declaration="yes" include-content-type="no" indent="yes" href="../docs/output/{$currentLetter ! base-uri() ! tokenize(., '/')[last()] ! substring-before(., '.xml')}Output.html"> <!-- ws:12/2/2022 - The output for html should be one of the already existing html files in /docs/output -->
                <html>
                    <head>
                        <meta charset="UTF-8"/>
                        <title><xsl:value-of select="$currentLetter//docTitle"/></title>
                        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                        <link rel="stylesheet" type="text/css" href="../style.css"/>
                    </head>
                    <body>
                        <h1 class="Title">The Founding of Penn State Behrend</h1>
                        <nav>
                            <a href="../index.html">Home</a>
                            <a href="../contents.html">Contents</a>
                            <a href="../about.html">About The Team</a>
                        </nav>
                        
                        <section id="contain">
                            <div id="text">
                                <xsl:apply-templates/>
                            </div>
                            <div id="images">
                                <xsl:for-each select="descendant::listImages/image/@href">
                                    <img src="documents/{current()}" alt=""/>
                                </xsl:for-each>
                                <!--<xsl:for-each select="collection('../docs/output/documents/?select=*.PNG')[base-uri() ! contains(., $matchString)]">
                                    <figure>
                                        <img src="documents/{current() ! base-uri() ! tokenize(., '/')[last()]}" alt="Page Image from {$currentLetter//docTitle}"/>
                                        <figcaption>Page Image from 
                                            <xsl:value-of select="$currentLetter//docTitle"/>
                                        </figcaption>
                                    </figure>
                                    
                                </xsl:for-each>-->
                            </div>
                        </section>
                    </body>
                </html>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>

<xsl:template match="header">
    <h2>
        <xsl:apply-templates select="docTitle"/>
    </h2>
    <h3>
        <xsl:apply-templates select="docAuthor"/>
    </h3>
    <h4>
        <xsl:apply-templates select="docType"/>
    </h4>
    <h5>
        <xsl:apply-templates select="docDate"/>
    </h5>
</xsl:template>

<xsl:template match="body">
    <section id="sourceText">
        <xsl:apply-templates/>
    </section>
</xsl:template>
    
<xsl:template match="docHead | recipient">
    <p>
        <xsl:apply-templates/>
    </p>
</xsl:template>
<xsl:template match="p">
    <p>
        <span class="num">
            <xsl:value-of select="@n"/>
        </span>
        <xsl:apply-templates/>
    </p>
</xsl:template>
<xsl:template match="addLine | lb">
    <xsl:variable name="curLine" select="current()" as="element()"/>
    <span class="num"><xsl:value-of select="count(preceding::*[name()=$curLine ! name()])"/></span><xsl:apply-templates/><br/>
</xsl:template>    
    
<xsl:template match="persName">
    <xsl:choose>
        <xsl:when test="@pers='#Unknown'">
            <a class="pers" title="Unknown">
                <xsl:apply-templates/>
            </a>
        </xsl:when>
        <xsl:otherwise>
            <a class="pers" href="advisory_board_xx-xx-57Output.html{@pers}">
                <xsl:apply-templates/>
            </a>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>
      
    
    
</xsl:stylesheet>
