<?xml version='1.0' encoding='UTF-8' ?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:inv="http://laphoadon.gdt.gov.vn/2014/09/invoicexml/v1" xmlns:ds="http://www.w3.org/2000/09/xmldsig#">
  <xsl:strip-space elements="*"/>
  <xsl:decimal-format decimal-separator="," grouping-separator="."/>
  <xsl:template name="tokenizeString">
        <xsl:param name="string"/>
        <xsl:param name="index"/>
        <xsl:choose>
            <xsl:when test="string-length($string) > 1">  
                <td class="labelBold">
					<xsl:value-of select="substring($string, $index, 1)"/> 
				</td>
				<xsl:call-template name="tokenizeString">
					<xsl:with-param name="string" select="substring($string, $index + 1)"/>
					<xsl:with-param name="index" select="$index"/>
				</xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <td class="labelBold">
					<xsl:value-of select="$string"/>
				</td>
            </xsl:otherwise>
        </xsl:choose>
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
  <xsl:template name="loop">
    <xsl:param name="var"></xsl:param>
    <xsl:choose>
      <xsl:when test="$var &lt; 7  and $var &gt; 0">
        <tr>
          <td align="center" class= "boxSmall">
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
  <xsl:template match="inv:invoice">
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
          font-size:18px;
          }
          .titleInvoice{
          font-weight:bold;
          font-style: italic;
          font-size:16px;
          }
          .serif {
          font-family: "Arial"; <!-- "Times New Roman", Times, serif; -->
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
          <!-- border: 3px double; -->
          width:858.267px;
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
          <!-- border-style: double; -->
          <!-- border-width: medium; -->
          }
          .boxSmall{
          color: #000000;
          }


          .borderBottom{
          border-bottom: 2px dotted #4C3F57;
          }
          .BG {
          <!--opacity: 0.3;-->
          background-image: url(signature.png);
          background-repeat: no-repeat;
          background-position: center center;
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
        <div id='section-to-print' ALIGN="center" 
              class = "serif boxLarge" 
              style="background-image:url(watermark.png); background-repeat:no-repeat;background-size:100% 100%">
        <table style="margin:20px; width:95%">
          <tr >
            <td colspan="2" width="72%" align="left" class="header" style="color:#000000;padding-left:5px;padding-top:15px" >
              <font class="invoiceName" style="font-size: 20pt;">
                H??A ????N (GTGT)
              </font>
              <div style="padding-top:5px">
				<font class="labelBold" style="padding-top:2px">B???n th??? hi???n c???a h??a ????n ??i???n t???</font>
			  </div>
			  <div style="padding-top:5px">
				<xsl:choose>
					<xsl:when test="inv:invoiceData/inv:invoiceIssuedDate !='null'">
					  <font class="labelNormal">Ng??y </font>
					  <xsl:value-of select="substring(inv:invoiceData/inv:invoiceIssuedDate, 9, 2)"/>
					  <font class="labelNormal">th??ng </font>
					  <xsl:value-of select="substring(inv:invoiceData/inv:invoiceIssuedDate, 6, 2)"/>
					  <font class="labelNormal">n??m </font>
					  <xsl:value-of select="substring(inv:invoiceData/inv:invoiceIssuedDate, 1, 4)"/>
					</xsl:when>
					<xsl:otherwise>
					  Ng??y ..... th??ng ..... n??m ....
					</xsl:otherwise>
				  </xsl:choose>
			  </div>
              

            </td>
            <td width="28%" style="vertical-align:center;padding-right:10px">
              <!--<table align="right" class= "boxSmall dataInfoInvoice" style = "border: none !important;">-->
              <table align="right" class= "boxSmall" style = "border: none !important;">
                <tr style="vertical-align:center">
                  <!--<td align="left" class="labelBold">M???u s??? (Form): </td>-->
                  <td align="left">
                    <font class="labelNormal" >M???u s???: </font>
                  </td>
                  <td align="left" class = "itemBold">
                    <xsl:value-of select="inv:invoiceData/inv:templateCode"/>
                  </td>
                </tr>
                <tr>
                  <td align="left">
                    <font class="labelNormal" >K?? hi???u: </font>
                  </td>
                  <td align="left" class = "itemBold">
                    <xsl:value-of select="inv:invoiceData/inv:invoiceSeries"/>
                  </td>
                </tr>
                <tr>
                  <td align="left">
                    <font class="labelNormal" >S??? h??a ????n: </font>
                  </td>
                  <td align="left" class = "itemBold">
                    <xsl:value-of select="inv:invoiceData/inv:invoiceNumber"/>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr class = "borderBottom">
            <td colspan="3" style="padding-left:5px;padding-top:15px">
              <table width="100%">
                <tr>
                  <td colspan="3" >
                    <table>
                      <tr>
                        <td>
                          <font class="labelBold" >????n v??? b??n h??ng: </font>
                          <font class="labelBold" >
                            <xsl:value-of select="inv:invoiceData/inv:seller/inv:sellerLegalName"/>
                          </font>
                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr>
                  <td colspan="3">
                    <table>
                      <tr>
                        <td style="padding-top:2px">
                          <font class="labelNormal" >?????a ch???: </font>
                          <font class="labelBold" style="font-size:11pt">
                            <xsl:value-of select="inv:invoiceData/inv:seller/inv:sellerAddressLine"/>
                          </font>
                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr>
                  <td colspan="3">
                    <table>
                      <tr>
                        <td style="padding-top:2px">
                          <font class="labelNormal" >M?? s??? thu???: </font>
                        </td>
						<td >
							<table>
								<!-- <tr style="border: 1px solid black; padding-left:2px; padding-right:2px"> -->
								<tr style="padding-left:2px; padding-right:2px">
									<xsl:call-template name="tokenizeString">
										<xsl:with-param name="string" select="inv:invoiceData/inv:seller/inv:sellerTaxCode"/>
										<xsl:with-param name="index" select="1"/>
									</xsl:call-template>
								</tr>
							</table>
						</td>
                      </tr>
                    </table>
                  </td>
                </tr>
				<tr>
                  <td colspan="3" style="padding-top:2px;padding-bottom:5px">
                    <table width="100%">
                      <tr>
                        <td width = "35%" >
                          <font class="labelNormal" >S??? t??i kho???n: </font>
                          <font class="labelNormal">
                            <xsl:value-of select="inv:invoiceData/inv:seller/inv:sellerBankAccount"/>
                          </font>
                        </td>
                        <td width = "65%" >
                          <font class="labelNormal" >T???i: </font>
                          <font class="labelNormal">
                            <xsl:value-of select="inv:invoiceData/inv:seller/inv:sellerBankName"/>
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
            <td colspan="3" style="padding-left:5px;padding-top:5px">
              <table width="100%">
                <tr>
                  <td colspan="2">
                    <table width="100%">
                      <tr>
                        <td colspan="3">
                          <font class="labelNormal" >H??? t??n ng?????i mua h??ng: </font>
                          <font class="itemNormal">
                            <xsl:value-of select="inv:invoiceData/inv:buyer/inv:buyerDisplayName"/>
                          </font>
                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr>
                  <td colspan="2" style="padding-top:2px">
                    <table align="left" width="100%">
                      <tr>
                        <td>
                          <font class="labelNormal" >????n v??? mua: </font>
                          <font class="itemNormal">
                            <xsl:value-of select="inv:invoiceData/inv:buyer/inv:buyerLegalName"/>
                          </font>
                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr>
                  <td colspan="2" style="padding-top:2px">
                    <table align="left" width="100%">
                      <tr>
                        <td>
                          <font class="labelNormal" >?????a ch???: </font>
                          <font class="itemNormal">
                            <xsl:value-of select="inv:invoiceData/inv:buyer/inv:buyerAddressLine"/>
                          </font>
                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr>
                  <td colspan="2" style="padding-top:2px">
                    <table width="100%">
                      <tr>
                        <td  style="width: 35%">
                          <font class="labelNormal" >S??? t??i kho???n: </font>
						  <font class="itemNormal">
                            <xsl:value-of select="inv:invoiceData/inv:buyer/inv:buyerBankAccount"/>
                          </font>
                        </td>
                        <td style="width: 65%">
                          <font class="labelNormal" >T???i ng??n h??ng: </font>
                          <font class="itemNormal">
                            <xsl:value-of select="inv:invoiceData/inv:buyer/inv:buyerBankName"/>
                          </font>
                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr>
                  <td colspan="3" style="padding-top:2px">
                    <table width="100%">
                      <tr>
                        <td  style="width: 35%">
                          <font class="labelNormal" >H??nh th???c thanh to??n: </font>
                          <font class="itemNormal">
                            <xsl:value-of select="inv:invoiceData/inv:payments/inv:payment/inv:paymentMethodName"/>
                          </font>
                        </td>
                        <td style="width: 65%">
                          <font class="labelNormal" >M?? s??? thu???: </font>
                          <font class="itemNormal">
                            <xsl:value-of select="inv:invoiceData/inv:buyer/inv:buyerTaxCode"/>
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
                <tr width="100%" >
                  <th width="5%" align="center" class= "boxSmall"  style="text-align: center;height:40">
                    <font class="labelBold" >STT</font>
                  </th>
                  <th align="center" class= "boxSmall"  style="text-align: center">
                    <font class="labelBold" >T??n h??ng h??a, d???ch v???</font>
                  </th>
                  <th width="11%" align="center" class= "boxSmall"  style="text-align: center">
                    <font class="labelBold" >????n v??? t??nh</font>
                  </th>
                  <th width="9%" align="center" class= "boxSmall"  style="text-align: center">
                    <font class="labelBold" >S??? l?????ng</font>
                  </th>
                  <th width="12%" align="center" class= "boxSmall"  style="text-align: center">
                    <font class="labelBold" >????n gi??</font>
                  </th>
                  <th width="14%" align="center" class= "boxSmall"  style="text-align: center">
                    <font class="labelBold" >Th??nh ti???n</font>
                  </th>
                </tr>
                <tr width="100%">
                  <th align="center" class= "boxSmall itemNormal"  style="text-align: center">(1)</th>
                  <th align="center" class= "boxSmall itemNormal" style="text-align: center">(2)</th>
                  <th align="center" class= "boxSmall itemNormal"  style="text-align: center">(3)</th>
                  <th align="center" class= "boxSmall itemNormal" style="text-align: center">(4)</th>
                  <th align="center" class= "boxSmall itemNormal" style="text-align: center">(5)</th>
                  <th align="center" class= "boxSmall itemNormal" style="text-align: center">(6 = 4 x 5)</th>
                </tr>
                <xsl:for-each select="inv:invoiceData/inv:items/inv:item">
                  <tr>
                    <td align="center" class= "boxSmall itemNormal">
                      <xsl:choose>
                        <xsl:when test="inv:lineNumber > 0">
                          <xsl:value-of select="inv:lineNumber"/>
                        </xsl:when>
                        <xsl:otherwise>
                          <font class="labelNormal" ></font>
                        </xsl:otherwise>
                      </xsl:choose>
                    </td>
                    <td align="left" class= "boxSmall itemNormal">
                      <xsl:value-of select="inv:itemName"/>
                    </td>
                    <td align="center" class= "boxSmall itemNormal">
                      <xsl:value-of select="inv:unitName"/>
                    </td>
                    <td align="right" class= "boxSmall itemNormal">
                      <xsl:if test="inv:quantity != 'null' and inv:quantity > 0">
                        <xsl:value-of select="format-number((inv:quantity), '###.##0,#########')"/>
                      </xsl:if>
                    </td>
                    <td align="right" class= "boxSmall itemNormal">
                      <xsl:if test="inv:unitPrice != 'null' and inv:unitPrice > 0">
                        <xsl:value-of select="format-number((inv:unitPrice), '###.##0,#########')"/>
                      </xsl:if>
                    </td>
                    <td align="right" class= "boxSmall itemNormal">
                      <xsl:if test="inv:itemTotalAmountWithoutVat != 'null' and inv:itemTotalAmountWithoutVat > 0">
                        <xsl:value-of select="format-number((inv:itemTotalAmountWithoutVat), '###.##0,#########')"/>
                      </xsl:if>
                    </td>
                  </tr>
                </xsl:for-each>
                <xsl:call-template name="loop">
                  <xsl:with-param name="var">
                    <xsl:value-of select="count(//inv:invoiceData/inv:items/inv:item)"/>
                  </xsl:with-param>
                </xsl:call-template>
                <tr>
                  <td align="left" colspan="2" class= "boxSmall" style="border-bottom:none">
                    <font class="labelNormal" ></font>
                  </td>
                  <td align="left" colspan="3" class= "boxSmall">
                    <font class="labelNormal" >C???ng ti???n h??ng: </font>
                  </td>
                  <td align="right" class= "boxSmall itemNormal">
                    <xsl:if test="inv:invoiceData/inv:totalAmountWithoutVAT != 'null' and inv:invoiceData/inv:totalAmountWithoutVAT >= 0">
                      <xsl:value-of select="format-number((inv:invoiceData/inv:totalAmountWithoutVAT), '###.##0,#########')"/>
                    </xsl:if>
                  </td>
                </tr>
                <xsl:choose>
                  <xsl:when test="inv:invoiceData/inv:invoiceTaxBreakdowns/inv:invoiceTaxBreakdowns != 'null' and count(inv:invoiceData/inv:invoiceTaxBreakdowns/inv:invoiceTaxBreakdowns[inv:vatPercentage != 'null']) > 0">
                    <xsl:for-each select="inv:invoiceData/inv:invoiceTaxBreakdowns/inv:invoiceTaxBreakdowns[inv:vatPercentage != 'null']">
                      <tr>
                        <td align="left"  colspan="2" class= "boxSmall labelNormal" style="border-top:none;border-bottom:none">
                          <font style = "" class="labelNormal">Thu??? su???t GTGT: </font> 
                          <font style = "" class="labelNormal">                            
                            <xsl:choose>
                              <xsl:when test="inv:vatPercentage != 'null' and inv:vatPercentage >= 0">
                                <xsl:value-of select="inv:vatPercentage"/>%
                              </xsl:when>
                              <xsl:otherwise>
                                .........%
                              </xsl:otherwise>
                            </xsl:choose>
                          </font>
                        </td>
                        <td align="left"  colspan="3" class= "boxSmall labelNormal">
                          <font style= "" class="labelNormal">Ti???n thu??? GTGT: </font>                       
                        </td>
                        <xsl:choose>
                          <xsl:when test="inv:vatPercentage != 'null' and inv:vatPercentage >= 0">
                            <td align="right" colspan="1" class= "boxSmall itemNormal" style="border-top:none">
                              <xsl:if test="inv:vatTaxAmount != 'null' and inv:vatTaxAmount >= 0">
                                <font class = "itemNormal">
                                  <xsl:value-of select="format-number((inv:vatTaxAmount), '###.##0,#########')"/>
                                </font>
                              </xsl:if>
                            </td>
                          </xsl:when>
                          <xsl:otherwise>
                            <td align="right" colspan="1" class= "boxSmall itemNormal">
                              <!-- .....\..... -->
                            </td>
                          </xsl:otherwise>
                        </xsl:choose>
                      </tr>
                    </xsl:for-each>
                  </xsl:when>
                  <xsl:otherwise>
                    <tr>
                      <td align="left"  colspan="2" class= "boxSmall labelNormal" style="border-top:none;border-bottom:none">
                        <font style = "" class="labelNormal">Thu??? su???t GTGT: </font>
                        <font style = "" class="labelNormal">
                          ..........%
                        </font>
                      </td>
                      <td align="left"  colspan="3" class= "boxSmall labelNormal">
                        <font style= "" class="labelNormal">Ti???n thu??? GTGT: </font>                    
                      </td>
                      <td align="right" colspan="1" class= "boxSmall itemNormal">
					  <!-- .....\..... -->
                      </td>
                    </tr>
                  </xsl:otherwise>
                </xsl:choose>
                <tr>
                  <td align="left" colspan="2" class= "boxSmall" style="border-top:none">
                    <font class="labelNormal" >Ghi ch??: </font>
                  </td>
                  <td align="left" colspan="3" class= "boxSmall">
                    <font class="labelBold" >T???ng ti???n thanh to??n: </font>
                  </td>
                  <td align="right" class= "boxSmall itemNormal">
                    <xsl:if test="inv:invoiceData/inv:totalAmountWithVAT != 'null' and inv:invoiceData/inv:totalAmountWithVAT >= 0">
                      <xsl:value-of select="format-number(inv:invoiceData/inv:totalAmountWithVAT, '###.##0,#########')"/>
                    </xsl:if>
                  </td>
                </tr>
                <tr>
                  <td align="left" colspan="6" class= "boxSmall">
                    <font class="labelNormal" >S??? ti???n vi???t b???ng ch???: </font>
                    <font class = "labelItalic">
                      <xsl:value-of select="inv:invoiceData/inv:totalAmountWithVATInWords"/>
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
                  <td align="center" width="50%" style="vertical-align: top">
                    <font class="labelBold" text-align="top">Ng?????i mua h??ng </font>
                    <br/>
                    <font class="labelItalic" >(K??, ghi r?? h??? t??n)</font>
                    <br/>
                    <xsl:if test="not((//*[local-name()='X509SubjectName'])[2]) = false() and (//*[local-name()='X509SubjectName'])[2] != ''">
                      <div class="BG">
                        <div style="height: 30px"  ></div>

                        <font class="labelBold" style="font-weight:bold;color: #FF0000;word-wrap:break-word">
                          K?? b???i <xsl:call-template name="tokenize">
                            <xsl:with-param name="pText" select="(//*[local-name()='X509SubjectName'])[2]"/>
                          </xsl:call-template>
                        </font>

                        <div style="height: 10px"  ></div>
                      </div>
                    </xsl:if>
                  </td>
                  <td  align="center" width="50%">
                    <font class="labelBold" >Ng?????i b??n h??ng </font>
                    <br/>
                    <font class="labelItalic" >(K??, ????ng d???u, ghi r?? h??? t??n)</font>
                    <br/>
                    <div class="BG">
                      <div style="height: 60px"  ></div>
                      <xsl:if test="inv:invoiceData/inv:seller/inv:sellerLegalName != 'null'">
                        <font class="labelBold" style="font-weight:bold;color: #FF0000;word-wrap:break-word">
                          K?? b???i <xsl:call-template name="tokenize">
                            <xsl:with-param name="pText" select="(//*[local-name()='X509SubjectName'])[1]"/>
                          </xsl:call-template>
                        </font>
						<br/>
						<font class="labelBold" style="font-weight:bold;color: #FF0000;word-wrap:break-word">
                          K?? ng??y
                          <xsl:if test="inv:invoiceData/inv:invoiceIssuedDate != 'null' and inv:invoiceData/inv:invoiceIssuedDate != ''">
                            <xsl:value-of select="concat(substring(inv:invoiceData/inv:invoiceIssuedDate, 9, 2),'/',substring(inv:invoiceData/inv:invoiceIssuedDate, 6, 2),'/',substring(inv:invoiceData/inv:invoiceIssuedDate, 1, 4))"/>
                          </xsl:if>
                        </font>
                      </xsl:if>
                      <div style="height: 10px"  ></div>
                      <div style="height: 10px"  ></div>
                      <div style="height: 10px"  ></div>
                    </div>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td colspan="3">
			  <div style="height: 40px"  ></div>
              <table width="100%" style ="font-size: 10pt">
				<tr>
                  <td align="center" style="padding-left:20px">
                    <table width="100%" >
						<tr>
							<td>
								
							</td>
							<td width="20%" align="center" rowspan="2" style="padding-right:10px">
							  <img src="logo.png" align="middle" style="max-height:100px ; max-width: 100%"/>
							  <br/>
							</td>
						</tr>
						<tr>
							<td style="vertical-align:bottom">
								<font class="itemBold" style="font-size:8pt">
									<xsl:value-of select="inv:invoiceData/inv:seller/inv:sellerLegalName"/>
								</font>
								<div style="height: 2px"  ></div>
								<font class="itemNormal" style="font-size:8pt">
									<xsl:value-of select="inv:invoiceData/inv:seller/inv:sellerAddressLine"/>
								</font>
								<br/>
								<font class="itemNormal" style="font-size:8pt">
									T <xsl:value-of select="inv:invoiceData/inv:seller/inv:sellerPhoneNumber"/>
									 - 
									F <xsl:value-of select="inv:invoiceData/inv:seller/inv:sellerFaxNumber"/>
								</font>
								<br/>
								<font class="itemNormal" style="font-size:8pt">
									W <xsl:value-of select="inv:invoiceData/inv:seller/inv:sellerWebsite"/>
								</font>
							</td>
						</tr>
					</table>
					<div style="height: 2px"  ></div>
                  </td>
                </tr>
                <tr>
                  <td align="center" style="border-top: 1pt dotted">
					<div style="height: 2px"  ></div>
                    <font class="labelItalic"> ????n v??? cung c???p d???ch v??? H??a ????n ??i???n t???: T???p ??o??n C??ng nghi???p - Vi???n th??ng Qu??n ?????i (Viettel), MST: 0100109106 </font>
                  </td>
                </tr>
                <tr>
                  <td align="center" >
                    <font class="labelItalic">Tra c???u h??a ????n ??i???n t??? t???i Website: https://sinvoice.viettel.vn/tracuuhoadon, M?? s??? b?? m???t: </font>
                    <font class = "itemNormal">
                      <xsl:value-of
                          select ="inv:invoiceData/inv:customDefines/inv:reservationCode" />
                    </font>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
		</div>
      </body>
    </html>
  </xsl:template>
</xsl:transform>