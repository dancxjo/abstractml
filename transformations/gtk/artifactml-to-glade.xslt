<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="xml" encoding="UTF-8" indent="yes" omit-xml-declaration="no" />

  <xsl:template match="/">
    <interface>
      <requires lib="gtk+" version="3.20"/>
      <xsl:apply-templates/>
    </interface>
  </xsl:template>

  <xsl:template match="application">
    <object class="GtkWindow">
      <property name="title">
        <xsl:value-of select="title"/>
      </property>
      <child>
        <object class="GtkBox">
          <property name="orientation">GTK_ORIENTATION_VERTICAL</property>
          <xsl:apply-templates select="main"/>
        </object>
      </child>
    </object>
  </xsl:template>

  <xsl:template match="main">
    <child>
      <object class="GtkLabel">
        <property name="label" translatable="yes">
          <xsl:value-of select="display"/>
        </property>
      </object>
    </child>
    <child>
      <object class="GtkGrid">
        <xsl:apply-templates select="keypad"/>
      </object>
    </child>
  </xsl:template>

  <xsl:template match="keypad">
    <xsl:for-each select="button">
      <child>
        <object class="GtkButton">
          <property name="label" translatable="yes">
            <xsl:value-of select="."/>
          </property>
          <xsl:attribute name="id">
            <xsl:text>button-</xsl:text>
            <xsl:value-of select="@value"/>
          </xsl:attribute>
        </object>
        <packing>
          <property name="left_attach">
            <xsl:value-of select="(position() - 1) mod 4"/>
          </property>
          <property name="top_attach">
            <xsl:value-of select="floor((position() - 1) div 4)"/>
          </property>
        </packing>
      </child>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
