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
			
			cid="45";
			ListBoxhbzs.SqlStr="select "+cid+",chcode,chtopic from "+GetChannelDataTableName(cid)+" where chstate=0 order by chputdate desc";
			
			cid="47";
			ListBoxlscj.SqlStr="select "+cid+",chcode,chtopic from "+GetChannelDataTableName(cid)+" where chstate=0 order by chputdate desc";
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
                <td height="25" align="left" class="font1225_black"><!--#include file="traceup.aspx"--></td>
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
				<div style="width:526px;overflow:hidden; padding-top:5px">
				  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="100%"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="93%" height="30" align="left" class="font1220B_green"><img src="images/sub_hbkj_03.gif" width="19" height="19" align="absmiddle">&nbsp;环保知识</td>
                          <td width="7%" align="right"><a href="redirect.aspx?cid=45"><img src="images/sub_hbkj_06.gif" width="38" height="20" border="0"></a></td>
                        </tr>
                        <tr bgcolor="#E5E5E5">
                          <td height="3" colspan="2"> </td>
                          </tr>
                        <tr align="center">
                          <td colspan="2">
						  <div style="width:500px; height:125px; overflow:hidden; padding-top:5px">
						    <table width="100%"  border="0" cellpadding="0" cellspacing="0" class="font1225_black">
                              <tr align="left">
                                <td width="23%" valign="top" class="font1225B_gray"><table width="102"  border="0" cellpadding="1" cellspacing="1" bgcolor="#D2CDD1">
                                  <tr>
                                    <td bgcolor="#FFFFFF"><img src="images/sub_jgsz_07.gif" width="98" height="98"></td>
                                  </tr>
                                </table></td>
                                <td width="77%" valign="top">
                                
<!--环保知识列表-->                                
<G:ListBox id="ListBoxhbzs" rows="4" contentfield="chtopic" showchars="27" style="width:383px; height:125px; overflow:hidden;" runat="server">
<G:Template id="Templatehbzs" runat="server">
<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="font1225_black">
    <tr align="left" class="sub_underline">
    <td width="10%"><img src="images/sub_hbkj_05.gif" width="10" height="10" hspace="8" align="absmiddle"></td>
    <td width="90%"><a href="sub_news.aspx?cid=*&id=*">*</a></td>
    </tr>
</table>
</G:Template>
</G:ListBox>
<!--环保知识列表-->								
								
								</td>
                              </tr>
                            </table>
						  </div>
						  </td>
                        </tr>
						
                      </table></td>
                      </tr>
                    <tr>
                      <td height="8"> </td>
                      </tr>
                    <tr>
                      <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="93%" height="30" align="left" class="font1220B_green"><img src="images/sub_hbkj_03.gif" width="19" height="19" align="absmiddle">&nbsp;绿色创建</td>
                          <td width="7%" align="right"><a href="redirect.aspx?cid=47"><img src="images/sub_hbkj_06.gif" width="38" height="20" border="0"></a></td>
                        </tr>
                        <tr bgcolor="#E5E5E5">
                          <td height="3" colspan="2"></td>
                        </tr>
                        <tr align="center">
                          <td colspan="2">
                            <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td width="50%">
								<div style="width:256px; height:125px; overflow:hidden; padding-top:5px">
								  <table width="100%"  border="0" cellpadding="0" cellspacing="0" class="font1225_black">
                                    <tr align="left">
                                      <td colspan="2"><img src="images/sub_jgsz_08.gif" width="234" height="127"></td>
                                      </tr>
                                  </table>
								</div>
								</td>
                                <td width="50%" align="right">
                                
<!--绿色创建列表-->
<G:ListBox id="ListBoxlscj" rows="5" contentfield="chtopic" showchars="16" style="width:256px; height:125px; overflow:hidden; padding-top:5px" runat="server">
<G:Template id="Templatelscj" runat="server">
<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="font1225_black">
<tr align="left">
    <td width="10%"><img src="images/sub_hbkj_04.gif" width="5" height="8" hspace="8" align="absmiddle"></td>
    <td width="90%"><a href="sub_news.aspx?cid=*&id=*">*</a></td>
</tr>
</table>
</G:Template>
</G:ListBox>
<!--绿色创建列表-->								
								
								</td>
                              </tr>
                            </table></td>
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
