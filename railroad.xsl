<?xml version="1.0" encoding="euc-kr" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>�뱸 �ù��� ���� ���� ����</title>
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
                    <h2>����ö ������</h2>
                    <table border="1" style="width: 80%;">
                        <tr>
                            <th id="line1" style="background-color: #e3312b; color: white;">1ȣ��</th>
                            <th id="line2" style="background-color: #88d945;">2ȣ��</th>
                            <th id="line3" style="background-color: #ffd817;">3ȣ��</th>
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
                    <h2>������ȣ ������</h2>
                    <table border="1" style="width: 80%;">
                        <tr>
                            <th colspan="2" style="background-color: #c30e2f; color: white;">��μ�<br/>(�λ�)</th>
                            <th colspan="2" style="background-color: #c30e2f; color: white;">��μ�<br/>(���ؿ��)</th>
                        </tr>
                        <tr>
                            <td style="background-color: black; color: white;">����</td>
                            <td style="background-color: black; color: white;">����</td>
                            <td style="background-color: black; color: white;">����</td>
                            <td style="background-color: black; color: white;">����</td>
                        </tr>
                        <xsl:for-each select="railroad/train/ITX_Saemaeul/line[1]/station">
                            <xsl:variable name="index" select="position()"/>
                            <xsl:for-each select="..">
                                <tr>
                                    <xsl:choose>
                                        <xsl:when test="./station[$index]/@stop='selective'">
                                            <td id="t302" style="background-color: lightgray">����</td>
                                            <td id="t302" style="background-color: lightgray"><xsl:value-of select="../line[1]/station[$index]/name[@lang='ko']"/></td>
                                        </xsl:when>
                                        <xsl:when test="./station[$index][not(@stop)]">
                                            <td id="t302">�ʼ�</td>
                                            <td id="t302"><xsl:value-of select="../line[1]/station[$index]/name[@lang='ko']"/></td>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <td id="t302"></td>
                                            <td id="t302">-</td>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                    <xsl:choose>
                                        <xsl:when test="../line[2]/station[$index]/@stop='selective'">
                                            <td id="t302" style="background-color: lightgray">����</td>
                                            <td id="t302" style="background-color: lightgray"><xsl:value-of select="../line[2]/station[$index]/name[@lang='ko']"/></td>
                                        </xsl:when>
                                        <xsl:when test="../line[2]/station[$index][not(@stop)]">
                                            <td id="t302">�ʼ�</td>
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
                    <h2>����ȭȣ ������</h2>
                    <table border="1" style="width: 80%;">
                        <tr>
                            <th colspan="2" style="background-color: #f55839; color: white;">��μ�</th>
                            <th colspan="2" style="background-color: #f55839; color: white;">�뱸��</th>
                        </tr>
                        <tr>
                            <td style="background-color: black; color: white;">����</td>
                            <td style="background-color: black; color: white;">����</td>
                            <td style="background-color: black; color: white;">����</td>
                            <td style="background-color: black; color: white;">����</td>
                        </tr>
                        <xsl:for-each select="railroad/train/Mugunghwa_Ho/line[1]/station">
                            <xsl:variable name="index" select="position()"/>
                            <xsl:for-each select="..">
                                <tr>
                                    <xsl:choose>
                                        <xsl:when test="./station[$index]/@stop='selective'">
                                            <td id="t302" style="background-color: lightgray">����</td>
                                            <td id="t302" style="background-color: lightgray"><xsl:value-of select="../line[1]/station[$index]/name[@lang='ko']"/></td>
                                        </xsl:when>
                                        <xsl:when test="./station[$index][not(@stop)]">
                                            <td id="t302">�ʼ�</td>
                                            <td id="t302"><xsl:value-of select="../line[1]/station[$index]/name[@lang='ko']"/></td>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <td id="t302"></td>
                                            <td id="t302">-</td>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                    <xsl:choose>
                                        <xsl:when test="../line[2]/station[$index]/@stop='selective'">
                                            <td id="t30210" style="background-color: lightgray">����</td>
                                            <td id="t30210" style="background-color: lightgray"><xsl:value-of select="../line[2]/station[$index]/name[@lang='ko']"/></td>
                                        </xsl:when>
                                        <xsl:when test="../line[2]/station[$index][not(@stop)]">
                                            <td id="t30210">�ʼ�</td>
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
                    <h2>KTX ������</h2>
                    <table border="1" style="width: 80%;">
                        <tr>
                            <th colspan="2" style="background-color: #C21540; color: white;">��ΰ�Ӽ�</th>
                            <th colspan="2" style="background-color: #144999; color: white;">��μ�<br/>(����)</th>
                            <th colspan="2" style="background-color: #144999; color: white;">��μ�<br/>(����)</th>
                        </tr>
                        <tr>
                            <td style="background-color: black; color: white;">����</td>
                            <td style="background-color: black; color: white;">����</td>
                            <td style="background-color: black; color: white;">����</td>
                            <td style="background-color: black; color: white;">����</td>
                            <td style="background-color: black; color: white;">����</td>
                            <td style="background-color: black; color: white;">����</td>
                        </tr>
                        <xsl:for-each select="railroad/train/KTX[1]/line/station">
                            <xsl:variable name="index" select="position()"/>
                            <xsl:for-each select="..">
                                <tr>
                                    <xsl:choose>
                                        <xsl:when test="./station[$index]/@stop='selective'">
                                            <td id="t302" style="background-color: lightgray">����</td>
                                            <td id="t302" style="background-color: lightgray"><xsl:value-of select="../line[1]/station[$index]/name[@lang='ko']"/></td>
                                        </xsl:when>
                                        <xsl:when test="./station[$index][not(@stop)]">
                                            <td id="t302">�ʼ�</td>
                                            <td id="t302"><xsl:value-of select="../line[1]/station[$index]/name[@lang='ko']"/></td>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <td id="t302"></td>
                                            <td id="t302">-</td>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                    <xsl:choose>
                                        <xsl:when test="../../KTX[2]/line[1]/station[$index]/@stop='selective'">
                                            <td id="t302" style="background-color: lightgray">����</td>
                                            <td id="t302" style="background-color: lightgray"><xsl:value-of select="../../KTX[2]/line[1]/station[$index]/name[@lang='ko']"/></td>
                                        </xsl:when>
                                        <xsl:when test="../../KTX[2]/line[1]/station[$index][not(@stop)]">
                                            <td id="t302">�ʼ�</td>
                                            <td id="t302"><xsl:value-of select="../../KTX[2]/line[1]/station[$index]/name[@lang='ko']"/></td>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <td id="t302"></td>
                                            <td id="t302">-</td>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                    <xsl:choose>
                                        <xsl:when test="../../KTX[2]/line[2]/station[$index]/@stop='selective'">
                                            <td id="t101" style="background-color: lightgray">����</td>
                                            <td id="t101" style="background-color: lightgray"><xsl:value-of select="../../KTX[2]/line[2]/station[$index]/name[@lang='ko']"/></td>
                                        </xsl:when>
                                        <xsl:when test="../../KTX[2]/line[2]/station[$index]/@stop='necessary'">
                                            <td id="t101">�ʼ�</td>
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