<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" encoding="UTF-8"/>

  <xsl:template match="/">
    <html>
      <head>
        <title><xsl:value-of select="application/title"/></title>
      </head>
      <body>
        <xsl:apply-templates/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="title">
    <h1><xsl:value-of select="."/></h1>
  </xsl:template>

  <xsl:template match="main">
    <div>
      <xsl:apply-templates/>
    </div>
  </xsl:template>

  <xsl:template match="display">
    <input type="text" id="{@id}" readonly="readonly"/>
  </xsl:template>

  <xsl:template match="keypad">
    <div>
      <xsl:apply-templates/>
    </div>
  </xsl:template>

  <xsl:template match="button">
    <button value="{@value}"><xsl:value-of select="."/></button>
  </xsl:template>
</xsl:stylesheet>
