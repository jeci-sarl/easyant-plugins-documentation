<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:ea="antlib:org.apache.easyant">
	<xsl:param name="basedir" />
	<xsl:variable name="modulename" select="/ivy-module/info/@module" />
	<xsl:variable name="module-antfile" select="concat($basedir, '/src/main/resources/', $modulename, '.ant')" />
	<xsl:variable name="project" select="document( $module-antfile )/project" />

<xsl:template match="/">
	<html>
      <head>
			<title>EasyAnt Plugin - <xsl:value-of select="$modulename"/></title>
      </head>
      <body>
			<h1>EasyAnt Plugin : <xsl:value-of select="$modulename"/></h1>
			<ul>
				<li>Organisation : <xsl:value-of select="/ivy-module/info/@organisation"/></li>
				<li>Revision : <xsl:value-of select="/ivy-module/info/@revision"/></li>
				<li>EasyAnt Required Revision : <xsl:value-of select="$project/ea:core-version/@requiredrevision"/></li>
			</ul>

			<h2>Description</h2>
			<xsl:apply-templates select="/ivy-module/info/description" />

			<h2>Ant Script</h2>
			<xsl:apply-templates select="$project" />



			<h2>Plugins Details</h2>
			<h3>Configurations</h3>
			<xsl:apply-templates select="/ivy-module/configurations" />

			<h3>Publications</h3>
			<xsl:apply-templates select="/ivy-module/publications" />

			<h3>Dependencies</h3>
			<xsl:apply-templates select="/ivy-module/dependencies" />



		</body>
	</html>
</xsl:template>

	<xsl:template match="project">
		<h3>Parameters</h3>
		<table>
			<tr><th>Name</th><th>Description</th><th>Default</th></tr>
		<xsl:for-each select="./ea:parameter">
			<tr>
				<td><xsl:value-of select="@property" /> </td>
				<td><xsl:value-of select="@description" /> 	</td>
				<td><xsl:value-of select="@default" /> 	</td>
			</tr>
		</xsl:for-each>
		</table>

		<h3>Plugins Deps</h3>
		<ul>
		<xsl:for-each select="./ea:plugin">
			<li>
<xsl:element name="a"><xsl:attribute name="href"><xsl:value-of select="@module"/><xsl:text>.html</xsl:text></xsl:attribute><xsl:value-of select="@module"/>	</xsl:element>
			 (<xsl:value-of select="@revision" />)
			</li>
		</xsl:for-each>
		</ul>

		<h3>Extension Points</h3>
		<ul>
		<xsl:for-each select="./extension-point">
			<li><b><xsl:value-of select="@name" /></b> : <xsl:value-of select="@description" />

			</li>
		</xsl:for-each>
		</ul>
  </xsl:template>


	<xsl:template match="description">
		<div>
		<xsl:apply-templates />
		</div>
	</xsl:template>
	<xsl:template match="p">
		<xsl:element name="p"><xsl:apply-templates /></xsl:element>
	</xsl:template>
	<xsl:template match="br"><xsl:element name="br"/></xsl:template>
	<xsl:template match="ol">
		<ol>
		<xsl:apply-templates />
		</ol>
	</xsl:template>
	<xsl:template match="li"><li><xsl:apply-templates /></li></xsl:template>


	<xsl:template match="configurations">
		<ul>
		<xsl:apply-templates />
		</ul>
	</xsl:template>

	<xsl:template match="conf">
		<li><xsl:value-of select="@name"/> <br/> <xsl:value-of select="@description"/></li>
	</xsl:template>


	<xsl:template match="publications">
		<ul>
		<xsl:apply-templates />
		</ul>
	</xsl:template>

	<xsl:template match="artifact">
		<li>Artifact  <u><xsl:value-of select="@name"/></u> type : <xsl:value-of select="@type"/> </li>
	</xsl:template>

	<xsl:template match="dependencies">
		<ul>
		<xsl:apply-templates />
		</ul>
	</xsl:template>

	<xsl:template match="dependency">
		<li><xsl:value-of select="@org"/>, <xsl:value-of select="@name"/> (<xsl:value-of select="@rev"/>)</li>
	</xsl:template>


</xsl:stylesheet>
