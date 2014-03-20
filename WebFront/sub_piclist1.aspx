<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
			
			ContainListtp.DataTable = GetPicList(0,cid);
		}
	</script>

<body>
<form id="FormXuHui" runat="server">
<!--#include file="head.aspx"-->

<table width="820"  border="0" align="center" cellpadding="0" cellspacing="0">
  
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
                <td height="25" align="left"></td>
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
                <td align="center" valign="top" background="images/sub_hbdt_23.gif">
                
<!--图片集-->                
<G:ContainList id="ContainListtp" rows="4" cols="4" alert="本栏目暂时没有内容！" itemstyle="height:100px;width:120px" style="width:526px; overflow:hidden; padding-top:5px" runat="server">
<G:PicNews id="PicNewstp" imgstr="images/sub_pp01.JPG" imgfield="imgstr" imgwidth="102" imgheight="90" runat="server">
<G:Template id="Templatetp" runat="server">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
<tr>
    <td align="center">
		<table  border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td class="sub_ppliebiao_bj"><div align="center">*</div></td>
			</tr>
			<tr>
				<td align="center"><a href="javascript:__doOpenArticle('pop_news.aspx?cid=*&id=*')">*</a></td>
			</tr>
		</table>
    </td>
</tr>
</table>
</G:Template>
</G:PicNews>
<G:NavStyle5 id="NavStyle55" prevtext="上一页" nexttext="下一页" runat="server"></G:NavStyle5>
</G:ContainList>
<!--图片集--> 				  
				  
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
  
</table>

<!--#include file="foot.aspx"-->
</form>
</body>
</html>
