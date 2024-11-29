<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text" encoding="UTF-8" />

  <xsl:template name="EscapeQuotes">
    <xsl:param name="value" />
    <xsl:choose>
      <xsl:when test="contains($value,'&quot;')">
    <xsl:value-of select="substring-before($value,'&quot;')" />
    <xsl:text>&quot;&quot;</xsl:text>
    <xsl:call-template name="EscapeQuotes">
      <xsl:with-param name="value" select="substring-after($value,'&quot;')" />
    </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
    <xsl:value-of select="$value" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="CsvEscape">
    <xsl:param name="value" />
    <xsl:choose>
    <xsl:when test="contains($value,',')">
      <xsl:text>&quot;</xsl:text>
      <xsl:call-template name="EscapeQuotes">
    <xsl:with-param name="value" select="$value" />
      </xsl:call-template>
      <xsl:text>&quot;</xsl:text>
    </xsl:when>
    <xsl:when test="contains($value,'&#xA;')">
      <xsl:text>&quot;</xsl:text>
      <xsl:call-template name="EscapeQuotes">
    <xsl:with-param name="value" select="$value" />
      </xsl:call-template>
      <xsl:text>&quot;</xsl:text>
    </xsl:when>
    <xsl:when test="contains($value,'&quot;')">
      <xsl:text>&quot;</xsl:text>
      <xsl:call-template name="EscapeQuotes">
    <xsl:with-param name="value" select="$value" />
      </xsl:call-template>
      <xsl:text>&quot;</xsl:text>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$value" />
    </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="/">
    <xsl:text
        >type,unit,value,sourceName,sourceVersion,device,creationDate,startDate,endDate</xsl:text>
    <xsl:text>&#xA;</xsl:text>
    <xsl:for-each select="HealthData/Record">
        <xsl:call-template name="CsvEscape"><xsl:with-param
                    name="value"
                    select="normalize-space(@type)"
                /></xsl:call-template>
        <xsl:text>,</xsl:text>
        <xsl:call-template name="CsvEscape"><xsl:with-param
                    name="value"
                    select="normalize-space(@unit)"
                /></xsl:call-template>
        <xsl:text>,</xsl:text>
        <xsl:call-template name="CsvEscape"><xsl:with-param
                    name="value"
                    select="normalize-space(@value)"
                /></xsl:call-template>
        <xsl:text>,</xsl:text>
      <xsl:call-template name="CsvEscape"><xsl:with-param
                    name="value"
                    select="normalize-space(@sourceName)"
                /></xsl:call-template>
      <xsl:text>,</xsl:text>
      <xsl:call-template name="CsvEscape"><xsl:with-param
                    name="value"
                    select="normalize-space(@sourceVersion)"
                /></xsl:call-template>
      <xsl:text>,</xsl:text>
      <xsl:call-template name="CsvEscape"><xsl:with-param
                    name="value"
                    select="normalize-space(@device)"
                /></xsl:call-template>
      <xsl:text>,</xsl:text>
      <xsl:call-template name="CsvEscape"><xsl:with-param
                    name="value"
                    select="normalize-space(@creationDate)"
                /></xsl:call-template>
      <xsl:text>,</xsl:text>
      <xsl:call-template name="CsvEscape"><xsl:with-param
                    name="value"
                    select="normalize-space(@startDate)"
                /></xsl:call-template>
      <xsl:text>,</xsl:text>
      <xsl:call-template name="CsvEscape"><xsl:with-param
                    name="value"
                    select="normalize-space(@endDate)"
                /></xsl:call-template>
      <xsl:text>&#xA;</xsl:text>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
