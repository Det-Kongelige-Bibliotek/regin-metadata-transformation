<xsl:transform version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xlink="http://www.w3.org/1999/xlink">
  <xsl:output method="text" indent="no" encoding="ISO-8859-1"/>
  <xsl:variable name="apos">'</xsl:variable>
  <xsl:variable name="quot">"</xsl:variable>
  <xsl:template match="/DMDS/Export">
    <xsl:value-of select="concat('accessions nummer',';',
                                 'materialetype', ';',
                                 'titel',';',
                                 'intern note',';',
                                 'år',';',
                                 'note',';',
                                 'kunstner',';',
                                 'opstilling',';'
                         )" />
<xsl:text>
</xsl:text>
    <xsl:apply-templates select="Vaerk" />
  </xsl:template>

  <xsl:template match="Vaerk">
    <!-- ACCESSIONS NUMMER -->
    <xsl:value-of select="concat(nummer, ';')" />

    <!-- MATERIALE TYPE -->
    <xsl:value-of select="concat(declareVaerktype/tekst,';')" />

    <!-- TITEL -->
    <xsl:call-template name="transform_characters">
      <xsl:with-param name="field" select="titel" />
    </xsl:call-template>
    <xsl:if test="titel_en != ''">
      <xsl:value-of select="'#en|'" />
      <xsl:call-template name="transform_characters">
        <xsl:with-param name="field" select="titel_en" />
      </xsl:call-template>
    </xsl:if>
    <xsl:value-of select="';'" />

    <!-- INTERN NOTE -->
    <xsl:if test="declareTitelType/tekst != ''">
      <xsl:value-of select="concat(declareTitelType/tekst,'#')" />
    </xsl:if>
    <xsl:if test="erhvervelsesbemaerkning != ''">
      <xsl:value-of select="concat(erhvervelsesbemaerkning,'#')" />
    </xsl:if>
    <xsl:if test="declareVaerkErhvervelsesmaade/tekst != ''">
      <xsl:if test="declareVaerkErhvervelsesmaade/tekst != ' [Blank]'">
        <xsl:value-of select="concat(declareVaerkErhvervelsesmaade/tekst,'#')" />
      </xsl:if>
    </xsl:if>
    <xsl:value-of select="';'" />

    <!-- ÅR -->
    <xsl:value-of select="concat(dateringStartaar,'-',dateringSlutaar,';')" />

    <!-- NOTE -->
    <xsl:if test="beskrivelse != ''">
      <xsl:call-template name="transform_characters">
        <xsl:with-param name="field" select="beskrivelse" />
      </xsl:call-template>
      <xsl:value-of select="'#'" />
    </xsl:if>
    <xsl:if test="materialeTeknik != ''">
      <xsl:call-template name="transform_characters">
        <xsl:with-param name="field" select="materialeTeknik" />
      </xsl:call-template>
      <xsl:value-of select="'#'" />
    </xsl:if>
    <xsl:if test="materialeTeknik_en != ''">
      <xsl:value-of select="'en|'" />
      <xsl:call-template name="transform_characters">
        <xsl:with-param name="field" select="materialeTeknik_en" />
      </xsl:call-template>
      <xsl:value-of select="'#'" />
    </xsl:if>
    <xsl:if test="signaturBetegnelse != ''">
      <xsl:call-template name="transform_characters">
        <xsl:with-param name="field" select="signaturBetegnelse" />
      </xsl:call-template>
      <xsl:value-of select="'#'" />
    </xsl:if>
    <xsl:if test="paaskrifter != ''">
      <xsl:call-template name="transform_characters">
        <xsl:with-param name="field" select="paaskrifter" />
      </xsl:call-template>
      <xsl:value-of select="'#'" />
    </xsl:if>
    <xsl:if test="nettomaal != ''">
      <xsl:call-template name="transform_characters">
        <xsl:with-param name="field" select="nettomaal" />
      </xsl:call-template>
      <xsl:value-of select="'#'" />
    </xsl:if>
    <xsl:if test="bruttomaal != ''">
      <xsl:call-template name="transform_characters">
        <xsl:with-param name="field" select="bruttomaal" />
      </xsl:call-template>
      <xsl:value-of select="'#'" />
    </xsl:if>
    <xsl:if test="materialeTeknik != ''">
      <xsl:call-template name="transform_characters">
        <xsl:with-param name="field" select="montering" />
      </xsl:call-template>
    </xsl:if>
    <xsl:value-of select="';'" />

    <!-- Kunstner -->
    <xsl:variable name="kunstner_count">
      <xsl:value-of select="count(link)" />
    </xsl:variable>

    <xsl:choose>
      <xsl:when test="$kunstner_count=0">
        <xsl:value-of select="';'" />
      </xsl:when>
      <xsl:when test="$kunstner_count=1">
        <xsl:variable name="kunstner_id">
          <xsl:value-of select="link[1]/@objectExtId" />
        </xsl:variable>
        <xsl:call-template name="transform_kunstner">
          <xsl:with-param name="kunstner" select="../Kunstner[@extId=$kunstner_id]" />
        </xsl:call-template>
        <xsl:value-of select="';'" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:for-each select="link">
          <xsl:variable name="kunstner_id">
            <xsl:value-of select="./@objectExtId" />
          </xsl:variable>
          <xsl:call-template name="transform_kunstner">
            <xsl:with-param name="kunstner" select="../../Kunstner[@extId=$kunstner_id]" />
          </xsl:call-template>
          <xsl:value-of select="'#'" />
        </xsl:for-each>
        <xsl:value-of select="';'" />
      </xsl:otherwise>
    </xsl:choose>

    <!-- Opstilling -->
    <xsl:variable name="vaerk_id">
      <xsl:value-of select="@extId" />
    </xsl:variable>

    <!-- Transformation of ObjektOpbevaring -->
    <xsl:call-template name="transform_objekt_opbevaring">
      <xsl:with-param name="objekt" select="../ObjektOpbevaring[@parentExtId=$vaerk_id][1]" />
    </xsl:call-template>
<!--
    <xsl:value-of select="concat('GNU', ';')" />
-->

    <xsl:text>
</xsl:text>
<!--
    <xsl:text>
###
</xsl:text>
-->
  </xsl:template>

  <!-- Template for the transformation of a ObjektOpbevaring element.-->
  <xsl:template name="transform_objekt_opbevaring">
    <xsl:param name="objekt" />
    <xsl:if test="$objekt/declareOpbevaringType/tekst != ''">
      <xsl:call-template name="transform_characters">
        <xsl:with-param name="field" select="$objekt/declareOpbevaringType/tekst" />
      </xsl:call-template>
      <xsl:value-of select="'#'" />
    </xsl:if>

    <xsl:call-template name="transform_opbevaring">
      <xsl:with-param name="opbevaring" select="../Opbevaring[@extId=$objekt/opbevaringExtId][1]" />
    </xsl:call-template>
  </xsl:template>

  <!-- Template for the transformation of a Opbevaring element.-->
  <xsl:template name="transform_opbevaring">
    <xsl:param name="opbevaring" />
    <xsl:if test="$opbevaring/bygning != ''">
      <xsl:call-template name="transform_characters">
        <xsl:with-param name="field" select="$opbevaring/bygning" />
      </xsl:call-template>
      <xsl:value-of select="'#'" />
    </xsl:if>
    <xsl:if test="$opbevaring/rum != ''">
      <xsl:call-template name="transform_characters">
        <xsl:with-param name="field" select="$opbevaring/rum" />
      </xsl:call-template>
      <xsl:value-of select="'#'" />
    </xsl:if>
    <xsl:if test="$opbevaring/skab != ''">
      <xsl:call-template name="transform_characters">
        <xsl:with-param name="field" select="$opbevaring/skab" />
      </xsl:call-template>
      <xsl:value-of select="'#'" />
    </xsl:if>
    <xsl:if test="$opbevaring/hylde != ''">
      <xsl:call-template name="transform_characters">
        <xsl:with-param name="field" select="$opbevaring/hylde" />
      </xsl:call-template>
      <xsl:value-of select="'#'" />
    </xsl:if>
    <xsl:if test="$opbevaring/skuffe != ''">
      <xsl:call-template name="transform_characters">
        <xsl:with-param name="field" select="$opbevaring/skuffe" />
      </xsl:call-template>
      <xsl:value-of select="'#'" />
    </xsl:if>
    <xsl:if test="$opbevaring/internNote != ''">
      <xsl:call-template name="transform_characters">
        <xsl:with-param name="field" select="$opbevaring/internNote" />
      </xsl:call-template>
      <xsl:value-of select="'#'" />
    </xsl:if>
    <xsl:if test="$opbevaring/eksternNote != ''">
      <xsl:call-template name="transform_characters">
        <xsl:with-param name="field" select="$opbevaring/eksternNote" />
      </xsl:call-template>
      <xsl:value-of select="'#'" />
    </xsl:if>
  </xsl:template>

  <xsl:template name="transform_kunstner">
    <xsl:param name="kunstner" />
    <xsl:value-of select="concat($kunstner/navn, ' ')" />
    <xsl:call-template name="transform_global_kunstner">
      <xsl:with-param name="global_kunstner" select="../GlobalKunstner[@extId=$kunstner/globalKunstnerExtId]" />
    </xsl:call-template>

    <xsl:if test="$kunstner/titel">
      <xsl:value-of select="concat(',', $kunstner/titel)" />
    </xsl:if>
  </xsl:template>

  <xsl:template name="transform_global_kunstner">
    <xsl:param name="global_kunstner" />
    <xsl:if test="$global_kunstner/alternativtNavn">
      <xsl:value-of select="concat('(', $global_kunstner/alternativtNavn, ')')" />
    </xsl:if>
    <xsl:if test="$global_kunstner/foedtStartaar">
      <xsl:value-of select="concat('(', $global_kunstner/foedtStartaar, ' - ', $global_kunstner/doedStartaar, ')')" />
    </xsl:if>
    <xsl:if test="$global_kunstner/titel">
      <xsl:value-of select="concat(',', $global_kunstner/titel)" />
    </xsl:if>
    <xsl:if test="$global_kunstner/declareNationalitet/nationalitet">
      <xsl:value-of select="concat(',', $global_kunstner/declareNationalitet/nationalitet)" />
    </xsl:if>


  </xsl:template>

  <xsl:template name="transform_characters">
    <xsl:param name="field" />
    <xsl:value-of select="replace(replace(replace(replace(replace(replace(
                                  $field,'&#13;&#10;', '##'), 
                                  ';', ','), 
                                  $quot, ''),
                                  $apos ,''),
                                  '&quot;', ''),
                                  '&amp;quot;', '')" />
    <!-- xsl:value-of select="';'" / -->
  </xsl:template>

</xsl:transform>
