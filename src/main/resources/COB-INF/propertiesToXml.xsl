<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ea="antlib:org.apache.easyant" xmlns:csv="http://apache.org/cocoon/csv/1.0">

    <xsl:template match="csv:document">
        <properties>
            <xsl:apply-templates />
        </properties>
    </xsl:template>

    <xsl:template match="csv:record">
        <xsl:choose>
            <xsl:when test="starts-with(./csv:field[1], '#')">
                <comment>
                    <xsl:apply-templates />
                </comment>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="property">
                    <xsl:attribute name="name">
                        <xsl:value-of select="./csv:field[@number=1]" /></xsl:attribute>
                    <xsl:value-of select="./csv:field[@number=2]" />
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>
