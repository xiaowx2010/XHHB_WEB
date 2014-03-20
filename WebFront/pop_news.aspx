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
			
			PicNewstp.DataTable = GetPicList2(0,cid);
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
    
<!--内容-->    
<G:PicNews id="PicNewstp" style="width:400px;height:420px" imgstr="images/sub_pp01.JPG" imgwidth="400" imgfield="imgstr" runat="server">
<G:Template id="Templatetp" runat="server">
<table width="97%"  border="0" cellspacing="0" cellpadding="0">
	<tr>
	<td height="35" align="center" class="font14B_black">*</td>
	</tr>
	<tr>
	<td align="center" class="sub_underline">发布日期：*</td>
	</tr>
	<tr class="sub_underline">
	<td class="font1225_black">
	<div style="width:400px;height:370px;overflow:auto">
	<table width="100%"  border="0" cellspacing="0" cellpadding="0">
		<tr>
		<td>*</td>
		</tr>
	</table>
	</div>
	</td>
	</tr>
</table> 
</G:Template>
</G:PicNews>
<!--内容-->      
     
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
