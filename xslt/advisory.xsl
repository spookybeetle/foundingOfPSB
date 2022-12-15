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
                        <h2><xsl:apply-templates select=".//docHead"/></h2>
                        <table>
                            <tr>
                                <xsl:apply-templates select=".//docHeadTable"/>
                            </tr>
                            <xsl:apply-templates select=".//persLine"/>
                        </table>
                    </div>
                    <div id="images">
                        <xsl:for-each select="descendant::listImages/image/@href">
                            <img src="{current()}" alt=""/>
                        </xsl:for-each>
                    </div>
                </section>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="docHeadTable">
        <th>
            <xsl:apply-templates select="colHead[@pos='1']"/>
        </th>
        <th>Name</th>
        <th>Company Title</th>
        <th>Dates Associated</th>
        <th>
            <xsl:apply-templates select="colHead[@pos='5']"/>
        </th>
        <th>
            <xsl:apply-templates select="colHead[@pos='6']"/>
        </th>
        <th>Letter List</th>
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
    
    <xsl:template match="persLine">
        <tr>
            <td>
                <xsl:apply-templates select=".//title[1]"/>
            </td>
            <td>
                <xsl:apply-templates select=".//name[1]"/>
            </td>
            <td>
                <xsl:apply-templates select=".//title[2]"/>
            </td>
            <td>
                <xsl:apply-templates select=".//date ! string-join(., ', ')"/>
            </td>
            
        </tr>
    </xsl:template>
    
        

</xsl:stylesheet>
