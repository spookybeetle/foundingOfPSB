<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/1999/xhtml" version="3.0">

    <xsl:mode on-no-match="shallow-copy"/>

    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="yes" include-content-type="no" indent="yes"/>

    <xsl:variable name="xmlLetter" as="document-node()+" select="collection('../xml/?select=*.xml')[base-uri()]"/>
    
    <xsl:variable name="image" as="document-node()" select="doc('../documents/?select=*.PNG')"/>


    <xsl:template match="/">
        <xsl:for-each select="$xmlLetter">
            
            <xsl:variable name="currentLetter" as="document-node()" select="current()"/>
            <!--<xsl:variable name="" select=""/>-->
            
            
            
            
            
            
            
            <xsl:result-document method="xhtml" html-version="5" omit-xml-declaration="yes" include-content-type="no" indent="yes" href="../docs/output/{$currentLetter ! base-uri() ! tokenize(., '/')[last()] ! substring-before(., '.xml')}Output.html">
                <html>
                    <head>
                        <meta charset="UTF-8"/>
                        <title>Behrend Letters</title>
                        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                        <link rel="stylesheet" type="text/css" href="../docs/style.css"/>
                        <!-- ws:11/28 - Can't get the directory to work -->
                    </head>
                    <body>
                        <h1>
                            <xsl:value-of select="$xmlLetter//docTitle ! normalize-space() => sort() => string-join(', ')"/>
                            <xsl:value-of select="$currentLetter//docTitle"/>
                        </h1>
                    </body>
                </html>
            </xsl:result-document>
        </xsl:for-each>

    </xsl:template>


</xsl:stylesheet>
