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
				<title>Zhou Zhiyong</title>
			</head>
			<body style="transform: scale(1.2);background-color:B2DFEE;">
				<xsl:apply-templates />
			</body>
		</html>
	</xsl:template>
	<xsl:template match="movie">
		<div>
			<xsl:variable name="ranking">
				<xsl:value-of select="@ranking" />
			</xsl:variable>
			<xsl:variable name="IMDb">
				<xsl:value-of select="@IMDb" />
			</xsl:variable>
			<a href="https://www.imdb.com/title/{$IMDb}/">
				<img src="{$ranking}.png" style="width:540px; height:803px; position:relative;" />
			</a>
			<div style="margin-left:620px; margin-top:-750px; height:400px;">
				<p>
					<b style="font-family:FZShuTi;font-size:100px;">
						<xsl:value-of select="basic/name/Chinese_name" />
					</b>
				</p>
				<p style="font-family:FZShuTi;font-size:50px;color:black;">
					导演：
					<xsl:value-of select="basic/directors/director" />
				</p>
				<p style="font-family:FZShuTi;font-size:50px;color:black;">
					演员：
					<xsl:for-each select="basic/stars/actor">
						<xsl:value-of select="." />
						<xsl:if test="position()!=last()">
										、&#160;									
									</xsl:if>
					</xsl:for-each>
				</p>
				<p style="font-family:FZShuTi;font-size:50px;color:black;">
					类型：
					<xsl:for-each select="basic/genres/genre">
						<xsl:value-of select="@category" />
						<xsl:if test="position()!=last()">
										、&#160;									
									</xsl:if>
					</xsl:for-each>
				</p>
				<p style="font-family:FZShuTi;font-size:50px;color:black;">
					语言：
					<xsl:for-each select="basic/languages/language">
						<xsl:value-of select="@category" />
						<xsl:if test="position()!=last()">
										、&#160;									
									</xsl:if>
					</xsl:for-each>
				</p>
				<p style="font-family:FZShuTi;font-size:50px;color:black;">
					国家：
					<xsl:value-of select="@country" />
				</p>
				<p style="font-family:FZShuTi;font-size:50px;color:black;">
					简评：
					<xsl:value-of select="review" />
				</p>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>