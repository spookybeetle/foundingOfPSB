<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/1999/xhtml" version="3.0">

    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="yes" include-content-type="no" indent="yes"/>

    <xsl:variable name="xmlLetter" as="document-node()+" select="collection('../xml/?select=*.xml')[not(contains(base-uri(), 'advisory'))]"/>

    <xsl:template match="/">
        <html>
            <head>
                <meta charset="UTF-8"/>
                <title><xsl:value-of select="//docTitle"/></title>
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
                
                <section>
                    <div id="advtext">
                        <h2><xsl:apply-templates select=".//docHead"/></h2>
                        <h3>The information below was remixed from the original source. This data is what we have collected so far:</h3>
                        <table>
                            <tr>
                                <xsl:apply-templates select=".//docHeadTable"/>
                            </tr>
                            <xsl:apply-templates select=".//persLine"/>
                        </table>
                        <xsl:apply-templates select=".//header"/>
                    </div>
                    <div id="images">
                        <xsl:for-each select="descendant::listImages/image/@href">
                            <img src="documents/{current()}" alt=""/>
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
        <xsl:apply-templates select="notes"/>
    </xsl:template>
    
    <xsl:template match="notes">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match="note/persName">
        <span class="pers" id="{@xml:id}">
            <xsl:apply-templates/>    
        </span>
    </xsl:template>
    <xsl:template match="name">
       <span class="pers" id="{parent::persName/@xml:id}">
            <xsl:apply-templates/>    
        </span>
    </xsl:template>
    
    
    <xsl:template match="persLine">
        <xsl:variable name="persID" select="persName/@xml:id"/>
        <tr>
            <td>
                <xsl:apply-templates select=".//title[1]"/>
            </td>
            <td>
                <b><xsl:apply-templates select=".//name[1]"/></b>
            </td>
            <td>
                <xsl:apply-templates select=".//title[2]"/>
            </td>
            <td>
                <xsl:apply-templates select=".//date => string-join(', ')"/>
            </td>
            <td>
                <xsl:apply-templates select=".//address[1]"/>
            </td>
            <td>
                <b><xsl:apply-templates select=".//company"/></b><br/>
                <xsl:apply-templates select=".//address[2]"/>
            </td>
            <td>
                <ul>
                    <xsl:apply-templates select="$xmlLetter//(doc//persName[@pers ! substring-after(., '#')=$persID])[1]" mode="LL"/>
                </ul>
            </td>
        </tr>
    </xsl:template>
    
    <xsl:template match="address">
        <xsl:apply-templates select="addLine"/><br/>
    </xsl:template>
        
    <xsl:template mode="LL" match="persName">
        <xsl:variable name="letterName" select="base-uri() ! tokenize(., '/')[last()] ! substring-before(., '.xml')"/>
        <li><a href="{$letterName}Output.html"><xsl:value-of select="$letterName"/></a></li>
    </xsl:template>

    <xsl:template match="note">
        <p><xsl:apply-templates/></p>
        <xsl:for-each select="persName">
            <p><xsl:apply-templates select="current()"/> is mentioned:</p>
            <ul>
                <xsl:apply-templates select="$xmlLetter//(doc//persName[@pers ! substring-after(., '#')=current()/@xml:id])[1]" mode="LL"/>
            </ul>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
