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
	string glname="";
		private void Page_Load(object sender,System.EventArgs e)
		{
			cid = GetQueryString("cid","0");
			id = GetQueryString("id","0");
			glname=GetQueryString("glname","0");
			HeadXuHui.ChannelCode=cid;
			
			ListBoxwznr.SqlStr="select chtopic,chputdate,chcontent from gcms_ch_64 where chstate=0 and chtopic='"+glname+"'";
		}
	</script>

<body topmargin="0" leftmargin="0" class="page_bgline">
<form id="FormXuhui" runat="server">
<table width="600" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td colspan="3"><img src="images/tanchu_01.jpg" width="600" height="105"></td>
  </tr>
  <tr>
    <td width="99"><img src="images/tanchu_02.jpg" width="99" height="445"></td>
    <td width="491" align="center" valign="top">
    
<!--文章内容-->                
<G:ListBox id="ListBoxwznr" rows="1" alert="本栏目暂时没有内容！" style="width:400px;height:400px;overflow-y:auto;overflow-x:auto; overflow:hidden; padding-top:5px" runat="server">
<G:Template id="Templatewznr" runat="server">
	<table width="100%"  cellspacing="0" cellpadding="0">
    <tr>
        <td align="center" class="font14_black_B">*</td>
    </tr>
    <tr class="sub_underline">
        <td height="25" align="center" class="font12_org">发布日期：*</td>
    </tr>
    <tr>
        <td align="left">
        <p class="font1225_gray">&nbsp;&nbsp;&nbsp;&nbsp;*</p>
        </td>
    </tr>
    </table>
</G:Template>
</G:ListBox>
<!--文章内容-->     
     
     <table width="97%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="66%">&nbsp;</td>
            <td width="17%"><a href="javascript:window.print()"><img src="images/tanchu_05.jpg" width="65" height="19" border="0"></a></td>
            <td width="17%"><a href="javascript:window.close()"><img src="images/tanchu_06.jpg" width="65" height="19" border="0"></a></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
    <td width="10"><img src="images/tanchu_03.jpg" width="10" height="445"></td>
  </tr>
  <tr align="center" valign="bottom">
    <td height="50" colspan="3" background="images/tanchu_04.jpg" class="font1220_gray">技术支持：<a href="http://www.yuhesys.com" target="_blank" class="font1220_gray">上海雨和信息技术有限公司技术支持</a></td>
  </tr>
</table>
</form>
</body>
</html>
