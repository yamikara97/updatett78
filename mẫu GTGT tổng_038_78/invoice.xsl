<?xml version='1.0' encoding='UTF-8' ?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:inv="http://laphoadon.gdt.gov.vn/2014/09/invoicexml/v1" xmlns:ds="http://www.w3.org/2000/09/xmldsig#">
  <xsl:strip-space elements="*"/>
  <xsl:decimal-format decimal-separator="," grouping-separator="."/>
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
  <xsl:template name="string-replace-all">
    <xsl:param name="text"/>
    <xsl:param name="replace"/>
    <xsl:param name="by"/>
    <xsl:param name="spl"/>
    <xsl:choose>
      <xsl:when test="contains($text,$replace)">
        <xsl:value-of select="substring-before($text,$replace)"/>
        <xsl:value-of select="$by"/>
        <br/>
        <xsl:value-of select="$spl"/>
        <xsl:call-template name="string-replace-all">
          <xsl:with-param name="text" select="substring-after($text,$replace)"/>
          <xsl:with-param name="replace" select="$replace"/>
          <xsl:with-param name="by" select="$by"/>
          <xsl:with-param name="spl" select="$spl"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$text"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template name="loop">
    <xsl:param name="var"></xsl:param>
    <xsl:choose>
      <xsl:when test="$var &lt; 10 and $var &gt; 0">
        <tr>
          <td align="center" class= "boxSmall itemNormal">
            <font class="labelNormal" ></font>
          </td>
          <td align="left" class= "boxSmall itemNormal">
          </td>
          <td align="center" class= "boxSmall itemNormal">
          </td>
          <td align="right" class= "boxSmall itemNormal">
          </td>
          <td align="right" class= "boxSmall itemNormal">
          </td>
          <td align="right" class= "boxSmall itemNormal">
          </td>
        </tr>
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
  <xsl:template match="/HDon">
    <html>
      <head>
        <style>
          tbody{
          }
          .header{
          vertical-align:top
          }
          .invoiceName{
          font-weight:bold;
          font-size:16pt;
          }
          .titleInvoice{
          font-weight:bold;
          font-style: normal;
          font-size:16px;
          }
          .serif {
          font-family: "Times New Roman", Times, serif;
          }

          .sansserif {
          font-family: Arial, Helvetica, sans-serif;
          }
          .image-box {
          text-align:center;
          }
          .image-box img {
          <!--opacity: 0.9;-->
          width: 350px;
          background-image: none;
          background-repeat: no-repeat;
          background-position: center center;
          background-size: cover;
          margin-top:300px;
          margin-bottom: 100px;
          }

          .image-box img[src=""] {
          display: none;
          }

          img[src=""] {
          display: none;
          }

          .watermark {
          top: 0;
          left: 0;
          bottom: 0;
          right: 0;
          position: absolute;
          z-index: -2;
          margin-left:auto;
          margin-right:auto;
          width:400px;
          margin-top: 0px;
          }

          .itemNormal{
          font-weight: normal;
          padding : 2px 2px 2px 2px
          }

          .itemBold{
          font-weight:bold;
          /*vertical-align:top;*/
          padding : 2px 2px 2px 2px
          }
          .labelNormal{
          padding : 2px 2px 2px 2px
          }

          .labelItalic{
          padding : 2px 2px 2px 2px;
          font-style: italic;
          color: #000000;
          }

          .labelItalicNormal{
          padding : 2px 2px 2px 2px;
          font-style: italic;
          font-weight: normal;
          color: #000000;
          }

          .labelBold{
          font-weight:bold;
          /*vertical-align:top;*/
          padding : 2px 2px 2px 2px
          }



          .boxLarge{
          margin-left:auto;
          margin-right:auto;
          border-collapse: collapse;
          padding : 5px 5px 5px 5px;
          border: 3px double;
          width:838.267px;
          }
          .boxSmall{
          border-collapse: collapse;
          padding : 5px 5px 5px 5px;
          border: 1px solid;
          }
          .boxSmallTable{
          border-spacing: 0px;
          padding : 0px 0px 0px 0px;
          border: 1px solid;
          }
          .dataInfoInvoice{
          vertical-align:top;
          font-weight:bold;
          padding : 2px 2px 2px 2px
          }
          <!--Bat buoc phai co - dau hieu nhan biet de change color-->
          <!--Start_color-->
          .invoiceName{
          color: #000000;
          }
          .invoiceNameItalic{
          color: #000000;
          font-style: italic;
          font-size: 14pt
          }
          .titleInvoice{
          color: #000000;
          }
          .itemNormal{
          color: #000000;
          }
          .itemBold{
          color: #000000;
          }
          .labelNormal{
          color: #000000;
          }
          .labelBold{
          color: #000000;
          }
          .boxLarge{
          color: #000000;
          border-style: double;
          border-width: medium;
          }
          .boxSmall{
          color: #000000;
          }


          .borderBottom{
          border-bottom: 2px solid #4C3F57;
          }
          .BG {
          <!--opacity: 0.3;-->
          background-image: url(signature.png);
          background-repeat: no-repeat;
          background-position: center top;
          background-size: 200px 70px;
          }
          img[src=""] {
          display: none;
          }
          <!--End_custom_nuoc_lai_chau
                    background-image: url("background.jpg");
                    z-index: -16 !important;
                    -->
        </style>
      </head>
      <body >
        <table  id='section-to-print' ALIGN="center" class = "serif boxLarge" style="background-image:url(watermark.png); background-repeat:no-repeat;background-position: center 350px;">
          <tr class = "borderBottom">
            <td width="24%" align="center" style="padding-left:1mm">
              <img src="logo.png" style="max-height: 90px; max-width: 100%;" align="middle"/>
            </td>
            <td align="center" class="header" style="color:#000000" >
              <font class="invoiceName">
                HÓA ĐƠN GIÁ TRỊ GIA TĂNG
              </font>
              <br/>
              <font class="invoiceNameItalic">
                (VAT INVOICE)
              </font>
              <br/>
              <font class="labelBold">Bản thể hiện của hóa đơn điện tử</font>
              <br/>
              <font class="labelItalic">
                (Electronic invoice display)
              </font>
              <br/>
              <xsl:choose>
                <xsl:when test="DLHDon/TTChung/NLap !='null'">
                  <font class="labelNormal">Ngày</font>
                  <font class="labelItalic" >(date) </font>
                  <xsl:value-of select="substring(DLHDon/TTChung/NLap, 9, 2)"/>
                  <font class="labelNormal"> tháng</font>
                  <font class="labelItalic" >(month) </font>
                  <xsl:value-of select="substring(DLHDon/TTChung/NLap, 6, 2)"/>
                  <font class="labelNormal"> năm</font>
                  <font class="labelItalic" >(year) </font>
                  <xsl:value-of select="substring(DLHDon/TTChung/NLap, 1, 4)"/>
                </xsl:when>
                <xsl:otherwise>
                  Ngày<font class="labelItalic" >(date) </font>..... tháng<font class="labelItalic" >(month) </font>..... năm<font class="labelItalic" >(year) </font>....
                </xsl:otherwise>
              </xsl:choose>

            </td>
            <td width="28%" style="vertical-align:top;">
              <!--<table align="right" class= "boxSmall dataInfoInvoice" style = "border: none !important;">-->
              <table align="right" class= "boxSmall" style = "border: none !important;">
                <tr>
                  <td align="left">
                    <font class="labelBold" >Ký hiệu</font>
                    <font class="labelItalic" >(Serial): </font>
                  </td>
                  <td align="left" class = "itemBold">
                    <xsl:value-of select="DLHDon/TTChung/KHMSHDon"/>
                              <xsl:value-of select="DLHDon/TTChung/KHHDon"/>
                  </td>
                </tr>
                <tr>
                  <!--<td align="left" class="labelBold">Số (No.): </td>-->
                  <td align="left">
                    <font class="labelBold" >Số</font>
                    <font class="labelItalic" >(No.): </font>
                  </td>
                  <td align="left" class = "itemBold">
                    <xsl:value-of select="DLHDon/TTChung/SHDon"/>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr class = "borderBottom">
            <td colspan="3">
              <table width="100%">
                <tr>
                  <td>
                    <table>
                      <tr>
                        <td>
                          <font class="labelBold" >Đơn vị bán hàng</font>
                          <font class="labelItalic" >(Seller): </font>
                          <font class="labelBold">
                            <xsl:value-of select="DLHDon/NDHDon/NBan/Ten"/>
                          </font>
                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr>
                  <td>
                    <table>
                      <tr>
                        <td>
                          <font class="labelBold" >Mã số thuế</font>
                          <font class="labelItalic" >(Tax code): </font>
                          <font class="labelBold">
                            <xsl:variable name = "sellerTaxCodeLength" select = "string-length(DLHDon/NDHDon/NBan/MST)"/>
                            <xsl:variable name = "sellerTaxCode" select = "DLHDon/NDHDon/NBan/MST"/>
                            <xsl:value-of select="$sellerTaxCode"/>
                          </font>
                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr>
                  <td>
                    <table>
                      <tr>
                        <td>
                          <font class="labelBold" >Địa chỉ</font>
                          <font class="labelItalic" >(Address): </font>
                          <font class="labelBold">
                            <xsl:value-of select="DLHDon/NDHDon/NBan/DChi"/>
                          </font>
                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr>
                  <td>
                    <table width="100%">
                      <tr>
                        <td width = "40%" >
                          <font class="labelBold" >Điện thoại</font>
                          <font class="labelItalic" >(Tel): </font>
                          <font class="labelBold">
                            <xsl:value-of select="DLHDon/NDHDon/NBan/SDThoai"/>
                          </font>
                        </td>
                        <td width = "25%" >
                          <font class="labelBold" >Fax: </font>
                          <font class="labelBold">
                            <xsl:value-of select="DLHDon/NDHDon/NBan/Fax"/>
                          </font>
                        </td>
                        <td width = "35%" >
                          <font class="labelBold" >Website: </font>
                          <font class="labelBold">
                            <xsl:value-of select="DLHDon/NDHDon/NBan/Website"/>
                          </font>
                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr>
                  <td>
                    <table  width="100%">
                      <tr>
                        <td width="24%" style="vertical-align: top">
                          <font class="labelBold" >Số tài khoản</font>
                          <font class="labelItalic" >(Account No.): </font>
                        </td>
                        <td width="16%" style="vertical-align: top">
                          <font class="labelBold">
                            <xsl:variable name="FeatureInfo" select="DLHDon/NDHDon/NBan/STKNHang" />
                            <xsl:call-template name="string-replace-all">
                              <xsl:with-param name="text" select="$FeatureInfo"/>
                              <xsl:with-param name="replace" select="';'"/>
                              <xsl:with-param name="by" select="'&#160;'"/>
                              <xsl:with-param name="spl" select="''"/>
                            </xsl:call-template>
                          </font>
                        </td>
                        <td width="17%" style="vertical-align: top">
                          <font class="labelBold" >Ngân hàng</font>
                          <font class="labelItalic" >(Bank): </font>
                        </td>
                        <td width="43%" style="vertical-align: top">
                          <font class="labelBold">
                            <xsl:variable name="FeatureInfo" select="DLHDon/NDHDon/NBan/TNHang" />
                            <xsl:call-template name="string-replace-all">
                              <xsl:with-param name="text" select="$FeatureInfo"/>
                              <xsl:with-param name="replace" select="';'"/>
                              <xsl:with-param name="by" select="'&#160;'"/>
                              <xsl:with-param name="spl" select="''"/>
                            </xsl:call-template>
                          </font>
                        </td>
                      </tr>
                    </table>
                  </td>

                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td colspan="3">
              <table width="100%">
                <tr>
                  <td>
                    <table width="100%">
                      <tr>
                        <td style="width: 100%">
                          <font class="labelBold" >Họ tên người mua hàng</font>
                          <font class="labelItalic" >(Customer's name): </font>
                          <font class="itemBold">
                            <xsl:value-of select="DLHDon/NDHDon/NMua/HVTNMHang"/>
                          </font>
                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr>
                  <td>
                    <table align="left" width="100%">
                      <tr>
                        <td style="width: 100%">
                          <font class="labelBold" >Tên đơn vị</font>
                          <font class="labelItalic" >(Company's name): </font>
                          <font class="itemBold">
                            <xsl:value-of select="DLHDon/NDHDon/NMua/Ten"/>
                          </font>
                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr>
                  <td>
                    <table align="left" width="100%">
                      <tr>
                        <td style="width: 100%">
                          <font class="labelBold" >Mã số thuế</font>
                          <font class="labelItalic" >(Tax code): </font>
                          <font class="itemBold">
                            <xsl:value-of select="DLHDon/NDHDon/NMua/MST"/>
                          </font>
                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr>
                  <td>
                    <table align="left" width="100%">
                      <tr>
                        <td style="width: 100%">
                          <font class="labelBold" >Địa chỉ</font>
                          <font class="labelItalic" >(Address): </font>
                          <font class="itemBold">
                            <xsl:value-of select="DLHDon/NDHDon/NMua/DChi"/>
                          </font>
                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr>
                  <td>
                    <table width="100%">
                      <tr>
                        <td style="width: 40%">
                          <font class="labelBold" >Số tài khoản</font>
                          <font class="labelItalic" >(Account No.): </font>
                          <font class="itemBold">
                            <xsl:value-of select="DLHDon/NDHDon/NMua/STKNHang"/>
                          </font>
                        </td>
                        <td style="width: 60%">
                          <font class="labelBold" >Ngân hàng</font>
                          <font class="labelItalic" >(Bank): </font>
                          <font class="itemBold">
                            <xsl:value-of select="DLHDon/NDHDon/NMua/TNHang"/>
                          </font>
                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr>
                  <td>
                    <table width="100%">
                      <tr>
                        <td  style="width: 100%">
                          <font class="labelBold" >Hình thức thanh toán</font>
                          <font class="labelItalic" >(Payment method): </font>
                          <font class="itemBold">
                            <xsl:value-of select="DLHDon/TTChung/HTTToan"/>
                          </font>
                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr>
                  <td>
                    <table width="100%">
                      <tr>
                        <td style="width: 100%">
                          <font class="labelBold" >Ghi chú</font>
                          <font class="labelItalic" >(Note): </font>
                          <font class="itemNormal">
                            <xsl:value-of select="DLHDon/TTChung/TTHDLQuan/Gchu"/>
                          </font>
                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td colspan="3">
              <table width="100%" class= "boxSmallTable">
                <tr width="100%">
                  <!--<td width="5%" align="center" class= "boxSmall labelBold">STT <br/>(No.)</td>-->
                  <td width="5%" align="center" class= "boxSmall"  style="text-align: center">
                    <font class="labelBold" >STT</font>
                    <br/>
                    <font class="labelItalicNormal">(No.)</font>
                  </td>
                  <!--<td width="32%" align="center" class= "boxSmall labelBold">Tên hàng hóa, dịch vụ <br/> (Description)</td>-->
                  <td align="center" class= "boxSmall"  style="text-align: center">
                    <font class="labelBold" >Tên hàng hóa, dịch vụ</font>
                    <br/>
                    <font class="labelItalicNormal" >(Description)</font>
                  </td>
                  <!--<td width="11%" align="center" class= "boxSmall labelBold">Đơn vị tính <br/>(Unit)</td>-->
                  <td width="12%" align="center" class= "boxSmall"  style="text-align: center">
                    <font class="labelBold" >Đơn vị tính</font>
                    <br/>
                    <font class="labelItalicNormal" >(Unit)</font>
                  </td>
                  <!--<td width="10%" align="center" class= "boxSmall labelBold">Số lượng <br/>(Quantity)</td>-->
                  <td width="10%" align="center" class= "boxSmall"  style="text-align: center">
                    <font class="labelBold" >Số lượng</font>
                    <br/>
                    <font class="labelItalicNormal" >(Quantity)</font>
                  </td>
                  <!--<td width="13%" align="center" class= "boxSmall labelBold">Đơn giá <br/>(Unit price)</td>-->
                  <td width="13%" align="center" class= "boxSmall"  style="text-align: center">
                    <font class="labelBold" >Đơn giá</font>
                    <br/>
                    <font class="labelItalicNormal" >(Unit price)</font>
                  </td>
                  <!--<td width="13%" align="center" class= "boxSmall labelBold">Thành tiền <br/>(Amount)</td>-->
                  <td width="13%" align="center" class= "boxSmall"  style="text-align: center">
                    <font class="labelBold" >Thành tiền</font>
                    <br/>
                    <font class="labelItalicNormal" >(Amount)</font>
                  </td>
                </tr>
                <tr width="100%">
                  <td align="center" class= "boxSmall labelBold"  style="text-align: center">1</td>
                  <td align="center" class= "boxSmall labelBold" style="text-align: center">2</td>
                  <td align="center" class= "boxSmall labelBold"  style="text-align: center">3</td>
                  <td align="center" class= "boxSmall labelBold" style="text-align: center">4</td>
                  <td align="center" class= "boxSmall labelBold" style="text-align: center">5</td>
                  <td align="center" class= "boxSmall labelBold" style="text-align: center">6 = 4 x 5</td>
                </tr>
                <xsl:for-each select="DLHDon/NDHDon/DSHHDVu/HHDVu">
                  <tr>
                    <td align="center" class= "boxSmall itemNormal">
                      <xsl:choose>
                        <xsl:when test="STT > 0">
                          <xsl:value-of select="STT"/>
                        </xsl:when>
                        <xsl:otherwise>
                          <font class="labelNormal" ></font>
                        </xsl:otherwise>
                      </xsl:choose>
                    </td>
                    <td align="left" class= "boxSmall itemNormal">
                      <xsl:value-of select="THHDVu"/>
                    </td>
                    <td align="center" class= "boxSmall itemNormal">
                      <xsl:value-of select="DVTinh"/>
                    </td>
                    <td align="right" class= "boxSmall itemNormal">
                      <xsl:if test="SLuong != 'null' and SLuong != '' and SLuong >= 0">
                        <xsl:value-of select="format-number(SLuong, '###.##0,#########')"/>
                      </xsl:if>
                    </td>
                    <td align="right" class= "boxSmall itemNormal">
                      <xsl:if test="DGia != 'null' and DGia != '' and DGia >= 0">
                        <xsl:value-of select="format-number(DGia, '###.##0,#########')"/>
                      </xsl:if>
                    </td>
                    <td align="right" class= "boxSmall itemNormal">
                      <xsl:if test="ThTien != 'null' and ThTien != '' and ThTien >= 0">
                        <xsl:value-of select="format-number(ThTien, '###.##0,#########')"/>
                      </xsl:if>
                    </td>
                  </tr>
                </xsl:for-each>
                <xsl:call-template name="loop">
                  <xsl:with-param name="var">
                    <xsl:value-of select="count(//DLHDon/NDHDon/DSHHDVu/HHDVu)"/>
                  </xsl:with-param>
                </xsl:call-template>
                <tr>
                  <td align="right" colspan="5" class= "boxSmall">
                    <font class="labelBold" >Cộng tiền hàng</font>
                    <font class="labelItalic" >(Total amount):</font>
                  </td>
                  <td align="right" class= "boxSmall itemNormal">
                    <xsl:if test="DLHDon/NDHDon/TToan /TgTCThue != 'null' and DLHDon/NDHDon/TToan /TgTCThue >= 0">
                      <xsl:value-of select="format-number(DLHDon/NDHDon/TToan /TgTCThue, '###.##0,#########')"/>
                    </xsl:if>
                  </td>
                </tr>
                <xsl:choose>
                  <xsl:when test="DLHDon/NDHDon/TToan/THTTLTSuat/LTSuat != 'null'">
                    <xsl:for-each select="DLHDon/NDHDon/TToan/THTTLTSuat/LTSuat">
                      <tr>
                        <td align="center"  colspan="2" class= "boxSmall labelNormal">
                          <font class="labelBold">Thuế suất GTGT</font>
                          <font class="labelItalic">(VAT rate):</font>
                          <font class="labelNormal">

                            <xsl:choose>
                              <xsl:when test="TSuat != 'null' and (TSuat = '0%' or TSuat = '5%' or TSuat = '10%')">
                                <xsl:value-of select="TSuat"/>
                              </xsl:when>
                              <xsl:otherwise>
                                .....\.....%
                              </xsl:otherwise>
                            </xsl:choose>
                          </font>
                        </td>
                        <td align="right"  colspan="3" class= "boxSmall labelNormal">
                          <font style= "" class="labelBold">Tiền thuế GTGT</font>
                          <font style= "" class="labelItalic">(VAT amount):</font>
                        </td>
                        <xsl:choose>
                          <xsl:when test="TSuat != 'null' and (TSuat = '0%' or TSuat = '5%' or TSuat = '10%')">
                            <td align="right" colspan="1" class= "boxSmall itemNormal">
                              <xsl:if test="TThue != 'null' and TThue >= 0">
                                <font class = "itemNormal">
                                  <xsl:value-of select="format-number(TThue, '###.##0,#########')"/>
                                </font>
                              </xsl:if>
                            </td>
                          </xsl:when>
                          <xsl:otherwise>
                            <td align="right" colspan="1" class= "boxSmall itemNormal">
                              .....\.....
                            </td>
                          </xsl:otherwise>
                        </xsl:choose>
                      </tr>
                    </xsl:for-each>
                  </xsl:when>
                  <xsl:otherwise>
                    <tr>
                      <td align="center"  colspan="2" class= "boxSmall labelNormal">
                        <font class="labelBold">Thuế suất GTGT</font>
                        <font class="labelItalic">(VAT rate):</font>
                        <font class="labelNormal">
                          ..........%
                        </font>
                      </td>
                      <td align="right"  colspan="3" class= "boxSmall labelNormal">
                        <font style= "" class="labelBold">Tiền thuế GTGT</font>
                        <font style= "" class="labelItalic">(VAT amount):</font>

                      </td>
                      <td align="right" colspan="1" class= "boxSmall itemNormal">
                      </td>
                    </tr>
                  </xsl:otherwise>
                </xsl:choose>
                <tr>
                  <td align="right" colspan="5" class= "boxSmall">
                    <font class="labelBold" >TỔNG CỘNG TIỀN THANH TOÁN</font>
                    <font class="labelItalic" >(Total payment):</font>
                  </td>
                  <td align="right" class= "boxSmall itemNormal">
                    <xsl:if test="DLHDon/NDHDon/TToan /TgTTTBSo != 'null' and DLHDon/NDHDon/TToan /TgTTTBSo >= 0">
                      <xsl:value-of select="format-number(DLHDon/NDHDon/TToan /TgTTTBSo, '###.##0,#########')"/>
                    </xsl:if>
                  </td>
                </tr>
                <tr>
                  <td align="left" colspan="9" class= "boxSmall">
                    <font class="labelBold" >Số tiền viết bằng chữ</font>
                    <font class="labelItalic" >(Amount in words):</font>
                    <font class = "itemNormal">
                      <xsl:value-of select="DLHDon/NDHDon/TToan /TgTTTBChu"/>
                    </font>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td colspan="3">
              <table width="100%">
                <tr>
                  <td align="center" width="50%" style="vertical-align:top">
                    <font class="labelBold" text-align="top">Người mua hàng</font>
                    <font class="labelItalic" >(Buyer)</font>
                    <br/>
                    <font class="labelItalic" >(Ký, ghi rõ họ tên)</font>
                    <br/>
                    <font class="labelItalic" >(Sign, full name)</font>
                  </td>
                  <td  align="center" width="50%">
                    <font class="labelBold" >Người bán hàng</font>
                    <font class="labelItalic" >(Seller)</font>
                    <br/>
                    <font class="labelItalic" >(Ký, ghi rõ họ tên)</font>
                    <br/>
                    <font class="labelItalic" >(Sign, full name)</font>
                  </td>
                </tr>
                <tr>
                  <td align="center">
                    <xsl:if test="not((//*[local-name()='X509SubjectName'])[2]) = false() and (//*[local-name()='X509SubjectName'])[2] != ''">
                      <div class="BG">
                        <div style="height: 30px"  ></div>

                        <font class="labelBold" style="font-weight:bold;color: #FF0000;word-wrap:break-word">
                          Ký bởi <xsl:call-template name="tokenize">
                            <xsl:with-param name="pText" select="(//*[local-name()='X509SubjectName'])[2]"/>
                          </xsl:call-template>
                        </font>

                        <div style="height: 10px"  ></div>
                      </div>
                    </xsl:if>
                  </td>
                  <td align="center" width="50%">
                    <div class="BG">
                      <div style="height: 30px"  ></div>
                      <xsl:if test="DLHDon/NDHDon/NBan/Ten != 'null'">
                        <font class="labelBold" style="font-weight:bold;color: #FF0000;word-wrap:break-word">
                          Ký bởi <xsl:call-template name="tokenize">
                            <xsl:with-param name="pText" select="(//*[local-name()='X509SubjectName'])[1]"/>
                          </xsl:call-template>
                        </font>
                        <br/>
                        <font class="labelBold" style="font-weight:bold;color: #FF0000;word-wrap:break-word">
                          Ký ngày
                          <xsl:if test="DLHDon/TTChung/NLap != 'null' and DLHDon/TTChung/NLap != ''">
                            <xsl:value-of select="concat(substring(DLHDon/TTChung/NLap, 9, 2),'/',substring(DLHDon/TTChung/NLap, 6, 2),'/',substring(DLHDon/TTChung/NLap, 1, 4))"/>
                          </xsl:if>
                        </font>
                      </xsl:if>
                      <div style="height: 10px"  ></div>
                    </div>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td colspan="3">
              <table width="100%" style="font-size: 10pt; padding-top: 10mm">
                <tr>
                  <td align="center" style="border-top: 2pt dotted">
                    <font font-size="7pt" class="labelItalic"> Đơn vị cung cấp dịch vụ Hóa đơn điện tử: Tập đoàn Công nghiệp - Viễn thông Quân đội (Viettel), MST: 0100109106 </font>
                  </td>
                </tr>
                <tr>
                  <td align="center" >
                    <font font-size="7pt" class="labelItalic">
                      Tra cứu hóa đơn điện tử tại Website: <xsl:choose>
                        <xsl:when test="not(DLHDon/NDHDon/NBan/TTKhac/TTin[TTruong='Link tra cứu người bán']/DLieu) = false() and DLHDon/NDHDon/NBan/TTKhac/TTin[TTruong='Link tra cứu người bán']/DLieu != ''">
                          <xsl:value-of select="DLHDon/NDHDon/NBan/TTKhac/TTin[TTruong='Link tra cứu người bán']/DLieu"/>
                        </xsl:when>
                        <xsl:otherwise>
                          https://sinvoice.viettel.vn/tracuuhoadon
                        </xsl:otherwise>
                      </xsl:choose>, Mã số bí mật:
                    </font>
                    <font font-size="7pt" class = "itemNormal">
                      <xsl:value-of
                          select ="DLHDon/TTChung/TTKhac/TTin[TTruong='Mã số bí mật']/DLieu" />
                    </font>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:transform>