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
            <body>
                <img src="../images/Logo.png" style="display:block; margin:20px auto;" />
                <p style="text-align: center; font-size: 15pt;">XML技术课程小组</p>
                <table width="40%" align="center" style="margin: 30px auto;">
                    <thead>
                        <tr>
                            <th>小组名称</th>
                            <th>小组编号</th>
                            <th>小组主题</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td style="text-align:center" height="50">
                                <xsl:value-of select="XMLspy/@name" />
                            </td>
                            <td style="text-align:center" height="50">
                                <xsl:value-of select="XMLspy/@no" />
                            </td>
                            <td style="text-align:center" height="50">
                                <xsl:value-of select="XMLspy/@theme" />
                            </td>
                        </tr>
                    </tbody>
                </table>
                <!-- <h3 style="text-align: center;">小组名称</h3>
                <h4 style="text-align: center;">
                    <xsl:value-of select="XMLspy/@name" />
                </h4>
                <h3 style="text-align: center;">小组编号</h3>
                <h4 style="text-align: center;">
                    <xsl:value-of select="XMLspy/@no" />
                </h4>
                <h3 style="text-align: center;">小组主题</h3>
                <h4 style="text-align: center;">
                    <xsl:value-of select="XMLspy/@theme" />
                </h4>
                <h3 style="text-align: center;">小组成员</h3> -->
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>