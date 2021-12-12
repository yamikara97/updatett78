<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:foo="http://sinvoice.com.vn"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:inv="http://laphoadon.gdt.gov.vn/2014/09/invoicexml/v1" exclude-result-prefixes="fo" version="1.1">
  <!--<xsl:stylesheet xmlns:foo="http://sinvoice.com.vn"  version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:inv="http://laphoadon.gdt.gov.vn/2014/09/invoicexml/v1"
    exclude-result-prefixes="fo">-->
  <!--Tuannh8_start_style-->
    <xsl:template name="tokenizeString">
        <xsl:param name="list1"/>
        <xsl:param name="list2"/>
        <xsl:param name="delimiter"/>
        <xsl:param name="header" />
        <xsl:param name="middle" />
        <xsl:param name="index" select="0"/>
        <xsl:choose>
            <xsl:when test="contains($list1, $delimiter)">      
                <fo:table-row>
					<fo:table-cell  padding-left="2mm">
						<fo:block font-size="8.5pt"  text-align="left" xsl:use-attribute-sets="labelBold">
							<fo:inline xsl:use-attribute-sets="labelBold"> 
								Số tài khoản (VND): 
							</fo:inline>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block font-size="8.5pt"  text-align="left" xsl:use-attribute-sets="labelBold">
							<fo:inline xsl:use-attribute-sets="labelBold"> 
								<xsl:if test="$header != 'null' and $header != ''">
									<xsl:value-of select="$header"/><xsl:if test="$index &gt; 0"><xsl:value-of select="$index"/>: </xsl:if>
								</xsl:if>
								<xsl:value-of select="substring-before($list1,$delimiter)"/>
								<xsl:if test="$middle != 'null' and $middle != ''">
									<xsl:value-of select="$middle"/>
								</xsl:if>
								<xsl:if test="$list2 != 'null' and $list2 != ''">
									<xsl:value-of select="substring-before($list2,$delimiter)"/>
								</xsl:if>
							</fo:inline>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
				<xsl:choose>
					<xsl:when test="$index &gt; 0">   
						<xsl:call-template name="tokenizeString">
							<xsl:with-param name="list1" select="substring-after($list1,$delimiter)"/>
							<xsl:with-param name="list2" select="substring-after($list2,$delimiter)"/>
							<xsl:with-param name="delimiter" select="$delimiter"/>
							<xsl:with-param name="header" select="$header"/>
							<xsl:with-param name="middle" select="$middle"/>
							<xsl:with-param name="index" select="$index + 1"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="tokenizeString">
							<xsl:with-param name="list1" select="substring-after($list1,$delimiter)"/>
							<xsl:with-param name="list2" select="substring-after($list2,$delimiter)"/>
							<xsl:with-param name="delimiter" select="$delimiter"/>
							<xsl:with-param name="header" select="$header"/>
							<xsl:with-param name="middle" select="$middle"/>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="$list1 = ''">
                        <xsl:text/>
                    </xsl:when>
                    <xsl:otherwise>
                        <fo:table-row>
							<fo:table-cell  padding-left="2mm">
						<fo:block font-size="8.5pt"  text-align="left" xsl:use-attribute-sets="labelBold">
							<fo:inline xsl:use-attribute-sets="labelBold"> 
								Acc. Number (USD): 
							</fo:inline>
						</fo:block>
					</fo:table-cell>
							<fo:table-cell >
								<fo:block font-size="8.5pt" text-align="left" xsl:use-attribute-sets="labelBold">
									<fo:wrapper font-size="8.5pt" xsl:use-attribute-sets="labelBold">
										<fo:inline xsl:use-attribute-sets="labelBold">
											<xsl:if test="$header != 'null' and $header != ''">
												<xsl:value-of select="$header"/><xsl:if test="$index &gt; 0"><xsl:value-of select="$index"/>: </xsl:if>
											</xsl:if>
											<xsl:value-of select="$list1"/>
											<xsl:if test="$middle != 'null' and $middle != ''">
												<xsl:value-of select="$middle"/>
											</xsl:if>
											<xsl:if test="$list2 != 'null' and $list2 != ''">
												<xsl:value-of select="$list2"/>
											</xsl:if>
										</fo:inline>
									</fo:wrapper>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
  <xsl:function name="foo:custom-num-format">
    <xsl:param name="num"/>
    <xsl:param name="formats"/>
    <xsl:param name="locale"/>
    <xsl:choose>
      <xsl:when test="string-length($num) = 0">
      </xsl:when>
      <xsl:when test="floor($num) = $num">
        <xsl:value-of select="format-number($num, '###.##0', 'european')"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="format-number($num, '###.##0,#########', 'european')"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:function>
  <xsl:function name="foo:custom-num-format">
    <xsl:param name="num"/>
    <xsl:param name="formats"/>
    <xsl:choose>
      <xsl:when test="string-length($num) = 0">
      </xsl:when>
      <xsl:when test="floor($num) = $num">
        <xsl:value-of select="format-number($num, '###.##0', 'european')"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="format-number($num, '###.##0,#########', 'european')"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:function>
  <xsl:function name="foo:custom-num-format">
    <xsl:param name="num"/>
    <xsl:choose>
      <xsl:when test="string-length($num) = 0">
      </xsl:when>
      <xsl:when test="floor($num) = $num">
        <xsl:value-of select="format-number($num, '###.##0', 'european')"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="format-number($num, '###.##0,#########', 'european')"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:function>
  <xsl:attribute-set name="header">
    <xsl:attribute name="vertical-align">top</xsl:attribute>
    <xsl:attribute name="text-align">center</xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="invoiceName">
    <!--<xsl:attribute name="color">#4C3F57</xsl:attribute>-->
    <xsl:attribute name="color">#000000</xsl:attribute>
    <xsl:attribute name="font-size">12pt</xsl:attribute>
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <xsl:attribute name="text-align">center</xsl:attribute>
    <xsl:attribute name="margin-top">3mm</xsl:attribute>
    <!--<xsl:attribute name="space-after">1mm</xsl:attribute>-->
  </xsl:attribute-set>
  <xsl:attribute-set name="invoiceNameItalic">
    <!--<xsl:attribute name="color">#4C3F57</xsl:attribute>-->
    <xsl:attribute name="color">#000000</xsl:attribute>
    <xsl:attribute name="font-style">italic</xsl:attribute>
    <xsl:attribute name="text-align">center</xsl:attribute>
    <!--<xsl:attribute name="margin-top">1mm</xsl:attribute>-->
    <xsl:attribute name="margin-left">1mm</xsl:attribute>
    <xsl:attribute name="margin-right">1mm</xsl:attribute>
    <xsl:attribute name="margin-bottom">2mm</xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="titleInvoice">
    <!--<xsl:attribute name="color">#4C3F57</xsl:attribute>-->
    <xsl:attribute name="color">#000000</xsl:attribute>
    <xsl:attribute name="font-size">8pt</xsl:attribute>
    <!--<xsl:attribute name="font-weight">bold</xsl:attribute>-->
    <xsl:attribute name="font-style">italic</xsl:attribute>
    <xsl:attribute name="text-align">center</xsl:attribute>
    <xsl:attribute name="space-after">3mm</xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="itemNormal">
    <!--<xsl:attribute name="color">#4C3F57</xsl:attribute>-->
    <xsl:attribute name="color">#000000</xsl:attribute>
    <xsl:attribute name="font-weight">normal</xsl:attribute>
    <xsl:attribute name="margin-top">1mm</xsl:attribute>
    <xsl:attribute name="margin-left">1mm</xsl:attribute>
    <xsl:attribute name="margin-right">1mm</xsl:attribute>
    <xsl:attribute name="margin-bottom">1mm</xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="itemBold">
    <!--<xsl:attribute name="color">#4C3F57</xsl:attribute>-->
    <xsl:attribute name="color">#000000</xsl:attribute>
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <xsl:attribute name="margin-top">1mm</xsl:attribute>
    <xsl:attribute name="margin-left">1mm</xsl:attribute>
    <xsl:attribute name="margin-right">1mm</xsl:attribute>
    <xsl:attribute name="margin-bottom">1mm</xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="labelNormal">
    <!--<xsl:attribute name="color">#4C3F57</xsl:attribute>-->
    <xsl:attribute name="color">#000000</xsl:attribute>
    <xsl:attribute name="margin-top">1mm</xsl:attribute>
    <xsl:attribute name="margin-left">1mm</xsl:attribute>
    <xsl:attribute name="margin-right">1mm</xsl:attribute>
    <xsl:attribute name="margin-bottom">1mm</xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="labelItalic">
    <!--<xsl:attribute name="color">#4C3F57</xsl:attribute>-->
    <xsl:attribute name="color">#000000</xsl:attribute>
    <xsl:attribute name="font-style">italic</xsl:attribute>
    <xsl:attribute name="margin-top">1mm</xsl:attribute>
    <xsl:attribute name="margin-left">1mm</xsl:attribute>
    <xsl:attribute name="margin-right">1mm</xsl:attribute>
    <xsl:attribute name="margin-bottom">1mm</xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="labelBold">
    <!--<xsl:attribute name="color">#4C3F57</xsl:attribute>-->
    <xsl:attribute name="color">#000000</xsl:attribute>
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <xsl:attribute name="margin-top">1mm</xsl:attribute>
    <xsl:attribute name="margin-left">1mm</xsl:attribute>
    <xsl:attribute name="margin-right">1mm</xsl:attribute>
    <xsl:attribute name="margin-bottom">1mm</xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="boxLarge">
    <xsl:attribute name="border">2pt solid</xsl:attribute>
    <xsl:attribute name="border-color">#000000</xsl:attribute>
    <!--<xsl:attribute name="border">3pt solid</xsl:attribute>
        <xsl:attribute name="border-color">#4C3F57</xsl:attribute>-->
  </xsl:attribute-set>
  <xsl:attribute-set name="boxSmall">
    <xsl:attribute name="border">0.5pt solid</xsl:attribute>
    <xsl:attribute name="border-color">#000000</xsl:attribute>
    <!--<xsl:attribute name="border-color">#4C3F57</xsl:attribute>-->
  </xsl:attribute-set>
 <xsl:attribute-set name="boxSmallItem">
    <xsl:attribute name="border-top">0.7pt solid</xsl:attribute>
    <xsl:attribute name="border-bottom">0.7pt solid</xsl:attribute>
    <xsl:attribute name="border-color">#C0C0C0</xsl:attribute>
    <xsl:attribute name="border-collapse">collapse</xsl:attribute>
    <!--<xsl:attribute name="border-color">#4C3F57</xsl:attribute>-->
  </xsl:attribute-set>
  <xsl:attribute-set name="dataInfoInvoice">
    <!--font-size="7pt" space-after="4mm" text-align="left" margin-top="0mm" border="0.5pt solid" border-color="#4C3F57"-->
    <xsl:attribute name="font-size">7pt</xsl:attribute>
    <xsl:attribute name="space-after">4mm</xsl:attribute>
    <xsl:attribute name="text-align">left</xsl:attribute>
    <xsl:attribute name="margin-top">0mm</xsl:attribute>
    <!--        <xsl:attribute name="border">0.5pt solid</xsl:attribute>
        <xsl:attribute name="border-color">#4C3F57</xsl:attribute>-->
  </xsl:attribute-set>
  <xsl:attribute-set name="signature">
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <xsl:attribute name="color">#FF0000</xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="boxSignature">
    <xsl:attribute name="border-bottom">0.5pt solid</xsl:attribute>
    <xsl:attribute name="border-right">0.5pt solid</xsl:attribute>
    <xsl:attribute name="border-color">#006699</xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="boxPdf147">
    <xsl:attribute name="border-bottom">0.5pt solid</xsl:attribute>
    <xsl:attribute name="border-left">0.5pt solid</xsl:attribute>
    <xsl:attribute name="border-color">#006699</xsl:attribute>
  </xsl:attribute-set>



  <xsl:attribute-set name="borderBottom">
    <!--<xsl:attribute name="border-color">#4C3F57</xsl:attribute>-->
    <xsl:attribute name="border-color">#000000</xsl:attribute>
    <xsl:attribute name="border-top">1pt solid</xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="borderBottomHeader">
    <xsl:attribute name="border-top">3pt solid</xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="boxLargeBefore">
    <xsl:attribute name="border-right">2pt solid</xsl:attribute>
    <xsl:attribute name="border-left">2pt solid</xsl:attribute>
    <xsl:attribute name="border-top">2pt solid</xsl:attribute>
    <xsl:attribute name="border-color">#000000</xsl:attribute>
    <!--<xsl:attribute name="border">3pt solid</xsl:attribute>
        <xsl:attribute name="border-color">#4C3F57</xsl:attribute>-->
  </xsl:attribute-set>
  <xsl:attribute-set name="boxLargeBody">
    <xsl:attribute name="border-right">2pt solid</xsl:attribute>
    <xsl:attribute name="border-left">2pt solid</xsl:attribute>
    <xsl:attribute name="border-bottom">2pt solid</xsl:attribute>
    <xsl:attribute name="border-color">#000000</xsl:attribute>
    <!--<xsl:attribute name="border">3pt solid</xsl:attribute>
        <xsl:attribute name="border-color">#4C3F57</xsl:attribute>-->
  </xsl:attribute-set>
  <xsl:attribute-set name="labelFooter">
    <xsl:attribute name="color">#00919F</xsl:attribute>
    <xsl:attribute name="margin-top">1mm</xsl:attribute>
    <xsl:attribute name="margin-left">1mm</xsl:attribute>
    <xsl:attribute name="margin-right">1mm</xsl:attribute>
    <xsl:attribute name="margin-bottom">1mm</xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="headerNote">
    <xsl:attribute name="color">#000000</xsl:attribute>
    <xsl:attribute name="font-style">normal</xsl:attribute>
    <xsl:attribute name="text-align">center</xsl:attribute>
    <xsl:attribute name="margin-top">1mm</xsl:attribute>
    <xsl:attribute name="margin-left">1mm</xsl:attribute>
    <xsl:attribute name="margin-right">1mm</xsl:attribute>
    <!--<xsl:attribute name="margin-bottom">1mm</xsl:attribute>-->
  </xsl:attribute-set>
  <xsl:attribute-set name="headerNoteItalic">
    <xsl:attribute name="color">#000000</xsl:attribute>
    <xsl:attribute name="font-style">italic</xsl:attribute>
    <xsl:attribute name="text-align">center</xsl:attribute>
    <!--<xsl:attribute name="margin-top">1mm</xsl:attribute>-->
    <xsl:attribute name="margin-left">1mm</xsl:attribute>
    <xsl:attribute name="margin-right">1mm</xsl:attribute>
    <xsl:attribute name="margin-bottom">2mm</xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="labelBoldHeader">
    <!--<xsl:attribute name="color">#4C3F57</xsl:attribute>-->
    <xsl:attribute name="color">#000000</xsl:attribute>
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <xsl:attribute name="margin-top">0.2mm</xsl:attribute>
    <xsl:attribute name="margin-left">0.2mm</xsl:attribute>
    <xsl:attribute name="margin-right">0.2mm</xsl:attribute>
    <xsl:attribute name="margin-bottom">0.2mm</xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="labelNormalHeader">
    <!--<xsl:attribute name="color">#4C3F57</xsl:attribute>-->
    <xsl:attribute name="color">#000000</xsl:attribute>
    <xsl:attribute name="margin-top">0.2mm</xsl:attribute>
    <xsl:attribute name="margin-left">0.2mm</xsl:attribute>
    <xsl:attribute name="margin-right">0.2mm</xsl:attribute>
    <xsl:attribute name="margin-bottom">0.2mm</xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="labelItalicHeader">
    <!--<xsl:attribute name="color">#4C3F57</xsl:attribute>-->
    <xsl:attribute name="color">#000000</xsl:attribute>
    <xsl:attribute name="font-style">italic</xsl:attribute>
    <xsl:attribute name="margin-top">0.2mm</xsl:attribute>
    <xsl:attribute name="margin-left">0.2mm</xsl:attribute>
    <xsl:attribute name="margin-right">0.2mm</xsl:attribute>
    <xsl:attribute name="margin-bottom">0.2mm</xsl:attribute>
  </xsl:attribute-set>
  <!--<xsl:import href="stylefo.xsl"/>-->
  <!--Tuannh8_End_style-->
  <xsl:output indent="yes" method="xml" omit-xml-declaration="no" version="1.0"/>
  <!--<xsl:decimal-format name="decimalFormat" decimal-separator='.' grouping-separator=","/>-->
  <xsl:decimal-format decimal-separator="." grouping-separator="," name="decimalFormat"/>
  <xsl:decimal-format decimal-separator="." grouping-separator="," name="us"/>
  <xsl:decimal-format decimal-separator="," grouping-separator="." name="european"/>
  <xsl:decimal-format NaN="Not a Number" decimal-separator="." digit="#" grouping-separator="," infinity="INFINITY" minus-sign="-" name="example" pattern-separator=";" per-mille="m" percent="%" zero-digit="0"/>
  <xsl:template name="tokenize">
    <xsl:param name="pText"/>
    <xsl:if test="string-length($pText)">
      <xsl:choose>
        <xsl:when test="contains($pText,',')">
          <xsl:variable name="text">
            <xsl:value-of select="substring-before($pText, ',')"/>
          </xsl:variable>
          <xsl:choose>
            <xsl:when test="substring($text,1,3) = 'CN='">
              <xsl:value-of select="substring-after($text, 'CN=')"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:call-template name="tokenize">
                <xsl:with-param name="pText" select=
       "substring-after($pText, ',')"/>
              </xsl:call-template>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <xsl:otherwise>
          <xsl:if test="substring($pText,1,3) = 'CN='">
            <xsl:value-of select="substring-after($pText, 'CN=')"/>
          </xsl:if>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:if>
  </xsl:template>
  <!--<xsl:decimal-format name="decimalFormat" grouping-separator=","/>-->
  <!--<xsl:template match="/HDon">-->
  <xsl:template name="loop">
    <xsl:param name="var"></xsl:param>
    <xsl:choose>
      <xsl:when test="$var &lt; 7 and $var &gt; 0">
        <fo:table-row keep-together.within-page="always" border-collapse="collapse">
          <fo:table-cell display-align="center" border-right="0.7pt solid #C0C0C0">
            <fo:block text-align="center" xsl:use-attribute-sets="itemNormal">
              <fo:leader />
            </fo:block>
          </fo:table-cell>
          <fo:table-cell  display-align="center" border-right="0.7pt solid #C0C0C0">
            <fo:block/>
          </fo:table-cell>
          <fo:table-cell  display-align="center" border-right="0.7pt solid #C0C0C0">
            <fo:block/>
          </fo:table-cell>
          <fo:table-cell  display-align="center" border-right="0.7pt solid #C0C0C0">
            <fo:block/>
          </fo:table-cell>
          <fo:table-cell  display-align="center" border-right="0.7pt solid #C0C0C0">
            <fo:block/>
          </fo:table-cell>
          <fo:table-cell  display-align="center" border-right="0.7pt solid #C0C0C0">
            <fo:block/>
          </fo:table-cell>
		  <fo:table-cell  display-align="center" border-right="0.7pt solid #C0C0C0">
            <fo:block/>
          </fo:table-cell>
		  <fo:table-cell  display-align="center" border-right="0.7pt solid #C0C0C0">
            <fo:block/>
          </fo:table-cell>
		  <fo:table-cell  display-align="center">
            <fo:block/>
          </fo:table-cell>
        </fo:table-row>
        <xsl:call-template name="loop">
          <xsl:with-param name="var">
            <xsl:number value="number($var)+1" />
          </xsl:with-param>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template match="/HDon" name="invoiceTemplate">
    <fo:root font-family="Times New Roman">
      <fo:layout-master-set>

        <fo:simple-page-master master-name="singlePage" margin-bottom="0.5cm" margin-left="0.5cm"
											   margin-right="0.5cm" margin-top="0.5cm" page-height="28.7cm" page-width="20cm">
          <fo:region-body   margin-bottom="30mm" border-right="" border-left="" border-top="" />
          <fo:region-after region-name="footer-first-one" extent="30mm" display-align="after" border-right="" border-left="" border-bottom=""/>
        </fo:simple-page-master>
        <fo:simple-page-master master-name="firstPage" margin-bottom="0.5cm" margin-left="0.5cm"
											   margin-right="0.5cm" margin-top="0.5cm" page-height="28.7cm" page-width="20cm">
          <fo:region-body   margin-bottom="30mm" border-right="" border-left="" border-top="" />
          <fo:region-after region-name="footer-first" extent="30mm" display-align="after" border-right="" border-left="" border-bottom=""/>
        </fo:simple-page-master>
        <fo:simple-page-master master-name="middlePage" margin-bottom="0.5cm" margin-left="0.5cm"
											   margin-right="0.5cm" margin-top="0.5cm" page-height="28.7cm" page-width="20cm">
          <fo:region-body   margin-bottom="30mm" border-right="" border-left=""  border-top="" />
          <fo:region-after region-name="footer-rest" extent="30mm" display-align="after" border-right="" border-left="" border-bottom=""/>
        </fo:simple-page-master>
        <fo:simple-page-master master-name="lastPage" margin-bottom="0.5cm" margin-left="0.5cm"
											   margin-right="0.5cm" margin-top="0.5cm" page-height="28.7cm" page-width="20cm">
          <fo:region-body   margin-bottom="30mm" border-right="" border-left=""  border-top="" />
          <fo:region-after region-name="footer-last" extent="30mm" display-align="after" border-right="" border-left="" border-bottom=""/>
        </fo:simple-page-master>

        <fo:page-sequence-master margin-bottom="0.5cm" margin-left="0.5cm" margin-right="0.5cm" margin-top="0.5cm" master-name="document" page-height="28.7cm" page-width="20cm">

          <fo:repeatable-page-master-alternatives>

            <fo:conditional-page-master-reference page-position="only" master-reference="singlePage"/>
            <fo:conditional-page-master-reference page-position="first" master-reference="firstPage"/>
            <fo:conditional-page-master-reference page-position="rest" master-reference="middlePage"/>
            <fo:conditional-page-master-reference page-position="last" master-reference="lastPage"/>

          </fo:repeatable-page-master-alternatives>
        </fo:page-sequence-master>

      </fo:layout-master-set>
      <fo:page-sequence master-reference="document">
        <fo:static-content flow-name="footer-first-one">
          <fo:block font-size="7pt">
            <fo:table  width="100%" table-layout="fixed">
              <fo:table-column column-width="79%"/>
              <fo:table-column column-width="21%"/>
              <fo:table-body>
			   <fo:table-row>
                  <fo:table-cell padding-bottom="1mm">
                    <fo:block text-align="left">
						  <fo:table  width="100%" table-layout="fixed">
							<fo:table-column column-width="100%"/>
							<fo:table-body>
								 <fo:table-row>  
                                    <fo:table-cell>
                                      <fo:block font-size="9pt" text-align="left">
											<fo:table table-layout="fixed" width="100%">
												<fo:table-column column-width="21%"/>
												<fo:table-column column-width="79%"/>
												<fo:table-body font-size="8.5pt">
													<xsl:choose>
														<xsl:when test="contains(DLHDon/NDHDon/NBan/STKNHang, ';')">
															<xsl:call-template name="tokenizeString">
																<xsl:with-param name="list1" select="DLHDon/NDHDon/NBan/STKNHang"/>
																<xsl:with-param name="list2" select="DLHDon/NDHDon/NBan/TNHang"/>
																<xsl:with-param name="delimiter" select="';'"/>
																<xsl:with-param name="header" select="''"/>
																<xsl:with-param name="middle" select="', '"/>
																<xsl:with-param name="index" select="1"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise/>
													</xsl:choose>
												</fo:table-body>
											</fo:table>
                                      </fo:block>
                                    </fo:table-cell>
                                  </fo:table-row>
							</fo:table-body>
						  </fo:table>
                    </fo:block>
                  </fo:table-cell>
				  <fo:table-cell padding-bottom="1mm">
					 <fo:block text-align="left">
						  <fo:table  width="100%" table-layout="fixed">
							<fo:table-column column-width="100%"/>
							<fo:table-body>
								 <fo:table-row>  
                                    <fo:table-cell>
                                      <fo:block font-size="8pt" text-align="right" xsl:use-attribute-sets="labelBold">
										<fo:inline font-size="8pt" xsl:use-attribute-sets="labelBold">
											<xsl:value-of select="DLHDon/NDHDon/NBan/DCTDTu"/>
										</fo:inline>
									  </fo:block>
									</fo:table-cell>
								 </fo:table-row>
								  <fo:table-row>  
                                    <fo:table-cell>
                                      <fo:block font-size="8pt" text-align="right" xsl:use-attribute-sets="labelBold">
										<fo:inline font-size="8pt" xsl:use-attribute-sets="labelBold">
											<xsl:value-of select="DLHDon/NDHDon/NBan/Website"/>
										</fo:inline>
									  </fo:block>
									</fo:table-cell>
								 </fo:table-row>
							</fo:table-body>
						  </fo:table>
					 </fo:block>
				  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell  number-columns-spanned="2" padding-top="1mm">
                    <fo:block text-align="center">
                      <fo:inline font-size="6pt" xsl:use-attribute-sets="labelItalicHeader">(Cần kiểm tra, đối chiếu khi lập, giao, nhận hóa đơn)</fo:inline>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="borderBottom">
                    <fo:block text-align="center">
                      <fo:inline font-size="6pt" xsl:use-attribute-sets="labelItalicHeader">Đơn vị cung cấp dịch vụ Hóa đơn điện tử: Tập đoàn Công nghiệp - Viễn thông Quân đội (Viettel), MST: 0100109106 </fo:inline>
                    </fo:block>
                    <fo:block text-align="center">
                      <fo:wrapper font-size="6pt" xsl:use-attribute-sets="labelItalicHeader">Tra cứu hóa đơn điện tử tại Website: <xsl:choose>
                      <xsl:when test="not(DLHDon/NDHDon/NBan/TTKhac/TTin[TTruong='Link tra cứu người bán']/DLieu) = false() and DLHDon/NDHDon/NBan/TTKhac/TTin[TTruong='Link tra cứu người bán']/DLieu != ''">
                        <xsl:value-of select="DLHDon/NDHDon/NBan/TTKhac/TTin[TTruong='Link tra cứu người bán']/DLieu"/>
                      </xsl:when>
                      <xsl:otherwise>
                        https://sinvoice.viettel.vn/tracuuhoadon
                      </xsl:otherwise>
                    </xsl:choose>. Mã số bí mật: </fo:wrapper>
                      <fo:wrapper font-size="6pt" xsl:use-attribute-sets="labelNormalHeader">
                        <xsl:value-of select="DLHDon/TTChung/TTKhac/TTin[TTruong='Mã số bí mật']/DLieu"/>
                      </fo:wrapper>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </fo:table-body>
            </fo:table>
          </fo:block>
        </fo:static-content>
        <fo:static-content flow-name="footer-first">
          <fo:block font-size="6pt" text-align="right">
            <fo:block>
              <fo:table  table-layout="fixed" width="100%">
              <fo:table-column column-width="79%"/>
              <fo:table-column column-width="21%"/>
              <fo:table-body>
			   <fo:table-row>
                  <fo:table-cell padding-bottom="1mm">
                    <fo:block text-align="left">
						  <fo:table  width="100%" table-layout="fixed">
							<fo:table-column column-width="100%"/>
							<fo:table-body>
								 <fo:table-row>  
                                    <fo:table-cell>
                                      <fo:block font-size="9pt" text-align="left">
											<fo:table table-layout="fixed" width="100%">
												<fo:table-column column-width="21%"/>
												<fo:table-column column-width="79%"/>
												<fo:table-body font-size="8.5pt">
													<xsl:choose>
														<xsl:when test="contains(DLHDon/NDHDon/NBan/STKNHang, ';')">
															<xsl:call-template name="tokenizeString">
																<xsl:with-param name="list1" select="DLHDon/NDHDon/NBan/STKNHang"/>
																<xsl:with-param name="list2" select="DLHDon/NDHDon/NBan/TNHang"/>
																<xsl:with-param name="delimiter" select="';'"/>
																<xsl:with-param name="header" select="''"/>
																<xsl:with-param name="middle" select="', '"/>
																<xsl:with-param name="index" select="1"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise/>
													</xsl:choose>
												</fo:table-body>
											</fo:table>
                                      </fo:block>
                                    </fo:table-cell>
                                  </fo:table-row>
							</fo:table-body>
						  </fo:table>
                    </fo:block>
                  </fo:table-cell>
				  <fo:table-cell padding-bottom="1mm">
					 <fo:block text-align="left">
						  <fo:table  width="100%" table-layout="fixed">
							<fo:table-column column-width="100%"/>
							<fo:table-body>
								 <fo:table-row>  
                                    <fo:table-cell>
                                      <fo:block font-size="8pt" text-align="right" xsl:use-attribute-sets="labelBold">
										<fo:inline font-size="8pt" xsl:use-attribute-sets="labelBold">
											<xsl:value-of select="DLHDon/NDHDon/NBan/DCTDTu"/>
										</fo:inline>
									  </fo:block>
									</fo:table-cell>
								 </fo:table-row>
								  <fo:table-row>  
                                    <fo:table-cell>
                                      <fo:block font-size="8pt" text-align="right" xsl:use-attribute-sets="labelBold">
										<fo:inline font-size="8pt" xsl:use-attribute-sets="labelBold">
											<xsl:value-of select="DLHDon/NDHDon/NBan/Website"/>
										</fo:inline>
									  </fo:block>
									</fo:table-cell>
								 </fo:table-row>
							</fo:table-body>
						  </fo:table>
					 </fo:block>
				  </fo:table-cell>
                </fo:table-row>
					<fo:table-row>
                    <fo:table-cell  number-columns-spanned="2" padding-top="1mm">
                      <fo:block text-align="center">
                        <fo:inline font-size="6pt" xsl:use-attribute-sets="labelItalicHeader">(Cần kiểm tra, đối chiếu khi lập, giao, nhận hóa đơn)</fo:inline>
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                    <fo:table-cell number-columns-spanned="2">
                      <fo:block text-align="center">
                        <fo:inline font-size="6pt" xsl:use-attribute-sets="labelItalicHeader">Đơn vị cung cấp dịch vụ Hóa đơn điện tử: Tập đoàn Công nghiệp - Viễn thông Quân đội (Viettel), MST: 0100109106 </fo:inline>
                      </fo:block>
                      <fo:block text-align="center">
                        <fo:wrapper font-size="6pt" xsl:use-attribute-sets="labelItalicHeader">Tra cứu hóa đơn điện tử tại Website: <xsl:choose>
                      <xsl:when test="not(DLHDon/NDHDon/NBan/TTKhac/TTin[TTruong='Link tra cứu người bán']/DLieu) = false() and DLHDon/NDHDon/NBan/TTKhac/TTin[TTruong='Link tra cứu người bán']/DLieu != ''">
                        <xsl:value-of select="DLHDon/NDHDon/NBan/TTKhac/TTin[TTruong='Link tra cứu người bán']/DLieu"/>
                      </xsl:when>
                      <xsl:otherwise>
                        https://sinvoice.viettel.vn/tracuuhoadon
                      </xsl:otherwise>
                    </xsl:choose>. Mã số bí mật: </fo:wrapper>
                        <fo:wrapper font-size="6pt" xsl:use-attribute-sets="labelNormalHeader">
                          <xsl:value-of select="DLHDon/TTChung/TTKhac/TTin[TTruong='Mã số bí mật']/DLieu"/>
                        </fo:wrapper>
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                </fo:table-body>
              </fo:table>
            </fo:block>
            <fo:wrapper xsl:use-attribute-sets="labelFooter">
              Trang <fo:page-number/> / <fo:page-number-citation ref-id="end-of-document"/>
            </fo:wrapper>
          </fo:block>
        </fo:static-content>
        <fo:static-content flow-name="footer-rest">
          <fo:block font-size="6pt" text-align="right">
            <fo:block>
              <fo:table  table-layout="fixed" width="100%">
              <fo:table-column column-width="79%"/>
              <fo:table-column column-width="21%"/>
              <fo:table-body>
			   <fo:table-row>
                  <fo:table-cell padding-bottom="1mm">
                    <fo:block text-align="left">
						  <fo:table  width="100%" table-layout="fixed">
							<fo:table-column column-width="100%"/>
							<fo:table-body>
								 <fo:table-row>  
                                    <fo:table-cell>
                                      <fo:block font-size="9pt" text-align="left">
											<fo:table table-layout="fixed" width="100%">
												<fo:table-column column-width="21%"/>
												<fo:table-column column-width="79%"/>
												<fo:table-body font-size="8.5pt">
													<xsl:choose>
														<xsl:when test="contains(DLHDon/NDHDon/NBan/STKNHang, ';')">
															<xsl:call-template name="tokenizeString">
																<xsl:with-param name="list1" select="DLHDon/NDHDon/NBan/STKNHang"/>
																<xsl:with-param name="list2" select="DLHDon/NDHDon/NBan/TNHang"/>
																<xsl:with-param name="delimiter" select="';'"/>
																<xsl:with-param name="header" select="''"/>
																<xsl:with-param name="middle" select="', '"/>
																<xsl:with-param name="index" select="1"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise/>
													</xsl:choose>
												</fo:table-body>
											</fo:table>
                                      </fo:block>
                                    </fo:table-cell>
                                  </fo:table-row>
							</fo:table-body>
						  </fo:table>
                    </fo:block>
                  </fo:table-cell>
				  <fo:table-cell padding-bottom="1mm">
					 <fo:block text-align="left">
						  <fo:table  width="100%" table-layout="fixed">
							<fo:table-column column-width="100%"/>
							<fo:table-body>
								 <fo:table-row>  
                                    <fo:table-cell>
                                      <fo:block font-size="8pt" text-align="right" xsl:use-attribute-sets="labelBold">
										<fo:inline font-size="8pt" xsl:use-attribute-sets="labelBold">
											<xsl:value-of select="DLHDon/NDHDon/NBan/DCTDTu"/>
										</fo:inline>
									  </fo:block>
									</fo:table-cell>
								 </fo:table-row>
								  <fo:table-row>  
                                    <fo:table-cell>
                                      <fo:block font-size="8pt" text-align="right" xsl:use-attribute-sets="labelBold">
										<fo:inline font-size="8pt" xsl:use-attribute-sets="labelBold">
											<xsl:value-of select="DLHDon/NDHDon/NBan/Website"/>
										</fo:inline>
									  </fo:block>
									</fo:table-cell>
								 </fo:table-row>
							</fo:table-body>
						  </fo:table>
					 </fo:block>
				  </fo:table-cell>
                </fo:table-row>
                  <fo:table-row>
                    <fo:table-cell  number-columns-spanned="2" padding-top="1mm">
                      <fo:block text-align="center">
                        <fo:inline font-size="6pt" xsl:use-attribute-sets="labelItalicHeader">(Cần kiểm tra, đối chiếu khi lập, giao, nhận hóa đơn)</fo:inline>
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                    <fo:table-cell number-columns-spanned="2">
                      <fo:block text-align="center">
                        <fo:inline font-size="6pt" xsl:use-attribute-sets="labelItalicHeader">Đơn vị cung cấp dịch vụ Hóa đơn điện tử: Tập đoàn Công nghiệp - Viễn thông Quân đội (Viettel), MST: 0100109106 </fo:inline>
                      </fo:block>
                      <fo:block text-align="center">
                        <fo:wrapper font-size="6pt" xsl:use-attribute-sets="labelItalicHeader">Tra cứu hóa đơn điện tử tại Website: <xsl:choose>
                      <xsl:when test="not(DLHDon/NDHDon/NBan/TTKhac/TTin[TTruong='Link tra cứu người bán']/DLieu) = false() and DLHDon/NDHDon/NBan/TTKhac/TTin[TTruong='Link tra cứu người bán']/DLieu != ''">
                        <xsl:value-of select="DLHDon/NDHDon/NBan/TTKhac/TTin[TTruong='Link tra cứu người bán']/DLieu"/>
                      </xsl:when>
                      <xsl:otherwise>
                        https://sinvoice.viettel.vn/tracuuhoadon
                      </xsl:otherwise>
                    </xsl:choose>. Mã số bí mật: </fo:wrapper>
                        <fo:wrapper font-size="6pt" xsl:use-attribute-sets="labelNormalHeader">
                          <xsl:value-of select="DLHDon/TTChung/TTKhac/TTin[TTruong='Mã số bí mật']/DLieu"/>
                        </fo:wrapper>
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                </fo:table-body>
              </fo:table>
            </fo:block>
            <fo:wrapper xsl:use-attribute-sets="labelFooter">
              tiep theo trang truoc - Trang <fo:page-number/> / <fo:page-number-citation ref-id="end-of-document"/>
            </fo:wrapper>
          </fo:block>
        </fo:static-content>
        <fo:static-content flow-name="footer-last">
          <fo:block font-size="6pt" text-align="right">
            <fo:block>
              <fo:table  table-layout="fixed" width="100%">
              <fo:table-column column-width="79%"/>
              <fo:table-column column-width="21%"/>
              <fo:table-body>
			   <fo:table-row>
                  <fo:table-cell padding-bottom="1mm">
                    <fo:block text-align="left">
						  <fo:table  width="100%" table-layout="fixed">
							<fo:table-column column-width="100%"/>
							<fo:table-body>
								 <fo:table-row>  
                                    <fo:table-cell>
                                      <fo:block font-size="9pt" text-align="left">
											<fo:table table-layout="fixed" width="100%">
												<fo:table-column column-width="21%"/>
												<fo:table-column column-width="79%"/>
												<fo:table-body font-size="8.5pt">
													<xsl:choose>
														<xsl:when test="contains(DLHDon/NDHDon/NBan/STKNHang, ';')">
															<xsl:call-template name="tokenizeString">
																<xsl:with-param name="list1" select="DLHDon/NDHDon/NBan/STKNHang"/>
																<xsl:with-param name="list2" select="DLHDon/NDHDon/NBan/TNHang"/>
																<xsl:with-param name="delimiter" select="';'"/>
																<xsl:with-param name="header" select="''"/>
																<xsl:with-param name="middle" select="', '"/>
																<xsl:with-param name="index" select="1"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise/>
													</xsl:choose>
												</fo:table-body>
											</fo:table>
                                      </fo:block>
                                    </fo:table-cell>
                                  </fo:table-row>
							</fo:table-body>
						  </fo:table>
                    </fo:block>
                  </fo:table-cell>
				  <fo:table-cell padding-bottom="1mm">
					 <fo:block text-align="left">
						  <fo:table  width="100%" table-layout="fixed">
							<fo:table-column column-width="100%"/>
							<fo:table-body>
								 <fo:table-row>  
                                    <fo:table-cell>
                                      <fo:block font-size="8pt" text-align="right" xsl:use-attribute-sets="labelBold">
										<fo:inline font-size="8pt" xsl:use-attribute-sets="labelBold">
											<xsl:value-of select="DLHDon/NDHDon/NBan/DCTDTu"/>
										</fo:inline>
									  </fo:block>
									</fo:table-cell>
								 </fo:table-row>
								  <fo:table-row>  
                                    <fo:table-cell>
                                      <fo:block font-size="8pt" text-align="right" xsl:use-attribute-sets="labelBold">
										<fo:inline font-size="8pt" xsl:use-attribute-sets="labelBold">
											<xsl:value-of select="DLHDon/NDHDon/NBan/Website"/>
										</fo:inline>
									  </fo:block>
									</fo:table-cell>
								 </fo:table-row>
							</fo:table-body>
						  </fo:table>
					 </fo:block>
				  </fo:table-cell>
                </fo:table-row>
                  <fo:table-row>
                    <fo:table-cell  number-columns-spanned="2" padding-top="1mm">
                      <fo:block text-align="center">
                        <fo:inline font-size="6pt" xsl:use-attribute-sets="labelItalicHeader">(Cần kiểm tra, đối chiếu khi lập, giao, nhận hóa đơn)</fo:inline>
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                    <fo:table-cell number-columns-spanned="2">
                      <fo:block text-align="center">
                        <fo:inline font-size="6pt" xsl:use-attribute-sets="labelItalicHeader">Đơn vị cung cấp dịch vụ Hóa đơn điện tử: Tập đoàn Công nghiệp - Viễn thông Quân đội (Viettel), MST: 0100109106 </fo:inline>
                      </fo:block>
                      <fo:block text-align="center">
                        <fo:wrapper font-size="6pt" xsl:use-attribute-sets="labelItalicHeader">Tra cứu hóa đơn điện tử tại Website: <xsl:choose>
                      <xsl:when test="not(DLHDon/NDHDon/NBan/TTKhac/TTin[TTruong='Link tra cứu người bán']/DLieu) = false() and DLHDon/NDHDon/NBan/TTKhac/TTin[TTruong='Link tra cứu người bán']/DLieu != ''">
                        <xsl:value-of select="DLHDon/NDHDon/NBan/TTKhac/TTin[TTruong='Link tra cứu người bán']/DLieu"/>
                      </xsl:when>
                      <xsl:otherwise>
                        https://sinvoice.viettel.vn/tracuuhoadon
                      </xsl:otherwise>
                    </xsl:choose>. Mã số bí mật: </fo:wrapper>
                        <fo:wrapper font-size="6pt" xsl:use-attribute-sets="labelNormalHeader">
                          <xsl:value-of select="DLHDon/TTChung/TTKhac/TTin[TTruong='Mã số bí mật']/DLieu"/>
                        </fo:wrapper>
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                </fo:table-body>
              </fo:table>
            </fo:block>
            <fo:wrapper xsl:use-attribute-sets="labelFooter">
              tiep theo trang truoc - Trang <fo:page-number/> / <fo:page-number-citation ref-id="end-of-document"/>
            </fo:wrapper>
          </fo:block>
        </fo:static-content>
        <fo:flow flow-name="xsl-region-body">
          <fo:table table-layout="fixed" text-align="center" width="100%">
            <!--border="1pt solid black" 2pt solid #4C3F57"-->
            <!--START_NOTHING-->
            <fo:table-column column-width="28%"/>
            <fo:table-column column-width="46%"/>
            <fo:table-column column-width="26%"/>
            <fo:table-header>
              <fo:table-row>
                <fo:table-cell>
                  <fo:block-container absolute-position="fixed" text-align="center" display-align="before" top="78mm" left="0mm" right="0mm">
                    <fo:block>
                      <fo:external-graphic content-height="scale-to-fit" content-width="scale-to-fit" height="21cm" max-width="100%"  scaling="uniform"  src="url('watermark.png')"/>
                    </fo:block>
                  </fo:block-container>
                  <fo:block-container  absolute-position="fixed" text-align="center" display-align="before" top="95mm" left="10mm" right="10mm">
                    <fo:block>
                      <fo:external-graphic content-height="scale-to-fit" content-width="scale-to-fit" max-height="12cm" max-width="100%"  scaling="uniform"  src="url('example.png')"/>
                    </fo:block>
                  </fo:block-container>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row border-collapse="collapse" width="100%">
                <fo:table-cell  display-align="center"  padding-top="3px" text-align="left">
                  <fo:block margin-left="3px">
                    <fo:external-graphic content-height="scale-to-fit" height="2cm"  content-width="scale-to-fit" max-width="100%"  scaling="uniform" src="url('logo.png')">
                    </fo:external-graphic>
                  </fo:block>
                </fo:table-cell>
				<fo:table-cell text-align="left" number-columns-spanned="2">
                  <fo:block margin-left="20px">
					<fo:block font-size="12pt" text-align="left" xsl:use-attribute-sets="labelNormal">
									<fo:inline xsl:use-attribute-sets="labelBold" color="#1bb6c9">
                                        <xsl:value-of select="DLHDon/NDHDon/NBan/Ten"/>
                                    </fo:inline>
                    </fo:block>
					<fo:block font-size="11pt" text-align="left" xsl:use-attribute-sets="labelNormal">
									<fo:inline xsl:use-attribute-sets="labelBold" color="#1bb6c9">
                                        Viindoo Technology JSC
                                    </fo:inline>
                                </fo:block>
								<fo:block font-size="10pt" text-align="left" xsl:use-attribute-sets="labelNormal">
									<fo:inline xsl:use-attribute-sets="labelNormal" color="#1bb6c9">
                                        Mã số thuế
                                    </fo:inline>
									<fo:inline xsl:use-attribute-sets="labelItalic" color="#1bb6c9"> 
                                         (TIN):
                                    </fo:inline>
									<fo:inline xsl:use-attribute-sets="labelNormal" color="#1bb6c9">
                                        <xsl:value-of select="DLHDon/NDHDon/NBan/MST"/>
                                    </fo:inline>
                                </fo:block>
								<fo:block font-size="10pt" text-align="left" xsl:use-attribute-sets="labelNormal">
									<fo:inline xsl:use-attribute-sets="labelNormal" color="#1bb6c9">
                                        Điện thoại
                                    </fo:inline>
									<fo:inline xsl:use-attribute-sets="labelItalic" color="#1bb6c9"> 
                                         (Phone):
                                    </fo:inline>
									<fo:inline xsl:use-attribute-sets="labelNormal" color="#1bb6c9">
                                        <xsl:value-of select="DLHDon/NDHDon/NBan/SDThoai"/>
                                    </fo:inline>
                                </fo:block>
								<fo:block font-size="10pt" text-align="left" xsl:use-attribute-sets="labelNormal">
									<fo:inline xsl:use-attribute-sets="labelNormal" color="#1bb6c9">
                                        Địa chỉ
                                    </fo:inline>
									<fo:inline xsl:use-attribute-sets="labelItalic" color="#1bb6c9"> 
                                         (Add.):
                                    </fo:inline>
									<fo:inline xsl:use-attribute-sets="labelNormal" color="#1bb6c9">
                                        <xsl:value-of select="DLHDon/NDHDon/NBan/DChi"/>
                                    </fo:inline>
                                </fo:block>
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row border-collapse="collapse" width="100%">
                <fo:table-cell  display-align="center"  padding-top="4mm" xsl:use-attribute-sets="borderBottomHeader" border-color="#1bb6c9">
                  <fo:block/>
                </fo:table-cell>
                <fo:table-cell border-collapse="collapse" xsl:use-attribute-sets="header borderBottomHeader"  padding-top="4mm" border-color="#7e4284">
                  <fo:block>
                    <fo:block font-size="14pt" xsl:use-attribute-sets="labelBold" color="#7e4284">HÓA ĐƠN</fo:block>
                  </fo:block>
				   <fo:block>
                    <fo:block font-size="14pt" xsl:use-attribute-sets="labelBold" color="#7e4284">GIÁ TRỊ GIA TĂNG</fo:block>
                  </fo:block>
				  <fo:block font-size="13pt">
                    <fo:block xsl:use-attribute-sets="labelItalic" color="#7e4284">(VAT INVOICE)</fo:block>
                  </fo:block>
				  
                  <fo:block font-size="8pt" padding-top="1.5mm">
                    <fo:block font-weight="bold"> Hóa đơn chuyển đổi từ hóa đơn điện tử</fo:block>
					<fo:block xsl:use-attribute-sets="labelItalic">(Invoice converted from electronic invoice)</fo:block>
                  </fo:block>
				 
                  <fo:block font-size="8pt" xsl:use-attribute-sets="labelNormal"  padding-top="1mm">
                    <xsl:choose>
                      <xsl:when test="invoiceData/invoiceSignedDate!='null'">
                        <fo:wrapper xsl:use-attribute-sets="labelBold">Ngày </fo:wrapper>
                        <fo:wrapper xsl:use-attribute-sets="labelItalic">(date) </fo:wrapper>
                        <xsl:value-of select="substring(invoiceData/invoiceSignedDate, 9, 2)"/>
                        <xsl:text> </xsl:text>
                        <fo:wrapper xsl:use-attribute-sets="labelBold">tháng </fo:wrapper>
                        <fo:wrapper xsl:use-attribute-sets="labelItalic">(month) </fo:wrapper>
                        <xsl:value-of select="substring(invoiceData/invoiceSignedDate, 6, 2)"/>
                        <xsl:text> </xsl:text>
                        <fo:wrapper xsl:use-attribute-sets="labelBold">năm </fo:wrapper>
                        <fo:wrapper xsl:use-attribute-sets="labelItalic">(year) </fo:wrapper>
                        <xsl:value-of select="substring(invoiceData/invoiceSignedDate, 1, 4)"/>
                        <xsl:text> </xsl:text>
                                                                        <!-- <xsl:value-of select="concat(substring(invoiceData/invoiceSignedDate, 9, 2),'/',substring(invoiceData/invoiceSignedDate, 6, 2),'/',substring(invoiceData/invoiceSignedDate, 1, 4))"/> -->
                      </xsl:when>
                      <xsl:otherwise>
                        <fo:wrapper xsl:use-attribute-sets="labelBold">Ngày  ......</fo:wrapper>
                        <fo:wrapper xsl:use-attribute-sets="labelItalic">(date) ......</fo:wrapper>
                        <fo:wrapper xsl:use-attribute-sets="labelBold">tháng  ......</fo:wrapper>
                        <fo:wrapper xsl:use-attribute-sets="labelItalic">(month) ......</fo:wrapper>
                        <fo:wrapper xsl:use-attribute-sets="labelBold">năm  ......</fo:wrapper>
                        <fo:wrapper xsl:use-attribute-sets="labelItalic">(year) ......</fo:wrapper>
                        <!-- Ngày ......... Tháng ......... Năm ......... -->
                      </xsl:otherwise>
                    </xsl:choose>
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell border-collapse="collapse"  padding-top="10mm" xsl:use-attribute-sets="borderBottomHeader" border-color="#7e4284">
                  <fo:block xsl:use-attribute-sets="dataInfoInvoice" font-size="9pt">
                    <!--border="1pt solid black"-->
                    <fo:table table-layout="fixed" width="100%">
                      <fo:table-column column-width="100%"/>
                      <fo:table-body>
                        <fo:table-row >
                          <fo:table-cell>
                            <fo:block xsl:use-attribute-sets="labelNormal">
                              <fo:wrapper xsl:use-attribute-sets="labelBold">
                                Mẫu số <fo:wrapper xsl:use-attribute-sets="labelItalic" font-weight="normal">(Form)</fo:wrapper>: <fo:wrapper xsl:use-attribute-sets="labelBold">
                                  <xsl:value-of select="DLHDon/TTChung/KHMSHDon"/>
                                </fo:wrapper>
                              </fo:wrapper>
                              <!--<fo:wrapper xsl:use-attribute-sets="labelItalic">(Form): </fo:wrapper>-->
                            </fo:block>
                          </fo:table-cell>
                        </fo:table-row>
                        <fo:table-row>
                          <fo:table-cell>
                            <fo:block xsl:use-attribute-sets="labelNormal">
                              <fo:wrapper xsl:use-attribute-sets="labelBold">
                                Ký hiệu <fo:wrapper xsl:use-attribute-sets="labelItalic" font-weight="normal">(Serial)</fo:wrapper>: <fo:wrapper xsl:use-attribute-sets="labelBold">
                                  <xsl:value-of select="DLHDon/TTChung/KHHDon"/>
                                </fo:wrapper>
                              </fo:wrapper>
                              <!--<fo:wrapper xsl:use-attribute-sets="labelItalic">(Serial): </fo:wrapper>-->
                            </fo:block>
                          </fo:table-cell>
                        </fo:table-row> 
                        <fo:table-row>
                          <fo:table-cell>
                            <fo:block xsl:use-attribute-sets="labelNormal">
                              <fo:wrapper xsl:use-attribute-sets="labelBold">
                                Số <fo:wrapper xsl:use-attribute-sets="labelItalic" font-weight="normal">(No.)</fo:wrapper>: <fo:wrapper xsl:use-attribute-sets="labelBold" font-size="10pt">
                                  <xsl:value-of select="DLHDon/TTChung/SHDon"/>
                                </fo:wrapper>
                              </fo:wrapper>
                              <!--<fo:wrapper xsl:use-attribute-sets="labelItalic">(No.): </fo:wrapper>-->
                            </fo:block>
                          </fo:table-cell>
                        </fo:table-row>
                      </fo:table-body>
                    </fo:table>
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="3">
                  <fo:block>
                    <fo:table border-collapse="collapse" table-layout="fixed" width="100%">
                      <fo:table-column column-width="50%"/>
                      <fo:table-column column-width="50%"/>
                      <fo:table-header>
                        <fo:table-row>
                          <fo:table-cell>
                            <fo:block/>
                          </fo:table-cell>
                        </fo:table-row>
                      </fo:table-header>
                      <fo:table-body>
                        <fo:table-row>
                          <fo:table-cell number-columns-spanned="2">
                             <fo:block font-size="9pt" text-align="left" xsl:use-attribute-sets="labelNormal" >
                                <fo:wrapper xsl:use-attribute-sets="labelBold">Họ tên người mua hàng </fo:wrapper>
                                <fo:wrapper  xsl:use-attribute-sets="labelItalic">(Buyer): </fo:wrapper>
                                <fo:inline xsl:use-attribute-sets="itemNormal">
                                   <xsl:value-of select="DLHDon/NDHDon/NMua/HVTNMHang"/>
                                </fo:inline>
                            </fo:block>
                          </fo:table-cell>
                        </fo:table-row>
						<fo:table-row>
                          <fo:table-cell number-columns-spanned="2">
                             <fo:block font-size="9pt" text-align="left" xsl:use-attribute-sets="labelNormal" >
                                <fo:wrapper xsl:use-attribute-sets="labelBold">Tên đơn vị </fo:wrapper>
                                <fo:wrapper  xsl:use-attribute-sets="labelItalic">(Company): </fo:wrapper>
                                <fo:inline xsl:use-attribute-sets="itemNormal">
                                   <xsl:value-of select="DLHDon/NDHDon/NMua/Ten"/>
                                </fo:inline>
                            </fo:block>
                          </fo:table-cell>
                        </fo:table-row>
						<fo:table-row>
                          <fo:table-cell number-columns-spanned="2">
                             <fo:block font-size="9pt" text-align="left" xsl:use-attribute-sets="labelNormal" >
                                <fo:wrapper xsl:use-attribute-sets="labelBold">Mã số thuế </fo:wrapper>
                                <fo:wrapper  xsl:use-attribute-sets="labelItalic">(TIN): </fo:wrapper>
                                <fo:inline xsl:use-attribute-sets="itemNormal">
                                   <xsl:value-of select="DLHDon/NDHDon/NMua/MST"/>
                                </fo:inline>
                            </fo:block>
                          </fo:table-cell>
                        </fo:table-row>
						<fo:table-row>
                          <fo:table-cell number-columns-spanned="2">
                             <fo:block font-size="9pt" text-align="left" xsl:use-attribute-sets="labelNormal" >
                                <fo:wrapper xsl:use-attribute-sets="labelBold">Địa chỉ </fo:wrapper>
                                <fo:wrapper  xsl:use-attribute-sets="labelItalic">(Address): </fo:wrapper>
                                <fo:inline xsl:use-attribute-sets="itemNormal">
                                   <xsl:value-of select="DLHDon/NDHDon/NMua/DChi"/>
                                </fo:inline>
                            </fo:block>
                          </fo:table-cell>
                        </fo:table-row>
						<fo:table-row>
                          <fo:table-cell>
                             <fo:block font-size="9pt" text-align="left" xsl:use-attribute-sets="labelNormal">
                                <fo:wrapper xsl:use-attribute-sets="labelBold">Hình thức thanh toán </fo:wrapper>
                                <fo:wrapper  xsl:use-attribute-sets="labelItalic">(Payment method): </fo:wrapper>
                                <fo:inline xsl:use-attribute-sets="itemNormal">
                                   <xsl:value-of select="DLHDon/TTChung/HTTToan"/>
                                </fo:inline>
                            </fo:block>
                          </fo:table-cell>
						  <fo:table-cell>
                             <fo:block font-size="9pt" text-align="left" xsl:use-attribute-sets="labelNormal">
                                <fo:wrapper xsl:use-attribute-sets="labelBold">Số tài khoản </fo:wrapper>
                                <fo:wrapper  xsl:use-attribute-sets="labelItalic">(Acc Number): </fo:wrapper>
                                <fo:inline xsl:use-attribute-sets="itemNormal">
                                   <xsl:value-of select="DLHDon/NDHDon/NMua/STKNHang"/>
                                </fo:inline>
                            </fo:block>
                          </fo:table-cell>
                        </fo:table-row>
                      </fo:table-body>
                    </fo:table>
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
            </fo:table-header>
            <fo:table-footer>
              <fo:table-row>
                <fo:table-cell>
                  <fo:block/>
                </fo:table-cell>
              </fo:table-row>
            </fo:table-footer>
            <!--END_NOTHING-->
            <fo:table-body>
				<fo:table-row>
					<fo:table-cell number-columns-spanned="3" text-align="right">
						<fo:block font-size="9pt"  margin-top="2mm">
							<fo:inline xsl:use-attribute-sets="labelBold">
								Tiền tệ 
							</fo:inline>
							<fo:inline xsl:use-attribute-sets="labelItalic">
								(Currency):
							</fo:inline>
							<fo:inline xsl:use-attribute-sets="itemBold">
                                   <xsl:value-of select="DLHDon/TTChung/DVTTe"/>
                            </fo:inline>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			<fo:table-row>
                <fo:table-cell number-columns-spanned="3">
                  <fo:block font-size="9pt">
                    <fo:table border-collapse="collapse" table-layout="fixed" width="100%">
                      <fo:table-column column-width="5%"/>
                      <fo:table-column column-width="32%"/>
                      <fo:table-column column-width="8%"/>
                      <fo:table-column column-width="7%"/>
                      <fo:table-column column-width="10%"/>
                      <fo:table-column column-width="11%"/>
                      <fo:table-column column-width="6%"/>
                      <fo:table-column column-width="10%"/>
                      <fo:table-column column-width="11%"/>
                      <fo:table-header width="100%">
                        <fo:table-row border-collapse="collapse">
                          <fo:table-cell xsl:use-attribute-sets="boxSmallItem" border-bottom="none" border-right="0.7pt solid">
                            <fo:block text-align="center">
                              <fo:block xsl:use-attribute-sets="labelBold" color="#7e4284">STT </fo:block>
                            </fo:block>
                          </fo:table-cell>
                          <fo:table-cell xsl:use-attribute-sets="boxSmallItem" border-bottom="none" border-right="0.7pt solid"> 
                            <fo:block text-align="center">
                              <fo:block xsl:use-attribute-sets="labelBold" color="#7e4284">Tên hàng hóa, dịch vụ </fo:block>
                            </fo:block>
                          </fo:table-cell>
                          <fo:table-cell xsl:use-attribute-sets="boxSmallItem" border-bottom="none" border-right="0.7pt solid">
                            <fo:block text-align="center">
                              <fo:block xsl:use-attribute-sets="labelBold" color="#7e4284">Đơn vị tính </fo:block>
                            </fo:block>
                          </fo:table-cell>
                          <fo:table-cell xsl:use-attribute-sets="boxSmallItem" border-bottom="none" border-right="0.7pt solid">
                            <fo:block text-align="center">
                              <fo:block xsl:use-attribute-sets="labelBold" color="#7e4284">Số lượng </fo:block>
                            </fo:block>
                          </fo:table-cell>
                          <fo:table-cell xsl:use-attribute-sets="boxSmallItem" border-bottom="none" border-right="0.7pt solid">
                            <fo:block text-align="center">
                              <fo:block xsl:use-attribute-sets="labelBold" color="#7e4284">Đơn giá </fo:block>
                            </fo:block>
                          </fo:table-cell>
                          <fo:table-cell xsl:use-attribute-sets="boxSmallItem" border-bottom="none">
                            <fo:block text-align="center">
                              <fo:block xsl:use-attribute-sets="labelBold" color="#7e4284">Thành tiền </fo:block>
                            </fo:block>
                          </fo:table-cell>
						  <fo:table-cell xsl:use-attribute-sets="boxSmallItem" number-columns-spanned="2" border-left="0.7pt solid" border-right="0.7pt solid">
                            <fo:block text-align="center">
                              <fo:block xsl:use-attribute-sets="labelBold" color="#7e4284">Thuế VAT</fo:block>
                            </fo:block>
                          </fo:table-cell>
						  <fo:table-cell xsl:use-attribute-sets="boxSmallItem" border-bottom="none">
                            <fo:block text-align="center">
                              <fo:block xsl:use-attribute-sets="labelBold" color="#7e4284">Thành tiền sau thuế</fo:block>
                            </fo:block>
                          </fo:table-cell>
                        </fo:table-row>
						<fo:table-row border-collapse="collapse">
                          <fo:table-cell xsl:use-attribute-sets="boxSmallItem" border-top="none" border-right="0.7pt solid">
                            <fo:block text-align="center">
                              <fo:block xsl:use-attribute-sets="labelItalic" color="#7e4284">(No.) </fo:block>
                            </fo:block>
                          </fo:table-cell>
                          <fo:table-cell xsl:use-attribute-sets="boxSmallItem" border-top="none" border-right="0.7pt solid">
                            <fo:block text-align="center">
                              <fo:block xsl:use-attribute-sets="labelItalic" color="#7e4284">(Description) </fo:block>
                            </fo:block>
                          </fo:table-cell>
                          <fo:table-cell xsl:use-attribute-sets="boxSmallItem" border-top="none" border-right="0.7pt solid">
                            <fo:block text-align="center">
                              <fo:block xsl:use-attribute-sets="labelItalic" color="#7e4284">(UoM) </fo:block>
                            </fo:block>
                          </fo:table-cell>
                          <fo:table-cell xsl:use-attribute-sets="boxSmallItem" border-top="none" border-right="0.7pt solid">
                            <fo:block text-align="center">
                              <fo:block xsl:use-attribute-sets="labelItalic" color="#7e4284">(Quantity) </fo:block>
                            </fo:block>
                          </fo:table-cell>
                          <fo:table-cell xsl:use-attribute-sets="boxSmallItem" border-top="none" border-right="0.7pt solid">
                            <fo:block text-align="center">
                              <fo:block xsl:use-attribute-sets="labelItalic" color="#7e4284">(Unit price) </fo:block>
                            </fo:block>
                          </fo:table-cell>
                          <fo:table-cell xsl:use-attribute-sets="boxSmallItem" border-top="none">
                            <fo:block text-align="center">
                              <fo:block xsl:use-attribute-sets="labelItalic" color="#7e4284">(Amount) </fo:block>
                            </fo:block>
                          </fo:table-cell>
						  <fo:table-cell xsl:use-attribute-sets="boxSmallItem" border-top="none" border-left="0.7pt solid" border-right="0.7pt solid">
                            <fo:block text-align="center">
                              <fo:block xsl:use-attribute-sets="labelItalic" color="#7e4284">% </fo:block>
                            </fo:block>
                          </fo:table-cell>
						  <fo:table-cell xsl:use-attribute-sets="boxSmallItem" border-top="none" border-right="0.7pt solid">
                            <fo:block text-align="center">
                              <fo:block xsl:use-attribute-sets="labelItalic" color="#7e4284">Amount </fo:block>
                            </fo:block>
                          </fo:table-cell>
						  <fo:table-cell xsl:use-attribute-sets="boxSmallItem" border-top="none">
                            <fo:block text-align="center">
                              <fo:block xsl:use-attribute-sets="labelItalic" color="#7e4284">(Total) </fo:block>
                            </fo:block>
                          </fo:table-cell>
                        </fo:table-row>
                      </fo:table-header>
                      <fo:table-footer>
                        <fo:table-row>
                          <fo:table-cell>
                            <fo:block/>
                          </fo:table-cell>
                        </fo:table-row>
                      </fo:table-footer>
                      <fo:table-body>
                        <xsl:for-each select="DLHDon/NDHDon/DSHHDVu/HHDVu">
                          <fo:table-row keep-together.within-page="always" border-collapse="collapse">
                            <fo:table-cell display-align="center" border-right="0.7pt solid #C0C0C0">
                              <fo:block text-align="center" xsl:use-attribute-sets="itemNormal">
                                <xsl:choose>
                                  <xsl:when test="STT &gt; 0">
                                    <xsl:value-of select="STT"/>
                                  </xsl:when>
                                  <xsl:otherwise>
                                    <fo:leader />
                                  </xsl:otherwise>
                                </xsl:choose>
                              </fo:block>
                            </fo:table-cell>
                            <fo:table-cell display-align="center" border-right="0.7pt solid #C0C0C0">
                              <fo:block text-align="left" xsl:use-attribute-sets="itemNormal" display-align="center">
                                <xsl:value-of select="THHDVu"/>
                              </fo:block>
                            </fo:table-cell>
                            <fo:table-cell  display-align="center" border-right="0.7pt solid #C0C0C0">
                              <fo:block text-align="center" xsl:use-attribute-sets="itemNormal" display-align="center">
                                <xsl:value-of select="DVTinh"/>
                              </fo:block>
                            </fo:table-cell>
                            <fo:table-cell  display-align="center" border-right="0.7pt solid #C0C0C0">
                              <fo:block text-align="right" xsl:use-attribute-sets="itemNormal" display-align="center">
                                <xsl:if test="SLuong != 'null' and SLuong &gt;= 0">
                                  <xsl:value-of select="foo:custom-num-format(SLuong, '###.##0', 'european')"/>
                                </xsl:if>
                              </fo:block>
                            </fo:table-cell>
                            <fo:table-cell  display-align="center" border-right="0.7pt solid #C0C0C0">
                              <fo:block text-align="right" xsl:use-attribute-sets="itemNormal" display-align="center">
                                <xsl:if test="DGia != 'null' and DGia &gt;= 0">
                                  <xsl:value-of select="foo:custom-num-format(DGia, '###.##0', 'european')"/>
                                </xsl:if>
                              </fo:block>
                            </fo:table-cell>
                            <fo:table-cell display-align="center" border-right="0.7pt solid #C0C0C0">
                              <fo:block text-align="right" xsl:use-attribute-sets="itemNormal" display-align="center">
                                <xsl:if test="ThTien != 'null' and ThTien &gt;= 0">
                                  <xsl:value-of select="foo:custom-num-format(ThTien, '###.##0', 'european')"/>
                                </xsl:if>
                              </fo:block>
                            </fo:table-cell>
							<fo:table-cell display-align="center" border-right="0.7pt solid #C0C0C0">
                              <fo:block text-align="right" xsl:use-attribute-sets="itemNormal">
                                <xsl:choose>
                                  <xsl:when test="not(TSuat) = false() and TSuat >= 0">
                                  <xsl:value-of select="foo:custom-num-format(TSuat, '###.###', 'european')"/>%
                                  </xsl:when>
                                  <xsl:when test="not(TSuat) = false() and TSuat  &lt;  0" >
                                    \
                                  </xsl:when>
                                  <xsl:otherwise>
                                  </xsl:otherwise>
                                </xsl:choose>
                              </fo:block>
                            </fo:table-cell>
							<fo:table-cell display-align="center" border-right="0.7pt solid #C0C0C0">
                              <fo:block text-align="right" xsl:use-attribute-sets="itemNormal">
                                <xsl:choose>
                                  <xsl:when test="not(TSuat) = false() and TSuat >= 0 and not(//DLHDon/NDHDon/DSHHDVu/HHDVu/TTKhac/TTin[TTruong='Tienthue']/Dlieu) = false() and //DLHDon/NDHDon/DSHHDVu/HHDVu/TTKhac/TTin[TTruong='Tienthue']/Dlieu &gt;= 0">
                                    <xsl:value-of select="foo:custom-num-format(//DLHDon/NDHDon/DSHHDVu/HHDVu/TTKhac/TTin[TTruong='Tienthue']/Dlieu, '###.###', 'european')"/>
                                  </xsl:when>
                                  <xsl:when test="not(TSuat) = false() and TSuat  &lt;  0" >
                                    \
                                  </xsl:when>
                                  <xsl:otherwise>
                                  </xsl:otherwise>
                                </xsl:choose>
                              </fo:block>
                            </fo:table-cell>
							<fo:table-cell display-align="center">
                              <fo:block text-align="right" xsl:use-attribute-sets="itemNormal">
                                <xsl:if test="//DLHDon/NDHDon/DSHHDVu/HHDVu/TTKhac/TTin[TTruong='Tongtiencothue']/DLieu != 'null' and //DLHDon/NDHDon/DSHHDVu/HHDVu/TTKhac/TTin[TTruong='Tongtiencothue']/DLieu &gt;= 0">
                                  <xsl:value-of select="foo:custom-num-format(//DLHDon/NDHDon/DSHHDVu/HHDVu/TTKhac/TTin[TTruong='Tongtiencothue']/DLieu, '###.###','european')"/>
                                </xsl:if>
                              </fo:block>
                            </fo:table-cell>
                          </fo:table-row>
                        </xsl:for-each>
                        <xsl:call-template name="loop">
                          <xsl:with-param name="var">
                            <xsl:value-of select="count(//DLHDon/NDHDon/DSHHDVu/HHDVu)"/>
                          </xsl:with-param>
                        </xsl:call-template>
                        <fo:table-row>
                          <fo:table-cell number-columns-spanned="8" xsl:use-attribute-sets="boxSmallItem">
                            <fo:block text-align="left" xsl:use-attribute-sets="itemNormal">
                              <fo:wrapper xsl:use-attribute-sets="labelBold" color="#1bb6c9">Tổng giá trị thanh toán </fo:wrapper>
                              <fo:wrapper xsl:use-attribute-sets="labelItalic" color="#1bb6c9">(Total Amount): </fo:wrapper>
                            </fo:block>
                          </fo:table-cell>
                          <fo:table-cell xsl:use-attribute-sets="boxSmallItem">
                             <fo:block text-align="right" xsl:use-attribute-sets="itemBold">
                              <xsl:if test="DLHDon/NDHDon/TToan /TgTTTBSo != 'null' and DLHDon/NDHDon/TToan /TgTTTBSo &gt;= 0">
                                <xsl:value-of select="foo:custom-num-format(DLHDon/NDHDon/TToan /TgTTTBSo, '###.###', 'european')"/>
                              </xsl:if>
                            </fo:block>
                          </fo:table-cell>
                        </fo:table-row>
						<fo:table-row>
                           <fo:table-cell number-columns-spanned="9" xsl:use-attribute-sets="boxSmallItem">
                                <fo:block text-align="left" xsl:use-attribute-sets="itemNormal">
                                    <fo:wrapper xsl:use-attribute-sets="labelBold">Số tiền viết bằng chữ </fo:wrapper>
                                    <fo:wrapper xsl:use-attribute-sets="labelItalic">(Amount in words): </fo:wrapper>
                                     <fo:inline xsl:use-attribute-sets="itemNormal">
                                       <xsl:value-of select="DLHDon/NDHDon/TToan /TgTTTBChu"/>
                                     </fo:inline>
                                </fo:block>
                             </fo:table-cell>
                        </fo:table-row>
						<fo:table-row>
                          <fo:table-cell number-columns-spanned="9" >
                             <fo:block text-align="left" xsl:use-attribute-sets="itemNormal">
                              <fo:wrapper xsl:use-attribute-sets="labelNormal">Tổng tiền không chịu thuế GTGT </fo:wrapper>
                              <fo:wrapper xsl:use-attribute-sets="labelItalic">(VAT Exemption Base)</fo:wrapper> 
							  <fo:wrapper text-align="right" xsl:use-attribute-sets="labelNormal">
                                    : <xsl:for-each select="HDon/DLHDon/NDHDon/TToan/THTTLTSuat/LTSuat">
                                        <xsl:if test="TSuat = -2 and ThTien != 'null' and ThTien &gt; 0">
                                            <fo:wrapper xsl:use-attribute-sets="labelBold">
                                              <xsl:value-of select="foo:custom-num-format(ThTien, '##0.###','european')"/>
                                            </fo:wrapper>
                                        </xsl:if>
                                    </xsl:for-each>
                                </fo:wrapper>
                            </fo:block>
                          </fo:table-cell> 
                        </fo:table-row>
						<fo:table-row>
                          <fo:table-cell number-columns-spanned="9" >
                             <fo:block text-align="left" xsl:use-attribute-sets="itemNormal">
                              <fo:wrapper xsl:use-attribute-sets="labelNormal">Tổng tiền chịu thuế suất</fo:wrapper>
                              <fo:wrapper xsl:use-attribute-sets="labelItalic">(VAT Base Amount) </fo:wrapper>
							   <fo:wrapper xsl:use-attribute-sets="labelNormal">0%</fo:wrapper>
							    <fo:wrapper text-align="right" xsl:use-attribute-sets="labelNormal">
                                : <xsl:for-each select="HDon/DLHDon/NDHDon/TToan/THTTLTSuat/LTSuat">
                                    <xsl:if test="TSuat = 0 and TThue != 'null' and TThue &gt;= 0 and ThTien &gt;= 0">
                                        <fo:wrapper xsl:use-attribute-sets="labelBold">
                                            <xsl:value-of select="foo:custom-num-format(ThTien + TThue, '##0.###','european')"/>
                                        </fo:wrapper>
                                    </xsl:if>
                                </xsl:for-each>
                              </fo:wrapper>
                            </fo:block>
                          </fo:table-cell> 
                        </fo:table-row>
						<fo:table-row>
                          <fo:table-cell number-columns-spanned="5" >
                             <fo:block text-align="left" xsl:use-attribute-sets="itemNormal">
                              <fo:wrapper xsl:use-attribute-sets="labelNormal">Tổng tiền chịu thuế suất</fo:wrapper>
                              <fo:wrapper xsl:use-attribute-sets="labelItalic">(VAT Base Amount) </fo:wrapper>
							   <fo:wrapper xsl:use-attribute-sets="labelNormal">5%</fo:wrapper>
							    <fo:wrapper text-align="right" xsl:use-attribute-sets="labelNormal">
                                    : <xsl:for-each select="HDon/DLHDon/NDHDon/TToan/THTTLTSuat/LTSuat">
                                        <xsl:if test="TSuat = 5  and ThTien != 'null' and ThTien &gt; 0">
                                            <fo:wrapper xsl:use-attribute-sets="labelBold">
                                              <xsl:value-of select="foo:custom-num-format(ThTien, '##0.###','european')"/>
											</fo:wrapper>
                                        </xsl:if>
                                    </xsl:for-each>
                                </fo:wrapper>
                            </fo:block>
                          </fo:table-cell>
						   <fo:table-cell number-columns-spanned="4" >
                             <fo:block text-align="left" xsl:use-attribute-sets="itemNormal" padding-left="4mm">
                              <fo:wrapper xsl:use-attribute-sets="labelNormal">Tiền thuế GTGT</fo:wrapper>
                              <fo:wrapper xsl:use-attribute-sets="labelItalic">(VAT) </fo:wrapper>
							   <fo:wrapper xsl:use-attribute-sets="labelNormal">5% : </fo:wrapper>
							    <fo:wrapper text-align="right" xsl:use-attribute-sets="labelNormal">
                                <xsl:for-each select="HDon/DLHDon/NDHDon/TToan/THTTLTSuat/LTSuat">
                                   <xsl:if test="TSuat = 5  and TThue != 'null' and TThue &gt; 0">
                                       <fo:wrapper xsl:use-attribute-sets="labelBold">
                                          <xsl:value-of select="foo:custom-num-format(TThue, '##0.###','european')"/>
                                        </fo:wrapper>
                                    </xsl:if>
                                  </xsl:for-each>
                              </fo:wrapper>
                            </fo:block>
                          </fo:table-cell>
                        </fo:table-row>
						<fo:table-row>
                          <fo:table-cell number-columns-spanned="5" xsl:use-attribute-sets="boxSmallItem" border-top="none">
                             <fo:block text-align="left" xsl:use-attribute-sets="itemNormal">
                              <fo:wrapper xsl:use-attribute-sets="labelNormal">Tổng tiền chịu thuế suất</fo:wrapper>
                              <fo:wrapper xsl:use-attribute-sets="labelItalic">(VAT Base Amount) </fo:wrapper>
							   <fo:wrapper xsl:use-attribute-sets="labelNormal">10%</fo:wrapper>
							   <fo:wrapper text-align="right" xsl:use-attribute-sets="labelNormal">
                                    : <xsl:for-each select="HDon/DLHDon/NDHDon/TToan/THTTLTSuat/LTSuat">
                                        <xsl:if test="TSuat = 10  and ThTien != 'null' and ThTien &gt; 0">
                                            <fo:wrapper xsl:use-attribute-sets="labelBold">
                                              <xsl:value-of select="foo:custom-num-format(ThTien, '##0.###','european')"/>
											</fo:wrapper>
                                        </xsl:if>
                                    </xsl:for-each>
                                </fo:wrapper>
                            </fo:block>
                          </fo:table-cell>
						   <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="boxSmallItem" border-top="none">
                             <fo:block text-align="left" xsl:use-attribute-sets="itemNormal" padding-left="4mm">
                              <fo:wrapper xsl:use-attribute-sets="labelNormal">Tiền thuế GTGT</fo:wrapper>
                              <fo:wrapper xsl:use-attribute-sets="labelItalic">(VAT) </fo:wrapper>
							   <fo:wrapper xsl:use-attribute-sets="labelNormal">10% : </fo:wrapper>
							   <fo:wrapper text-align="right" xsl:use-attribute-sets="labelNormal">
                                <xsl:for-each select="HDon/DLHDon/NDHDon/TToan/THTTLTSuat/LTSuat">
                                   <xsl:if test="TSuat = 10  and TThue != 'null' and TThue &gt; 0">
                                       <fo:wrapper xsl:use-attribute-sets="labelBold">
                                          <xsl:value-of select="foo:custom-num-format(TThue, '##0.###','european')"/>
                                        </fo:wrapper>
                                    </xsl:if>
                                </xsl:for-each>
                              </fo:wrapper>
                            </fo:block>
                          </fo:table-cell>
                        </fo:table-row>
                        <fo:table-row keep-together.within-page="always">
                          <fo:table-cell number-columns-spanned="9">
                            <fo:block padding-top="3mm">
                              <fo:table table-layout="fixed" width="100%">
                                <fo:table-column column-width="85%"/>
                                <fo:table-column column-width="15%"/>
                                <fo:table-body> 
									<fo:table-row>
                                    <fo:table-cell number-columns-spanned="2">
                                      <fo:block margin-top="1mm" font-size="9pt">
                                        <fo:table table-layout="fixed" width="100%">
                                           <fo:table-column column-width="32%"/>
                                          <fo:table-column column-width="32%"/>
                                          <fo:table-column column-width="36%"/>
                                          <fo:table-body>
                                            <fo:table-row>
												<fo:table-cell>
                                                <fo:block text-align="center">
                                                  <fo:wrapper  xsl:use-attribute-sets="labelBold">Người chuyển đổi </fo:wrapper>
                                                  <fo:wrapper font-size="9pt"  xsl:use-attribute-sets="labelItalic">(Exchanged by)</fo:wrapper>
                                                </fo:block>
                                                <fo:block text-align="center">
                                                  <fo:inline font-size="8pt"  xsl:use-attribute-sets="labelItalic">(Ký, ghi rõ họ tên)</fo:inline>
                                                </fo:block>
                                                <fo:block text-align="center">
                                                  <fo:inline font-size="8pt"  xsl:use-attribute-sets="labelItalic">(Sign,full name)</fo:inline>
                                                </fo:block>
                                                <fo:block text-align="center">
                                                  <fo:inline font-size="9pt">    </fo:inline>
                                                </fo:block>
                                                <fo:block text-align="center">
                                                  <fo:inline font-size="9pt">    </fo:inline>
                                                </fo:block>
                                                <fo:block text-align="center">
                                                  <fo:inline font-size="9pt">    </fo:inline>
                                                </fo:block>
                                                <fo:block text-align="center">
                                                  <fo:inline font-size="9pt" xsl:use-attribute-sets="labelNormal">${exchangeUser}</fo:inline>
                                                </fo:block>
                                                <fo:block text-align="center">
                                                  <fo:wrapper font-size="9pt"  xsl:use-attribute-sets="labelBold">Ngày chuyển đổi </fo:wrapper>
                                                  <fo:wrapper font-size="9pt" xsl:use-attribute-sets="labelItalic">(Exchange date):</fo:wrapper>
                                                  <fo:block font-size="9pt" xsl:use-attribute-sets="labelNormal">${exchangeDay}/${exchangeMonth}/${exchangeYear}</fo:block>
                                                </fo:block>
                                              </fo:table-cell>
                                              <fo:table-cell>
                                                <fo:block text-align="center">
                                                  <fo:wrapper  xsl:use-attribute-sets="labelBold">Người mua hàng </fo:wrapper>
                                                  <fo:wrapper font-size="9pt" xsl:use-attribute-sets="labelItalic">(Buyer)</fo:wrapper>
												   <fo:block text-align="center">
													 <fo:wrapper font-size="8pt" xsl:use-attribute-sets="labelItalic">(Ký, ghi rõ họ tên)</fo:wrapper>
												   </fo:block>
												    <fo:block text-align="center">
													 <fo:wrapper font-size="8pt" xsl:use-attribute-sets="labelItalic">(Sign, fullname)</fo:wrapper>
												   </fo:block>
                                                  <fo:block text-align="center"  display-align="center">
                                                    <fo:block padding-top="10px" margin-top="10px">
                                                    </fo:block>
                                                    <fo:block xsl:use-attribute-sets="signature">
                                                      <xsl:if test="not((//*[local-name()='X509SubjectName'])[2]) = false() and (//*[local-name()='X509SubjectName'])[2] != ''">
                                                        <fo:block-container absolute-position="absolute" text-align="center" left="1mm" right="1mm" top="10mm">
                                                          <fo:block>
                                                            <fo:external-graphic content-height="scale-to-fit" content-width="scale-to-fit" max-height="1.6cm" max-width="100%"  scaling="uniform"  src="url('signature.png')"/>
                                                          </fo:block>
                                                        </fo:block-container>
                                                        <fo:block xsl:use-attribute-sets="signature">
                                                          Ký bởi <xsl:call-template name="tokenize">
                                                            <xsl:with-param name="pText" select="(//*[local-name()='X509SubjectName'])[2]"/>
                                                          </xsl:call-template>
                                                        </fo:block>
                                                      </xsl:if>
                                                    </fo:block>
                                                  </fo:block>
                                                </fo:block>
                                              </fo:table-cell>
                                              <fo:table-cell>
                                                <fo:block text-align="center">
                                                  <fo:wrapper font-size="9pt"  xsl:use-attribute-sets="labelBold">Người bán hàng </fo:wrapper>
                                                  <fo:wrapper font-size="9pt"  xsl:use-attribute-sets="labelItalic">(Seller)</fo:wrapper>
                                                </fo:block>
												 <fo:block text-align="center">
													 <fo:wrapper font-size="8pt" xsl:use-attribute-sets="labelItalic">(Ký, ghi rõ họ tên)</fo:wrapper>
												   </fo:block>
												    <fo:block text-align="center">
													 <fo:wrapper font-size="8pt" xsl:use-attribute-sets="labelItalic">(Sign, fullname)</fo:wrapper>
												   </fo:block>
                                                <fo:block text-align="center"  display-align="center">
                                                  <fo:block padding-top="10px" margin-top="10px">
                                                  </fo:block>
                                                  <fo:block-container absolute-position="absolute" text-align="center" left="1mm" right="1mm" top="10mm">
                                                    <fo:block>
                                                      <fo:external-graphic content-height="scale-to-fit" content-width="scale-to-fit" max-height="1.6cm" max-width="100%"  scaling="uniform"  src="url('signature.png')"/>
                                                    </fo:block>
                                                  </fo:block-container>

                                                  <fo:block xsl:use-attribute-sets="signature">
                                                    <xsl:if test="DLHDon/NDHDon/NBan/Ten != 'null'">
                                                      <fo:block xsl:use-attribute-sets="signature">
                                                        Ký bởi <xsl:call-template name="tokenize">
                                                          <xsl:with-param name="pText" select="(//*[local-name()='X509SubjectName'])[1]"/>
                                                        </xsl:call-template>
                                                      </fo:block>
                                                      <fo:block  xsl:use-attribute-sets="signature">
                                                        Ký ngày
                                                        <xsl:if test="DLHDon/TTChung/NLap != 'null' and DLHDon/TTChung/NLap != ''">
                                                          <xsl:value-of select="concat(substring(DLHDon/TTChung/NLap, 9, 2),'/',substring(DLHDon/TTChung/NLap, 6, 2),'/',substring(DLHDon/TTChung/NLap, 1, 4))"/>
                                                        </xsl:if>
                                                      </fo:block>
                                                    </xsl:if>
                                                  </fo:block>
                                                </fo:block>
                                              </fo:table-cell>
                                            </fo:table-row>
                                          </fo:table-body>
                                        </fo:table>
                                      </fo:block>
                                    </fo:table-cell>
                                  </fo:table-row>
                                </fo:table-body>
                              </fo:table>
                            </fo:block>
                          </fo:table-cell>
                        </fo:table-row>
                      </fo:table-body>
                    </fo:table>
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
            </fo:table-body>
          </fo:table>
          <fo:block id="end-of-document"></fo:block>
        </fo:flow>
      </fo:page-sequence>
    </fo:root>
  </xsl:template>
</xsl:stylesheet>
