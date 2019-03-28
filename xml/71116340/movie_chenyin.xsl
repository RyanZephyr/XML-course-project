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
                <title>Chen Yin</title>
                <style type="text/css">
                    *{
                    margin: 0;
                    padding: 0;
                    overflow: hidden;
                    }
                    div{
                    width: 80%;
                    height: 70%;
                    background: rgba(255, 250, 250, 0.9);
                    border-radius:0px 16px 16px 0px;
                    }
                    .center-in-center{
                        position: absolute;
                        top: 50%;
                        left: 50%;
                        -webkit-transform: translate(-50%, -50%);
                        -moz-transform: translate(-50%, -50%);
                        -ms-transform: translate(-50%, -50%);
                        -o-transform: translate(-50%, -50%);
                        transform: translate(-50%, -50%);
                    }
                </style>
            </head>
            <body style="font-family: 'Microsoft YaHei';" background="background.jpg">
                <xsl:apply-templates />
            </body>
        </html>
    </xsl:template>
    <xsl:template match="movie">
        <div class="center-in-center">
            <xsl:variable name="ranking">
                <xsl:value-of select="@ranking" />
            </xsl:variable>
            <xsl:variable name="IMDb">
                <xsl:value-of select="@IMDb" />
            </xsl:variable>
            <!-- img -->
            <a href="https://www.imdb.com/title/{$IMDb}/">
                <img src="{$ranking}.jpg" style="width:420px; height:630px; position:relative;" />
            </a>
            <!-- text -->
            <div style="margin-left:440px; margin-top:-600px; height: auto; background: rgba(255, 250, 250, 0);">
                <b style="font-size: 20px;">
                    NO.
                    <xsl:value-of select="@ranking" />
                </b>
                &#160;&#160;
                <font style="font-size: 20px; background: #F9C461; border: 1px solid #F9C461; border-radius: 10px 10px 10px 10px;">
                    &#160;豆瓣评分：
                    <xsl:value-of select="review/@rating" />
                    &#160;
                </font>
                <p style="font-size: 27px; font-weight: bold; margin-top: 18px;">
                        <xsl:value-of select="basic/name/Chinese_name" />
                        &#160;
                        <xsl:value-of select="basic/name/English_name" />
                        (<xsl:value-of select="@release_year" />)
                </p>
                <p style="font-size: 17px; margin-top: 18px;">
                    演员：
                    <xsl:for-each select="basic/stars/actor">
                        <xsl:value-of select="." />.&#160;
                    </xsl:for-each>
                </p>
                <p style="font-size: 17px; margin-top: 2px;">
                    类型：
                    <xsl:for-each select="basic/genres/genre">
                        <xsl:value-of select="@category" />.&#160;
                    </xsl:for-each>
                </p>
                <p style="font-size: 17px; margin-top: 2px;">
                    语言：
                    <xsl:for-each select="basic/languages/language">
                        <xsl:value-of select="@category" />.&#160;
                    </xsl:for-each>
                </p>
                <p style="font-size: 17px; margin-top: 2px;">
                    国家：
                    <xsl:value-of select="@country" />
                </p>
                <p style="font-size: 17px; margin-top: 10px; width: 740pt; text-align: justify; text-justify: inter-ideograph;">
                    简介：
                    <xsl:for-each select="introduction/paragraph">
                        <br /><br />&#160;&#160;&#160;&#160;<xsl:value-of select="." />
                    </xsl:for-each>
                </p>
                <div style="color: #FFFFFF; background-color: #F9C461; font-size: 25px; font-weight: bold; margin-top: 80px; width: 100%; height: 40px; border-radius:10px 0px 0px 10px;">
                   &#160;&#160;&#160;&#160;&#160;&#160;"<xsl:value-of select="review" />"
                </div>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>