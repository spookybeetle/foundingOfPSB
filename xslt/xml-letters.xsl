<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/1999/xhtml" version="3.0">
    
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="yes" include-content-type="no" indent="yes"/>
    <xsl:mode on-no-match="shallow-copy"/>
    <xsl:variable name="xml-letters" as="document-node()+"
        select="collection('../xml/?select=*.xml')"/> 
    
        
    <xsl:template match="/">
        <xsl:for-each select="$xml-letters"><xsl:result-document method="xhtml" html-version="5" omit-xml-declaration="yes" include-content-type="no" indent="yes" href="file_{$xml-letters//docTitle ! replace(., '\s+', '')}-output.xml">
            <html>
                <head>
                    <meta charset="UTF-8"/>
                    <title>Behrend Letters</title>
                    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                    <link rel="stylesheet" type="text/css" href="../docs/style.css"/> <!-- ws:11/28 - Can't get the directory to work -->
                </head>
                <body>
                    <h1>
                        <xsl:value-of select="$xml-letters//docTitle ! normalize-space() => sort() => string-join(', ')"/>
                    </h1>
                </body>
            </html>
        </xsl:result-document></xsl:for-each>
       
    </xsl:template>
    
    
</xsl:stylesheet>
