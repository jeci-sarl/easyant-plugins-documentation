<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ea="antlib:org.apache.easyant">
    <xsl:param name="basedir" />
    <xsl:param name="type" />
    <xsl:variable name="modulename" select="/eamodule/ivy-module/info/@module" />

    <xsl:template match="/">
        <xsl:apply-templates select="/eamodule/ivy-module" />
    </xsl:template>

    <xsl:template match="ivy-module">
        <html>

        <head>
            <title>EasyAnt Plugin -
                <xsl:value-of select="$modulename" />
            </title>
            <link rel="stylesheet" href="/static/main.css" />

        </head>

        <body>
            <h1>EasyAnt Plugin : <xsl:value-of select="$modulename"/></h1>
            <ul>
                <li>Organisation :
                    <xsl:value-of select="./info/@organisation" />
                </li>
                <li>Revision :
                    <xsl:value-of select="./info/@revision" />
                </li>
                <li>EasyAnt Required Revision :
                    <xsl:value-of select="/eamodule/project/ea:core-version/@requiredrevision" />
                </li>
                <li>Files :
                    <xsl:element name="a">
                        <xsl:attribute name="href">
                            <xsl:value-of select="@module" />
                            <xsl:text>.ivy</xsl:text>
                        </xsl:attribute>
                        module.ivy</xsl:element>
                </li>
            </ul>

            <h2>Description</h2>
            <xsl:apply-templates select="./info/description" />

            <h2>Ant Script</h2>
            <xsl:apply-templates select="/eamodule/project" />


            <div>
                <h2>Plugins Details</h2>
                <div class="col3">
                    <h3>Configurations</h3>
                    <xsl:apply-templates select="./configurations" />
                </div>
                <div class="col3">
                    <h3>Publications</h3>
                    <xsl:apply-templates select="./publications" />
                </div>
                <div class="col3">
                    <h3>Dependencies</h3>
                    <xsl:apply-templates select="./dependencies" />
                </div>
            </div>

        </body>

        </html>
    </xsl:template>

    <xsl:template match="project">
        <div class="col2">
            <h3>Targets</h3>
            <table>
                <thead>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Depends</th>
                </thead>
                <xsl:for-each select="./target">
                    <xsl:element name="tr">
                        <xsl:attribute name="class">
                            <xsl:choose>
                                <xsl:when test="position() mod 2 = 0 ">
                                    <xsl:value-of select="'odd'" />
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="'even'" />
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:attribute>
                        <td>
                            <b><xsl:value-of select="@name" /></b>
                        </td>
                        <td>
                            <xsl:value-of select="@description" />
                        </td>
                        <td>
                            <xsl:value-of select="@depends" />
                        </td>
                    </xsl:element>
                </xsl:for-each>
            </table>
        </div>

        <div class="col2">
            <h3>Default properties</h3>
            <xsl:apply-templates select="/eamodule/properties" />
        </div>


        <div class="col1 br">
            <h3>Parameters</h3>
            <table>
                <thead>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Default</th>
                </thead>
                <xsl:for-each select=".//ea:parameter">
                    <xsl:element name="tr">
                        <xsl:attribute name="class">
                            <xsl:choose>
                                <xsl:when test="position() mod 2 = 0 ">
                                    <xsl:value-of select="'odd'" />
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="'even'" />
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:attribute>
                        <td>
                            <xsl:value-of select="@property" />
                        </td>
                        <td>
                            <xsl:value-of select="@description" />
                        </td>
                        <td>
                            <xsl:value-of select="@default" />
                        </td>
                    </xsl:element>
                </xsl:for-each>
            </table>
        </div>


        <div class="br">
            <h3>Plugins Deps</h3>

            <div class="col2">
                <h4>EasyAnt Plugins</h4>
                <ul>
                    <xsl:for-each select="./ea:plugin">
                        <li>
                            <xsl:element name="a">
                                <xsl:attribute name="href">
                                    <xsl:text>/plugins/</xsl:text>
                                    <xsl:value-of select="@module" />
                                    <xsl:text>.html</xsl:text>
                                </xsl:attribute>
                                <xsl:value-of select="@module" /></xsl:element>
                            (
                            <xsl:value-of select="@revision" />)
                        </li>
                    </xsl:for-each>
                </ul>
            </div>

            <div class="col2">
                <h4>EasyAnt Import</h4>
                <ul>
                    <xsl:for-each select="./ea:import">
                        <xsl:variable name="imp-module" select="substring-before(substring-after(@mrid, '#' ), ';')" />
                        <xsl:variable name="imp-revision" select="substring-after(@mrid, ';')" />
                        <li>
                            <xsl:element name="a">
                                <xsl:attribute name="href">
                                    <xsl:text>/plugins/</xsl:text>
                                    <xsl:value-of select="$imp-module" />
                                    <xsl:text>.html</xsl:text>
                                </xsl:attribute>
                                <xsl:value-of select="$imp-module" /></xsl:element>
                            (
                            <xsl:value-of select="$imp-revision" />)
                        </li>
                    </xsl:for-each>
                </ul>
            </div>
        </div>

        <div class="br">
            <div class="col2">
                <h3>Extension Points</h3>
                <ul>
                    <xsl:for-each select="./extension-point">
                        <li><b><xsl:value-of select="@name" /></b> :
                            <xsl:value-of select="@description" />

                        </li>
                    </xsl:for-each>
                </ul>
            </div>
            <div class="col2">
                <h3>Bind Targets</h3>
                <ul>
                    <xsl:for-each select="./bindtargets">
                        <li><b>Extension Points : <xsl:value-of select="@extensionPoint" /></b>
                            <br/>Bind Targets:
                            <xsl:value-of select="@targets" />
                        </li>
                    </xsl:for-each>
                </ul>
            </div>
        </div>

    </xsl:template>

    <xsl:template match="properties">
        <ul>
            <xsl:for-each select="./property">
                <li><b><xsl:value-of select="@name"/></b> : <xsl:value-of select="text()"/></li>
            </xsl:for-each>
        </ul>
    </xsl:template>

    <xsl:template match="description">
        <div>
            <xsl:apply-templates />
        </div>
    </xsl:template>
    <xsl:template match="p">
        <xsl:element name="p">
            <xsl:apply-templates /></xsl:element>
    </xsl:template>
    <xsl:template match="br">
        <xsl:element name="br" /></xsl:template>
    <xsl:template match="ol">
        <ol>
            <xsl:apply-templates />
        </ol>
    </xsl:template>
    <xsl:template match="li">
        <li>
            <xsl:apply-templates />
        </li>
    </xsl:template>


    <xsl:template match="configurations">
        <ul>
            <xsl:apply-templates />
        </ul>
    </xsl:template>

    <xsl:template match="conf">
        <li>
            <xsl:value-of select="@name" />
            <br/>
            <xsl:value-of select="@description" />
        </li>
    </xsl:template>


    <xsl:template match="publications">
        <ul>
            <xsl:apply-templates />
        </ul>
    </xsl:template>

    <xsl:template match="artifact">
        <li>Artifact <u><xsl:value-of select="@name"/></u> type :
            <xsl:value-of select="@type" />
        </li>
    </xsl:template>

    <xsl:template match="dependencies">
        <ul>
            <xsl:apply-templates />
        </ul>
    </xsl:template>

    <xsl:template match="dependency">
        <li>
            <xsl:value-of select="@org" />,
            <xsl:value-of select="@name" />(
            <xsl:value-of select="@rev" />)</li>
    </xsl:template>


</xsl:stylesheet>
