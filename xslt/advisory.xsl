<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/1999/xhtml" version="3.0">

    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="yes" include-content-type="no" indent="yes"/>

    

    <xsl:template match="/">
        <html>
            <head>
                <meta charset="UTF-8"/>
                <title><xsl:value-of select="//docTitle"/></title>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <link rel="stylesheet" type="text/css" href="../style.css"/>
            </head>
            <body>
                <!--<h1 class="Title">The Founding of Penn State Behrend</h1>
                <nav>
                    <a href="../index.html">Home</a>
                    <a href="../analysis.html">Analysis</a>
                    <a href="../gallery.html">Gallery</a>
                    <a href="../about.html">About the Team</a>
                </nav>
                -->
                <section id="contain">
                    <div id="text">
                        <!--<xsl:apply-templates/>-->
                        <table>
                            <tr>
                                <xsl:apply-templates select="docHeadTable"/>
                                <!--<th>Letter Date</th>
                                <th>People Mentioned</th>
                                <th>Places Mentioned</th>-->
                            </tr>
                            <xsl:apply-templates select="body" mode="toc"/>
                        </table>
                    </div>
                    <!--<div id="images">
                        <xsl:for-each select="descendant::listImages/image/@href">
                            <img src="{current()}" alt=""/>
                        </xsl:for-each>
                    </div>-->
                </section>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="">
        <xsl:apply-templates select="colHead"/>
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
    
    <xsl:template match="body" mode="toc">
        <tr>
            <td><a href="#{@xml:id}"><!-- This is the internal link --><xsl:apply-templates select="@xml:id"/></a>: <xsl:value-of select=".//p[1] ! substring(., 1, 80)"/>
            </td>
            <td>
                <xsl:value-of select="descendant::placeName ! normalize-space() => distinct-values() => sort() => string-join(', ')"/>
            </td>
            <td>
                <xsl:value-of select="descendant::persName ! normalize-space() => distinct-values() => sort() => string-join(', ')"/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="body">
        <div id="{@xml:id}">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
               
            
            <!--<td>
                <a href="#{@xml:id}"><!-\- This is the internal link -\->
                    <xsl:apply-templates select="@xml:id"/>
                </a>: <xsl:value-of select=".//p[1] ! substring(., 1, 80)"/>
            </td>
            <td>
                <xsl:value-of select="descendant::placeName ! normalize-space() => distinct-values() => sort() => string-join(', ')"/>
            </td><!-\-
            <td>
                <xsl:value-of select="descendant::persName ! normalize-space() => distinct-values() => sort() => string-join(', ')"/>
            </td>-\->
            -->
        
    
        

</xsl:stylesheet>
