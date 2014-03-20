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
	string sitecode="";
		private void Page_Load(object sender,System.EventArgs e)
		{
			cid = GetQueryString("cid","0");
			id = GetQueryString("id","0");
			HeadXuHui.ChannelCode=cid;
			
			Contentxxnr.SqlStr="select fld_"+cid+"_10,fld_"+cid+"_11,fld_"+cid+"_12,fld_"+cid+"_13,fld_"+cid+"_14,chtopic,chcontent,fld_"+cid+"_15,fld_"+cid+"_16,cast(datepart(year,chputdate) as varchar(50))+'-'+cast(datepart(month,chputdate) as varchar(50))+'-'+cast(datepart(day,chputdate) as varchar(50)) as chputdate from "+GetChannelDataTableName(cid)+" where chstate=0 and chcode="+id;
			Contentxxnr.WriteLog(cid,id);
		//	Response.Write(Contentxxnr.SqlStr);
		}
	</script>

<body topmargin="0" leftmargin="0" class="page_bgline">
<form id="FormXuHui" repeat="post" runat="server">
<table width="600" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td colspan="3"><img src="images/tanchu_01.jpg" width="600" height="105"></td>
  </tr>
  <tr>
    <td width="99"><img src="images/tanchu_02.jpg" width="99" height="445"></td>
    <td width="491" align="center" valign="top">
    
<!--详细内容-->    
<G:Content id="Contentxxnr" runat="server">
<G:Template id="Templatexxnr" runat="server">
<table width="97%"  border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td style="padding-left:30px;padding-right:30px;padding-top:20px;">
    <p class="plist">信访查询<hr size=1>
    <table>
    <tr>
		<td>您的姓名：</td>
		<td> * </td>
    </tr>
    <tr>
		<td>联系电话：</td>
		<td> * </td>
    </tr>
    <tr>
		<td>E&nbsp;-&nbsp;mail：</td>
		<td> * </td>
    </tr>
    <tr>
		<td>邮政编码：</td>
		<td> * </td>
    </tr>
    <tr>
		<td>联系地址：</td>
		<td> * </td>
    </tr>
    <tr>
		<td>标&nbsp;&nbsp;&nbsp;&nbsp;题：</td>
		<td> * </td>
    </tr>
    <tr>
		<td>内&nbsp;&nbsp;&nbsp;&nbsp;容：</td>
		<td><div style="height:140px;padding-top:20px;overflow:auto"> * </div></td>
    </tr>
    <tr>
		<td>处理进度：</td>
		<td> * </td>
    </tr>
    <tr>
		<td>处理结果：</td>
		<td> * </td>
    </tr>
    </table>
    </center>
    <div align="right"><hr size=1>
    录入日期：*</div>
    </td>
  </tr>
</table>
</G:Template>
</G:Content>
<!--详细内容-->      
     
     <table width="97%"  border="0" cellspacing="0" cellpadding="0"> 
      <tr>
		<td height="50">&nbsp;</td>
      </tr>
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
    <td height="50" colspan="3" background="images/tanchu_04.jpg" class="font1220_gray">技术支持：<a class="font1220_gray" href="http://www.yuhesys.com">上海雨和信息技术有限公司技术支持</a></td>
  </tr>
</table>
</form>
</body>
</html>
