<?xml version="1.0" encoding="euc-kr" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>대구 시민을 위한 교통 정보</title>
                <style>
                    div {
                        display: flex;
                        float: left;
                        box-sizing: border-box;
                        align-items: center;
                        margin: 0 auto;
                        flex-direction: column;
                    }
                    table {
                        text-align: center;
                        font-size: 12px;
                    }
                </style>
            </head>
            <body>
                <div class="subway" style="width: 30%;">
                    <h2>지하철 정차역</h2>
                    <table border="1" style="width: 80%;">
                        <tr>
                            <th id="line1" style="background-color: #e3312b; color: white;">1호선</th>
                            <th id="line2" style="background-color: #88d945;">2호선</th>
                            <th id="line3" style="background-color: #ffd817;">3호선</th>
                        </tr>
                        <xsl:for-each select="railroad/metro/subway[1]/line/station">
                            <xsl:variable name="index" select="position()"/>
                                <xsl:for-each select="..">
                                    <tr>
                                        <xsl:choose>
                                            <xsl:when test="./station[$index]/@type='transfer'">
                                                <td id="line1" style="background-color: #ffcecc;"><xsl:value-of select="//subway[1]/line/station[$index]/name[@lang='ko']"/></td>
                                            </xsl:when>
                                            <xsl:when test="./station[$index]/@type='train'">
                                                <td id="line1" style="background-color: #144999; color: white;"><xsl:value-of select="//subway[1]/line/station[$index]/name[@lang='ko']"/></td>
                                            </xsl:when>
                                            <xsl:when test="./station[$index]/@pub='due'">
                                                <td id="line1" style="background-color: gray; color: white;"><xsl:value-of select="//subway[1]/line/station[$index]/name[@lang='ko']"/></td>
                                            </xsl:when>
                                            <xsl:when test="./station[$index][not(@type) and not(@pub)]">
                                                <td id="line1"><xsl:value-of select="//subway[1]/line/station[$index]/name[@lang='ko']"/></td>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <td id="line1">-</td>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                        <xsl:choose>
                                            <xsl:when test="../../subway[2]/line/station[$index]/@type='transfer'">
                                                <td id="line2" style="background-color: #d1fc95;"><xsl:value-of select="//subway[2]/line/station[$index]/name[@lang='ko']"/></td>
                                            </xsl:when>
                                            <xsl:when test="../../subway[2]/line/station[$index][not(@type)]">
                                                <td id="line2"><xsl:value-of select="//subway[2]/line/station[$index]/name[@lang='ko']"/></td>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <td id="line2">-</td>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                        <xsl:choose>
                                            <xsl:when test="../../subway[3]/line/station[$index]/@type='transfer'">
                                                <td id="line3" style="background-color: #ffea82;"><xsl:value-of select="//subway[3]/line/station[$index]/name[@lang='ko']"/></td>
                                            </xsl:when>
                                            <xsl:when test="../../subway[3]/line/station[$index][not(@type)]">
                                                <td id="line3"><xsl:value-of select="//subway[3]/line/station[$index]/name[@lang='ko']"/></td>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <td id="line3">-</td>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </tr>
                                </xsl:for-each>
                        </xsl:for-each>
                    </table>
                </div>
                <div class="train" style="width: 20%;">
                    <h2>새마을호 정차역</h2>
                    <table border="1" style="width: 80%;">
                        <tr>
                            <th colspan="2" style="background-color: #c30e2f; color: white;">경부선<br/>(부산)</th>
                            <th colspan="2" style="background-color: #c30e2f; color: white;">경부선<br/>(신해운대)</th>
                        </tr>
                        <tr>
                            <td style="background-color: black; color: white;">정차</td>
                            <td style="background-color: black; color: white;">역명</td>
                            <td style="background-color: black; color: white;">정차</td>
                            <td style="background-color: black; color: white;">역명</td>
                        </tr>
                        <xsl:for-each select="railroad/train/ITX_Saemaeul/line[1]/station">
                            <xsl:variable name="index" select="position()"/>
                            <xsl:for-each select="..">
                                <tr>
                                    <xsl:choose>
                                        <xsl:when test="./station[$index]/@stop='selective'">
                                            <td id="t302" style="background-color: lightgray">선택</td>
                                            <td id="t302" style="background-color: lightgray"><xsl:value-of select="../line[1]/station[$index]/name[@lang='ko']"/></td>
                                        </xsl:when>
                                        <xsl:when test="./station[$index][not(@stop)]">
                                            <td id="t302">필수</td>
                                            <td id="t302"><xsl:value-of select="../line[1]/station[$index]/name[@lang='ko']"/></td>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <td id="t302"></td>
                                            <td id="t302">-</td>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                    <xsl:choose>
                                        <xsl:when test="../line[2]/station[$index]/@stop='selective'">
                                            <td id="t302" style="background-color: lightgray">선택</td>
                                            <td id="t302" style="background-color: lightgray"><xsl:value-of select="../line[2]/station[$index]/name[@lang='ko']"/></td>
                                        </xsl:when>
                                        <xsl:when test="../line[2]/station[$index][not(@stop)]">
                                            <td id="t302">필수</td>
                                            <td id="t302"><xsl:value-of select="../line[2]/station[$index]/name[@lang='ko']"/></td>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <td id="t302"></td>
                                            <td id="t302">-</td>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </tr>
                            </xsl:for-each>
                        </xsl:for-each>
                    </table>
                </div>
                <div class="train" style="width: 20%;">
                    <h2>무궁화호 정차역</h2>
                    <table border="1" style="width: 80%;">
                        <tr>
                            <th colspan="2" style="background-color: #f55839; color: white;">경부선</th>
                            <th colspan="2" style="background-color: #f55839; color: white;">대구선</th>
                        </tr>
                        <tr>
                            <td style="background-color: black; color: white;">정차</td>
                            <td style="background-color: black; color: white;">역명</td>
                            <td style="background-color: black; color: white;">정차</td>
                            <td style="background-color: black; color: white;">역명</td>
                        </tr>
                        <xsl:for-each select="railroad/train/Mugunghwa_Ho/line[1]/station">
                            <xsl:variable name="index" select="position()"/>
                            <xsl:for-each select="..">
                                <tr>
                                    <xsl:choose>
                                        <xsl:when test="./station[$index]/@stop='selective'">
                                            <td id="t302" style="background-color: lightgray">선택</td>
                                            <td id="t302" style="background-color: lightgray"><xsl:value-of select="../line[1]/station[$index]/name[@lang='ko']"/></td>
                                        </xsl:when>
                                        <xsl:when test="./station[$index][not(@stop)]">
                                            <td id="t302">필수</td>
                                            <td id="t302"><xsl:value-of select="../line[1]/station[$index]/name[@lang='ko']"/></td>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <td id="t302"></td>
                                            <td id="t302">-</td>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                    <xsl:choose>
                                        <xsl:when test="../line[2]/station[$index]/@stop='selective'">
                                            <td id="t30210" style="background-color: lightgray">선택</td>
                                            <td id="t30210" style="background-color: lightgray"><xsl:value-of select="../line[2]/station[$index]/name[@lang='ko']"/></td>
                                        </xsl:when>
                                        <xsl:when test="../line[2]/station[$index][not(@stop)]">
                                            <td id="t30210">필수</td>
                                            <td id="t30210"><xsl:value-of select="../line[2]/station[$index]/name[@lang='ko']"/></td>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <td id="t30210"></td>
                                            <td id="t30210">-</td>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </tr>
                            </xsl:for-each>
                        </xsl:for-each>
                    </table>
                </div>
                <div class="train" style="width: 30%">
                    <h2>KTX 정차역</h2>
                    <table border="1" style="width: 80%;">
                        <tr>
                            <th colspan="2" style="background-color: #C21540; color: white;">경부고속선</th>
                            <th colspan="2" style="background-color: #144999; color: white;">경부선<br/>(수원)</th>
                            <th colspan="2" style="background-color: #144999; color: white;">경부선<br/>(구포)</th>
                        </tr>
                        <tr>
                            <td style="background-color: black; color: white;">정차</td>
                            <td style="background-color: black; color: white;">역명</td>
                            <td style="background-color: black; color: white;">정차</td>
                            <td style="background-color: black; color: white;">역명</td>
                            <td style="background-color: black; color: white;">정차</td>
                            <td style="background-color: black; color: white;">역명</td>
                        </tr>
                        <xsl:for-each select="railroad/train/KTX[1]/line/station">
                            <xsl:variable name="index" select="position()"/>
                            <xsl:for-each select="..">
                                <tr>
                                    <xsl:choose>
                                        <xsl:when test="./station[$index]/@stop='selective'">
                                            <td id="t302" style="background-color: lightgray">선택</td>
                                            <td id="t302" style="background-color: lightgray"><xsl:value-of select="../line[1]/station[$index]/name[@lang='ko']"/></td>
                                        </xsl:when>
                                        <xsl:when test="./station[$index][not(@stop)]">
                                            <td id="t302">필수</td>
                                            <td id="t302"><xsl:value-of select="../line[1]/station[$index]/name[@lang='ko']"/></td>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <td id="t302"></td>
                                            <td id="t302">-</td>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                    <xsl:choose>
                                        <xsl:when test="../../KTX[2]/line[1]/station[$index]/@stop='selective'">
                                            <td id="t302" style="background-color: lightgray">선택</td>
                                            <td id="t302" style="background-color: lightgray"><xsl:value-of select="../../KTX[2]/line[1]/station[$index]/name[@lang='ko']"/></td>
                                        </xsl:when>
                                        <xsl:when test="../../KTX[2]/line[1]/station[$index][not(@stop)]">
                                            <td id="t302">필수</td>
                                            <td id="t302"><xsl:value-of select="../../KTX[2]/line[1]/station[$index]/name[@lang='ko']"/></td>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <td id="t302"></td>
                                            <td id="t302">-</td>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                    <xsl:choose>
                                        <xsl:when test="../../KTX[2]/line[2]/station[$index]/@stop='selective'">
                                            <td id="t101" style="background-color: lightgray">선택</td>
                                            <td id="t101" style="background-color: lightgray"><xsl:value-of select="../../KTX[2]/line[2]/station[$index]/name[@lang='ko']"/></td>
                                        </xsl:when>
                                        <xsl:when test="../../KTX[2]/line[2]/station[$index]/@stop='necessary'">
                                            <td id="t101">필수</td>
                                            <td id="t101"><xsl:value-of select="../../KTX[2]/line[2]/station[$index]/name[@lang='ko']"/></td>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <td id="t101"></td>
                                            <td id="t101">-</td>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </tr>
                            </xsl:for-each>
                        </xsl:for-each>
                    </table>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>