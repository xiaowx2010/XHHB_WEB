<%@ Page Language="c#" Debug="true" %>
<%@ Register TagPrefix="G" Namespace="Guangye.ContentManagement.WebFront" Assembly="Guangye.ContentManagement.FrontModule" %>
<HTML>
	<HEAD>
		<G:HtmlHead id="HeadXuHui" runat="server"></G:HtmlHead>
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<!--#include file="func.aspx"-->
	<!--#include file="../insql.aspx"-->
	<script runat="server" language="C#">
		private void Page_Load(object sender,System.EventArgs e)
		{
			cid = GetQueryString("cid","0");
			id = GetQueryString("id","0");
			HeadXuHui.ChannelCode=cid;
			TraceUpXuHui.ChannelCode=cid;
			LeftFree.Url="tree.aspx?cid="+cid;
			
			ListBoxlb.SqlStr="select chtopic from "+GetChannelDataTableName(cid)+" where chstate=0 order by chputdate desc";
		}
	</script>

<body topmargin="0" leftmargin="0" class="page_bgline">
<form id="FormXuHui" runat="server">
<table width="820"  border="0" align="center" cellpadding="0" cellspacing="0">
  <!--#include file="head.aspx"-->
  <tr>
    <td background="images/index_01.gif">&nbsp;</td>
    <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr valign="top">
        <td width="190" bgcolor="#BEE6A7" class="left_bottombg"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="images/sub_hbdt_01.gif" width="190" height="24"></td>
          </tr>
          <tr>
            <td align="center"><!--#include file="left.aspx"--></td>
          </tr>
        </table></td>
        <td width="590"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="175"><img src="images/sub_hbdt_12.gif" width="175" height="24"></td>
            <td width="146" align="center" background="images/sub_hbdt_13.gif" class="font1220_green"><!--#include file="date.aspx"--></td>
            <td width="269"><img src="images/sub_hbdt_14.gif" width="269" height="24"></td>
          </tr>
          <tr>
            <td colspan="3"><img src="images/sub_hbdt_15.gif" width="590" height="8"></td>
            </tr>
          <tr align="center">
            <td colspan="3"><table width="556"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="25" align="left"><!--#include file="traceup.aspx"--></td>
              </tr>
              <tr>
                <td height="2" bgcolor="#BFE7A8"> </td>
              </tr>
              <tr>
                <td align="left" style="padding-left:20px; "><img src="images/sub_hbdt_17.gif" width="7" height="6"></td>
              </tr>
              <tr>
                <td height="10"> </td>
              </tr>
              <tr>
                <td><img src="images/sub_hbkj_02.gif" width="556" height="12"></td>
              </tr>
              <tr>
                <td align="center" background="images/sub_hbdt_23.gif">
				<div style="width:526px; overflow:hidden; padding-top:5px">
				  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td><table width="526" height="244"  border="0" cellpadding="0" cellspacing="1" bgcolor="#E2E2E2">
                            <tr>
                              <td align="center" valign="middle" bgcolor="#FFFFFF"><p><img src="images/sub_qjt_03.jpg" width="520" height="238"></p>
                               </td>
                            </tr>
                          </table></td>
                        </tr>
                        <tr>
                          <td align="center" class="font1225_gray">上海政府将对餐厨垃圾全程监控</td>
                        </tr>
                      </table></td>
                    </tr>
                    <tr>
                      <td><table width="100%"  border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
                        <tr>
                          <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="4%"><img src="images/sub_hbkj_03.gif" width="19" height="19"></td>
                              <td width="9%" align="center" class="font1220B_green">全景图</td>
                              <td width="73%">&nbsp;</td>
                              <td width="14%"></td>
                            </tr>
                          </table></td>
                        </tr>
                        <tr>
                          <td height="6"></td>
                        </tr>
                        <tr>
                          <td height="3" bgcolor="#E5E5E5"></td>
                        </tr>
                        <tr>
                          <td>
                          
<!--全景图列表-->                          
<G:ListBox id="ListBoxlb" rows="4" contentfield="chtopic" showchars="25" style="width:525px;height:100px;overflow:hidden;padding-top:10px;" runat="server">
<G:Template id="Templatelb" runat="server">
<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="font1220_gray">
<tr class="sub_underline">
    <td width="6%" align="center" valign="top" style="padding-top:6px; "><img src="images/sub_hbkj_04.gif" width="5" height="8" hspace="8" align="absmiddle"></td>
    <td width="94%" align="left">*</td>
</tr>
</table>
</G:Template>
<G:NavStyle5 id="NavStyle55" prevtext="上一页" nexttext="上一页" runat="server"></G:NavStyle5>
</G:ListBox>
<!--全景图列表-->                          
                          
                          </td>
                        </tr>
                      </table></td>
                    </tr>
                  </table>
</div>
				</td>
              </tr>
              <tr>
                <td><img src="images/sub_hbdt_27.gif" width="557" height="13"></td>
              </tr>
            </table></td>
          </tr>
        </table>          </td>
      </tr>
    </table></td>
    <td background="images/index_02.gif">&nbsp;</td>
  </tr>
  <!--#include file="foot.aspx"-->
</table>
</form>
</body>
</html>
