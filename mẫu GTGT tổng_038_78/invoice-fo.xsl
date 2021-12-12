<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:foo="http://sinvoice.com.vn"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:inv="http://laphoadon.gdt.gov.vn/2014/09/invoicexml/v1" exclude-result-prefixes="fo" version="2.0">
  <!--<xsl:stylesheet xmlns:foo="http://sinvoice.com.vn"  version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:inv="http://laphoadon.gdt.gov.vn/2014/09/invoicexml/v1"
    exclude-result-prefixes="fo">-->
  <!--Tuannh8_start_style-->
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
    <xsl:attribute name="font-size">16pt</xsl:attribute>
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
    <xsl:attribute name="font-size">11pt</xsl:attribute>
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
  <xsl:attribute-set name="dataInfoInvoice">
    <!--font-size="9pt" space-after="4mm" text-align="left" margin-top="0mm" border="0.5pt solid" border-color="#4C3F57"-->
    <xsl:attribute name="font-size">9pt</xsl:attribute>
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
    <xsl:attribute name="border-color">#000000</xsl:attribute>
    <xsl:attribute name="border-top">1pt solid</xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="boxLargeBefore">
    <xsl:attribute name="border-right">2pt solid</xsl:attribute>
    <xsl:attribute name="border-left">2pt solid</xsl:attribute>
    <xsl:attribute name="border-top">2pt solid</xsl:attribute>
    <xsl:attribute name="border-color">#000000</xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="boxLargeBody">
    <xsl:attribute name="border-right">2pt solid</xsl:attribute>
    <xsl:attribute name="border-left">2pt solid</xsl:attribute>
    <xsl:attribute name="border-bottom">2pt solid</xsl:attribute>
    <xsl:attribute name="border-color">#000000</xsl:attribute>
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
      <xsl:when test="$var &lt; 10 and $var &gt; 0">
        <fo:table-row keep-together.within-page="always">
          <fo:table-cell xsl:use-attribute-sets="boxSmall" display-align="center">
            <fo:block text-align="center" xsl:use-attribute-sets="itemNormal" display-align="center">
              <fo:leader />
            </fo:block>
          </fo:table-cell>
          <fo:table-cell xsl:use-attribute-sets="boxSmall" display-align="center">
            <fo:block text-align="left" xsl:use-attribute-sets="itemNormal" display-align="center">
            </fo:block>
          </fo:table-cell>
          <fo:table-cell xsl:use-attribute-sets="boxSmall" display-align="center">
            <fo:block text-align="center" xsl:use-attribute-sets="itemNormal" display-align="center">
            </fo:block>
          </fo:table-cell>
          <fo:table-cell xsl:use-attribute-sets="boxSmall" display-align="center">
            <fo:block text-align="right" xsl:use-attribute-sets="itemNormal" display-align="center">
            </fo:block>
          </fo:table-cell>
          <fo:table-cell xsl:use-attribute-sets="boxSmall" display-align="center">
            <fo:block text-align="right" xsl:use-attribute-sets="itemNormal" display-align="center">
            </fo:block>
          </fo:table-cell>
          <fo:table-cell xsl:use-attribute-sets="boxSmall" display-align="center">
            <fo:block text-align="right" xsl:use-attribute-sets="itemNormal" display-align="center">
            </fo:block>
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
          <fo:region-body  margin-bottom="10mm" border-right="3pt double" border-left="3pt double" border-top="3pt double"/>
          <fo:region-after region-name="footer-first-one" extent="10mm" display-align="after" border-right="3pt double" border-left="3pt double" border-bottom="3pt double"/>
        </fo:simple-page-master>
        <fo:simple-page-master master-name="firstPage" margin-bottom="0.5cm" margin-left="0.5cm"
						margin-right="0.5cm" margin-top="0.5cm" page-height="28.7cm" page-width="20cm">
          <fo:region-body  margin-bottom="15mm" border-right="3pt double" border-left="3pt double" border-top="3pt double"/>
          <fo:region-after region-name="footer-first" extent="15mm" display-align="after" border-right="3pt double" border-left="3pt double" border-bottom="3pt double"/>
        </fo:simple-page-master>
        <fo:simple-page-master master-name="middlePage" margin-bottom="0.5cm" margin-left="0.5cm"
						margin-right="0.5cm" margin-top="0.5cm" page-height="28.7cm" page-width="20cm">
          <fo:region-body  margin-bottom="15mm" border-right="3pt double" border-left="3pt double" border-top="3pt double" />
          <fo:region-after region-name="footer-rest" extent="15mm" display-align="after" border-right="3pt double" border-left="3pt double" border-bottom="3pt double"/>
        </fo:simple-page-master>
        <fo:simple-page-master master-name="lastPage" margin-bottom="0.5cm" margin-left="0.5cm"
						margin-right="0.5cm" margin-top="0.5cm" page-height="28.7cm" page-width="20cm">
          <fo:region-body  margin-bottom="15mm" border-right="3pt double" border-left="3pt double" border-top="3pt double" />
          <!--<fo:region-before extent="95mm" display-align="before" precedence="true" border-right="3pt double" border-left="3pt double" border-top="3pt double"  />-->
          <fo:region-after region-name="footer-last" extent="15mm" display-align="after" border-right="3pt double" border-left="3pt double" border-bottom="3pt double"/>
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
          <fo:block font-size="7pt" text-align="right">
            <fo:block>
              <fo:table table-layout="fixed" width="100%">
                <fo:table-column column-width="100%"/>
                <fo:table-body>
                  <fo:table-row>
                    <fo:table-cell border-top="dotted">
                      <fo:block text-align="center">
                        <fo:inline  xsl:use-attribute-sets="labelItalic">Đơn vị cung cấp dịch vụ Hóa đơn điện tử: Tập đoàn Công nghiệp - Viễn thông Quân đội (Viettel), MST: 0100109106 </fo:inline>
                      </fo:block>
                      <fo:block text-align="center">
                        <fo:wrapper  xsl:use-attribute-sets="labelItalic">Tra cứu hóa đơn điện tử tại Website: <xsl:choose>
                      <xsl:when test="not(DLHDon/NDHDon/NBan/TTKhac/TTin[TTruong='Link tra cứu người bán']/DLieu) = false() and DLHDon/NDHDon/NBan/TTKhac/TTin[TTruong='Link tra cứu người bán']/DLieu != ''">
                        <xsl:value-of select="DLHDon/NDHDon/NBan/TTKhac/TTin[TTruong='Link tra cứu người bán']/DLieu"/>
                      </xsl:when>
                      <xsl:otherwise>
                        https://vinvoice.viettel.vn/utilities/invoice-search
                      </xsl:otherwise>
                    </xsl:choose>. Mã số bí mật: </fo:wrapper>
                        <fo:wrapper  xsl:use-attribute-sets="labelNormal">
                          <xsl:value-of select="DLHDon/TTChung/TTKhac/TTin[TTruong='Mã số bí mật']/DLieu"/>
                        </fo:wrapper>
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                </fo:table-body>
              </fo:table>
            </fo:block>
          </fo:block>
        </fo:static-content>
        <fo:static-content flow-name="footer-first">
          <fo:block font-size="7pt" text-align="right">
            <fo:block>
              <fo:table table-layout="fixed" width="100%">
                <fo:table-column column-width="100%"/>
                <fo:table-body>
                  <fo:table-row>
                    <fo:table-cell border-top="dotted">
                      <fo:block text-align="center">
                        <fo:inline  xsl:use-attribute-sets="labelItalic">Đơn vị cung cấp dịch vụ Hóa đơn điện tử: Tập đoàn Công nghiệp - Viễn thông Quân đội (Viettel), MST: 0100109106 </fo:inline>
                      </fo:block>
                      <fo:block text-align="center">
                        <fo:wrapper  xsl:use-attribute-sets="labelItalic">Tra cứu hóa đơn điện tử tại Website: <xsl:choose>
                          <xsl:when test="not(DLHDon/NDHDon/NBan/TTKhac/TTin[TTruong='Link tra cứu người bán']/DLieu) = false() and DLHDon/NDHDon/NBan/TTKhac/TTin[TTruong='Link tra cứu người bán']/DLieu != ''">
                            <xsl:value-of select="DLHDon/NDHDon/NBan/TTKhac/TTin[TTruong='Link tra cứu người bán']/DLieu"/>
                          </xsl:when>
                          <xsl:otherwise>
                            https://vinvoice.viettel.vn/utilities/invoice-search
                          </xsl:otherwise>
                        </xsl:choose>. Mã số bí mật: </fo:wrapper>
                        <fo:wrapper  xsl:use-attribute-sets="labelNormal">
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
          <fo:block font-size="7pt" text-align="right">
            <fo:block>
              <fo:table table-layout="fixed" width="100%">
                <fo:table-column column-width="100%"/>
                <fo:table-body>
                  <fo:table-row>
                    <fo:table-cell border-top="dotted">
                      <fo:block text-align="center">
                        <fo:inline  xsl:use-attribute-sets="labelItalic">Đơn vị cung cấp dịch vụ Hóa đơn điện tử: Tập đoàn Công nghiệp - Viễn thông Quân đội (Viettel), MST: 0100109106 </fo:inline>
                      </fo:block>
                      <fo:block text-align="center">
                        <fo:wrapper  xsl:use-attribute-sets="labelItalic">Tra cứu hóa đơn điện tử tại Website: <xsl:choose>
                      <xsl:when test="not(DLHDon/NDHDon/NBan/TTKhac/TTin[TTruong='Link tra cứu người bán']/DLieu) = false() and DLHDon/NDHDon/NBan/TTKhac/TTin[TTruong='Link tra cứu người bán']/DLieu != ''">
                        <xsl:value-of select="DLHDon/NDHDon/NBan/TTKhac/TTin[TTruong='Link tra cứu người bán']/DLieu"/>
                      </xsl:when>
                      <xsl:otherwise>
                        https://vinvoice.viettel.vn/utilities/invoice-search
                      </xsl:otherwise>
                    </xsl:choose>. Mã số bí mật: </fo:wrapper>
                        <fo:wrapper  xsl:use-attribute-sets="labelNormal">
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
          <fo:block font-size="7pt" text-align="right">
            <fo:block>
              <fo:table table-layout="fixed" width="100%">
                <fo:table-column column-width="100%"/>
                <fo:table-body>
                  <fo:table-row>
                    <fo:table-cell border-top="dotted">
                      <fo:block text-align="center">
                        <fo:inline  xsl:use-attribute-sets="labelItalic">Đơn vị cung cấp dịch vụ Hóa đơn điện tử: Tập đoàn Công nghiệp - Viễn thông Quân đội (Viettel), MST: 0100109106 </fo:inline>
                      </fo:block>
                      <fo:block text-align="center">
                        <fo:wrapper  xsl:use-attribute-sets="labelItalic">Tra cứu hóa đơn điện tử tại Website: <xsl:choose>
                          <xsl:when test="not(DLHDon/NDHDon/NBan/TTKhac/TTin[TTruong='Link tra cứu người bán']/DLieu) = false() and DLHDon/NDHDon/NBan/TTKhac/TTin[TTruong='Link tra cứu người bán']/DLieu != ''">
                            <xsl:value-of select="DLHDon/NDHDon/NBan/TTKhac/TTin[TTruong='Link tra cứu người bán']/DLieu"/>
                          </xsl:when>
                          <xsl:otherwise>
                            https://vinvoice.viettel.vn/utilities/invoice-search
                          </xsl:otherwise>
                        </xsl:choose>. Mã số bí mật: </fo:wrapper>
                        <fo:wrapper  xsl:use-attribute-sets="labelNormal">
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
            <fo:table-column column-width="26%"/>
            <fo:table-column column-width="48%"/>
            <fo:table-column column-width="26%"/>
            <fo:table-header>
              <fo:table-row>
                <fo:table-cell>
                  <fo:block-container absolute-position="fixed" text-align="center" display-align="before" top="95mm" left="10mm" right="10mm">
                    <fo:block>
                      <fo:external-graphic content-height="scale-to-fit" content-width="scale-to-fit" max-height="15cm" max-width="100%"  scaling="uniform"  src="url('watermark.png')"/>
                    </fo:block>
                  </fo:block-container>
                  <fo:block-container  absolute-position="fixed" text-align="center" display-align="before" top="95mm" left="10mm" right="10mm">
                    <fo:block>
                      <fo:external-graphic content-height="scale-to-fit" content-width="scale-to-fit" max-height="15cm" max-width="100%"  scaling="uniform"  src="url('example.png')"/>
                    </fo:block>
                  </fo:block-container>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row border-collapse="collapse" width="100%">
                <fo:table-cell  display-align="center">
                  <fo:block  margin-left="3px">
                    <fo:external-graphic content-height="scale-to-fit" max-height="3cm"  content-width="scale-to-fit" max-width="100%"  scaling="uniform" src="url('logo.png')">
                    </fo:external-graphic>
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell border-collapse="collapse" xsl:use-attribute-sets="header">
                  <fo:block>
                    <fo:block xsl:use-attribute-sets="invoiceName">HÓA ĐƠN GIÁ TRỊ GIA TĂNG</fo:block>
                  </fo:block>
                  <fo:block>
                    <fo:block font-size="14pt" xsl:use-attribute-sets="invoiceNameItalic">(VAT INVOICE)</fo:block>
                  </fo:block>
                  <fo:block font-size="9pt">
                    <fo:block xsl:use-attribute-sets="headerNote" font-weight="bold">Bản thể hiện của hóa đơn điện tử</fo:block>
                  </fo:block>
                  <fo:block font-size="9pt">
                    <fo:block xsl:use-attribute-sets="headerNoteItalic" >(Electronic invoice display)</fo:block>
                  </fo:block>
                  <fo:block font-size="9pt" xsl:use-attribute-sets="itemNormal">
                    <xsl:choose>
                      <xsl:when test="DLHDon/TTChung/NLap!='null'">
                        <fo:wrapper xsl:use-attribute-sets="labelNormal">Ngày </fo:wrapper>
                        <fo:wrapper xsl:use-attribute-sets="labelItalic">(date) </fo:wrapper>
                        <xsl:value-of select="substring(DLHDon/TTChung/NLap, 9, 2)"/>
                        <xsl:text> </xsl:text>
                        <fo:wrapper xsl:use-attribute-sets="labelNormal">tháng </fo:wrapper>
                        <fo:wrapper xsl:use-attribute-sets="labelItalic">(month) </fo:wrapper>
                        <xsl:value-of select="substring(DLHDon/TTChung/NLap, 6, 2)"/>
                        <xsl:text> </xsl:text>
                        <fo:wrapper xsl:use-attribute-sets="labelNormal">năm </fo:wrapper>
                        <fo:wrapper xsl:use-attribute-sets="labelItalic">(year) </fo:wrapper>
                        <xsl:value-of select="substring(DLHDon/TTChung/NLap, 1, 4)"/>
                        <xsl:text> </xsl:text>
                        <!--                                                <xsl:value-of select="concat(substring(DLHDon/TTChung/NLap, 9, 2),'/',substring(DLHDon/TTChung/NLap, 6, 2),'/',substring(DLHDon/TTChung/NLap, 1, 4))"/>-->
                      </xsl:when>
                      <xsl:otherwise>
                        <fo:wrapper xsl:use-attribute-sets="labelNormal">Ngày </fo:wrapper>
                        <fo:wrapper xsl:use-attribute-sets="labelItalic">(date) ......</fo:wrapper>
                        <fo:wrapper xsl:use-attribute-sets="labelNormal">tháng </fo:wrapper>
                        <fo:wrapper xsl:use-attribute-sets="labelItalic">(month) ......</fo:wrapper>
                        <fo:wrapper xsl:use-attribute-sets="labelNormal">năm </fo:wrapper>
                        <fo:wrapper xsl:use-attribute-sets="labelItalic">(year) ......</fo:wrapper>
                        <!--Ngày ......... Tháng ......... Năm .........-->
                      </xsl:otherwise>
                    </xsl:choose>
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell border-collapse="collapse">
                  <fo:block xsl:use-attribute-sets="dataInfoInvoice">
                    <!--border="1pt solid black"-->
                    <fo:table table-layout="fixed" width="100%">
                      <fo:table-column column-width="55%"/>
                      <fo:table-column column-width="45%"/>
                      <fo:table-body>
                        <fo:table-row>
                          <fo:table-cell>
                            <fo:block xsl:use-attribute-sets="labelNormal">
                              <fo:wrapper xsl:use-attribute-sets="labelBold">Ký hiệu </fo:wrapper>
                              <fo:wrapper xsl:use-attribute-sets="labelItalic">(Serial): </fo:wrapper>
                            </fo:block>
                          </fo:table-cell>
                          <fo:table-cell>
                            <fo:block xsl:use-attribute-sets="itemBold">
                              <xsl:value-of select="DLHDon/TTChung/KHMSHDon"/>
                              <xsl:value-of select="DLHDon/TTChung/KHHDon"/>
                            </fo:block>
                          </fo:table-cell>
                        </fo:table-row>
                        <fo:table-row>
                          <fo:table-cell>
                            <fo:block xsl:use-attribute-sets="labelNormal">
                              <fo:wrapper xsl:use-attribute-sets="labelBold">Số </fo:wrapper>
                              <fo:wrapper xsl:use-attribute-sets="labelItalic">(No.): </fo:wrapper>
                            </fo:block>
                          </fo:table-cell>
                          <fo:table-cell>
                            <fo:block xsl:use-attribute-sets="itemBold">
                              <xsl:value-of select="DLHDon/TTChung/SHDon"/>
                            </fo:block>
                          </fo:table-cell>
                        </fo:table-row>
                      </fo:table-body>
                    </fo:table>
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="borderBottom">
                  <fo:block>
                    <fo:table border-collapse="collapse" table-layout="fixed" width="100%">
                      <fo:table-column column-width="100%"/>
                      <fo:table-body>
                        <fo:table-row>
                          <fo:table-cell  padding-left="2mm">
                            <fo:block font-size="9pt" text-align="left" xsl:use-attribute-sets="labelNormal">
                              <fo:wrapper xsl:use-attribute-sets="labelBold">Đơn vị bán hàng </fo:wrapper>
                              <fo:wrapper xsl:use-attribute-sets="labelItalic">(Seller): </fo:wrapper>
                              <fo:inline xsl:use-attribute-sets="labelBold">
                                <xsl:value-of select="DLHDon/NDHDon/NBan/Ten"/>
                              </fo:inline>
                            </fo:block>
                          </fo:table-cell>
                        </fo:table-row>
                        <fo:table-row>
                          <fo:table-cell  padding-left="2mm">
                            <fo:block font-size="9pt" text-align="left" xsl:use-attribute-sets="labelNormal">
                              <fo:wrapper xsl:use-attribute-sets="labelBold">Mã số thuế </fo:wrapper>
                              <fo:wrapper xsl:use-attribute-sets="labelItalic">(Tax code): </fo:wrapper>
                              <fo:inline xsl:use-attribute-sets="labelBold">
                                <xsl:value-of select="DLHDon/NDHDon/NBan/MST"/>
                              </fo:inline>
                            </fo:block>
                          </fo:table-cell>
                        </fo:table-row>
                        <fo:table-row>
                          <fo:table-cell  padding-left="2mm">
                            <fo:block font-size="9pt" text-align="left" xsl:use-attribute-sets="labelNormal">
                              <fo:wrapper xsl:use-attribute-sets="labelBold">Địa chỉ </fo:wrapper>
                              <fo:wrapper xsl:use-attribute-sets="labelItalic">(Address): </fo:wrapper>
                              <fo:inline xsl:use-attribute-sets="labelBold">
                                <xsl:value-of select="DLHDon/NDHDon/NBan/DChi"/>
                              </fo:inline>
                            </fo:block>
                          </fo:table-cell>
                        </fo:table-row>
                        <fo:table-row>
                          <fo:table-cell padding-left="2mm">
                            <fo:block font-size="9pt">
                              <fo:table table-layout="fixed" width="100%">
                                <fo:table-column column-width="35%"/>
                                <fo:table-column column-width="20%"/>
                                <fo:table-column column-width="45%"/>
                                <fo:table-body>
                                  <fo:table-row>
                                    <fo:table-cell>
                                      <fo:block font-size="9pt" text-align="left" xsl:use-attribute-sets="labelNormal">
                                        <fo:wrapper xsl:use-attribute-sets="labelBold">Điện thoại </fo:wrapper>
                                        <fo:wrapper xsl:use-attribute-sets="labelItalic">(Tel): </fo:wrapper>
                                        <fo:inline xsl:use-attribute-sets="labelBold">
                                          <xsl:value-of select="DLHDon/NDHDon/NBan/SDThoai"/>
                                        </fo:inline>
                                      </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell>
                                      <fo:block font-size="9pt" text-align="left" xsl:use-attribute-sets="labelNormal">
                                        <fo:wrapper xsl:use-attribute-sets="labelBold">Fax: </fo:wrapper>
                                        <fo:inline xsl:use-attribute-sets="labelBold">
                                          <xsl:value-of select="DLHDon/NDHDon/NBan/Fax"/>
                                        </fo:inline>
                                      </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell>
                                      <fo:block font-size="9pt" text-align="left" xsl:use-attribute-sets="labelNormal">
                                        <fo:wrapper xsl:use-attribute-sets="labelBold">Website: </fo:wrapper>
                                        <fo:inline xsl:use-attribute-sets="labelBold">
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
                          <fo:table-cell  padding-left="2mm">
                            <fo:block font-size="9pt">
                              <fo:table table-layout="fixed" width="100%">
                                <fo:table-column column-width="21%"/>
                                <fo:table-column column-width="14%"/>
                                <fo:table-column column-width="15%"/>
                                <fo:table-column column-width="50%"/>
                                <fo:table-body>
                                  <fo:table-row>
                                    <fo:table-cell>
                                      <fo:block font-size="9pt" text-align="left"  xsl:use-attribute-sets="labelNormal">
                                        <fo:wrapper xsl:use-attribute-sets="labelBold">Số tài khoản </fo:wrapper>
                                        <fo:wrapper xsl:use-attribute-sets="labelItalic">(Account No.): </fo:wrapper>
                                      </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell>
                                      <fo:block font-size="9pt" text-align="left"  xsl:use-attribute-sets="labelNormal">
                                        <fo:inline xsl:use-attribute-sets="labelBold">
                                          <xsl:choose>
                                            <xsl:when test="contains(DLHDon/NDHDon/NBan/STKNHang,';')">
                                              <xsl:value-of select="replace(DLHDon/NDHDon/NBan/STKNHang,';','&#x2028;')"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                              <xsl:value-of select="DLHDon/NDHDon/NBan/STKNHang"/>
                                            </xsl:otherwise>
                                          </xsl:choose>
                                        </fo:inline>
                                      </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell>
                                      <fo:block font-size="9pt" text-align="left" xsl:use-attribute-sets="labelNormal">
                                        <fo:wrapper xsl:use-attribute-sets="labelBold">Ngân hàng</fo:wrapper>
                                        <fo:wrapper xsl:use-attribute-sets="labelItalic"> (Bank): </fo:wrapper>
                                      </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell>
                                      <fo:block font-size="9pt" text-align="left" xsl:use-attribute-sets="labelNormal">
                                        <fo:inline xsl:use-attribute-sets="labelBold">
                                          <xsl:choose>
                                            <xsl:when test="contains(DLHDon/NDHDon/NBan/TNHang,';')">
                                              <xsl:value-of select="replace(DLHDon/NDHDon/NBan/TNHang,';','&#x2028;')"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                              <xsl:value-of select="DLHDon/NDHDon/NBan/TNHang"/>
                                            </xsl:otherwise>
                                          </xsl:choose>
                                        </fo:inline>
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
              <fo:table-row>
                <fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="borderBottom">
                  <fo:block>
                    <fo:table border-collapse="collapse" table-layout="fixed" width="100%">
                      <fo:table-column column-width="100%"/>
                      <fo:table-body>
                        <fo:table-row>
                          <fo:table-cell padding-left="2mm">
                            <fo:block font-size="9pt" text-align="left" xsl:use-attribute-sets="labelNormal">
                              <fo:wrapper xsl:use-attribute-sets="labelBold">Họ tên người mua hàng </fo:wrapper>
                              <fo:wrapper xsl:use-attribute-sets="labelItalic">(Customer's name): </fo:wrapper>
                              <fo:inline xsl:use-attribute-sets="labelBold">
                                <xsl:value-of select="DLHDon/NDHDon/NMua/HVTNMHang"/>
                              </fo:inline>
                            </fo:block>
                          </fo:table-cell>
                        </fo:table-row>
                        <fo:table-row>
                          <fo:table-cell padding-left="2mm">
                            <fo:block font-size="9pt" text-align="left" xsl:use-attribute-sets="labelNormal">
                              <fo:wrapper xsl:use-attribute-sets="labelBold">Tên đơn vị </fo:wrapper>
                              <fo:wrapper xsl:use-attribute-sets="labelItalic">(Company's name): </fo:wrapper>
                              <fo:inline xsl:use-attribute-sets="labelBold">
                                <xsl:value-of select="DLHDon/NDHDon/NMua/Ten"/>
                              </fo:inline>
                            </fo:block>
                          </fo:table-cell>
                        </fo:table-row>
                        <fo:table-row>
                          <fo:table-cell padding-left="2mm">
                            <fo:block font-size="9pt" text-align="left" xsl:use-attribute-sets="labelNormal">
                              <fo:wrapper xsl:use-attribute-sets="labelBold">Mã số thuế </fo:wrapper>
                              <fo:wrapper xsl:use-attribute-sets="labelItalic">(Tax code): </fo:wrapper>
                              <fo:inline xsl:use-attribute-sets="labelBold">
                                <xsl:value-of select="DLHDon/NDHDon/NMua/MST"/>
                              </fo:inline>
                            </fo:block>
                          </fo:table-cell>
                        </fo:table-row>

                        <fo:table-row>
                          <fo:table-cell padding-left="2mm">
                            <fo:block font-size="9pt" text-align="left" xsl:use-attribute-sets="labelNormal">
                              <fo:wrapper xsl:use-attribute-sets="labelBold">Địa chỉ </fo:wrapper>
                              <fo:wrapper xsl:use-attribute-sets="labelItalic">(Address): </fo:wrapper>
                              <fo:inline xsl:use-attribute-sets="labelBold">
                                <xsl:value-of select="DLHDon/NDHDon/NMua/DChi"/>
                              </fo:inline>
                            </fo:block>
                          </fo:table-cell>
                        </fo:table-row>
                        <fo:table-row>
                          <fo:table-cell padding-left="2mm">
                            <fo:block font-size="9pt">
                              <fo:table table-layout="fixed" width="100%">
                                <fo:table-column column-width="35%"/>
                                <fo:table-column column-width="65%"/>
                                <fo:table-body>
                                  <fo:table-row>
                                    <fo:table-cell>
                                      <fo:block font-size="9pt" text-align="left"  xsl:use-attribute-sets="labelNormal">
                                        <!--<fo:wrapper xsl:use-attribute-sets="labelNormal">Số tài khoản: </fo:wrapper>-->
                                        <fo:wrapper xsl:use-attribute-sets="labelBold">Số tài khoản </fo:wrapper>
                                        <fo:wrapper xsl:use-attribute-sets="labelItalic">(Account No.): </fo:wrapper>
                                        <fo:inline xsl:use-attribute-sets="labelBold">
                                          <xsl:value-of select="DLHDon/NDHDon/NMua/STKNHang"/>
                                        </fo:inline>
                                      </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell>
                                      <fo:block font-size="9pt" text-align="left" xsl:use-attribute-sets="labelNormal">
                                        <fo:wrapper xsl:use-attribute-sets="labelBold">Ngân hàng</fo:wrapper>
                                        <fo:wrapper xsl:use-attribute-sets="labelItalic"> (Bank): </fo:wrapper>
                                        <fo:inline xsl:use-attribute-sets="labelBold">
                                          <xsl:value-of select="DLHDon/NDHDon/NMua/TNHang"/>
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
                          <fo:table-cell padding-left="2mm">
                            <fo:block font-size="9pt" text-align="left" xsl:use-attribute-sets="labelNormal">
                              <fo:wrapper xsl:use-attribute-sets="labelBold">Hình thức thanh toán </fo:wrapper>
                              <fo:wrapper xsl:use-attribute-sets="labelItalic">(Payment method): </fo:wrapper>
                              <fo:inline xsl:use-attribute-sets="labelBold">
                                <xsl:value-of select="DLHDon/TTChung/HTTToan"/>
                              </fo:inline>
                            </fo:block>
                          </fo:table-cell>
                        </fo:table-row>
                        <fo:table-row>
                          <fo:table-cell padding-left="2mm">
                            <fo:block font-size="9pt" text-align="left" xsl:use-attribute-sets="labelNormal">
                              <fo:wrapper xsl:use-attribute-sets="labelBold">Ghi chú </fo:wrapper>
                              <fo:wrapper xsl:use-attribute-sets="labelItalic">(Note): </fo:wrapper>
                              <fo:inline xsl:use-attribute-sets="labelBold">
                                <xsl:value-of select="DLHDon/TTChung/TTHDLQuan/Gchu"/>
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
            <!--END_NOTHING-->
            <fo:table-body>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="3">
                  <fo:block font-size="9pt">
                    <fo:table border-collapse="collapse" table-layout="fixed" width="100%">
                      <fo:table-column column-width="5%"/>
                      <fo:table-column column-width="45%"/>
                      <fo:table-column column-width="10%"/>
                      <fo:table-column column-width="10%"/>
                      <fo:table-column column-width="14%"/>
                      <fo:table-column column-width="16%"/>
                      <fo:table-header width="100%">
                        <fo:table-row>
                          <fo:table-cell xsl:use-attribute-sets="boxSmall">
                            <fo:block text-align="center">
                              <fo:block xsl:use-attribute-sets="labelBold">STT </fo:block>
                              <fo:block xsl:use-attribute-sets="labelItalic">(No.) </fo:block>
                            </fo:block>
                          </fo:table-cell>
                          <fo:table-cell xsl:use-attribute-sets="boxSmall">
                            <fo:block text-align="center">
                              <fo:block xsl:use-attribute-sets="labelBold">Tên hàng hóa, dịch vụ </fo:block>
                              <fo:block xsl:use-attribute-sets="labelItalic">(Description) </fo:block>
                            </fo:block>
                          </fo:table-cell>
                          <fo:table-cell xsl:use-attribute-sets="boxSmall">
                            <fo:block text-align="center">
                              <fo:block xsl:use-attribute-sets="labelBold">Đơn vị tính </fo:block>
                              <fo:block xsl:use-attribute-sets="labelItalic">(Unit) </fo:block>
                            </fo:block>
                          </fo:table-cell>
                          <fo:table-cell xsl:use-attribute-sets="boxSmall">
                            <fo:block text-align="center">
                              <fo:block xsl:use-attribute-sets="labelBold">Số lượng </fo:block>
                              <fo:block xsl:use-attribute-sets="labelItalic">(Quantity) </fo:block>
                            </fo:block>
                          </fo:table-cell>
                          <fo:table-cell xsl:use-attribute-sets="boxSmall">
                            <fo:block text-align="center">
                              <fo:block xsl:use-attribute-sets="labelBold">Đơn giá </fo:block>
                              <fo:block xsl:use-attribute-sets="labelItalic">(Unit price) </fo:block>
                            </fo:block>
                          </fo:table-cell>
                          <fo:table-cell xsl:use-attribute-sets="boxSmall">
                            <fo:block text-align="center">
                              <fo:block xsl:use-attribute-sets="labelBold">Thành tiền </fo:block>
                              <fo:block xsl:use-attribute-sets="labelItalic">(Amount) </fo:block>
                            </fo:block>
                          </fo:table-cell>
                        </fo:table-row>
                        <fo:table-row font-weight="bold">
                          <fo:table-cell xsl:use-attribute-sets="boxSmall">
                            <fo:block text-align="center" xsl:use-attribute-sets="labelBold">
                              <xsl:text>1</xsl:text>
                            </fo:block>
                          </fo:table-cell>
                          <fo:table-cell xsl:use-attribute-sets="boxSmall">
                            <fo:block text-align="center" xsl:use-attribute-sets="labelBold">
                              <xsl:text>2</xsl:text>
                            </fo:block>
                          </fo:table-cell>
                          <fo:table-cell xsl:use-attribute-sets="boxSmall">
                            <fo:block text-align="center" xsl:use-attribute-sets="labelBold">
                              <xsl:text>3</xsl:text>
                            </fo:block>
                          </fo:table-cell>
                          <fo:table-cell xsl:use-attribute-sets="boxSmall">
                            <fo:block text-align="center" xsl:use-attribute-sets="labelBold">
                              <xsl:text>4</xsl:text>
                            </fo:block>
                          </fo:table-cell>
                          <fo:table-cell xsl:use-attribute-sets="boxSmall">
                            <fo:block text-align="center" xsl:use-attribute-sets="labelBold">
                              <xsl:text>5</xsl:text>
                            </fo:block>
                          </fo:table-cell>
                          <fo:table-cell xsl:use-attribute-sets="boxSmall">
                            <fo:block text-align="center" xsl:use-attribute-sets="labelBold">
                              <xsl:text>6 = 4 x 5</xsl:text>
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
                          <fo:table-row keep-together.within-page="always">
                            <fo:table-cell xsl:use-attribute-sets="boxSmall" display-align="center">
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
                            <fo:table-cell xsl:use-attribute-sets="boxSmall" display-align="center">
                              <fo:block text-align="left" xsl:use-attribute-sets="itemNormal" display-align="center">
                                <xsl:value-of select="THHDVu"/>
                              </fo:block>
                            </fo:table-cell>
                            <fo:table-cell xsl:use-attribute-sets="boxSmall" display-align="center">
                              <fo:block text-align="center" xsl:use-attribute-sets="itemNormal" display-align="center">
                                <xsl:value-of select="DVTinh"/>
                              </fo:block>
                            </fo:table-cell>
                            <fo:table-cell xsl:use-attribute-sets="boxSmall" display-align="center">
                              <fo:block text-align="right" xsl:use-attribute-sets="itemNormal" display-align="center">
                                <xsl:if test="SLuong != 'null' and SLuong != '' and SLuong &gt;= 0">
                                  <xsl:value-of select="foo:custom-num-format(SLuong, '###.##0', 'european')"/>
                                </xsl:if>
                              </fo:block>
                            </fo:table-cell>
                            <fo:table-cell xsl:use-attribute-sets="boxSmall" display-align="center">
                              <fo:block text-align="right" xsl:use-attribute-sets="itemNormal" display-align="center">
                                <xsl:if test="DGia != 'null' and DGia != '' and DGia &gt;= 0">
                                  <xsl:value-of select="foo:custom-num-format(DGia, '###.##0', 'european')"/>
                                </xsl:if>
                              </fo:block>
                            </fo:table-cell>
                            <fo:table-cell xsl:use-attribute-sets="boxSmall" display-align="center">
                              <fo:block text-align="right" xsl:use-attribute-sets="itemNormal" display-align="center">
                                <xsl:if test="ThTien != 'null'  and ThTien != '' and ThTien &gt;= 0">
                                  <xsl:value-of select="foo:custom-num-format(ThTien, '###.##0', 'european')"/>
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
                          <fo:table-cell number-columns-spanned="5" xsl:use-attribute-sets="boxSmall">
                            <fo:block text-align="right" xsl:use-attribute-sets="itemNormal">
                              <fo:wrapper xsl:use-attribute-sets="labelBold">Cộng tiền hàng </fo:wrapper>
                              <fo:wrapper xsl:use-attribute-sets="labelItalic">(Total amount): </fo:wrapper>
                            </fo:block>
                          </fo:table-cell>
                          <fo:table-cell xsl:use-attribute-sets="boxSmall">
                            <fo:block text-align="right" xsl:use-attribute-sets="itemNormal">
                              <xsl:if test="DLHDon/NDHDon/TToan /TgTCThue != 'null' and DLHDon/NDHDon/TToan /TgTCThue &gt;= 0">
                                <xsl:value-of select="foo:custom-num-format(DLHDon/NDHDon/TToan /TgTCThue, '###.##0', 'european')"/>
                              </xsl:if>
                            </fo:block>
                          </fo:table-cell>
                        </fo:table-row>
                        <xsl:choose>
                          <xsl:when test="DLHDon/NDHDon/TToan/THTTLTSuat/LTSuat != ''">
                            <xsl:for-each select="DLHDon/NDHDon/TToan/THTTLTSuat/LTSuat">
                              <xsl:choose>
                                <xsl:when test="TSuat != 'null' and (TSuat = '0%' or TSuat = '5%' or TSuat = '10%')">
                                  <fo:table-row>
                                    <fo:table-cell number-columns-spanned="2"  xsl:use-attribute-sets="boxSmall">
                                      <fo:block text-align="center" xsl:use-attribute-sets="itemNormal">
                                        <fo:wrapper xsl:use-attribute-sets="labelBold">Thuế suất GTGT </fo:wrapper>
                                        <fo:wrapper xsl:use-attribute-sets="labelItalic">
                                          (VAT rate): <xsl:value-of select="TSuat"/>
                                        </fo:wrapper>
                                      </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell number-columns-spanned="3"  xsl:use-attribute-sets="boxSmall">
                                      <fo:block text-align="right" xsl:use-attribute-sets="itemNormal">
                                        <fo:wrapper xsl:use-attribute-sets="labelBold">Tiền thuế GTGT </fo:wrapper>
                                        <fo:wrapper xsl:use-attribute-sets="labelItalic">(VAT amount): </fo:wrapper>
                                      </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell xsl:use-attribute-sets="boxSmall">
                                      <fo:block text-align="right" xsl:use-attribute-sets="itemNormal">
                                        <xsl:if test="TThue != 'null' and TThue &gt;= 0">
                                          <xsl:value-of select="foo:custom-num-format(TThue, '###.##0', 'european')"/>
                                        </xsl:if>
                                      </fo:block>
                                    </fo:table-cell>
                                  </fo:table-row>
                                </xsl:when>
                                <xsl:otherwise>
                                  <fo:table-row>
                                    <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="boxSmall">
                                      <fo:block text-align="center" xsl:use-attribute-sets="itemNormal">
                                        <fo:wrapper xsl:use-attribute-sets="labelBold">Thuế suất GTGT </fo:wrapper>
                                        <fo:wrapper xsl:use-attribute-sets="labelItalic">(VAT rate): </fo:wrapper>
                                        <fo:inline xsl:use-attribute-sets="labelNormal">
                                          .....\.....%
                                        </fo:inline>
                                      </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="boxSmall">
                                      <fo:block text-align="right" xsl:use-attribute-sets="itemNormal">
                                        <fo:wrapper xsl:use-attribute-sets="labelBold">Tiền thuế GTGT </fo:wrapper>
                                        <fo:wrapper xsl:use-attribute-sets="labelItalic">(VAT amount): </fo:wrapper>
                                      </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell xsl:use-attribute-sets="boxSmall">
                                      <fo:block text-align="right" xsl:use-attribute-sets="itemNormal">
                                        .....\.....
                                      </fo:block>
                                    </fo:table-cell>
                                  </fo:table-row>
                                </xsl:otherwise>
                              </xsl:choose>
                            </xsl:for-each>
                          </xsl:when>
                          <xsl:otherwise>
                            <fo:table-row>
                              <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="boxSmall">
                                <fo:block text-align="center" xsl:use-attribute-sets="itemNormal">
                                  <fo:wrapper xsl:use-attribute-sets="labelBold">Thuế suất GTGT </fo:wrapper>
                                  <fo:wrapper xsl:use-attribute-sets="labelItalic">(VAT rate): </fo:wrapper>
                                  <fo:inline xsl:use-attribute-sets="labelNormal">
                                    ..........%
                                  </fo:inline>
                                </fo:block>
                              </fo:table-cell>
                              <fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="boxSmall">
                                <fo:block text-align="right" xsl:use-attribute-sets="itemNormal">
                                  <fo:wrapper xsl:use-attribute-sets="labelBold">Tiền thuế GTGT </fo:wrapper>
                                  <fo:wrapper xsl:use-attribute-sets="labelItalic">(VAT amount): </fo:wrapper>
                                </fo:block>
                              </fo:table-cell>
                              <fo:table-cell xsl:use-attribute-sets="boxSmall">
                                <fo:block text-align="right" xsl:use-attribute-sets="itemNormal">
                                </fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                          </xsl:otherwise>
                        </xsl:choose>
                        <fo:table-row keep-together.within-page="always">
                          <fo:table-cell number-columns-spanned="6">
                            <fo:block>
                              <fo:table table-layout="fixed" width="100%">
                                <fo:table-column column-width="84%"/>
                                <fo:table-column column-width="16%"/>
                                <fo:table-body>
                                  <fo:table-row>
                                    <fo:table-cell border-left="0.5pt solid" border-right="0.5pt solid" border-bottom="0.5pt solid">
                                      <fo:block text-align="right" xsl:use-attribute-sets="itemNormal">
                                        <fo:wrapper xsl:use-attribute-sets="labelBold">TỔNG CỘNG TIỀN THANH TOÁN </fo:wrapper>
                                        <fo:wrapper xsl:use-attribute-sets="labelItalic">(Total payment): </fo:wrapper>
                                      </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border-left="0.5pt solid" border-right="0.5pt solid" border-bottom="0.5pt solid">
                                      <fo:block text-align="right" xsl:use-attribute-sets="itemNormal">
                                        <xsl:if test="DLHDon/NDHDon/TToan /TgTTTBSo != 'null' and DLHDon/NDHDon/TToan /TgTTTBSo &gt;= 0">
                                          <xsl:value-of select="foo:custom-num-format(DLHDon/NDHDon/TToan /TgTTTBSo, '###.##0', 'european')"/>
                                        </xsl:if>
                                      </fo:block>
                                    </fo:table-cell>
                                  </fo:table-row>
                                  <fo:table-row>
                                    <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="boxSmall">
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
                                    <fo:table-cell number-columns-spanned="2">
                                      <fo:block margin-top="1mm" font-size="10pt">
                                        <fo:table table-layout="fixed" width="100%">
                                          <fo:table-column column-width="50%"/>
                                          <fo:table-column column-width="50%"/>
                                          <fo:table-body>
                                            <fo:table-row>
                                              <fo:table-cell>
                                                <fo:block text-align="center">
                                                  <fo:wrapper  xsl:use-attribute-sets="labelBold">Người mua hàng </fo:wrapper>
                                                  <fo:wrapper xsl:use-attribute-sets="labelItalic">(Buyer)</fo:wrapper>
                                                </fo:block>
                                                <fo:block text-align="center">
                                                  <fo:inline  xsl:use-attribute-sets="labelItalic">(Ký, ghi rõ họ tên)</fo:inline>
                                                </fo:block>
                                                <fo:block text-align="center">
                                                  <fo:inline  xsl:use-attribute-sets="labelItalic">(Sign, full name)</fo:inline>
                                                </fo:block>
                                                <fo:block text-align="center"  display-align="center">
                                                  <fo:block padding-top="7px" margin-top="7px">
                                                  </fo:block>
                                                  <fo:block xsl:use-attribute-sets="signature">
                                                    <xsl:if test="not((//*[local-name()='X509SubjectName'])[2]) = false() and (//*[local-name()='X509SubjectName'])[2] != ''">
                                                      <fo:block-container absolute-position="absolute" text-align="center" left="1mm" right="1mm" top="11mm">
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
                                              </fo:table-cell>
                                              <fo:table-cell>
                                                <fo:block text-align="center">
                                                  <fo:wrapper  xsl:use-attribute-sets="labelBold">Người bán hàng </fo:wrapper>
                                                  <fo:wrapper  xsl:use-attribute-sets="labelItalic">(Seller)</fo:wrapper>
                                                </fo:block>
                                                <fo:block text-align="center">
                                                  <fo:inline  xsl:use-attribute-sets="labelItalic">(Ký, ghi rõ họ tên)</fo:inline>
                                                </fo:block>
                                                <fo:block text-align="center">
                                                  <fo:inline  xsl:use-attribute-sets="labelItalic">(Sign, full name)</fo:inline>
                                                </fo:block>
                                                <fo:block text-align="center"  display-align="center">
                                                  <fo:block padding-top="7px" margin-top="7px">
                                                  </fo:block>
                                                  <fo:block-container absolute-position="absolute" text-align="center" left="1mm" right="1mm" top="11mm">
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