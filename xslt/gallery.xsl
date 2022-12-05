<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/1999/xhtml" version="3.0">

    <xsl:mode on-no-match="shallow-copy"/>

    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="yes" include-content-type="no" indent="yes"/>

    <xsl:variable name="xmlLetter" as="document-node()+" select="collection('../xml/?select=*.xml')[base-uri()]"/>
    
    <xsl:variable name="image" as="document-node()" select="doc('../documents/?select=*.PNG')"/>


    <xsl:template match="/">
        <html>
            <body>
                <h1>
                    <xsl:value-of select = "$xmlLetter//docHead">
                        
                    </xsl:value-of>
                </h1>
            </body>
        </html>
      <!--  <xsl:for-each select="$xmlLetter">
            
            <xsl:variable name="currentLetter" as="document-node()" select="current()"/>
            <!-\-<xsl:variable name="" select=""/>-\->
            
            
            
            
            
            
            
            <xsl:result-document method="xhtml" html-version="5" omit-xml-declaration="yes" include-content-type="no" indent="yes" href="{$currentLetter ! base-uri() ! tokenize(., '/')[last()] ! substring-before(., '.xml')}Output.html"> <!-\- ws:12/2/2022 - The output for html should be one of the already existing html files in /docs/output -\->
                <html>
                    <head>
                        <meta charset="UTF-8"/>
                        <title>Behrend Letters</title>
                        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                        <link rel="stylesheet" type="text/css" href="../style.css"/>
                    </head>
                    <body>
                        <h1>
                            <!-\-<xsl:value-of select="$xmlLetter//docTitle ! normalize-space() => sort() => string-join(', ')"/>-\->
                            <xsl:value-of select="$currentLetter//docHead"/>
                        </h1>
                        <p>
                            <xsl:apply-templates/>
                        </p>
                    </body>
                </html>
            </xsl:result-document>
        </xsl:for-each>-->

    </xsl:template>


</xsl:stylesheet>
