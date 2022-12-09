<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/1999/xhtml" version="3.0">

    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="yes" include-content-type="no" indent="yes"/>

    <xsl:variable name="xmlLetter" as="document-node()+" select="collection('../xml/?select=*.xml')[base-uri()]"/>
    
    <xsl:variable name="xmlImage" as="document-node()" select="doc('../documents/?select=*.PNG')"/>


    <xsl:template match="/">
        <xsl:for-each select="$xmlLetter">
            
            <xsl:variable name="currentLetter" as="document-node()" select="current()"/>
            <xsl:variable name="currentImage" as="xs:string" select="$currentLetter ! base-uri() ! substring-after(., 'xml/') !substring-before(., '.xml')"/>
            
            
            <xsl:result-document method="xhtml" html-version="5" omit-xml-declaration="yes" include-content-type="no" indent="yes" href="{$currentLetter ! base-uri() ! tokenize(., '/')[last()] ! substring-before(., '.xml')}Output.html"> <!-- ws:12/2/2022 - The output for html should be one of the already existing html files in /docs/output -->
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
                            <a href="../analysis.html">Analysis</a>
                            <a href="../gallery.html">Gallery</a>
                            <a href="../about.html">About the Team</a>
                        </nav>
                        <h2>
                            <xsl:value-of select="$currentLetter//docTitle"/>, <xsl:value-of select="$currentLetter//docHead"/>   
                        </h2>
                        <p>
                            <xsl:apply-templates/>
                        </p>
                        
                        <!-- ws-12/7/22: This Makes Images from an If-Else statement (xsl:choose)-->
                        <xsl:choose>
                            <xsl:when test="$currentLetter//page/@n">
                                <!--We have multiple images: <xsl:value-of select="$currentLetter//page/@n"/>--> 
                                <xsl:for-each select="$currentLetter//page/@n">
                                    <img src="../documents/{$currentImage}_page{current()}.PNG"/>
                                </xsl:for-each>
                            </xsl:when>
                            <xsl:otherwise>
                                <img src="../documents/{$currentImage}.PNG"/>
                            </xsl:otherwise>
                        </xsl:choose>



                    </body>
                </html>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>


</xsl:stylesheet>
