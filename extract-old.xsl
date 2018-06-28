<xsl:transform version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xlink="http://www.w3.org/1999/xlink">
  <xsl:output method="text" indent="no" encoding="ISO-8859-1"/>
  <xsl:variable name="apos">'</xsl:variable>
  <xsl:variable name="quot">"</xsl:variable>
  <xsl:template match="/DMDS/Export">
    <xsl:value-of select="concat('extId',';',
                                 'number', ';',
                                 'vaerkKIDStatus',';',
                                 'vaerkArtType',';',
                                 'declareVaerktype_entryId',';',
                                 'declareVaerktype_tekst',';',
                                 'declareVaerktype_parentId',';',
                                 'declareVaerktype_toplevelId',';',
                                 'declareVaerktype_indent',';',
                                 'declareVaerktype_sortKey',';',
                                 'declareVaerktype_path',';',
                                 'vaerktypeId',';',
                                 'declareAutenticitet_entryId',';',
                                 'declareAutenticitet_kode',';',
                                 'declareAutenticitet_tekst',';',
                                 'autenticitetId',';',
                                 'autenticitetNote',';',
                                 'autenticitetNote_en',';',
                                 'titel',';',
                                 'titel_en',';'
                         )" />
    <xsl:value-of select="concat('declareTitelType_entryId',';',
                                 'declareTitelType_kode',';',
                                 'declareTitelType_tekst',';',
                                 'declareTitelType_tekst_en',';',
                                 'titelTypeId',';',
                                 'declareTitel_enType_entryId',';',
                                 'declareTitel_enType_kode',';',
                                 'declareTitel_enType_tekst',';',
                                 'declareTitel_enType_tekst_en',';',
                                 'titel_enTypeId',';',
                                 'alternativTitel',';',
                                 'dateringStartaar',';',
                                 'dateringSlutaar',';',
                                 'dateringStartdato',';',
                                 'dateringSlutdato ',';',
                                 'primaerDatering',';',
                                 'beskrivelse',';',
                                 'materialeTeknik',';',
                                 'materialeTeknik_en',';',
                                 'signaturBetegnelse',';',
                                 'paaskrifter',';',
                                 'nettomaal',';',
                                 'bruttomaal',';',
                                 'montering',';',
                                 'ejer',';',
                                 'forvalter',';'
                         )" />
    <xsl:value-of select="concat('declareVaerkErhvervelsesmaade_entryId',';',
                                 'declareVaerkErhvervelsesmaade_kode',';',
                                 'declareVaerkErhvervelsesmaade_tekst',';',
                                 'vaerkErhvervelsesmaadeId',';',
                                 'erhvervelsesdato',';',
                                 'erhvervelsesStartaar',';',
                                 'erhvervelsesSlutaar',';',
                                 'erhvervelsesStartdato',';',
                                 'erhvervelsesSlutdato',';',
                                 'vaerkStatusNote',';',
                                 'erhvervelsesbemaerkning',';',
                                 'udstillet',';',
                                 'kunstnergruppe',';',
                                 'topografiskMotivStedId',';',
                                 'relateredeVaerkerNote',';',
                                 'relateredeVaerkerNote_en',';',
                                 'ophavsret',';',
                                 'internNote',';',
                                 'eksternNote',';',
                                 'publiceres',';'
                         )" />

    <!-- Kunstner -->
    <xsl:value-of select="concat('antal kunstnere',';',
                                 'kunstner',';'
                         )" />

    <!-- ObjektOpbevaring -->
    <xsl:value-of select="concat('declareOpbevaringType_entryId', ';',
                                 'declareOpbevaringType_kode', ';',
                                 'declareOpbevaringType_tekst', ';',
                                 'opbevaringTypeId', ';',
                                 'opbevaringsdato', ';'
                         )" />
    <!-- Opbevaring -->
    <xsl:value-of select="concat('bygning', ';',
                                 'rum', ';',
                                 'skab', ';',
                                 'hylde', ';',
                                 'skuffe', ';',
                                 'internNote', ';',
                                 'externNote', ';'
		 )" />
<xsl:text>
</xsl:text>
    <xsl:apply-templates select="Vaerk" />
  </xsl:template>

  <xsl:template match="Vaerk">
    <xsl:value-of select="concat(@extId, ';', 
                                 nummer, ';',
                                 vaerkKIDStatus,';',
                                 vaerkArtType,';',
                                 declareVaerktype/entryId,';',
                                 declareVaerktype/tekst,';',
                                 declareVaerktype/parentId,';',
                                 declareVaerktype/toplevelId,';',
                                 declareVaerktype/indent,';',
                                 declareVaerktype/sortKey,';',
                                 declareVaerktype/path,';',
                                 vaerktypeId,';',
                                 declareAutenticitet/entryId,';',
                                 declareAutenticitet/kode,';',
                                 declareAutenticitet/tekst,';'
                         )" />
    <xsl:call-template name="transform_characters">
      <xsl:with-param name="field" select="autenticitetId" />
    </xsl:call-template>
    <xsl:call-template name="transform_characters">
      <xsl:with-param name="field" select="autenticitetNote" />
    </xsl:call-template>
    <xsl:call-template name="transform_characters">
      <xsl:with-param name="field" select="autenticitetNote_en" />
    </xsl:call-template>
    <xsl:call-template name="transform_characters">
      <xsl:with-param name="field" select="titel" />
    </xsl:call-template>
    <xsl:call-template name="transform_characters">
      <xsl:with-param name="field" select="titel_en" />
    </xsl:call-template>
    <xsl:value-of select="concat(declareTitelType_entryId,';',
                                 declareTitelType/kode,';',
                                 declareTitelType/tekst,';',
                                 declareTitelType/tekst_en,';',
                                 titelTypeId,';',
                                 declareTitel_enType/entryId,';',
                                 declareTitel_enType/kode,';',
                                 declareTitel_enType/tekst,';',
                                 declareTitel_enType/tekst_en,';',
                                 titel_enTypeId,';',
                                 alternativTitel,';',
                                 dateringStartaar,';',
                                 dateringSlutaar,';',
                                 dateringStartdato,';',
                                 dateringSlutdato,';',
                                 primaerDatering,';'
                         )" />
    <xsl:call-template name="transform_characters">
      <xsl:with-param name="field" select="beskrivelse" />
    </xsl:call-template>
    <xsl:call-template name="transform_characters">
      <xsl:with-param name="field" select="materialeTeknik" />
    </xsl:call-template>
    <xsl:call-template name="transform_characters">
      <xsl:with-param name="field" select="materialeTeknik_en" />
    </xsl:call-template>
    <xsl:call-template name="transform_characters">
      <xsl:with-param name="field" select="signaturBetegnelse" />
    </xsl:call-template>
    <xsl:call-template name="transform_characters">
      <xsl:with-param name="field" select="paaskrifter" />
    </xsl:call-template>
    <xsl:call-template name="transform_characters">
      <xsl:with-param name="field" select="nettomaal" />
    </xsl:call-template>
    <xsl:call-template name="transform_characters">
      <xsl:with-param name="field" select="bruttomaal" />
    </xsl:call-template>
    <xsl:call-template name="transform_characters">
      <xsl:with-param name="field" select="montering" />
    </xsl:call-template>
    <xsl:call-template name="transform_characters">
      <xsl:with-param name="field" select="ejer" />
    </xsl:call-template>
    <xsl:call-template name="transform_characters">
      <xsl:with-param name="field" select="forvalter" />
    </xsl:call-template>
    <xsl:call-template name="transform_characters">
      <xsl:with-param name="field" select="declareVaerkErhvervelsesmaade/entryId" />
    </xsl:call-template>
    <xsl:call-template name="transform_characters">
      <xsl:with-param name="field" select="declareVaerkErhvervelsesmaade/kode" />
    </xsl:call-template>
    <xsl:call-template name="transform_characters">
      <xsl:with-param name="field" select="declareVaerkErhvervelsesmaade/tekst" />
    </xsl:call-template>
    <xsl:call-template name="transform_characters">
      <xsl:with-param name="field" select="vaerkErhvervelsesmaadeId" />
    </xsl:call-template>
    <xsl:value-of select="concat(erhvervelsesdato,';',
                                 erhvervelsesStartaar,';',
                                 erhvervelsesSlutaar,';',
                                 erhvervelsesStartdato,';',
                                 erhvervelsesSlutdato,';'
                         )" />
    <xsl:call-template name="transform_characters">
      <xsl:with-param name="field" select="vaerkStatusNote" />
    </xsl:call-template>
    <xsl:call-template name="transform_characters">
      <xsl:with-param name="field" select="erhvervelsesbemaerkning" />
    </xsl:call-template>
    <xsl:call-template name="transform_characters">
      <xsl:with-param name="field" select="udstillet" />
    </xsl:call-template>
    <xsl:call-template name="transform_characters">
      <xsl:with-param name="field" select="kunstnergruppe" />
    </xsl:call-template>
    <xsl:call-template name="transform_characters">
      <xsl:with-param name="field" select="topografiskMotivStedId" />
    </xsl:call-template>
    <xsl:call-template name="transform_characters">
      <xsl:with-param name="field" select="relateredeVaerkerNote" />
    </xsl:call-template>
    <xsl:call-template name="transform_characters">
      <xsl:with-param name="field" select="relateredeVaerkerNote_en" />
    </xsl:call-template>
    <xsl:call-template name="transform_characters">
      <xsl:with-param name="field" select="ophavsret" />
    </xsl:call-template>
    <xsl:call-template name="transform_characters">
      <xsl:with-param name="field" select="internNote" />
    </xsl:call-template>
    <xsl:call-template name="transform_characters">
      <xsl:with-param name="field" select="eksternNote" />
    </xsl:call-template>
    <xsl:call-template name="transform_characters">
      <xsl:with-param name="field" select="publiceres" />
    </xsl:call-template>

    <!-- Kunstner -->
    <xsl:variable name="kunstner_count">
      <xsl:value-of select="count(link)" />
    </xsl:variable>

    <xsl:value-of select="concat($kunstner_count, ';')" />

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
          <xsl:value-of select="concat($objekt/declareOpbevaringType/entryId, ';',
                                 $objekt/declareOpbevaringType/kode, ';',
                                 $objekt/declareOpbevaringType/tekst, ';',
                                 $objekt/opbevaringTypeId, ';',
                                 $objekt/opbevaringsdato, ';'
                         )" />

    <xsl:call-template name="transform_opbevaring">
      <xsl:with-param name="opbevaring" select="../Opbevaring[@extId=$objekt/opbevaringExtId][1]" />
    </xsl:call-template>
  </xsl:template>

  <!-- Template for the transformation of a Opbevaring element.-->
  <xsl:template name="transform_opbevaring">
    <xsl:param name="opbevaring" />
    <xsl:call-template name="transform_characters">
      <xsl:with-param name="field" select="$opbevaring/bygning" />
    </xsl:call-template>
    <xsl:call-template name="transform_characters">
      <xsl:with-param name="field" select="$opbevaring/rum" />
    </xsl:call-template>
    <xsl:call-template name="transform_characters">
      <xsl:with-param name="field" select="$opbevaring/skab" />
    </xsl:call-template>
    <xsl:call-template name="transform_characters">
      <xsl:with-param name="field" select="$opbevaring/hylde" />
    </xsl:call-template>
    <xsl:call-template name="transform_characters">
      <xsl:with-param name="field" select="$opbevaring/skuffe" />
    </xsl:call-template>
    <xsl:call-template name="transform_characters">
      <xsl:with-param name="field" select="$opbevaring/internNote" />
    </xsl:call-template>
    <xsl:call-template name="transform_characters">
      <xsl:with-param name="field" select="$opbevaring/eksternNote" />
    </xsl:call-template>
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
    <xsl:value-of select="';'" />
  </xsl:template>

</xsl:transform>
