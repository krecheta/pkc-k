<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html xml:lang="en" lang="en" xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <title>ex05-09.xsl</title>
            </head>
            <body>
                <div style="display:flex;justify-content:space-evenly; width:100%; left-margin:5%; right-margin:5%">
                    <div>
                        <h2>Lista klientow</h2>
                        <table border="1">
                            <tr>
                                <th>Lp.</th>
                                <th>Imie</th>
                                <th>Nazwisko</th>
                                <th>Miasto</th>
                                <th>Numer Telefonu</th>
                                <th>Zapłacono</th>
                                <th>Dostawa</th>
                                <th>Faktura</th>
                            </tr>
                            <xsl:for-each select="zamowienia/zamowienie">
                                <tr>
                                    <td>
                                        <xsl:number/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="klient/imie"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="klient/nazwisko"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="klient/adres/miasto"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="klient/telefon"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="koszt"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="@dostawa"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="@faktura"/>
                                    </td>
                                </tr>
                                <!-- <xsl:sort select = "koszt" data-type="number" order="descending"/> 
                                <xsl:sort select = "@dostawa"/> -->
                            </xsl:for-each>
                        </table>
                    </div>
                    <div>
                        <h2>Lista rzeczy zakupionych</h2>
                        <table border="1">
                            <tr>
                                <th>Artykuł</th>
                                <th>Ilość</th>
                            </tr>
                            <xsl:for-each select="zamowienia/zamowienie/towary">
                                <xsl:for-each select="artykuł">
                                    <xsl:if test="not(preceding::artykuł[text() = current()/text()])">
                                        <tr>
                                            <td>
                                                <xsl:value-of select="."/>
                                            </td>
                                            <td>
                                                <xsl:value-of select="count(//artykuł[text()=current()/text()])"/>
                                            </td>
                                        </tr>
                                    </xsl:if>
                                </xsl:for-each>
                            </xsl:for-each>
                        </table>
                    </div>
                </div>
                <div>
                    <ul>
                        <li>
                            <p>Liczba wszystkich sprzedanych artykułów:
                                <xsl:value-of select="count(zamowienia/zamowienie/towary/artykuł)"/>
                            </p>
                        </li>
                        <li>
                            <p>Liczba wszystkich dostępnych artykułów:
                                <xsl:value-of select="count(/zamowienia/towar)"/>
                            </p>
                        </li>
                        <li>
                            <p>Klient który zakupił towar za największą kwotę:
                                <xsl:for-each select="zamowienia/zamowienie">
                                    <xsl:sort select="koszt" data-type="number" order="descending"/>
                                    <xsl:if test="position()=1">
                                        <xsl:value-of select="concat(klient/imie,' ',klient/nazwisko) "/>
                                    </xsl:if>
                                </xsl:for-each>
                            </p>
                        </li>
                    </ul>
                </div>
                <div style="text-align: right;">
                <p>
                    Data utworzenia dokumentu:
                    <xsl:value-of select="/zamowienia/data-utworzenia"/>
                </p>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
