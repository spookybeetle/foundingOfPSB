<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/1999/xhtml" version="3.0">
    
    <xsl:mode on-no-match="shallow-copy"/>
    
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="yes" include-content-type="no" indent="yes"/>
    
    <xsl:variable name="xmlLetter" as="document-node()+" select="collection('../xml/?select=*.xml')[base-uri()]"/>
    <xsl:variable name="xmlLetternames" as="xs:string" select="//persName/name"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <meta charset="UTF-8"/>
                <title>Analysis Table</title>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <link rel="stylesheet" type="text/css" href="style.css"/>
            </head>
            <body>
                <xsl:for-each select = "$xmlLetternames"><xsl:value-of select = "current()"/></xsl:for-each>
                <h1 class="Title">The Founding of Penn State Behrend</h1>
                <nav>
                    <a href="index.html">Home</a>
                    <a href="analysis.html">Analysis</a>
                    <a href="gallery.html">Gallery</a>
                    <a href="about.html">About the Team</a>
                </nav>
                
                <section id="toc">
                    <h2 id="toc">Surveying the markup</h2>            
                    <ul class="table">                        
                        <li>person</li>
                    </ul>


                <section id="person">       
                    <h3>Person</h3>    
                    
                    <table id="person"> 
                        <tr>
                            <th>Letters this person appears in</th>
                        </tr>
                        
<!--                        <xsl:for-each select="$beastMarkup">
                            <!-\- current() refers to the current word/phrase in the sequence.
                       We'll make a local variable to help find all the poems that mention this.
                       -\->
                            <xsl:variable name="poemList" as="element()*" select="$poemColl//root[contains(. ! lower-case(.) ! normalize-space(), 'current()')]//title[1]"/>
                            <tr> 
                                <td><xsl:value-of select="current()"/></td>  
                                
                                <td><!-\-Let's output a tidy list of the poems that mention the current word/phrase -\->
                                    <ul class="table">
                                        <xsl:for-each select="$poemList">
                                            <!-\-Let's go through each member of this sequence: and make a link to it in the HTML output on the reading view fulltext.html page. -\->
                                            
                                            <li>
                                                
                                                <a href="fulltext.html#{current()/parent::pg/@ref}"><xsl:value-of select="current()"/></a>
                                                
                                            </li>
                                            
                                        </xsl:for-each>
                                    </ul>
                                    
                                </td>
                            </tr>
                        </xsl:for-each>-->
                        
                    </table></section>
                </section>


            </body>
        </html>

    </xsl:template>
    <!-- Text view rules -->
    <xsl:template match="root/pg/title"> <!-- <h2> on poem titles -->
        <h2 id="{//pg/@ref => distinct-values()}"><a href="#top"><xsl:apply-templates/></a></h2>
    </xsl:template>
    <xsl:template match="root/pg/lg"> <!-- Wrap every line group with <p> -->
        <p><xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="root/pg/lg/l"> <!-- Line break after each line -->
        <xsl:apply-templates/><br/>
    </xsl:template>
    <xsl:template match="root/pg/pgNum"> <!-- Line break after page number to prevent content overlapping with that of next page-->
        <xsl:apply-templates/><br/><br/>
    </xsl:template>
    <xsl:template match="root/pg/fig"> <!-- Deal with images-->
        <img alt="{img/@alt}" src="{img/@src}"/>
    </xsl:template>
    
    <xsl:template match="root" mode="toc">
        <tr>
            <td class="table-title">
                <h2 >
                    <a href="#{//pg/@ref => distinct-values()}"><xsl:apply-templates select="pg/title" mode="toc"/></a>
                </h2>
            </td>
            <td class="table-page">
                
            </td>
        </tr>
    </xsl:template>
    
</xsl:stylesheet>
