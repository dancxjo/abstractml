<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="text" encoding="UTF-8"/>

  <xsl:template match="/">
    <xsl:text>{</xsl:text>
    <xsl:text>&#10;  "language": "</xsl:text><xsl:value-of select="application/@lang"/><xsl:text>",</xsl:text>
    <xsl:text>&#10;  "intents": [</xsl:text>
    <xsl:apply-templates select="application/button"/>
    <xsl:text>&#10;  ]</xsl:text>
    <xsl:text>&#10;}</xsl:text>
  </xsl:template>

  <xsl:template match="button">
    <xsl:text>&#10;    {</xsl:text>
    <xsl:text>&#10;      "value": "</xsl:text><xsl:value-of select="@value"/><xsl:text>",</xsl:text>
    <xsl:text>&#10;      "displayText": "</xsl:text><xsl:value-of select="."/><xsl:text>"</xsl:text>
    <xsl:text>&#10;    }</xsl:text>
    <xsl:if test="position() != last()">,</xsl:if>
  </xsl:template>
</xsl:stylesheet>
