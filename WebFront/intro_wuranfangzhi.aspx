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
			
			cid="30";
			ListBoxwrfz.SqlStr="select "+cid+",chcode,chtopic from "+GetChannelDataTableName(cid)+" where chstate=0 order by chputdate desc";
			
			cid="31";
			ListBoxdaqi.SqlStr="select "+cid+",chcode,chtopic from "+GetChannelDataTableName(cid)+" where chstate=0 order by chputdate desc";
			
			cid="32";
			ListBoxzaosheng.SqlStr="select "+cid+",chcode,chtopic from "+GetChannelDataTableName(cid)+" where chstate=0 order by chputdate desc";
			
			cid="33";
			ListBoxgtfw.SqlStr="select "+cid+",chcode,chtopic from "+GetChannelDataTableName(cid)+" where chstate=0 order by chputdate desc";
			
			cid="35";
			Gridzxzz.SqlStr="select "+cid+",chcode,chtopic from "+GetChannelDataTableName(cid)+" where chstate=0 order by chputdate desc";
			
			cid="36";
			Gridrcgl.SqlStr="select "+cid+",chcode,chtopic from "+GetChannelDataTableName(cid)+" where chstate=0 order by chputdate desc";
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
                      <td width="50%"><table width="98%"  border="0" cellpadding="0" cellspacing="0" class="font1225_black">
                        <tr>
                          <td width="85%" height="30" align="left"><span class="font1220B_green"><img src="images/sub_hbkj_03.gif" width="19" height="19" align="absmiddle">&nbsp;水污染防治</span></td>
                          <td width="15%" align="right"><a href="redirect.aspx?cid=30"><img src="images/sub_hbkj_06.gif" width="38" height="20" border="0"></a></td>
                        </tr>
						<tr bgcolor="#E5E5E5">
                          <td height="3" colspan="2"> </td>
                          </tr>
                        <tr align="left">
                          <td colspan="2">
						  
<!--水污染防治-->						  
<G:ListBox id="ListBoxwrfz" rows="4" contentfield="chtopic" showchars="17" style="width:256px; height:100px; overflow:hidden; padding-top:5px" runat="server">
<G:Template id="Templatewrfz" runat="server">
<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="font1225_black">
<tr align="left">
    <td width="10%"><img src="images/sub_hbkj_05.gif" width="10" height="10" hspace="8" align="absmiddle"></td>
    <td width="90%"><a href="sub_news.aspx?cid=*&id=*">*</a></td>
</tr>
</table>
</G:Template>
</G:ListBox>
<!--水污染防治-->						  
						  
						  </td>
                          </tr>
                      </table></td>
                      <td width="50%" align="right"><table width="98%"  border="0" cellpadding="0" cellspacing="0" class="font1225_black">
                        <tr>
                          <td width="85%" height="30" align="left"><span class="font1220B_green"><img src="images/sub_hbkj_03.gif" width="19" height="19" align="absmiddle">&nbsp;大气污染防治</span></td>
                          <td width="15%" align="right"><a href="redirect.aspx?cid=31"><img src="images/sub_hbkj_06.gif" width="38" height="20" border="0"></a></td>
                        </tr>
						<tr bgcolor="#E5E5E5">
                          <td height="3" colspan="2"> </td>
                          </tr>
                        <tr align="right">
                          <td colspan="2">
                          
<!--大气污染防治-->                          
<G:ListBox id="ListBoxdaqi" rows="4" contentfield="chtopic" showchars="17" style="width:256px; height:100px; overflow:hidden; padding-top:5px" runat="server">
<G:Template id="Templatedaqi" runat="server"> 
<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="font1225_black">
    <tr align="left">
    <td width="10%"><img src="images/sub_hbkj_05.gif" width="10" height="10" hspace="8" align="absmiddle"></td>
    <td width="90%"><a href="sub_news.aspx?cid=*&id=*">*</a></td>
    </tr>
</table>
</G:Template>
</G:ListBox>
<!--大气污染防治-->						  
						  
						  </td>
                        </tr>
                      </table></td>
                    </tr>
                    <tr>
                      <td height="8" colspan="2"> </td>
                      </tr>
                    <tr>
                      <td width="50%"><table width="98%"  border="0" cellpadding="0" cellspacing="0" class="font1225_black">
                        <tr>
                          <td width="85%" height="30" align="left"><span class="font1220B_green"><img src="images/sub_hbkj_03.gif" width="19" height="19" align="absmiddle">&nbsp;噪声污染防治</span></td>
                          <td width="15%" align="right"><a href="redirect.aspx?cid=32"><img src="images/sub_hbkj_06.gif" width="38" height="20" border="0"></a></td>
                        </tr>
						<tr bgcolor="#E5E5E5">
                          <td height="3" colspan="2"> </td>
                          </tr>
                        <tr align="left">
                          <td colspan="2">
                          
<!--噪声污染防治-->                          
<G:ListBox id="ListBoxzaosheng" rows="4" contentfield="chtopic" showchars="17" style="width:256px; height:100px; overflow:hidden; padding-top:5px" runat="server">
<G:Template id="Template" runat="server">
<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="font1225_black">
<tr align="left">
    <td width="10%"><img src="images/sub_hbkj_05.gif" width="10" height="10" hspace="8" align="absmiddle"></td>
    <td width="90%"><a href="sub_news.aspx?cid=*&id=*">*</a></td>
</tr>
</table>
</G:Template>
</G:ListBox>
<!--噪声污染防治-->						  
						  
						  </td>
                          </tr>
                      </table></td>
                      <td width="50%" align="right"><table width="98%"  border="0" cellpadding="0" cellspacing="0" class="font1225_black">
                        <tr>
                          <td width="85%" height="30" align="left"><span class="font1220B_green"><img src="images/sub_hbkj_03.gif" width="19" height="19" align="absmiddle">&nbsp;固体废物污染防治</span></td>
                          <td width="15%" align="right"><a href="redirect.aspx?cid=33"><img src="images/sub_hbkj_06.gif" width="38" height="20" border="0"></a></td>
                        </tr>
						<tr bgcolor="#E5E5E5">
                          <td height="3" colspan="2"> </td>
                          </tr>
                        <tr align="right">
                          <td colspan="2">
                          
<!--固体废物污染防治-->                          
<G:ListBox id="ListBoxgtfw" rows="4" contentfield="chtopic" showchars="17" style="width:256px; height:100px; overflow:hidden; padding-top:5px" runat="server">
<G:Template id="Templategtfw" runat="server">
<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="font1225_black">
    <tr align="left">
    <td width="10%"><img src="images/sub_hbkj_05.gif" width="10" height="10" hspace="8" align="absmiddle"></td>
    <td width="90%"><a href="sub_news.aspx?cid=*&id=*">*</a></td>
    </tr>
</table>
</G:Template>
</G:ListBox>
<!--固体废物污染防治-->						  
						  
						  </td>
                        </tr>
                      </table></td>
                    </tr>
					    
                    <tr>
                      <td height="8" colspan="2"> </td>
                      </tr>
					  <tr>
                      <td colspan="2"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="93%" height="30" align="left" class="font1220B_green"><img src="images/sub_hbkj_03.gif" width="19" height="19" align="absmiddle">&nbsp;重点监管单位动态</td>
                          <td width="7%" align="right"><a href="redirect.aspx?cid=34"><img src="images/sub_hbkj_06.gif" width="38" height="20" border="0"></a></td>
                        </tr>
                        <tr bgcolor="#E5E5E5">
                          <td height="3" colspan="2"> </td>
                          </tr>
                        <tr align="center" class="sub_underline">
                          <td colspan="2" align="left">
						    <table width="100%"  border="0" cellpadding="0" cellspacing="0" class="font1225_black">
                              <tr align="left">
                                <td colspan="2" class="font1225B_gray">专项整治</td>
                                <td colspan="2">&nbsp;</td>
                              </tr>
                            </table>
                            
<!--专项整治-->                            
<G:Grid id="Gridzxzz" rows="2" cols="2" contentfield="chtopic" showchars="18" style="width:520px; height:80px; overflow:hidden; padding-top:5px" runat="server">
<G:Template id="Templatezxzz" runat="server">
<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="font1225_black">
    <tr align="left" >
    <td width="25"><img src="images/sub_hbkj_04.gif" width="5" height="8" hspace="8" align="absmiddle"></td>
    <td width="260"><a href="sub_news.aspx?cid=*&id=*">*</a></td>
    </tr>
</table>
</G:Template>
</G:Grid>
<!--专项整治-->

						  </td>
                        </tr>
						<tr align="center" class="sub_underline">
                          <td colspan="2" align="left">
						    <table width="100%"  border="0" cellpadding="0" cellspacing="0" class="font1225_black">
                              <tr align="left">
                                <td colspan="2" class="font1225B_gray">日常管理</td>
                                <td colspan="2">&nbsp;</td>
                              </tr>
                            </table>
                            
<!--日常管理-->                            
<G:Grid id="Gridrcgl" rows="2" cols="2" contentfield="chtopic" showchars="18" style="width:520px; height:80px; overflow:hidden; padding-top:5px" runat="server">
<G:Template id="Templatercgl" runat="server">
<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="font1225_black"> 
    <tr align="left">
    <td width="25"><img src="images/sub_hbkj_04.gif" width="5" height="8" hspace="8" align="absmiddle"></td>
    <td width="260"><a href="sub_news.aspx?cid=*&id=*">*</a></td>
    </tr>
</table>
</G:Template>
</G:Grid>
<!--日常管理-->						    
						    
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
