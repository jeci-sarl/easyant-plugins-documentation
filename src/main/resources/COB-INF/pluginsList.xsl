<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:param name="type" />

    <xsl:template match="/">
        <html>

        <head>
            <title>List of EasyAnt Plugins</title>
            <link rel="stylesheet" href="static/main.css" />

        </head>

        <body>
            <h1>List of EasyAnt Plugins</h1>
            <ul>
                <xsl:for-each select=".//info">
                    <xsl:sort select="@module" />
                    <li>
                        <xsl:element name="a">
                            <xsl:attribute name="href">
                                <xsl:value-of select="$type" />
                                <xsl:text>/</xsl:text>
                                <xsl:value-of select="@module" />
                                <xsl:text>.html</xsl:text>
                            </xsl:attribute>
                            <xsl:value-of select="@module" /></xsl:element>
                        (
                        <xsl:value-of select="@revision" />) :
                        <p>
                            <xsl:apply-templates select="description" />
                        </p>
                    </li>
                </xsl:for-each>
            </ul>
        </body>

        </html>
    </xsl:template>

    <xsl:template match="description">
        <xsl:apply-templates />
    </xsl:template>

    <xsl:template match="br">
        <xsl:element name="br" />
    </xsl:template>
    <xsl:template match="p">
        <xsl:element name="p">
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>
    <xsl:template match="ol">
        <ol>
            <xsl:apply-templates />
        </ol>
    </xsl:template>
    <xsl:template match="ul">
        <ul>
            <xsl:apply-templates />
        </ul>
    </xsl:template>
    <xsl:template match="li">
        <li>
            <xsl:apply-templates />
        </li>
    </xsl:template>


    <xsl:template match="code">
        <xsl:element name="div">
            <xsl:attribute name="class">
                <xsl:value-of select="@type" /></xsl:attribute>
            <xsl:copy-of select="." />
        </xsl:element>
    </xsl:template>


</xsl:stylesheet>
