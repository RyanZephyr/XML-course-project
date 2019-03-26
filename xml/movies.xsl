<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:template match="*|@*|processing-instruction()">
		<xsl:copy>
			<xsl:apply-templates select="*|@*|text()|processing-instruction()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="/">
		<html>
			<body style="transform: scale(1.2);background-color:#8B4513;">
				<h1 style="font-family: Georgia;text-align:center;">Douban Top 250 by XMLSpy</h1>
				<xsl:for-each select="movies/movie">
					<xsl:variable name="color">                
							  #CD851F
						</xsl:variable>
					<xsl:variable name="img">
						<xsl:value-of select="@img" />
					</xsl:variable>
					<xsl:variable name="IMDb">
						<xsl:value-of select="@IMDb" />
					</xsl:variable>
					<div style="margin:30px;background-color:{$color};">
						<a href="https://www.imdb.com/title/{$IMDb}/">
							<img src="../images/posters/{$img}" style="width:300px; height:400px;position:relative;" />
						</a>
						<div style="margin-left:330px; margin-top:-400px; height:400px;">
							<p>
								<b>NO.</b>
								<xsl:value-of select="@ranking" />
								&#160;&#160;
								<font color="FFD700">
									<xsl:value-of select="review/@rating" />
								</font>
							</p>
							<p style="font-size: 20px;">
								<b>
									<xsl:value-of select="basic/name/Chinese_name" />
									&#160;&#160;&#160;
									<xsl:value-of select="basic/name/English_name" />
									（
									<xsl:value-of select="@release_year" />
									）
								</b>
							</p>
							<xsl:choose>
								<xsl:when test="basic/directors/director='Kaige Chen'">
									<p>
										导演：
										<font color="FFD700">Kaige Chen</font>
									</p>
								</xsl:when>
								<xsl:otherwise>
									<p>
										导演：
										<xsl:for-each select="basic/directors/director">
											<xsl:value-of select="." />.&#160;
										</xsl:for-each>
									</p>
								</xsl:otherwise>
							</xsl:choose>
							<p>
								演员：
								<xsl:for-each select="basic/stars/actor">
									<xsl:value-of select="." />.&#160;
								</xsl:for-each>
							</p>
							<p>
								类型：
								<xsl:for-each select="basic/genres/genre">
									<xsl:value-of select="@category" />.&#160;
								</xsl:for-each>
							</p>
							<p>
								语言：
								<xsl:for-each select="basic/languages/language">
									<xsl:value-of select="@category" />.&#160;
								</xsl:for-each>
							</p>
							<p>
								国家：
								<xsl:value-of select="@country" />
							</p>
							<p>
								简介：
								<xsl:value-of select="introduction" />
							</p>
							<p>
								简评：
								<xsl:value-of select="review" />
							</p>
						</div>
						<xsl:if test="@country='China'">
							<img src="flag.jpg" style="width:50px; height:30px;position:relative;margin-top:-405px;margin-left:1580px;" />
						</xsl:if>
					</div>
				</xsl:for-each>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>