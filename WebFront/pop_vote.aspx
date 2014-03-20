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
	private void Page_Load(object sender, System.EventArgs e)
	{	
		string hint="";
		cid = GetQueryString("cid","0");
		id = GetQueryString("id","0");
		hint = GetQueryString("hint","0");
		if (hint=="1")
		{
			alertvote.InnerText="您已投票成功,谢谢您的投票!";
		}
		if (hint=="2")
		{
			alertvote.InnerText="对不起，您已经投过一票了!";
		}
		if(id!="0" && id!="") Session["vcode"]=id;
		this.Session["guangye"] = "0";
	
	}
	</script>

<body topmargin="0" leftmargin="0" class="page_bgline">
<form id="FormXuHui" runat="server">
<table width="600" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td colspan="3"><img src="images/tanchu_01.jpg" width="600" height="105"></td>
  </tr>
  <tr>
    <td width="99"><img src="images/tanchu_02.jpg" width="99" height="445"></td>
    <td width="491" align="center" valign="top">
    
    <div id="alertvote" runat="server" class="font_red" style="height:15px;padding-top:5px;"></div>
      <div style="width:480px;height:420px;overflow:auto;">
          <TABLE cellSpacing=0 cellPadding=3 width="100%" align=center border=0>
            <TBODY>
              <TR>
                <TD><HR SIZE=1>
                </TD>
              </TR>
              <TR>
                <TD vAlign=top>                 
    <!--投票结果-->
	<OBJECT classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
	codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0"
	WIDTH="630" HEIGHT="400" id="FlashCharts" ALIGN="" VIEWASTEXT>
	<PARAM NAME=movie VALUE="/GCMS/Common/Shell.aspx?com=FC2Pie3D&IsLocal=1&dataURL=ChatData.aspx">
	<PARAM NAME=quality VALUE=high>
	<PARAM NAME=bgcolor VALUE=#FFFFFF>
	<EMBED src="/GCMS/Common/Shell.aspx?com=FC2Pie3D&IsLocal=1&dataURL=ChatData.aspx" quality=high bgcolor=#FFFFFF  WIDTH="630" HEIGHT="400" NAME="FlashCharts" ALIGN=""
	TYPE="application/x-shockwave-flash" PLUGINSPAGE="http://www.macromedia.com/go/getflashplayer"></EMBED></OBJECT>
	<!--投票结果-->
                 
                    <!-- 内容 --></TD>
              </TR>
            </TBODY>
          </TABLE>
        </div>  
    
	</td>
    <td width="10"><img src="images/tanchu_03.jpg" width="10" height="445"></td>
  </tr>
  <tr align="center" valign="bottom">
    <td height="50" colspan="3" background="images/tanchu_04.jpg" class="font1220_gray">技术支持：<a class="font1220_gray" href="http://www.yuhesys.com">上海雨和信息技术有限公司技术支持</a></td>
  </tr>
</table>
</form>
</body>
</html>
