<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
    <xsl:template match="*|@*|processing-instruction()">
        <xsl:copy>
            <xsl:apply-templates select="*|@*|text()|processing-instruction()" />
        </xsl:copy>
    </xsl:template>
    <xsl:template match="/">
        <html>
            <head>
                <meta charset="UTF-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0" />
                <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
                <link rel="shortcut icon" href="../favicon.ico" type="x-icon" />
                <title>XMLspy</title>
            </head>
            <body style="font-family: 'Microsoft YaHei';">
                <img src="../images/Logo.png" style="display:block; margin:20px auto;" />
                <p style="text-align: center; font-size: 15pt; font-weight: bold;">XML技术课程小组-<xsl:value-of select="XMLspy/@no" />-<xsl:value-of select="XMLspy/@theme" />&#160;&#160;18-19-3学期</p>

                <table width="60%" align="center" style="margin:0 auto; table-layout:fixed;">
                    <tbody>
                        <xsl:apply-templates />
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="person">
        <xsl:variable name="gender">
            <xsl:choose>
                <xsl:when test="@gender='male'">
                        男
                    </xsl:when>
                <xsl:when test="@gender='female'">
                        女
                    </xsl:when>
                <xsl:otherwise>
                        不明
                    </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="sno">
            <xsl:value-of select="@sno" />
        </xsl:variable>
        <tr>
            <td align="center">
                <img src="../images/{$sno}.jpg" style="width: 200px; height: 200px; display: flex; border-radius: 50%; align-items: center; justify-content: center; overflow: hidden; margin: 10px 10px;" alt="" />
            </td>
            <td>
                <xsl:value-of select="name" />，<xsl:value-of select="$gender" />，<xsl:value-of select="@age" />岁，<xsl:value-of select="identity" />，学号<xsl:value-of select="@sno" />.
                <br />
                <br />
                地址：<xsl:value-of select="address" />&#160;&#160;&#160;&#160;
                邮编：<xsl:value-of select="address/@postcode" />
                <br />
                联系方式：<xsl:value-of select="contact/mobile" />
                <br />
                电子邮箱：<xsl:value-of select="contact/email" />
                <br />
                <br />
                <b>“<xsl:value-of select="motto"/>”</b>
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>