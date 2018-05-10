<?xml version='1.0' encoding='UTF-8' ?> 
<!-- was: no XML declaration present -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:date="http://exslt.org/dates-and-times">
    <xsl:key name="artykuł-zamowienie" match="towar" use="@id"/>
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="/zamowienia/zamowienie/towary/artykuł">
        <xsl:copy>
            <xsl:value-of select="key('artykuł-zamowienie',@list)/nazwa"/>
        </xsl:copy>
    </xsl:template> 
    
    <xsl:template match="/zamowienia/naglowek">
        <xsl:copy-of select="."/>
        <data-utworzenia>
            <xsl:value-of select="date:date()"/>
        </data-utworzenia>
    </xsl:template>
    
</xsl:stylesheet>


